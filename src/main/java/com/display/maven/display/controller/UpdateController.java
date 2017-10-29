package com.display.maven.display.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.display.maven.util.UploadFilePathUtil;

@Controller
@RequestMapping("upload")
public class UpdateController {
	
	/**
	 * 上传文件 返回ppt的转flash的文件名
	 * @param request
	 * @param model
	 * @param file
	 * @return
	 */
	@RequestMapping(value = "flash")
	public String user_info_update(HttpServletRequest request, Model model, MultipartFile file) {
		// 返回文件名
		String filename = UploadFilePathUtil.toupload(file, request);
		// 调用lash
		String flashname = UploadFilePathUtil.toflash(filename, request); //flash文件名
		request.getSession().setAttribute("swfpath", filename);
		// model.addAttribute("swfpath", filename);
		return "redirect:/documentView.jsp";

	}
}
