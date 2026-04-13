package com.example.esempioFiven.model;

import java.math.BigDecimal;
import java.util.Date;

public class Accesso {
	private BigDecimal idAccesso;
	private BigDecimal operaoreId;
	private Integer postazioneId;
	private Date loginDate;
	private Date logoutDate;
	
	
	public Accesso(BigDecimal operaoreId, Integer postazioneId, Date loginDate, Date logoutDate) {
		this.operaoreId = operaoreId;
		this.postazioneId = postazioneId;
		this.loginDate = loginDate;
		this.logoutDate = logoutDate;
	}


	public BigDecimal getIdAccesso() {
		return idAccesso;
	}


	public void setIdAccesso(BigDecimal idAccesso) {
		this.idAccesso = idAccesso;
	}


	public BigDecimal getOperaoreId() {
		return operaoreId;
	}


	public void setOperaoreId(BigDecimal operaoreId) {
		this.operaoreId = operaoreId;
	}


	public Integer getPostazioneId() {
		return postazioneId;
	}


	public void setPostazioneId(Integer postazioneId) {
		this.postazioneId = postazioneId;
	}


	public Date getLoginDate() {
		return loginDate;
	}


	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}


	public Date getLogoutDate() {
		return logoutDate;
	}


	public void setLogoutDate(Date logoutDate) {
		this.logoutDate = logoutDate;
	}	
}
