package com.example.demo.admin;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AdminMapper {

    AdminDTO findAdmin(String aId);

}
