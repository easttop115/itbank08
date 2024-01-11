package com.example.demo.prod;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProdController {

    @Autowired
    ProdService service;

    @GetMapping("/cateInsert")
    public String cateInsert() {
        return "prod/cateInsert";
    }

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
            service.addColor(color.getColorCode());
            System.out.println("ColorCode:" + color.getColorCode());
            ra.addFlashAttribute("msg", "ColorCode 추가 성공");

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
    @PostMapping("/prodList")
    public String prodList(Map<String, String> params) {

        List<ProdDTO> prodList = service.prodList(params);

        String productListHtml = "<table>";
        productListHtml += "<thead><tr><th>상품코드</th><th>상품명</th><th>사이즈</th><th>색상코드</th><th>총수량</th></tr></thead><tbody>";

        for (ProdDTO prod : prodList) {
            productListHtml += "<tr>";
            productListHtml += "<td>" + prod.getProdNo() + "</td>";
            productListHtml += "<td>" + prod.getProdName() + "</td>";
            productListHtml += "<td>" + prod.getSize() + "</td>";
            productListHtml += "<td>" + prod.getColorCode() + "</td>";
            productListHtml += "<td>" + prod.getQuan() + "</td>";
            productListHtml += "</tr>";
        }

        productListHtml += "</tbody></table>";
        return productListHtml;
    }

    @RequestMapping("stockStatus")
    public String stockManage() {
        return "prod/stockStatus";
    }

}