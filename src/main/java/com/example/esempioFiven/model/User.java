package com.example.esempioFiven.model;


import java.util.Date;
import java.util.List;

public class User {
	private Integer idOperatore;
	private String codiceOperatore;
    private String username;
    private String password;
    private String descrizione;
    private String email;
    private String telFisso;
    private String telMobile;
    private Integer centroDematId;
    private Integer profiloId;
    private Boolean enabled;
    private Integer tentativiFalliti;
    private Date dataInserimento;
    
    private List<DDT> ddt;
    private List<Spedizione> spedizioni;
    private List<Scatola> scatole;
    private List<Documento> documenti;
    
    
    public User(){
    	
    }
    
    
	public Integer getIdOperatore() {
		return idOperatore;
	}
	
	public void setIdOperatore(Integer idOperatore) {
		this.idOperatore = idOperatore;
	}
	
	
	public String getCodiceOperatore() {
		return codiceOperatore;
	}
	
	public void setCodiceOperatore(String codiceOperatore) {
		this.codiceOperatore = codiceOperatore;
	}
	
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getDescrizione() {
		return descrizione;
	}
	
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
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
	
	
	public Integer getCentroDematId() {
		return centroDematId;
	}
	
	public void setCentroDematId(Integer centroDematId) {
		this.centroDematId = centroDematId;
	}
	
	
	public Integer getProfiloId() {
		return profiloId;
	}
	
	public void setProfiloId(Integer profiloId) {
		this.profiloId = profiloId;
	}
	
	
	public Boolean getEnabled() {
		return enabled;
	}
	
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	
	
	public Integer getTentativiFalliti() {
		return tentativiFalliti;
	}
	
	public void setTentativiFalliti(int tentativiFalliti) {
		this.tentativiFalliti = tentativiFalliti;
	}
	
	
	public Date getDataInserimento() {
		return dataInserimento;
	}
	
	public void setDataInserimento(Date dataInserimento) {
		this.dataInserimento = dataInserimento;
	}
	
	
	public List<DDT> getDdt() {
		return ddt;
	}
	
	public void setDdt(List<DDT> ddt) {
		this.ddt = ddt;
	}
	
	
	public List<Spedizione> getSpedizioni() {
		return spedizioni;
	}
	
	public void setSpedizioni(List<Spedizione> spedizioni) {
		this.spedizioni = spedizioni;
	}
	
	
	public List<Scatola> getScatole() {
		return scatole;
	}
	
	public void setScatole(List<Scatola> scatole) {
		this.scatole = scatole;
	}
	
	
	public List<Documento> getDocumenti() {
		return documenti;
	}
	
	public void setDocumenti(List<Documento> documenti) {
		this.documenti = documenti;
	}
	
	
}
