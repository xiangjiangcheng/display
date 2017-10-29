package com.display.maven.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.springframework.web.multipart.MultipartFile;
public class UploadFilePathUtil {
	
	/**
	 * 对base64的图片进行解析
	 */
	public static int saveBasePic(String base64,String path){
		base64 = base64.substring(23);//去除前缀
        File file=new File(path);
         if (!file.getParentFile().exists()) {
        	 file.getParentFile().mkdirs();
         }
         try {  
             byte[] decodedBytes = Base64.decodeBase64(base64);// 将字符串格式的imagedata转为二进制流（biye[])的decodedBytes  
             for(int i=0;i<decodedBytes.length;++i){    
                 if(decodedBytes[i]<0) {  
                     //调整异常数据    
                     decodedBytes[i]+=256;    
                 }
             }
             FileOutputStream fo = new FileOutputStream(path);  //调用文件输出流
             fo.write(decodedBytes);//将文件写到本地
             fo.flush();
             fo.close();
             return 1;
         }catch(Exception e){
     		e.printStackTrace();
     		return 0;
     	}
	}
	
	/**
	 * 上传文件 
	 */
	public static String toupload(MultipartFile file, HttpServletRequest request) {
		String filename = "";
		try {
			// 图片原始名称
			String originalName = file.getOriginalFilename();
			// 上传文件处理
			if (!file.isEmpty()) {
				// 1、保存图片的物理路径  - 虚拟路径为：http://localhost:8080/Mavenuser/file/photos
				// String path = "D:\\file\\photos";   
				String path = request.getSession().getServletContext().getRealPath("upload");
		        System.out.println("path:"+path);
		        // 文件夹不存在 新建文件夹
		        if(!new File(path).exists())	{
		            new File(path).mkdirs();
		          }
				// 2、新的图片名称
				String fileNewName = UUID.randomUUID() + originalName.substring(originalName.lastIndexOf("."));
				// 3、新图片产生
				//File file = new File(path+'\\' + picNewName);
				
				File tmp = new File(path, fileNewName);
				// 4、将内存中的数据写入磁盘
				file.transferTo(tmp);
				// 5、将图片名称写入User对象中
				// info.setIntroduce(picNewName);
				// 6. 将图片信息写入文件表中 
				filename = fileNewName;	 // 文件名
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return filename;

	}
	
	/**
	 * 转flash
	 */
	public static String toflash(String fileName,HttpServletRequest request) {
		 //获取文件上传路径  
		String saveDirectory =request.getSession().getServletContext().getRealPath("upload");
		//打印上传路径信息  
		System.out.println(saveDirectory);  
		try {
			 
			//获取上传文件的扩展名  
	         String extName=fileName.substring(fileName.lastIndexOf(".")+1);  
	         //文件全路径  
	         String lastFileName= saveDirectory+"\\" + fileName;  
	         //获取需要转换的文件名,将路径名中的'\'替换为'/'  
	         String converfilename = saveDirectory.replaceAll("\\\\", "/")+"/"+fileName;  
	         System.out.println(converfilename);  
	         //调用转换类DocConverter,并将需要转换的文件传递给该类的构造方法  
	         DocConverter d = new DocConverter(converfilename);  
	         //调用conver方法开始转换，先执行doc2pdf()将office文件转换为pdf;再执行pdf2swf()将pdf转换为swf;  
	         d.conver();  
	         fileName = fileName.substring(0, fileName.lastIndexOf("."))+".swf";  
	          

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileName;

	}

}
