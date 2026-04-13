package com.example.esempioFiven.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.esempioFiven.dto.PalletDTO;
import com.example.esempioFiven.model.Pallet;
import com.example.esempioFiven.mybatis.mapper.PalletMapper;
import com.example.esempioFiven.mybatis.mapper.ScatoleMapper;


@Service
public class PalletService {
	
	@Autowired
	private PalletMapper palletMapper;
	
	@Autowired
	private ScatoleMapper scatoleMapper;
	
	//private static final org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(DdtService.class);

	public PalletService(PalletMapper palletMapper) {
		this.palletMapper = palletMapper;
	}
	
	public PalletDTO getPalletById(Integer id) {
		return palletMapper.findPalletById(id);
	}
	
	public List<Pallet> getPalletPage(int page, int pageSize){
		int offset=page*pageSize;
		
		return palletMapper.findPalletPage(pageSize, offset);
	}
	
	public int getTotPage(int pageSize) {
		int totPall=palletMapper.countPallet();
		
		return (int) Math.ceil((double) totPall/pageSize);
	}

	@Transactional
	public Integer creaPalletConScatole(Pallet pallet, List<Integer> idScatole) {
		
		//Creazione di un codicePallet che sarà del tipo PALL + data (yyyyMMdd) + 3 cifre autoincrementali
		String prefisso ="PALL"+ new SimpleDateFormat("yyyyMMdd").format(new Date()) + "-";
		Integer codiceProgressivoPrec = palletMapper.getUltimaCifraProgressivo(prefisso + "%");
		int nuovoProgressivo =(codiceProgressivoPrec == null)? 1 : codiceProgressivoPrec + 1;
		String codiceFinale= prefisso + String.format("%03d", nuovoProgressivo);
		
		pallet.setCodicePallet(codiceFinale);
		pallet.setStatoDescrizione("Chiuso");
		
		palletMapper.insertPallet(pallet);
		Integer idGenerato=pallet.getIdPallet();
		
		if(idScatole != null && !idScatole.isEmpty()) {
			scatoleMapper.pallettizzazioneScatole(idGenerato, idScatole);
		}
		
		return idGenerato;
	}
	
	@Transactional
    public void eliminaPalletESvincolaScatole(Integer idPallet) {
        scatoleMapper.svincolaScatole(idPallet);
        palletMapper.deleteById(idPallet);
    }
	

}
