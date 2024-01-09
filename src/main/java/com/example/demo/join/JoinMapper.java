package com.example.demo.join;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {

    int registProc(JoinDTO joins);

    JoinDTO findJoin(String id);

    JoinDTO findBN(String businessNo);

    JoinDTO findEmail(String email);

    JoinDTO findTel(String tel);

    JoinDTO findDbName(String uniqueDbName);

    int verifyProc(JoinDTO joins);

    JoinDTO checkAccount(String email);

    JoinDTO checkStatus(String id);

    int updateProc(JoinDTO joins);
}
