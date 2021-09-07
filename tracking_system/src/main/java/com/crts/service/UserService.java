
package com.crts.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crts.entity.UserEntity;
import com.crts.repo.UserRepo;

@Service
public class UserService {

	@Autowired
	private UserRepo userRepo;

	public boolean getuser(String userName) {
		boolean getres = false;
		UserEntity entity = this.userRepo.getByuName(userName);
		if(userName.equals(entity.getuName()))
		{
			getres =true;
		}
		else
		{
			getres =true;
		}
		 return getres;
	}
}
