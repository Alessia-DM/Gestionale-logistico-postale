package com.example.esempioFiven.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.esempioFiven.model.Macroservizi;

@Mapper
public interface MacroserviziMapper {
	List<Macroservizi> findAllMacroservizi();
	List<Macroservizi> findAllWithServizi();
	
}
