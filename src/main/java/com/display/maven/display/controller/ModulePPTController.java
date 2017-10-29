package com.display.maven.display.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.display.maven.display.domain.ModulePpt;
import com.display.maven.display.service.ModulePPTService;
import com.display.maven.util.UploadFilePathUtil;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("module")
public class ModulePPTController {

	@Resource
	private ModulePPTService modulePPTService;

	/**
	 * 上传文件 返回ppt的转flash的文件名
	 * @param request
	 * @param model
	 * @param file
	 * @return
	 */
	@RequestMapping("flash")
	@ResponseBody
	public Map<String, Object> user_info_update(HttpServletRequest request, Model model, MultipartFile file) {
		Map<String, Object> map = new HashMap<String, Object>();
 		// 返回文件名
		String filename = UploadFilePathUtil.toupload(file, request);
		// 调用lash
		String flashname = UploadFilePathUtil.toflash(filename, request); //flash文件名
		//request.getSession().setAttribute("swfpath", filename);
		map.put("filename", filename);
		map.put("flashname", flashname);
		return map;

	}
	/**
	 * 查询ppt
	 * @param filename
	 * @param groupid
	 * @param menuid
	 * @return
	 */
	@RequestMapping("QueryFlash")
	@ResponseBody
	public Map<String, Object> QueryFlash(String groupid){
		System.out.println(groupid);
		ModulePpt modulePpt = new ModulePpt();
		Map<String, Object> map = new HashMap<>();
		modulePpt = modulePPTService.getByGroupId(groupid);
		map.put("modulePpt", modulePpt);
		return map;
	}
	@RequestMapping("toaddFlash")
	@ResponseBody
	public String ToaddFlash(@RequestParam("filename") String filename,String groupid,String menuid,HttpServletRequest request){
		JsonObject jsonObject = new JsonObject();
		ModulePpt modulePpt = new ModulePpt();
		modulePpt.setGroupid(groupid);
		modulePpt.setMenuid(menuid);
		modulePpt.setFileName(filename);
		// 根据班组id获取 
		int i = 0;
		boolean flag = false;
		ModulePpt getmodulePpt = modulePPTService.getByGroupId(groupid);
		if (getmodulePpt == null) {
			// 如果没有就添加 
			i = modulePPTService.addModulePPT(modulePpt);
		} else {
			// 存在修改
			// getmodulePpt.setDlt(1);
			getmodulePpt.setFileName(filename);
			flag = modulePPTService.updateModulePpt(getmodulePpt);
		}
		
		if (i==1) {
			jsonObject.addProperty("flag", true);
		}else{
			jsonObject.addProperty("msg", "添加失败！");
		}
		jsonObject.addProperty("flag", flag);
		return jsonObject.toString();
	}
}
