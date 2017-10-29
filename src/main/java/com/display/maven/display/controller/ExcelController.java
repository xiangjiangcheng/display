package com.display.maven.display.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.display.maven.display.domain.Excel;
import com.display.maven.display.domain.ModuleTable;
import com.display.maven.display.service.ModuleTableService;
import com.display.maven.util.ReadExcelUtil;
import com.display.maven.util.UUIDUtil;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("excel")
public class ExcelController {
	@Resource
	private ModuleTableService moduleTableService;
	

	/**
	 * 通过pageHelper 分页显示PlanSummary
	 */
	@RequestMapping("doShowPlanList")
	@ResponseBody
	public PageInfo<ModuleTable> doShowPlanSummaryList(int pageNum,int pageSize,String name,String menuid,HttpServletRequest request){
		String groupid=(String) request.getSession().getAttribute("groupid");
		PageHelper.startPage(pageNum, pageSize);
		PageInfo<ModuleTable> pageInfo=null;
		List<ModuleTable> moduleTables=moduleTableService.getModuletable(groupid, menuid,name);
		pageInfo=new PageInfo<>(moduleTables);
		return pageInfo;
	}
	
	/**
	 * 点击删除后，删除表格
	 * @param id
	 * @return
	 */
	@RequestMapping("delExcel")
	@ResponseBody
	public String delExcel(String id){
		JsonObject jsonObject=new JsonObject();
		int i=moduleTableService.dleTableById(id);
		if(i==1)jsonObject.addProperty("msg", "success");
		else jsonObject.addProperty("msg", "error");
		return jsonObject.toString();
	}
	
	/**
	 * 新增工作计划，进入到新增addPlan页面
	 * @param menuid
	 * @param request
	 * @return
	 */
	@RequestMapping("toAddPlan/{menuid}")
	public String toAddExcel(@PathVariable("menuid") String menuid,Model model){
		//获得对应的模板信息
		String type="plan";
		Excel excels=moduleTableService.getExcelModelByType(type);
		model.addAttribute("excels", excels);
		model.addAttribute("menuid", menuid);
		return "excel/addPlan";
	}
	
	/**
	 * 上传Excel
	 * @param file
	 * @param request
	 * @return
	 */
	@RequestMapping(value="uploadExcel",method=RequestMethod.POST)
	@ResponseBody
	public String uploadExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request){
		JsonObject jsonObject=new JsonObject();
		String savePath=request.getServletContext().getRealPath("/")+"static/ExcelUpload/";
		String originName=file.getOriginalFilename();
		//确认文件夹存在
		File SaveFile = new File(savePath);
        if (!SaveFile.exists()) {
        	SaveFile.mkdirs();
        }
        String id=UUIDUtil.getUUID();
        String type=StringUtils.substringAfter(originName, "."); // 后缀
        String filename=StringUtils.join(id,".",type);
        String filePath=savePath+filename;
        File files = new File(filePath);   
        try {
			file.transferTo(files);
			jsonObject.addProperty("filename",filename);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return jsonObject.toString();
		
	}
	
	/**
	 * 上传表格的表单，excel 新增和修改公用
	 * @param menuid
	 * @return
	 */
	@RequestMapping("doAddPlan")
	@ResponseBody
	public String doAddExcel(ModuleTable moduleTable,HttpServletRequest request){
		JsonObject jsonObject=new JsonObject();
		String groupid=(String) request.getSession().getAttribute("groupid");
		moduleTable.setGroupid(groupid);
		int i=moduleTableService.addTable(moduleTable);
		if(i==1){
			jsonObject.addProperty("msg", "success");
		}else{
			jsonObject.addProperty("msg", "error");
		}
		return jsonObject.toString();
	}
	
	/**
	 * ,根据已有的信息预览Excel，通过Id查询
	 * @param id
	 * @return
	 */
	@RequestMapping("previewExcel")
	@ResponseBody
	public Map<String, Object> previewExcel(String id,HttpServletRequest request){
		//根据Id查询出对应的信息
		ModuleTable moduleTable=moduleTableService.getModuleTableById(id);
		String fileName=moduleTable.getFileName();
		String remark;
		Excel excel=moduleTableService.getExcelModelById(moduleTable.getExcelid());
		String filePath=request.getServletContext().getRealPath("/")+"static/ExcelUpload/"+fileName;
		int i=excel.getStartrow(),j=excel.getStartcol();//解析表格的开始行和开始列
		Map<String, Object> map=ReadExcelUtil.readExcel(filePath,i,j);
		if(moduleTable != null && StringUtils.isNotBlank(moduleTable.getRemark())){
			map.put("fileName", moduleTable.getRemark());
			System.out.println(moduleTable.getRemark());
		}
		return map;
	}
	
	/**
	 * 上传之后，没有保存到数据库中，先保存在服务器中的。
	 * @param filename
	 * @return
	 */
	@RequestMapping("previewExcelByName")
	@ResponseBody
	public Map<String, Object> previewExcelByName(String filename,String excelid,HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String filePath=request.getServletContext().getRealPath("/")+"static/ExcelUpload/"+filename;
		Excel excel=moduleTableService.getExcelModelById(excelid);
		int i=excel.getStartrow(),j=excel.getStartcol();//解析表格的开始行和开始列
		map=ReadExcelUtil.readExcel(filePath,i,j);//文件名，开始行，开始列
		return map;
	}
	

	/**
	 * 新增工作总结，其格式与plan相同，进入addPlan页面
	 * 添加的summary的表单提交
	 * @param menuid
	 * @param model
	 * @return
	 */
	@RequestMapping("toAddSummary/{menuid}")
	public String toAddSummary(@PathVariable("menuid") String menuid,Model model){
		//获得对应的模板信息
		String type="summary";
		Excel excels=moduleTableService.getExcelModelByType(type);
		model.addAttribute("excels", excels);
		model.addAttribute("menuid", menuid);
		return "excel/addPlan";
	}
	
	/**
	 * 新增绩效考核页面，不是通用模板，新建add页面，进入addCheck
	 * @param menuid
	 * @param model
	 * @return
	 */
	@RequestMapping("toAddCheck/{menuid}")
	public String toAddCheck(@PathVariable("menuid") String menuid,Model model){
		//获得对应的模板信息
		String type="check";
		Excel excels=moduleTableService.getExcelModelByType(type);
		model.addAttribute("excels", excels);
		model.addAttribute("menuid", menuid);
		return "excel/addCheck";
	}
	
	/**
	 * 新增员工考勤页面，其不是普通模板，新建Add页面
	 * 进入addAttendance.jsp
	 * @param menuid
	 * @param model
	 * @return
	 */
	@RequestMapping("toAddAttendance/{menuid}")
	public String toAddAttendance(@PathVariable("menuid") String menuid,Model model){
		//获得对应的模板信息
		String type="attendance";
		Excel excels=moduleTableService.getExcelModelByType(type);
		model.addAttribute("excels", excels);
		model.addAttribute("menuid", menuid);
		return "excel/addAttendance";
	}
	
	
	/**
	 * 添加的summary的表单提交
	 * @param menuid
	 * @param model
	 * @return
	 */
	@RequestMapping("toAddDynamic/{menuid}")
	public String toAddDynamic(@PathVariable("menuid") String menuid,Model model){
		//获得对应的模板信息
		String type="dynamic";
		Excel excels=moduleTableService.getExcelModelByType(type);
		model.addAttribute("excels", excels);
		model.addAttribute("menuid", menuid);
		return "excel/addDynamic";
	}
	
	/**
	 * 添加的train的表单提交
	 * @param menuid
	 * @param model
	 * @return
	 */
	@RequestMapping("toAddTrain/{menuid}")
	public String toAddTrain(@PathVariable("menuid") String menuid,Model model){
		//获得对应的模板信息
		String type="train";
		Excel excels=moduleTableService.getExcelModelByType(type);
		model.addAttribute("excels", excels);
		model.addAttribute("menuid", menuid);
		return "excel/addTrain";
	}
	
	@RequestMapping("DownloadMyModel")
	public void DownloadMyModel(HttpServletRequest request,HttpServletResponse response,String id) throws Exception{
		//根据excel的id拿到模板的文件名
		Excel excel=moduleTableService.getExcelModelById(id);
		String filename=excel.getFilename();
		//转码，免得文件名中文乱码  
        filename = URLEncoder.encode(filename,"UTF-8");  
		//得到文件路径，相对于服务器  
        String fileName = request.getSession().getServletContext().getRealPath("\\static\\web\\excelModel\\")+"\\"+filename;  
        //获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));  
        //设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + new String(excel.getName().getBytes("utf-8"),"iso-8859-1")+".xlsx");    
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
        response.setContentType("multipart/form-data");   
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
        int len = 0;  
        while((len = bis.read()) != -1){  
            out.write(len);  
            out.flush();  
        }  
        out.close();  
	}
	
	
}
