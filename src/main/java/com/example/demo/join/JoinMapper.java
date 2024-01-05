package com.example.demo.join;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {

    int registProc(JoinDTO joins);

    JoinDTO findJoin(String id);

    JoinDTO checkStatus(String id);

    JoinDTO findBN(String businessNo);

    JoinDTO findEmail(String email);

    JoinDTO findTel(String tel);

    List<JoinDTO> subJoins(JoinDTO joins);

    int verifyProc(JoinDTO joins);

    JoinDTO checkAccount(String email);

}
