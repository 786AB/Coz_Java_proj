package com.crts.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crts.entity.UserEntity;
import com.crts.repo.UserRepo;

@Service
public class UserService {

	@Autowired
	private UserRepo userRepo;

	public boolean getuser(String userName, String password) {
		boolean getres = false;
		try {
			System.out.println(userName);
			System.out.println(password);
			UserEntity entity = this.userRepo.getByuName(userName);
System.out.println("====================");
			System.out.println(entity.getuName());
			System.out.println(entity.getuPassword());

			if (userName.equals(entity.getuName()) && password.equals(entity.getuPassword())) {
				getres = true;
			} else {
				getres = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return getres;

	}
}
