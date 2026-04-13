package com.example.esempioFiven.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.esempioFiven.dto.PalletDTO;
import com.example.esempioFiven.model.Pallet;

@Mapper
public interface PalletMapper {
	
	List<Pallet> findPalletPage(@Param("pageSize") int pageSize, @Param("offset") int offset);
	
	PalletDTO findPalletById(Integer idPallet);
	
	int countPallet();
	
	int insertPallet(Pallet pallet);
	
	Integer getUltimaCifraProgressivo(@Param("prefisso") String prefisso);
	void deleteById(@Param("id") Integer id);
	
}
