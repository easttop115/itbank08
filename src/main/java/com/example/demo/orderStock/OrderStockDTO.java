package com.example.demo.orderStock;

import lombok.Getter;
import lombok.Setter;

/*
CREATE TABLE orderStock (
    reqStore VARCHAR(20),
    respStore VARCHAR(20),
    prodNo VARCHAR(200) DEFAULT CONCAT('cateCode', UUID()),
    reqQuan INT,
    respQuan INT,
    reqDate VARCHAR(20),
    respDate VARCHAR(20),
    orderStatus VARCHAR(20)
);
*/

@Getter
@Setter
public class OrderStockDTO {

    private String reqStore;
    private String respStore;
    private String prodNo;
    private int reqQuan;
    private int respQuan;
    private String reqDate;
    private String respDate;
    private String orderStatus;

}
