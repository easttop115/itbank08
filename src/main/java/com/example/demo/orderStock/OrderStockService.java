package com.example.demo.orderStock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.prod.ProdDTO;

@Service
public class OrderStockService {

    @Autowired
    private OrderStockMapper mapper;

    public String storingProc(ProdDTO prods) {
        int result = mapper.storingProc(prods);
        if (result > 0)
            return "success";

        return "failed";
    }

    public List<ProdDTO> prodList(ProdDTO prod) {

        return mapper.searchProd(prod);
      }

}
