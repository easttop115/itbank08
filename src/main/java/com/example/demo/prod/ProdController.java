package com.example.demo.prod;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ProdController {

    @Autowired
    ProdService service;
    @Autowired
    private HttpSession session;

    // 브랜드코드 추가
    @PostMapping("/brandInsert")
    public String addBrand(BrandDTO brand, RedirectAttributes ra) {

        if (brand.getBrandCode() != null || !brand.getBrandCode().trim().isEmpty()) {
            service.addBrand(brand.getBrandCode(), brand.getBrandDescription());
            System.out.println("brandCode:" + brand.getBrandCode());
            ra.addFlashAttribute("msg", "brandCode 추가 성공");

            return "redirect:prodInsert";
        }
        return "prodInsert";
    }

    // 카테고리 추가
    @GetMapping("/cateInsert")
    public String cateInsert() {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null) {
            return "redirect:/";
        }
        return "prod/cateInsert";
    }

    @PostMapping("/cateInsert")
    public String addCategory(CateDTO cate, RedirectAttributes ra) {

        if (cate.getCateGroup() != null || !cate.getCateGroup().trim().isEmpty()) {
            service.addCategory(cate.getCateGroup(), cate.getCateCode(), cate.getCateName());
            System.out.println("cateCode:" + cate.getCateCode());
            ra.addFlashAttribute("msg", "cateCode 추가 성공");

            return "redirect:prodInsert";
        }
        return "prodInsert";
    }

    @PostMapping("/colorInsert")
    public String addColor(ColorDTO color, RedirectAttributes ra) {

        if (color.getColorCode() != null || !color.getColorCode().trim().isEmpty()) {
            service.addColor(color.getColorCode(), color.getColorName());
            System.out.println("ColorCode:" + color.getColorCode());
            ra.addFlashAttribute("msg", "ColorCode 추가 성공");

            return "redirect:prodInsert";
        }
        return "prodInsert";
    }

    // 상품등록
    @RequestMapping("/prodInsert")
    public String prodInsert(Model model) {

        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null) {
            return "redirect:/";
        }
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

    // 상품조회, 관리
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
        return "/prod/prodManage";
    }

    // 등록상품 조회
    @PostMapping("/prod/prodList")
    public String prodList(@ModelAttribute("prod") ProdDTO prod, RedirectAttributes ra) {
        System.out.println("cateGroup" + prod.getCateGroup());
        System.out.println("cateCode" + prod.getCateCode());

        // String cateC = cateGroup + "(" + prod.getCateCode() + ")";
        // prod.setCateCode(cateC);
        List<ProdDTO> plist = service.prodList(prod);
        ra.addFlashAttribute("prods", plist);
        System.out.println("확인" + plist);
        return "redirect:/prodManage";

    }

    @RequestMapping("stockStatus")
    public String stockManage() {
        return "prod/stockStatus";
    }

}