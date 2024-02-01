package com.example.demo.instruction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import com.example.demo.prod.ProdDTO;
import jakarta.servlet.http.HttpSession;

@Service
@Transactional
public class InstructionService {
    @Autowired
    private InstructionMapper mapper;
    @Autowired
    private HttpSession session;

    public void instructionform(String cp, Model model) {

    }

    public void instructionwrite(String cp, Model model) {

    }

    // public List<InstructionDTO> instructionGroupList() {
    // List<InstructionDTO> instructions = mapper.instructionGroupList();
    // return instructions;

    // }

    // public List<ProdDTO> prodList() {

    // return mapper.searchProd();
    // }

    // public List<OrderStockDTO> orderStockList() {
    // List<OrderStockDTO> orderStocks = mapper.orderStockList();
    // return orderStocks;

    // }
    @Autowired
    public InstructionService(InstructionMapper mapper) {
        this.mapper = mapper;
    }

    public List<InstructionDTO> getAllInstructionData() {
        List<InstructionDTO> instructionDTOList = mapper.instructionGroupList();
        instructionDTOList.addAll(mapper.prodList());
        instructionDTOList.addAll(mapper.orderStockList());
        instructionDTOList.addAll(mapper.cateList());
        instructionDTOList.addAll(mapper.colorList());

        return instructionDTOList;
    }

    public String instructionwriteProc(String prodNo, int respQuan, String storeName) {

        ProdDTO prod = new ProdDTO(null, null, null, null);
        prod.setProdNo(prodNo);
        ProdDTO totalQuan = mapper.findRootProd(prod); // prodNo 값은 유니크 값 => prodNo에 해당하는 수량을 가져와라
        if (respQuan <= totalQuan.getQuan()) { // 출고 수량보다 총 수량이 많으면 ok
            int result = mapper.instwriteProc(storeName, prodNo, respQuan); // 출고 기록용으로 db에 저장(orderStock)

            if (result > 0) {
                int updateRootQuan = totalQuan.getQuan() - respQuan;
                prod.setQuan(updateRootQuan);
                mapper.updateRootQuan(prod); // 본사 재고 수량 업데이트

                prod.setStoreName(storeName);
                ProdDTO findStoreProd = mapper.findStoreProd(prod); // 매장의 product 정보를 가져옴

                if (findStoreProd != null) { // 기존 정보가 있다면
                    findStoreProd.setQuan(findStoreProd.getQuan() + respQuan); // 기존 수량 + 출고 수량
                    mapper.updateStoreProd(findStoreProd); // 같은 매장 정보가 있다면 수량만 업데이트
                } else { // 새 정보라면
                    ProdDTO findRootProd = mapper.findRootProd(prod);

                    findRootProd.setQuan(respQuan);
                    findRootProd.setStoreName(storeName);
                    mapper.insertStoreProd(findRootProd); // product 테이블에 매장의 재고 정보를 기입
                }

                return "success";
            }

            return "failed";
        }
        return "재고 수량보다 입력한 수량이 많습니다. 다시 시도해 주세요.";
    }
}
