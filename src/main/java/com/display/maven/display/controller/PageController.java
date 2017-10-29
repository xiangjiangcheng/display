package com.display.maven.display.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.display.maven.display.domain.Album;
import com.display.maven.display.domain.AlbumImg;
import com.display.maven.display.domain.Background;
import com.display.maven.display.domain.Title;
import com.display.maven.display.domain.extend.MenuConfigExtend;
import com.display.maven.display.service.AlbumImgService;
import com.display.maven.display.service.AlbumService;
import com.display.maven.display.service.BackgroundService;
import com.display.maven.display.service.MenuConfigService;
import com.display.maven.display.service.TitleService;
import com.display.maven.display.service.impl.AlbumImgServiceImpl;
import com.display.maven.display.service.impl.AlbumServiceImpl;

@Controller
@RequestMapping("page")
public class PageController {

	@Resource
	private TitleService titleService;
	@Resource
	private BackgroundService backgroundServiceImpl;
	@Resource
	private MenuConfigService menuconfigServiceImpl;
	@Resource
	private AlbumService albumServiceImpl;
	@Resource
	private AlbumImgService albumImgServiceImpl;
	
	@RequestMapping("ModuleManger")
	public String ModuleManger(){
		 return "display/ModuleManger";
	}
	
	@RequestMapping("indexConfig")
	public String IndexConfig(Model model,HttpServletRequest request){
		String groupid = "";
		// 得到session中的role
		int role = (int) request.getSession().getAttribute("role");
		if (role == 0) {
			// 管理员
			groupid = request.getParameter("groupid");
		} else {
			// 班组
			groupid = (String) request.getSession().getAttribute("groupid");
		}
		
		
		String backgroundid="";
		Background background = new Background();
		List<Background> backgrounds = new ArrayList<>();
		List<Title> title = titleService.getAllTitle(groupid);

		backgroundid = title.get(0).getBackgroundid();
		background = backgroundServiceImpl.getBackgroundById(backgroundid);
		backgrounds = backgroundServiceImpl.getAllBigBg();
		
		model.addAttribute("title", title.get(0));
		model.addAttribute("groupid", groupid);
		model.addAttribute("background", background);
		model.addAttribute("backgrounds", backgrounds);
		return "display/indexConfig";
	}
	/**
	 * 跳转到相册设置
	 * @return
	 */
	@RequestMapping("showPhoto")
	public String showPhoto(Model model,HttpServletRequest request){
		String groupid=(String) request.getSession().getAttribute("groupid");
		List<Album> albums = albumServiceImpl.getByGroupid(groupid);
		List<Object> list = new ArrayList<>();
		List<Object> list2 = new ArrayList<>();
		try {
			for(int i=0;i<albums.size();i++){
				String albumid = albums.get(i).getId();
				List<AlbumImg> albumImgs=albumImgServiceImpl.getByAlbumid(albumid);
				if (albumImgs.size() > 0) {
					// 该相册有图片 ，添加相册信息和第一张图片信息
					list.add(0, albumImgs.get(0));
				} else {
					// 该相册没有图片 添加相册信息
					list.add(0, null);
				}
				list.add(1,albums.get(i));
				list2.add(list);
				list = new ArrayList<>();
				
			}
		} catch (Exception e) {
		}
		
		model.addAttribute("list", list2);
		model.addAttribute("groupid", groupid);
		return "display/showPhotoFile";
	}
	
	/**
	 * 跳转到相册设置
	 * @return
	 */
	@RequestMapping("showPhotoDetail")
	public String showPhotoDetail(){
		return "display/showPhotoDetail";
	}
	/**
	 * 跳转到用户管理页面
	 * @return
	 */
	@RequestMapping("userList")
	public String userList(){
		return "display/showUser";
	}
	/**
	 * 跳转到班组信息管理页面
	 * @return
	 */
	@RequestMapping("groupManange")
	public String groupMange(){
		return "display/showGroup";
	}
	/**
	 * 跳转到Ueditor页面
	 */
	@RequestMapping("showUeditor")
	public String showUeditor(){
		return "display/showUeditor";
	}

	/**
	 * 跳转到富文本管理页面
	 */
	@RequestMapping("ruleManange")
	public String ruleManange(HttpServletRequest request){
		String menuid= request.getParameter("menuid");
		String groupid=request.getParameter("groupid");
		MenuConfigExtend menuConfigExtend=menuconfigServiceImpl.getMenuById(menuid);
		String title=menuConfigExtend.getTitle();
		System.out.println(title);
		request.setAttribute("title", title);
		request.setAttribute("menuid", menuid);
		
		return "display/showRulesMge";
	}
	/**
	 * 跳转到评仪评先页面
	 */
	@RequestMapping("getPageByMenuId")
	public String honorMge(HttpServletRequest request){
		String menuid= request.getParameter("menuid");
		String groupid=request.getParameter("groupid");
		MenuConfigExtend menuConfigExtend=menuconfigServiceImpl.getMenuById(menuid);
		String title=menuConfigExtend.getTitle();
		System.out.println(title);
		request.setAttribute("title", title);
		request.setAttribute("menuid", menuid);
		
		return "display/showHonorMge";
	}
	/**
	 * 跳转到网址修改页面
	 * @return
	 */
	@RequestMapping("showWeb")
	public String showWeb(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "display/showWeb";
	}
	/**
	 * 展示ppt
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("showPPT")
	public String  showPPT(HttpServletRequest request,Model model){
		String menuid = request.getParameter("menuid");
		String groupid = request.getParameter("groupid");
		model.addAttribute("menuid", menuid);
		model.addAttribute("groupid", groupid);
		return "forward:/uploadPPT.jsp";
	}
	/*@RequestMapping("showPPT")
	public String  showPPT(HttpServletRequest request,Model model){
		String menuid = request.getParameter("menuid");
		String groupid = request.getParameter("groupid");
		model.addAttribute("menuid", menuid);
		model.addAttribute("groupid", groupid);
		//return "forward:/documentUpload.jsp";
		return "forward:/uploadPPT.jsp";
	}*/
	
	// ppt
	
	// rich
	
	// form - 微创新
	@RequestMapping("smallInnovate")
	public String  smallInnovate(HttpServletRequest request,Model model){
		try {
			model.addAttribute("menuid", request.getParameter("menuid"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "display/showSmallInnovateList";
	}


	/**
	 * 工作计划list页面
	 * @return
	 */
	@RequestMapping("showPlanList")
	public String showPlanList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "excel/planList";
	}
	/**
	 * 工作总结list页面
	 * @return
	 */
	@RequestMapping("showSummaryList")
	public String showSummaryList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "excel/summaryList";
	}
	/**
	 * 绩效考核list页面
	 * @return
	 */
	@RequestMapping("showCheckList")
	public String showCheckList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "excel/checkList";
	}
	
	/**
	 * 员工考勤list页面
	 * @param request
	 * @return
	 */
	@RequestMapping("showAttendanceList")
	public String showAttendanceList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "excel/attendanceList";
	}
	
	/**
	 * 员工动态页面
	 * @param request
	 * @return
	 */
	@RequestMapping("showDynamicList")
	public String showDynamicList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "excel/dynamicList";
	}
	
	/**
	 * 员工动态页面
	 * @param request
	 * @return
	 */
	@RequestMapping("showTrainList")
	public String showTrainList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		MenuConfigExtend menuConfigExtend=menuconfigServiceImpl.getMenuById(menuid);
		if(menuConfigExtend != null && menuConfigExtend.getPid() != null) {
			menuid = menuConfigExtend.getPid();
		}
		request.setAttribute("menuid", menuid);
		return "excel/trainList";
	}
}
