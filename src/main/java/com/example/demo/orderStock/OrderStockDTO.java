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

    private String reqStore; // 요청매장
    private String respStore; // 받은매장
    private String prodNo; // 상품번호
    private int reqQuan; // 요청수량
    private int respQuan; // 받은수량
    private String reqDate; // 요청날짜
    private String respDate; // 수령날짜
    private String orderStatus; // 요청상태

}
