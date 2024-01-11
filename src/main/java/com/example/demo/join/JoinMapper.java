package com.example.demo.join;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {

    int registProc(JoinDTO joins);

    JoinDTO findJoin(String id);

    JoinDTO findBN(String businessNo);

    JoinDTO findEmail(String email);

    JoinDTO findTel(String tel);

    JoinDTO findDbName(String uniqueDbName);

    JoinDTO checkStatus(String id);

    int updateProc(JoinDTO joins);

    ArrayList<JoinDTO> manageInfo(JoinDTO join);

    int statusModify(JoinDTO join);

    int storeDeleteProc(JoinDTO join);
}
