package com.example.demo.orderStock;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.prod.ProdDTO;

import jakarta.servlet.http.HttpSession;

@Service
public class OrderStockService {

    @Autowired
    private OrderStockMapper mapper;
    @Autowired
    private HttpSession session;

    public String storingProc(String prodNo, int reqQuan, Model model) {
        String id = (String) session.getAttribute("id");
        String storeName = mapper.connectName(id);
        ProdDTO prod = new ProdDTO(null, null, null, null);
        prod.setProdNo(prodNo);
        ProdDTO totalQuan = mapper.findRootProd(prod);
        if (storeName != null) {
            if (reqQuan < totalQuan.getQuan()) {
                int result = mapper.storingProc(storeName, prodNo, reqQuan);
                if (result > 0)
                    return "success";

                return "failed";
            }
            return "재고 수량보다 신청 수량이 많습니다. 다시 시도해 주세요.";
        }
        return "MYPAGE에서 지점 이름 수정 후 다시 시도해 주세요.";
    }

    public List<ProdDTO> prodList(ProdDTO prod) {

        return mapper.searchProd(prod);
    }

    public void stockList(Model model) {
        ArrayList<OrderStockDTO> stocks = mapper.stockList();

        model.addAttribute("stocks", stocks);
    }

    public String storingApprove(OrderStockDTO store, Model model) {
        int searchProdQuan = mapper.searchRootQuan(store); // 본사가 등록한 재고 수량 확인
        OrderStockDTO searchProdInfo = mapper.searchProdInfo(store); // 매장에서 요청한 수량, prodNo 확인
        int updateRootQuan = searchProdQuan - searchProdInfo.getReqQuan();
        if (updateRootQuan > 0) {
            ProdDTO prods = new ProdDTO(null, null, null, null);
            prods.setQuan(updateRootQuan);
            prods.setProdNo(searchProdInfo.getProdNo());

            int result = mapper.updateRootQuan(prods); // 본사의 product.quan 수정
            if (result > 0) {
                ProdDTO findRootProd = mapper.findRootProd(prods); // 본사의 product 정보를 가져옴

                prods.setStoreName(searchProdInfo.getReqStore());
                ProdDTO findStoreProd = mapper.findStoreProd(prods); // 매장의 product 정보를 가져옴
                if (findStoreProd.getStoreName() != null) { // 기존 정보가 있다면
                    findStoreProd.setQuan(findStoreProd.getQuan() + searchProdInfo.getReqQuan()); // 기존 수량 + 입고 수량
                    mapper.updateStoreProd(findStoreProd); // 같은 매장 정보가 있다면 수량만 업데이트
                } else { // 새 정보라면
                    findRootProd.setQuan(searchProdInfo.getReqQuan());
                    findRootProd.setStoreName(store.getReqStore());
                    mapper.insertStoreProd(findRootProd); // product 테이블에 매장의 재고 정보를 기입
                }
                OrderStockDTO changeStatus = mapper.searchOrderStatus(store);
                mapper.updateOrderStatus(changeStatus); // 승인된 입고 요청 상태를 승인 완료로 변경

                return "success";
            }
            return "본사 재고 수량보다 많은 값을 입력했습니다. 확인 후 다시 시도해주세요.";
        }

        return "failed";
    }

    public String storingDenied(OrderStockDTO store) {
        int result = mapper.storingDenied(store);
        if (result > 0)
            return "success";

        return "failed";
    }

    public String unstoringProc(String prodNo, int respQuan, Model model) {
        String id = (String) session.getAttribute("id");
        String storeName = mapper.connectName(id);
        ProdDTO prod = new ProdDTO(null, null, null, null);
        prod.setProdNo(prodNo);
        ProdDTO totalQuan = mapper.findRootProd(prod);
            if (respQuan < totalQuan.getQuan()) {
                int result = mapper.unstoringProc(storeName, prodNo, respQuan);
                if (result > 0)
                    return "success";

                return "failed";
            }
            return "재고 수량보다 신청 수량이 많습니다. 다시 시도해 주세요.";
    }

    public void storeList(Model model) {
        List<String> storeNames = mapper.storeList();

        model.addAttribute("storeNames", storeNames);
    }

}
