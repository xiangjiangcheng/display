package com.display.maven.display.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.display.maven.display.domain.Background;
import com.display.maven.display.domain.Title;
import com.display.maven.display.service.BackgroundService;
import com.display.maven.display.service.TitleService;
import com.display.maven.util.UUIDUtil;
import com.display.maven.util.UploadFilePathUtil;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("indexConfig")
public class IndexConfigController {

	@Resource
	private TitleService titleServiceImpl;
	@Resource
	private BackgroundService backgroundServiceImpl;
	
	/**
	 * 修改首页配置
	 * @param title
	 * @return
	 */
	@RequestMapping("updateConfig")
	public String UpdateConfig(Title title,Model model,HttpServletRequest request){
		Title newTitle = new Title();
		Background background = new Background();
		List<Background> backgrounds = new ArrayList<>();
		int j = 0;
		int i = 0;
		String backgroundid = "";
		String id = title.getId();
		String title1 = title.getTitle1();
		String title2 = title.getTitle2();
		backgroundid = title.getBackgroundid();
		if (backgroundid.contains(".")) {
			backgrounds = backgroundServiceImpl.getBackgroundByName(backgroundid);
			if (backgrounds.size()==0) {
				background.setBgname(backgroundid);
				j = backgroundServiceImpl.addBackground(background);
			}	
			backgroundid = backgroundServiceImpl.getBackgroundByName(backgroundid).get(0).getId();
		} 
		newTitle.setId(id);
		newTitle.setTitle1(title1);
		newTitle.setTitle2(title2);
		newTitle.setBackgroundid(backgroundid);
		newTitle.setGroupStBgcolor(title.getGroupStBgcolor());
		i = titleServiceImpl.updateTitle(newTitle);//更改title表
		
		if (i==1||j==1) {
			model.addAttribute("msg", "修改成功！");
		} else {
			model.addAttribute("msg", "修改失败！");
		}
		 
		//将所有数据传送到页面
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
		String sqlbackgroundid="";
		Background sqlbackground = new Background();
		List<Background> sqlbackgrounds = new ArrayList<>();
		List<Title> sqltitle = titleServiceImpl.getAllTitle(groupid);

		sqlbackgroundid = sqltitle.get(0).getBackgroundid();
		sqlbackground = backgroundServiceImpl.getBackgroundById(sqlbackgroundid);
		sqlbackgrounds = backgroundServiceImpl.getAllBigBg();
		
		model.addAttribute("title", sqltitle.get(0));
		model.addAttribute("groupid", groupid);
		model.addAttribute("background", sqlbackground);
		model.addAttribute("backgrounds", sqlbackgrounds);
		
		return "display/indexConfig";
	}
	
	/**
	 * 上传图片
	 * @param file
	 * @return
	 */
	@RequestMapping("addbigbg")
	@ResponseBody
	public String addbigbg(String base64,String Bgfile,HttpServletRequest request){
		JsonObject jsonObject=new JsonObject();
		//服务器地址
		String imgPath=request.getServletContext().getRealPath("/")+"static/web/img/bg/";
		System.out.println("lujing ::   "+imgPath);
		String type=StringUtils.substringAfter(Bgfile, "."); // 后缀
        String fileNames = StringUtils.join(UUIDUtil.getUUID(),".",type);//文件名
        String uploadPathName = imgPath + fileNames;//获取到上传后的文件路径+文件名 
        int i=UploadFilePathUtil.saveBasePic(base64, uploadPathName);//保存图片
        if(i==1){
        	jsonObject.addProperty("msg", "success");
        	jsonObject.addProperty("imgName", fileNames);
        }else{
        	jsonObject.addProperty("msg", "error");
        }
        return jsonObject.toString();
	}

}
