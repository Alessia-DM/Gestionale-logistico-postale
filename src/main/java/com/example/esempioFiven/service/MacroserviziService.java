package com.example.esempioFiven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.esempioFiven.model.Macroservizi;
import com.example.esempioFiven.mybatis.mapper.MacroserviziMapper;

@Service
public class MacroserviziService {
	
	@Autowired
	private MacroserviziMapper macroserviziMapper;
	
	public List<Macroservizi> getAllMacros(){
		return macroserviziMapper.findAllMacroservizi();
	}
	
	public List<Macroservizi> findAllWithServizi(){
		return macroserviziMapper.findAllWithServizi();
	}
	
	
}
