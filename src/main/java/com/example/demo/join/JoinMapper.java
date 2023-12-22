package com.example.demo.join;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {

    int registProc(JoinDTO joins);

    JoinDTO loginProc(JoinDTO joins);

    JoinDTO findJoin(String id);

}
