package com.example.esempioFiven.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.esempioFiven.model.DDT;
import com.example.esempioFiven.mybatis.mapper.DdtMapper;

@Service
public class DdtService {
	
	@Autowired
	private DdtMapper ddtMapper;
	
	
    private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(DdtService.class);

	
	public DdtService(DdtMapper ddtMapper) {
        this.ddtMapper = ddtMapper;
    }
	
	public List<DDT> getAllIdDDT(){
		return ddtMapper.findAllIdDdt();
	}
	
	public DDT getById(Integer id) {
		return ddtMapper.findById(id);
	}
	
	public List<DDT> getDdtPag(int page, int pageSize){
		int offset=page*pageSize;
		return ddtMapper.findDdtPage(pageSize,offset);
	}
	
	public int getTotPag(int pageSize) {
		int totElem=ddtMapper.countDdt();
		
		//le parentesi tonde servono a convertire temporaneamente le variabili
		// nel tipo specificato tra parentesi.
		// Math.ceil  è una funzione che arrotonda all'intero superiore
		return (int) Math.ceil((double) totElem/pageSize);
	}
	
	@Transactional(rollbackFor = Exception.class)
    public void salvaNuovoDdt(DDT ddt) throws Exception{
		
		if (ddtMapper.existsByCodeDdt(ddt.getCodiceDdt())) {
            log.error("Tentativo di inserimento codice duplicato: {}", ddt.getCodiceDdt());
            throw new Exception("Errore: il codice scatola è già presente nel sistema.");
        }
		
        ddtMapper.insertDdt(ddt);
        log.info("Scatola inserita con successo: {}", ddt.getCodiceDdt() );
    }
	
	@Transactional
	public void aggiungiScatolaAlContenuto(Integer idDdt, String codiceScatola) {

	    ddtMapper.aggiornaConteggioColli(idDdt);
	}
	
}
