package com.example.esempioFiven.mapper;


import com.example.esempioFiven.dto.ProfiloUserDTO;
import com.example.esempioFiven.dto.ProfiloUserModificaDTO;
import com.example.esempioFiven.model.User;
import com.example.esempioFiven.util.CollocamentoCitta;
import com.example.esempioFiven.util.RuoliOperatori;

public class ProfiloUserMapper {

    private ProfiloUserMapper() {} // impedisce istanziazione

    public static ProfiloUserDTO toDTO(User user) {

        Integer centroDematId = user.getCentroDematId();
        String citta = (centroDematId != null? CollocamentoCitta.getCittaById(centroDematId): "Non assegnata");

        Integer profiloId = user.getProfiloId();
        String ruolo = (profiloId != null ? RuoliOperatori.getRuoloById(profiloId): "Non assegnato");

        

        
        return new ProfiloUserDTO(user.getCodiceOperatore(), user.getUsername(), user.getDescrizione(),user.getEmail(), user.getTelFisso(), user.getTelMobile(), ruolo , citta);
    }
    
    public static ProfiloUserModificaDTO toEditDTO(User user) {
        return new ProfiloUserModificaDTO(
            user.getEmail(),
            user.getTelFisso(),
            user.getTelMobile()
        );
    }
}
