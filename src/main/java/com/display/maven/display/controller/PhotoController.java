package com.display.maven.display.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.display.maven.display.domain.Album;
import com.display.maven.display.domain.AlbumImg;
import com.display.maven.display.service.AlbumImgService;
import com.display.maven.display.service.AlbumService;
import com.display.maven.util.UUIDUtil;
import com.display.maven.util.UploadFilePathUtil;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import com.mysql.fabric.xmlrpc.base.Array;

@Controller
@RequestMapping("album")
public class PhotoController {

	@Resource
	private AlbumService albumService;
	@Resource
	private AlbumImgService albumImgService;
	
	@RequestMapping("toAddAlbum")
	@ResponseBody
	public String toAddAlbum(@RequestParam(value="title" ,required=true) String title ,@RequestParam( value="groupid",required=true) String groupid,HttpServletRequest request){
		JsonObject jsonObject = new JsonObject();
		System.out.println(title);
		//String groupid = (String) request.getSession().getAttribute("groupid");
		Album album = new Album();
		album.setName(title);
		album.setGroupid(groupid);
		int i = albumService.addAlbum(album);
		if (i==1) {
			jsonObject.addProperty("msg", "添加成功！");
		} else {
			jsonObject.addProperty("msg", "添加失败！");
		}
		return jsonObject.toString();
	}
	
	@RequestMapping("showPhotoDetil")
	public String showPhotoDetil(HttpServletRequest request){
		String albumid = request.getParameter("id");
		Album album = albumService.getById(albumid);
		List<AlbumImg> albumImgs = albumImgService.getByAlbumid(albumid);
		request.setAttribute("albumImgs", albumImgs);
		request.setAttribute("album", album);
		return "display/showPhotoes";
	}
	
	@RequestMapping("toDeleteAlbum")
	@ResponseBody
	public String toDeleteAlbum(@RequestParam("id") String id,HttpServletRequest request){
		JsonObject jsonObject = new JsonObject();
		
		Album album = albumService.getById(id);
		album.setDlt(1);
		int i = albumService.updateAlbum(album);
		if (i==1) {
			jsonObject.addProperty("msg", "删除成功！");
		} else {
			jsonObject.addProperty("msg", "删除失败！");
		}
		return jsonObject.toString();
	}
	
	@RequestMapping("toDeleteAlbumImg")
	@ResponseBody
	public String toDeleteAlbumImg(@RequestParam("id") String id,HttpServletRequest request){
		JsonObject jsonObject = new JsonObject();
		
		AlbumImg albumImg = albumImgService.getById(id);
		albumImg.setDlt(1);
		int i = albumImgService.updateAlbumImg(albumImg);
		if (i==1) {
			jsonObject.addProperty("msg", "删除成功！");
		} else {
			jsonObject.addProperty("msg", "删除失败！");
		}
		return jsonObject.toString();
	}
	
	/**
	 * 上传图片
	 * @param file
	 * @return
	 */
	@RequestMapping("addphoto")
	@ResponseBody
	public String addbigbg(String base64,String Bgfile,HttpServletRequest request){
		JsonObject jsonObject=new JsonObject();
		//服务器地址
		String imgPath=request.getServletContext().getRealPath("/")+"static/web/img/photo/";
		System.out.println(imgPath);
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
	
	@RequestMapping("toAddAlbumImg")
	@ResponseBody
	public String toAddAlbumImg(@RequestParam("info") String info,
			@RequestParam("albumid") String albumid,
			@RequestParam("name") String albumname,
			@RequestParam("info2") String info2,
			HttpServletRequest request){
		JsonObject jsonObject = new JsonObject();
		//通过JsonParser对象可以把json格式的字符串解析成一个JsonElement对象
		Gson mg = new Gson();
		int j = 0;
        List<AlbumImg> newimg = mg.fromJson(info,new TypeToken<List<AlbumImg>>(){}.getType());
        if (!info.isEmpty()) {
			for (int i=0; i<newimg.size()-1; i++) {
				AlbumImg albumImg1 = newimg.get(i);
				albumImg1.setAlbumId(albumid);
				j=albumImgService.addAlbumImg(albumImg1);
			}
        }else{
        	j=1;
        }
        
        //数据库中已经存在的图片修改title
        List<AlbumImg> oldimg = mg.fromJson(info2,new TypeToken<List<AlbumImg>>(){}.getType());
        if (!info2.isEmpty()) {
			for (int i=0; i<oldimg.size()-1; i++) {
				AlbumImg albumImg = oldimg.get(i);
				String id = albumImg.getId();
				String realname = albumImg.getRealname();
				AlbumImg albumImg2 = albumImgService.getById(id);
				albumImg2.setRealname(realname);
				j=albumImgService.updateAlbumImg(albumImg2);
			}
        }else{
        	j=1;
        }
		//修改相册标题
		Album album = albumService.getById(albumid);
		album.setName(albumname);
		int x = albumService.updateAlbum(album);

		if (j==1 || x==1) {
			jsonObject.addProperty("msg", "修改成功！");
		} else {
			jsonObject.addProperty("msg", "修改失败！");
		}
		
		return jsonObject.toString();
	}
}
