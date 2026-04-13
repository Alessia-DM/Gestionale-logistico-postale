package com.example.esempioFiven.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.esempioFiven.dto.ScatolaFiltri;
import com.example.esempioFiven.model.OggettoInventario;
import com.example.esempioFiven.model.Scatola;
import com.example.esempioFiven.mybatis.mapper.ScatoleMapper;

@Service
public class ScatoleService {
    @Autowired
    private ScatoleMapper scatoleMapper;
    
    private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(ScatoleService.class);

    public List<Scatola> getScatolePaginate(ScatolaFiltri filtri, int pageSize) {
        prepareFilter(filtri);
        int offset = filtri.getPage() * pageSize;
        
        return scatoleMapper.findAllWithMazzetteImpaginato(
            pageSize, offset, filtri.getOrderBy(), filtri.getDirezione(),
            filtri.getStato(), filtri.getCleanKeyword(), 
            filtri.getStartDate(), filtri.getEndDate(), filtri.getOperatore()
        );
    }

    public int getTotalePagine(ScatolaFiltri filtri, int pageSize) {
        prepareFilter(filtri);
        int totale = scatoleMapper.countScatole(
        		filtri.getStato(), filtri.getCleanKeyword(), 
        		filtri.getStartDate(), filtri.getEndDate(), filtri.getOperatore()
        );
        return (int) Math.ceil((double) totale / pageSize);
    }

    // Logica centralizzata per le date
    private void prepareFilter(ScatolaFiltri filtri) {
        if (filtri.getEndDate() == null) filtri.setEndDate(new Date());
        if (filtri.getStartDate() == null) {
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.MONTH, -6);
            filtri.setStartDate(cal.getTime());
        }
    }

    public int getProduttivitaMese(String descUtente) {
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.DAY_OF_MONTH, 1);
        return scatoleMapper.countScatole(null, null, cal.getTime(), new Date(), descUtente);
    }

    public List<String> getListaOperatori() {
        return scatoleMapper.findDistinctOperatori();
    }
    
    public List<String> getListaStati(){
    	return scatoleMapper.findDistinctStati();
    }
    
    @Transactional(rollbackFor = Exception.class)
    public void inserimentoNuovaScatola(Scatola scatola) throws Exception{
    	
    	if (scatoleMapper.existsByCodice(scatola.getCodiceScatola())) {
            log.error("Tentativo di inserimento codice duplicato: {}", scatola.getCodiceScatola());
            throw new Exception("Errore: il codice scatola è già presente nel sistema.");
        }
    	scatoleMapper.inserisciScatola(scatola);
    	log.info("Scatola inserita con successo: {}", scatola.getCodiceScatola());
    	
    }
    
    public void decrementoInventario(String tipo) {
    	scatoleMapper.decrementoInventario(tipo);
    }
    
    public List<OggettoInventario> listaScatoleDisponibili(){
    	return scatoleMapper.findAllInventario();
    }
    
    public boolean esisteScatola(String codiceScatola) {
    	return scatoleMapper.existsByCodice(codiceScatola);
    }
    
    public List<Scatola> getScatoleDaReggiare(int pageSizeRegg, int offsetRegg, String keywordRegg) {
    	return scatoleMapper.findScatoleDaReggiare(pageSizeRegg,offsetRegg, keywordRegg);
    }
    
    
}