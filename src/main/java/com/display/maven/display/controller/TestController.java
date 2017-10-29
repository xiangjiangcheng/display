package com.display.maven.display.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.display.maven.display.service.GroupService;

@Controller
@RequestMapping("test")
public class TestController {
	@Resource
	public GroupService groupService;
	
	@RequestMapping("test")
	public String index(HttpServletResponse response, Model model) {
		
		return null;
		
	}
}
