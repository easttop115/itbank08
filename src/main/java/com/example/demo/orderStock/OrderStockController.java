package com.example.demo.orderStock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.prod.BrandDTO;
import com.example.demo.prod.CateDTO;
import com.example.demo.prod.ColorDTO;
import com.example.demo.prod.ProdDTO;
import com.example.demo.prod.ProdService;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderStockController {

    @Autowired
    private HttpSession session;
    @Autowired
    private OrderStockService service;
    @Autowired
    private ProdService prodService;

    @RequestMapping("/storing")
    public String storing(Model model) {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null)
            return "/join/login";

        List<CateDTO> cateGroups = prodService.cateGroupList();
        List<CateDTO> cateCodes = prodService.cateCodeList();
        List<BrandDTO> brandCodes = prodService.brandCodeList();
        List<ColorDTO> colorCodes = prodService.colorCodeList();

        model.addAttribute("cateGroups", cateGroups);
        model.addAttribute("cateCodes", cateCodes);
        model.addAttribute("brandCodes", brandCodes);
        model.addAttribute("colorCodes", colorCodes);

        return "/orderStock/storing";
    }

    @PostMapping("/storingProc")
    public String storingProc(@RequestParam("selectedProducts") String prodNo, @RequestParam("reqQuan") int reqQuan,
            Model model) {
        String confirm = service.storingProc(prodNo, reqQuan, model);
        if (confirm.equals("success"))
            return "redirect:/storing";

        model.addAttribute("msg", confirm);
        return "/orderStock/storing";
    }

    @PostMapping("/searchStoring")
    public String prodList(@ModelAttribute("prod") ProdDTO prod, RedirectAttributes ra) {

        if (prod.getCateCode().trim().isEmpty()
                && prod.getCateGroup().trim().isEmpty()
                && prod.getColorCode().trim().isEmpty()
                && prod.getSize().trim().isEmpty()
                && prod.getProdNo().trim().isEmpty()) {
            System.out.println(prod.getCateCode());
            System.out.println(prod.getColorCode());
            return "redirect:/storing";
        }

        List<ProdDTO> plist = service.prodList(prod);
        ra.addFlashAttribute("prods", plist);
        System.out.println("확인" + plist);
        return "redirect:/storing";

    }

    @GetMapping("/ioCheck")
    public String ioCheck(@RequestParam(name = "radioButton", required = false) String radioButton, Model model) {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null)
            return "/join/login";

        service.stockList(model);

        model.addAttribute("radioButton", radioButton); // 라디오 버튼의 값을 모델에 추가

        return "/orderStock/ioCheck";
    }

    @RequestMapping("/storingApprove")
    public String storingApprove(OrderStockDTO store, Model model) {
        String confirm = service.storingApprove(store, model);

        if (confirm.equals("success"))
            return "redirect:/ioCheck";

        model.addAttribute("msg", confirm);
        return "/orderStock/ioCheck";
    }

    @RequestMapping("/storingDenied")
    public String storingDenied(OrderStockDTO store) {
        String confirm = service.storingDenied(store);

        if (confirm.equals("success"))
            return "redirect:/ioCheck";

        return "/orderStock/ioCheck";
    }

    @RequestMapping("/unstoring")
    public String unstoring(Model model) {
        String sessionId = (String) session.getAttribute("id");
        if (sessionId == null)
            return "/join/login";

        List<CateDTO> cateGroups = prodService.cateGroupList();
        List<CateDTO> cateCodes = prodService.cateCodeList();
        List<BrandDTO> brandCodes = prodService.brandCodeList();
        List<ColorDTO> colorCodes = prodService.colorCodeList();
        service.storeList(model);

        model.addAttribute("cateGroups", cateGroups);
        model.addAttribute("cateCodes", cateCodes);
        model.addAttribute("brandCodes", brandCodes);
        model.addAttribute("colorCodes", colorCodes);

        return "/orderStock/unstoring";
    }

    @PostMapping("/unstoringProc")
    public String unstoringProc(@RequestParam("selectedProducts") String prodNo, @RequestParam("respQuan") int respQuan,
            Model model) {
        String confirm = service.unstoringProc(prodNo, respQuan, model);
        if (confirm.equals("success"))
            return "redirect:/unstoring";

        model.addAttribute("msg", confirm);
        return "/orderStock/unstoring";
    }

    @PostMapping("/searchUnstoring")
    public String unprodList(@ModelAttribute("prod") ProdDTO prod, RedirectAttributes ra) {

        if (prod.getCateCode().trim().isEmpty()
                && prod.getCateGroup().trim().isEmpty()
                && prod.getColorCode().trim().isEmpty()
                && prod.getSize().trim().isEmpty()
                && prod.getProdNo().trim().isEmpty()) {
            System.out.println(prod.getCateCode());
            System.out.println(prod.getColorCode());
            return "redirect:/unstoring";
        }

        List<ProdDTO> plist = service.prodList(prod);
        ra.addFlashAttribute("prods", plist);
        System.out.println("확인" + plist);
        return "redirect:/unstoring";

    }

}
