package com.example.demo.prod;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StockStatusDTO {

    // product table
    private String storeName;
    private String prodCode; // prodNo
    private String prodName;
    private String price; // sellPrice
    private String sizeS;
    private String sizeM;
    private String sizeL;
    private String sizeXL;

    // color table
    private String color; // colorName

}
