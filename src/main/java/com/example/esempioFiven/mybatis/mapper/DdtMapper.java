package com.example.esempioFiven.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.esempioFiven.model.DDT;

@Mapper
public interface DdtMapper {
	List<DDT> findAllIdDdt();
	
	DDT findById(Integer idDdt);
	int countDdt(); 
	List<DDT> findDdtPage(@Param("pageSize") int pageSize,@Param("offset") int offset);
	void insertDdt(DDT ddt);

    boolean existsByCodeDdt(@Param("codiceDdt") String codiceDdt);
    void aggiornaConteggioColli(@Param("idDdt") Integer idDdt);
	
}
