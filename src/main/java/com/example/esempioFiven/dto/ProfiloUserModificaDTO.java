package com.example.esempioFiven.dto;

public class ProfiloUserModificaDTO {
	
    private String email;
    private String telFisso;
    private String telMobile;
    
    public ProfiloUserModificaDTO() {
    	
    }
    
    public ProfiloUserModificaDTO(String email, String telFisso, String telMobile) {
        this.email = email;
        this.telFisso = telFisso;
        this.telMobile = telMobile;
    }

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelFisso() {
		return telFisso;
	}

	public void setTelFisso(String telFisso) {
		this.telFisso = telFisso;
	}

	public String getTelMobile() {
		return telMobile;
	}

	public void setTelMobile(String telMobile) {
		this.telMobile = telMobile;
	}
}
