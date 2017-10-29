package com.display.maven.display.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.display.maven.display.domain.AdvancedShow;
import com.display.maven.display.domain.SmallInnovateModule;
import com.display.maven.display.domain.SmallInnovateWithBLOBs;
import com.display.maven.display.service.AdvancedShowService;
import com.display.maven.display.service.MenuConfigService;
import com.display.maven.display.service.smallInnovateWithBLOBsService;
import com.display.maven.util.UUIDUtil;
import com.display.maven.util.UploadFilePathUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;

/**
 * 表单模板、微创新模块/先进展示模块
 * 
 * @author P1306521
 *
 */
@Controller
@RequestMapping("moduleform")
public class ModuleFormController {

	@Resource
	private smallInnovateWithBLOBsService smallInnovateWithBLOBsServiceImpl;
	@Resource 
	private AdvancedShowService advanceShowServiceImpl;
	@Resource
	private MenuConfigService MenuConfigServiceImpl;

	/**
	 * 跳转到先进展示页面
	 */
	@RequestMapping("toAdvancedShow")
	public String toAdvancedShow(HttpServletRequest request, Model model) {
		return "display/showAdvancedShow";
	}
	
	/**
	 * 跳转到先进展示添加页面
	 */
	@RequestMapping("toAddAdvancedShow")
	public String toAddAdvancedShow(HttpServletRequest request, Model model) {
		return "display/addAdvancedShow";
	}
	
	/**
	 * 跳转到先进展示修改页面
	 */
	@RequestMapping("toUpdateAdvancedShow/{id}")
	public String toUpdateAdvancedShow(HttpServletRequest request, @PathVariable("id") String id) {
		AdvancedShow advancedShow = new AdvancedShow();
		try {
			advancedShow = advanceShowServiceImpl.getAdvancedShowByid(id);
		} catch (Exception e) {
		}
		
		request.setAttribute("advancedShow", advancedShow);
		
		return "display/updateAdvancedShow";
	}
	
	@RequestMapping("QueryAdvanceShowData")
	@ResponseBody
	public PageInfo<AdvancedShow> QueryAdvanceShowData(@RequestParam(value = "pageNum") int pageNum,
			@RequestParam(value = "pageSize") int pageSize, HttpServletRequest request) {
		String condition = "";
		try {
			condition = request.getParameter("condition");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 得到班组id
		String groupid = (String) request.getSession().getAttribute("groupid");
		PageInfo<AdvancedShow> advancedShow = null;
		PageHelper.startPage(pageNum, pageSize);
		List<AdvancedShow> list = advanceShowServiceImpl.QueryData(condition, groupid);
		advancedShow = new PageInfo<>(list);
		return advancedShow;
	}
	
	/**
	 * 新增、修改先进展示
	 * 
	 * @return
	 */
	@RequestMapping("addAndUpdateAdvancedShow")
	@ResponseBody
	public Map<String, Object> addAndUpdateAdvancedShow(HttpServletRequest request, @Valid AdvancedShow advancedShow) {
		String message = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result;
		result = new HashMap<String, Object>(); // 实例化map
		// 得到班组id
		HttpSession session = request.getSession();
		String groupid = (String) session.getAttribute("groupid");
		
		try {
			// 判断是新增 还是修改
			int flag = Integer.parseInt(request.getParameter("flag"));
			
			if (flag == 1){
				// 新增
				advancedShow.setGroupid(groupid);
				status = advanceShowServiceImpl.addAdvancedShow(advancedShow);
			} else {
				// 修改
				status = advanceShowServiceImpl.updateAdvancedShow(advancedShow);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("status", status);
		return result;
	}
	
	/**
	 * 删除微创新delete
	 * 
	 * @return
	 */
	@RequestMapping("deleteAdvance")
	@ResponseBody
	public Map<String, Object> deleteAdvance(HttpServletRequest request) {
		String message = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result;
		result = new HashMap<String, Object>(); // 实例化map
		try {
			String id = request.getParameter("id");
			status = advanceShowServiceImpl.delete(id);
		} catch (Exception e) {
			//e.printStackTrace();
		}
		result.put("status", status);
		return result;
	}
	
	
	
	
	
	
	
	/**
	 * 跳转到微创新新建
	 */
	@RequestMapping("toAddSmallInnovate")
	public String toSmallInnovate(HttpServletRequest request, Model model) {
		try {
			model.addAttribute("menuid", request.getParameter("menuid"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "display/addSmallInnovate";
	}

	/**
	 * 跳转到微创新修改页面
	 */
	@RequestMapping("toUpdateSmallInnovate/{id}")
	public String toUpdateSmallInnovate(HttpServletRequest request, @PathVariable("id") String id) {
		request.setAttribute("smallid", id);
		return "display/updateSmallInnovate";
	}

	/**
	 * 跳转到微创新显示模板配置
	 */
	@RequestMapping("toConfigSmallInnovate")
	public String toConfigSmallInnovate(HttpServletRequest request) {

		return "display/configSmallInnovate";
	}

	/**
	 * 根据微创新id查询对应的微创新页面数据
	 * 
	 * @return
	 */
	@RequestMapping("getSmallInnovateByGid")
	@ResponseBody
	public Map<String, Object> getSmallInnovateByGid(HttpServletRequest request) {
		String message = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result;
		result = new HashMap<String, Object>(); // 实例化map
		// 得到微创新id
		String id = request.getParameter("id");
		// 得到数据
		SmallInnovateWithBLOBs sInnovate = new SmallInnovateWithBLOBs();
		try {
			sInnovate = smallInnovateWithBLOBsServiceImpl.getsmallInnovateWithBLOBsById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 如果没有查到微创新
		if (sInnovate == null) {
			// 返回false
			status = false;
		} else {
			status = true;
		}
		result.put("status", status);
		result.put("sInnovate", sInnovate);
		return result;
	}

	/**
	 * 新增、修改微创新显示模板
	 * 
	 * @return
	 */
	@RequestMapping("ConfigSmallInnovate")
	@ResponseBody
	public Map<String, Object> ConfigSmallInnovate(HttpServletRequest request) {
		String message = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result;
		result = new HashMap<String, Object>(); // 实例化map
		// 得到班组id
		HttpSession session = request.getSession();
		String groupid = (String) session.getAttribute("groupid");
		
		SmallInnovateModule smallInnovateModule = null;
		try {
			// 通过班组id查询模板
			smallInnovateModule = smallInnovateWithBLOBsServiceImpl.getSModuleByGid(groupid);
			if (smallInnovateModule == null) {
				// 新增
				smallInnovateModule = new SmallInnovateModule();
				smallInnovateModule.setGroupid(groupid);
				smallInnovateModule.setModule(Integer.parseInt(request.getParameter("module")));
				status = smallInnovateWithBLOBsServiceImpl.addSModule(smallInnovateModule);
			} else {
				// 修改
				smallInnovateModule.setModule(Integer.parseInt(request.getParameter("module")));
				status = smallInnovateWithBLOBsServiceImpl.updateSModule(smallInnovateModule);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("status", status);
		return result;
	}
	
	/**
	 * 新增、修改微创新
	 * 
	 * @return
	 */
	@RequestMapping("addAndUpdateSmallInnovate")
	@ResponseBody
	public Map<String, Object> addAndUpdateSmallInnovate(HttpServletRequest request,@Valid SmallInnovateWithBLOBs smallInnovate) {
		String message = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result;
		result = new HashMap<String, Object>(); // 实例化map
		// 得到班组id
		HttpSession session = request.getSession();
		String groupid = (String) session.getAttribute("groupid");
		try {
			if (smallInnovate.getId() == null || smallInnovate.getId().length() <= 0) {
				// 先根据传过来的菜单id去找到父级的菜单（pid）
				String parentMenu = MenuConfigServiceImpl.getMenuById(smallInnovate.getMenuid()).getPid();
				smallInnovate.setGroupid(groupid);
				smallInnovate.setMenuid(parentMenu);
				// 新增
				status = smallInnovateWithBLOBsServiceImpl.addsmallInnovateWithBLOBs(smallInnovate);
			} else {
				// 修改
				status = smallInnovateWithBLOBsServiceImpl.updatesmallInnovateWithBLOBs(smallInnovate);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		result.put("status", status);
		return result;
	}

	/**
	 * 得到微创新模板
	 * 
	 * @return
	 */
	@RequestMapping("getSModuleByGid")
	@ResponseBody
	public Map<String, Object> getSModuleByGid(HttpServletRequest request) {
		String message = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result;
		result = new HashMap<String, Object>(); // 实例化map
		// 得到班组id
		HttpSession session = request.getSession();
		String groupid = (String) session.getAttribute("groupid");
		// 根据班组id获取该班组微创新已选择的模板
		SmallInnovateModule smallInnovateModule = null;
		try {
			smallInnovateModule = smallInnovateWithBLOBsServiceImpl.getSModuleByGid(groupid);
			request.setAttribute("module", smallInnovateModule.getModule());
		} catch (Exception e) {
			//e.printStackTrace();
		}
		// 如果没有查到
		if (smallInnovateModule == null) {
			// 返回false
			status = false;
		} else {
			status = true;
		}
		result.put("status", status);
		result.put("smallInnovateModule", smallInnovateModule);
		return result;
	}

	@RequestMapping("QueryData")
	@ResponseBody
	public PageInfo<SmallInnovateWithBLOBs> QueryData(@RequestParam(value = "pageNum") int pageNum,
			@RequestParam(value = "pageSize") int pageSize, HttpServletRequest request) {
		String condition = "";
		try {
			condition = request.getParameter("condition");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 得到班组id
		String groupid = (String) request.getSession().getAttribute("groupid");
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<SmallInnovateWithBLOBs> smallInnovate = null;
		List<SmallInnovateWithBLOBs> list = smallInnovateWithBLOBsServiceImpl.QueryData(condition, groupid);
		smallInnovate = new PageInfo<>(list);
		return smallInnovate;
	}
	
	/**
	 * 删除微创新delete
	 * 
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request) {
		String message = ""; // 返回信息
		boolean status = false; // 状态
		Map<String, Object> result;
		result = new HashMap<String, Object>(); // 实例化map
		try {
			String id = request.getParameter("id");
			status = smallInnovateWithBLOBsServiceImpl.delete(id);
		} catch (Exception e) {
			//e.printStackTrace();
		}
		result.put("status", status);
		return result;
	}

	/**
	 * 微创新模块的上传图片
	 * 
	 * @param base64
	 * @param Bgfile
	 * @param request
	 * @return
	 */
	@RequestMapping("uploadFile")
	@ResponseBody
	public String uploadFile(String base64, String Bgfile, HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		// 服务器地址
		String imgPath = request.getServletContext().getRealPath("/") + "static/web/img/smallInnovate/";
		//String imgPath=request.getServletContext().getRealPath("/")+"../smallInnovateUpload/";
		String type = StringUtils.substringAfter(Bgfile, "."); // 后缀
		String fileNames = StringUtils.join(UUIDUtil.getUUID(), ".", type);// 文件名
		String uploadPathName = imgPath + fileNames;// 获取到上传后的文件路径+文件名
		int i = UploadFilePathUtil.saveBasePic(base64, uploadPathName);// 保存图片
		if (i == 1) {
			jsonObject.addProperty("msg", "success");
			jsonObject.addProperty("imgName", fileNames);
		} else {
			jsonObject.addProperty("msg", "error");
		}
		return jsonObject.toString();
	}
	
	
	
}
