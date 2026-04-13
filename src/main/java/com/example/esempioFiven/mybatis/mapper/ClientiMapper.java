package com.example.esempioFiven.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.esempioFiven.model.Cliente;

@Mapper
public interface ClientiMapper {
	List<Cliente> findAll();
	
	void inserimentoPrivato(@Param("nomePrivato") String nome, @Param("cognomePrivato") String cognome, @Param("cfPrivato") String cf, @Param("email") String email, @Param("idScatolaFK") Integer idScatolaFK, @Param("idSpedizioneFK") Integer idSpedizioneFK, @Param("idDdtFK") Integer idDdtFK);
}
