package com.example.esempioFiven.mybatis.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.esempioFiven.model.User;

@Mapper
public interface UserMapper {
	User getByUsername(@Param("username") String username);
	
	Integer incrementTentativiFalliti(String username);
	Integer resetTentativiFalliti(String username);
	
	void updateProfilo(@Param("username") String username, @Param("email") String email, @Param("telFisso") String telFisso, @Param("telMobile") String telMobile);
	
	List<User> findAllUtenti();
}
