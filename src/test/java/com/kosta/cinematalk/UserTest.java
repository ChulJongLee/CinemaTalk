package com.kosta.cinematalk;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kosta.service.UserServiceImple;

import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml")
public class UserTest {
	@Resource(name="userService")
	private UserServiceImple userServiceImple;
	
	@Test
	public void test1() throws OpenAPIFault, Exception {
		userServiceImple.deleteUser(110);
	}
}
