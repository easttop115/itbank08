package com.example.demo.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.join.JoinDTO;

@Mapper
public interface AdminMapper {

    AdminDTO findAdmin(String aId);

    ArrayList<JoinDTO> adminInfo(JoinDTO join);

    JoinDTO checkAccount(String email);

    int verifyProc(JoinDTO joins);

    int adminStatusModify(JoinDTO join);

    int adminRootDeleteProc(JoinDTO join);

}
