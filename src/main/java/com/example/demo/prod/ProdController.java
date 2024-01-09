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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ProdController {

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
    @PostMapping(value = "/prodList", produces = "text/plain; charset=UTF-8")
    public String prodList(@RequestBody String prodNo, Model model) {
        System.out.println(prodNo);
        // 서비스에서 처리 후의 결과를 반환
        String msg = "";
        List<ProdDTO> list = service.prodList(prodNo);
        if (list == null) {
            msg = "조회된 정보가 없습니다.";
            return msg;
        }
        model.addAttribute("DataList", list);
        msg = "조회완료";
        return msg;

    }

    @RequestMapping("stockStatus")
    public String stockManage() {
        return "prod/stockStatus";
    }

}