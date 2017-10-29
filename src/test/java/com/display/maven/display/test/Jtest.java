package com.display.maven.display.test;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import junit.framework.TestCase;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath*:/spring-context*.xml","classpath*:/spring-mvc*.xml"}) 
public class Jtest extends TestCase{

	
	@Before
	public void before(){
		System.out.println("测试开始了！");
	}
	
	@Test
	public void testAdd(){
		
		try {
			for(int i=1;i<20;i++){
				

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			System.out.println("测试进行中！");
		}
	}
	
	@After
	public void after(){
		System.out.println("测试结束了！");
	}
}
