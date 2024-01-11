package com.example.demo.prod;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    @Autowired
    ProdService service;

    @PostMapping("/brandInsert")
    public String addBrand(BrandDTO brand, RedirectAttributes ra) {

        if (brand.getBrandCode() != null || !brand.getBrandCode().trim().isEmpty()) {
            service.addBrand(brand.getBrandCode(), brand.getBrandDescription());
            System.out.println("코드 보여줄래:" + brand.getBrandCode());
            ra.addFlashAttribute("msg", "brandCode 추가 성공");

            return "redirect:prodInsert";
        }
        return "prodInsert";
    }

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
    public String prodInsertProc(ProdDTO prods, RedirectAttributes ra) {

        String msg = service.prodInsertProc(prods);
        ra.addFlashAttribute("msg", msg);

        return "redirect:/prodManage";
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
        return "prod/prodManage";
    }

    @ResponseBody
    @PostMapping(value = "/prodList", produces = "application/json; charset=UTF-8")
    public String prodList(@RequestBody String prodNo) {
        System.out.println(prodNo);
        // 서비스에서 처리 후의 결과를 반환
        String msg = "";
        List<ProdDTO> list = service.prodList(prodNo);

        for (ProdDTO dto : list) {
            System.out.println(dto.getProdName());
            System.out.println(dto.getProdNo());
        }

        if (list == null) {
            msg = "조회된 정보가 없습니다.";
            return msg;
        }

        // 리스트를 JSON 형식의 문자열로 변환하여 반환
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String jsonList = objectMapper.writeValueAsString(list);
            return jsonList;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "Error during JSON conversion";
        }
    }

    @RequestMapping("stockStatus")
    public String stockManage() {
        return "prod/stockStatus";
    }

}