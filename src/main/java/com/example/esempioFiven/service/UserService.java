package com.example.esempioFiven.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.esempioFiven.dto.ProfiloUserDTO;
import com.example.esempioFiven.mapper.ProfiloUserMapper;
import com.example.esempioFiven.model.User;
import com.example.esempioFiven.mybatis.mapper.UserMapper;

@Service
public class UserService {
	
	private final UserMapper userMapper;
	
	public UserService(UserMapper userMapper) {
		this.userMapper=userMapper;
	} 
	
	public User getUserByUsername(String username) {
		return userMapper.getByUsername(username);
	}
	
	@Transactional
	public void loginFailed(String username) {
		int updated = userMapper.incrementTentativiFalliti(username);
        System.out.println("Tentativi falliti incrementati, righe aggiornate: " + updated);
    }
	
	@Transactional
	public void loginSuccess(String username) {
		int updated = userMapper.resetTentativiFalliti(username);
        System.out.println("Tentativi falliti resettati, righe aggiornate: " + updated);
    }
	
	@Transactional
	public void incrementFailedAttempts(String username) {
	    userMapper.resetTentativiFalliti(username);
	}
		
	public List<ProfiloUserDTO> getAllOperatori(){
		List<User> users=userMapper.findAllUtenti();
		
		return users.stream().map(ProfiloUserMapper::toDTO).toList();
	}
	
}
