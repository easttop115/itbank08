// package com.example.demo.instruction;

// import java.util.List;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.PostMapping;
// import org.springframework.web.bind.annotation.RequestBody;
// import org.springframework.web.bind.annotation.RequestMapping;
// import org.springframework.web.bind.annotation.RestController;

// import com.example.demo.prod.BrandDTO;
// import com.example.demo.prod.CateDTO;
// import com.example.demo.prod.ColorDTO;
// import com.example.demo.prod.ProdDTO;
// import com.example.demo.prod.ProdService;

// @RestController
// @RequestMapping("instruction")
// public class InstructionRestController {

// @Autowired
// InstructionService instructionService;

// @Autowired
// ProdService prodService;

// @GetMapping("prod-search-modal")
// public ProdFilterGroupDTO prodSearchModal() {
// List<CateDTO> cateGroups = this.prodService.cateGroupList();
// List<CateDTO> cateCodes = this.prodService.cateCodeList();
// List<BrandDTO> brandCodes = this.prodService.brandCodeList();
// List<ColorDTO> colorCodes = this.prodService.colorCodeList();

// ProdFilterGroupDTO filterGroup = new ProdFilterGroupDTO();
// filterGroup.setCateGroups(cateGroups);
// filterGroup.setCateCodes(cateCodes);
// filterGroup.setBrandCodes(brandCodes);
// filterGroup.setColorCodes(colorCodes);

// return filterGroup;
// }

// @PostMapping("prod-search")
// public List<ProdDTO> prodSearch(
// @RequestBody ProdDTO body) {
// System.out.println("body test :: " + body);
// List<ProdDTO> plist = prodService.prodList(body);
// return plist;
// }
