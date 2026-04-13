package com.example.esempioFiven.mybatis.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.esempioFiven.model.OggettoInventario;
import com.example.esempioFiven.model.Scatola;

@Mapper
public interface ScatoleMapper {
    
    List<Scatola> findAllScatole();
    List<OggettoInventario> findAllInventario();
    List<Scatola> findScatoleDaReggiare(@Param("pageSizeRegg") int pageSizeRegg, @Param("offsetRegg") int offsetRegg, @Param("keywordRegg") String keywordRegg);
    int countScatoleDaReggiare(@Param("keywordRegg") String keywordRegg);
    

    int countScatole(@Param("stato") String stato, @Param("keyword") String keyword,
            @Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("operatore") String operatore);

    List<Scatola> findAllWithMazzetteImpaginato(@Param("pageSize") int pageSize, 
            @Param("offset") int offset, @Param("orderBy") String orderBy, 
            @Param("direzione") String direzione, @Param("stato") String stato, 
            @Param("keyword") String keyword, @Param("startDate") Date startDate, 
            @Param("endDate") Date endDate, @Param("operatore") String operatore);

    // Metodo per la dropdown con gli operatori
    @org.apache.ibatis.annotations.Select(
    		"SELECT DISTINCT CONCAT(u.idOperatore, '|', u.descrizione) " +
    		"FROM users u " +
    		"INNER JOIN scatole s ON u.idOperatore = s.idOperatoreFK " +
    		"ORDER BY CONCAT(u.idOperatore, '|', u.descrizione) ASC")
    		List<String> findDistinctOperatori();

    @org.apache.ibatis.annotations.Select("SELECT DISTINCT statoDescrizione FROM scatole ORDER BY statoDescrizione ASC")
    List<String> findDistinctStati();
    
    void inserisciScatola(Scatola scatola);
    void decrementoInventario(String tipo);
    boolean existsByCodice(@Param("codiceScatola") String codiceScatola);
    void pallettizzazioneScatole(@Param("idPallet") Integer idPallet, @Param("idScatole") List<Integer> idScatole);
    List<Scatola> findScatoleByPallet(Integer id);
    
    List<Scatola> findDisponibiliPerDdt(@Param("idDdt") Integer idDdt);
    
    void svincolaScatole(@Param("idPallet") Integer idPallet);
    
}