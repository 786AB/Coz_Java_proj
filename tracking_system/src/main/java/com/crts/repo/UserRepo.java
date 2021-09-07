package com.crts.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crts.entity.UserEntity;

@Repository
public interface UserRepo extends JpaRepository<UserEntity, Integer> {

	public UserEntity getByuName(String un); 

	public UserEntity getByuPassword(String pw); 
	
	
	
	
}
