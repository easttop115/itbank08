package com.example.demo.instruction;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import com.example.demo.orderStock.OrderStockMapper;
import com.example.demo.prod.ProdDTO;
import jakarta.servlet.http.HttpSession;

@Service
@Transactional
public class InstructionService {
    @Autowired
    private InstructionMapper mapper;
    @Autowired
    private HttpSession session;
    @Autowired
    private OrderStockMapper orderStockMapper;

    public void instructionform(String cp, Model model) {

    }

    public void instructionwrite(String cp, Model model) {

    }

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

        String id = (String) session.getAttribute("id");
        String sessionId = orderStockMapper.connectName(id);
        ProdDTO prod = new ProdDTO(null, null, null, null);
        prod.setStoreName(sessionId);
        prod.setProdNo(prodNo);
        ProdDTO totalQuan = mapper.findRootInst(prod); // prodNo 값은 유니크 값 => prodNo에 해당하는 수량을 가져와라
        if (respQuan <= totalQuan.getQuan()) { // 출고 수량보다 총 수량이 많으면 ok
            int result = mapper.instwriteProc(sessionId, storeName, prodNo, respQuan); // 출고 기록용으로 db에
                                                                                       // 저장(orderStock)

            if (result > 0) {
                int updateRootQuan = totalQuan.getQuan() - respQuan;
                prod.setQuan(updateRootQuan);
                mapper.updateRootQuan(prod); // 요청 매장 재고 업데이트(보내는애)

                prod.setStoreName(storeName); // 요청 받은 매장 재고 업데이트(받는애)
                ProdDTO findStoreInst = mapper.findStoreInst(prod); // 매장의 product 정보를 가져옴

                InstructionDTO inst = new InstructionDTO();
                inst.setId(id);
                inst.setProdNo(findStoreInst.getProdNo());
                inst.setProdName(findStoreInst.getProdName());
                inst.setColorCode(findStoreInst.getColorCode());
                inst.setSize(findStoreInst.getSize());
                inst.setRespStore(findStoreInst.getStoreName());
                inst.setRespQuan(respQuan);
                mapper.insertStoreInst(inst);

                return "success";
            }

            return "failed";
        }
        return "재고 수량보다 입력한 수량이 많습니다. 다시 시도해 주세요.";
    }

    // public List<InstructionDTO> instructionlist(String regDate) {
    // List<InstructionDTO> instructionlist = mapper.getDate(regDate);
    // System.out.println(instructionlist);
    // return instructionlist;
    // }

    // // 타매장
    // public List<InstructionDTO> getOtherStoreInstructions(String currentStoreId)
    // {
    // // 현재 매장의 요청을 제외한 다른 매장의 요청을 조회합니다.
    // List<InstructionDTO> otherStoreInstructions =
    // mapper.getOtherStoreInstructions(currentId);

    // // 다른 매장의 요청 목록을 반환합니다.
    // return otherStoreInstructions;
    // }
    // instructionlist 메서드 수정

    public List<InstructionDTO> instructionlist(String regDate) {
        // 세션에서 현재 로그인한 사용자의 아이디 가져오기
        String sessionId = (String) session.getAttribute("id");
        System.out.println(sessionId);
        // String storeName = orderStockMapper.connectName(sessionId);
        // System.out.println(storeName);
        // 현재 로그인한 사용자가 요청한 매장의 요청 목록을 반환
        List<InstructionDTO> instructionlist = mapper.getDate(regDate, sessionId);
        System.out.println(instructionlist);

        return instructionlist;
    }

    // 타매장 요청 반환 메서드 추가
    public List<InstructionDTO> getOtherStoreInstructions() {
        // 현재 매장의 요청을 제외한 다른 매장의 요청을 조회합니다.
        String id = (String) session.getAttribute("id");
        System.out.println(id);

        // String storeName = orderStockMapper.connectName(sessionId);
        // System.out.println(storeName);
        List<InstructionDTO> otherStoreInstructions = mapper.getOtherStoreInstructions(id);
        for (InstructionDTO tmp : otherStoreInstructions) {
            String storeName = orderStockMapper.connectName(tmp.getId());
            tmp.setId(storeName);
            System.out.println(storeName);
        }
        // 다른 매장의 요청 목록을 반환합니다.
        return otherStoreInstructions;
    }

}
