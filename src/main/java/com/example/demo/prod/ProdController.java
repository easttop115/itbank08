package com.example.demo.prod;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ProdController {

    private static final Logger logger = LoggerFactory.getLogger(ProdController.class);

    @Autowired
    ProdService service;

    @RequestMapping("/prodInsert")
    public String prodInsert(Model model) {

        List<CateDTO> cateGroups = service.cateGroupList();
        List<CateDTO> cateCodes = service.cateCodeList();
        List<BrandDTO> brandCodes = service.brandCodeList();
        List<ColorDTO> colorCodes = service.colorCodeList();

        model.addAttribute("cateGroups", cateGroups);
        model.addAttribute("cateCodes", cateCodes);
        model.addAttribute("brandCodes", brandCodes);
        model.addAttribute("colorCodes", colorCodes);
        System.out.println("test: " + brandCodes);
        return "prod/prodInsert";

    }

    @PostMapping("/prodInsertProc")
    public ResponseEntity<Map<String, String>> prodInsertProc(ProdDTO prods, Model model, RedirectAttributes ra) {

        // logger.info("Before calling prodInsertProc method. prodNo: {}",
        // prods.getProdNo());
        // String result = service.prodInsertProc(prods);
        // logger.info("After calling prodInsertProc method. Result: {}", result);

        Map<String, String> response = new HashMap<>();
        String msg = service.prodInsertProc(prods);
        response.put("msg", msg);
        response.put("redirectURI", "/"); // 리다이렉트할 URL

        return new ResponseEntity<>(response, HttpStatus.OK);
        // ResponseEntity<Map<String, String>>를 사용하는 경우에는 JSON 형태의 응답을 전달 - 클이 리다이렉트 수행
    }

    @RequestMapping("/prodManage")
    public String prodManage(Model model) {

        List<CateDTO> cateGroups = service.cateGroupList();
        List<CateDTO> cateCodes = service.cateCodeList();
        List<BrandDTO> brandCodes = service.brandCodeList();
        List<ColorDTO> colorCodes = service.colorCodeList();

        model.addAttribute("cateGroups", cateGroups);
        model.addAttribute("cateCodes", cateCodes);
        model.addAttribute("brandCodes", brandCodes);
        model.addAttribute("colorCodes", colorCodes);
        System.out.println("test: " + brandCodes);
        return "prod/prodManage";
    }

    @ResponseBody
    @PostMapping(value = "/prodManageProc", produces = "application/json")
    public ResponseEntity<List<ProdDTO>> prodManageProc(@RequestParam Map<String, String> data) {

        String cateCode = data.get("cateCode");
        String brandCode = data.get("brandCode");
        String colorCode = data.get("colorCode");
        String size = data.get("size");

        // 서비스에서 처리 후의 결과를 반환
        List<ProdDTO> list = service.prodList(cateCode, brandCode, colorCode, size);

        return new ResponseEntity<>(list, HttpStatus.OK);

    }

    @RequestMapping("stockStatus")
    public String stockManage() {
        return "prod/stockStatus";
    }

}