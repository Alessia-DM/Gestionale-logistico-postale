package com.example.esempioFiven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.esempioFiven.model.Cliente;
import com.example.esempioFiven.mybatis.mapper.ClientiMapper;

@Service
public class ClientiService {
	
	@Autowired
	private ClientiMapper clientiMapper;
	
	public List<Cliente> getAllClienti(){
		return clientiMapper.findAll();
	}
	
	@Transactional
	public void salvaPrivato(String nome, String cognome, String codiceFiscale, String email, Integer idScatolaFk, Integer idSpedizioneFK, Integer idDdtFK) {
		clientiMapper.inserimentoPrivato(nome, cognome, codiceFiscale, email, idScatolaFk, idSpedizioneFK, idDdtFK);
	};

}
