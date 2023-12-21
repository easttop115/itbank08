package com.example.demo.join;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {

    JoinDTO findJoin(String id);

    int registProc(JoinDTO joins);

}
