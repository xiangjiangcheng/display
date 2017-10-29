package com.display.maven.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 读取Excel中的信息
 * @author P1306066
 *
 */
public  class ReadExcelUtil {
	private Logger logger =LoggerFactory.getLogger(ReadExcelUtil.class);
	private Workbook wb;//工作簿
	private Sheet sheet;//整个数据表
	private Row row;//行
	
	public ReadExcelUtil(String filePath){
		if(filePath==null){
			return;
		}else{
			String type=StringUtils.substringAfterLast(filePath, ".");
			try{
				InputStream is = new FileInputStream(filePath);
				if("xls".equals(type)){
					wb = new HSSFWorkbook(is);
				}else if("xlsx".equals(type)){
					wb = new XSSFWorkbook(is);
				}else{
					wb=null;
				}
			}catch(Exception e){
				logger.debug("解析Excel失败！");
			}
		}
	}
	
	/**
	 * 读取表格的表头
	 * @return
	 * @throws Exception
	 */
	public String[] readExcleTitle(int startrow, int startcol) throws Exception{
		if(wb==null){
			throw new Exception("Workbook对象为空！");
		}
		sheet=wb.getSheetAt(0);
		row=sheet.getRow(0);
		//标题的总列数
		int col=row.getPhysicalNumberOfCells();
		System.out.println(col);
		String[] title = new String[col-startcol];
		for (int i = startcol; i < col; i++) {
			row=sheet.getRow(startrow);
			row.getCell(i).setCellType(Cell.CELL_TYPE_STRING);
			title[i-startcol] = row.getCell(i).getStringCellValue();
			System.out.println(title[i-startcol]);
		}
		
		return title;
	}
	
	public Map<Integer, Map<Integer,Object>> readExcelContent(int startrow, int startcol) throws Exception{
		if(wb==null){
			throw new Exception("Workbook对象为空！");
		}
		Map<Integer, Map<Integer,Object>> content = new HashMap<Integer, Map<Integer,Object>>();
		sheet = wb.getSheetAt(0);
		// 得到总行数
		int rowNum = sheet.getLastRowNum();
		
		row = sheet.getRow(0);
		int colNum = row.getPhysicalNumberOfCells();//获取表格的列的数量
		// 正文内容应该从开始行的第二行开始,第一行为表头的标题
		for (int i = startrow+1; i <= rowNum; i++) {
			row=sheet.getRow(i);
			int j = startcol;
			Map<Integer,Object> cellValue = new HashMap<Integer, Object>();
			try {
				while (j < colNum) {
					Object obj = getCellFormatValue(row.getCell(j));
					cellValue.put(j, obj);
					j++;
				}
			} catch (Exception e) {
				System.out.println(i);
				e.printStackTrace();
			}
			content.put(i, cellValue);
		}
		return content;
	}
		
		
		
		/**
		 * 
		 * 根据Cell类型设置数据
		 * 
		 * @param cell
		 * @return
		 * @author zengwendong
		 */
		private Object getCellFormatValue(Cell cell){
			Object cellvalue = "";
			if (cell != null) {
				// 判断当前Cell的Type
				switch (cell.getCellType()) {
				case Cell.CELL_TYPE_NUMERIC:// 如果当前Cell的Type为NUMERIC
				case Cell.CELL_TYPE_FORMULA: {
					// 判断当前的cell是否为Date
					if (DateUtil.isCellDateFormatted(cell)) {
						Date date = cell.getDateCellValue();
						String toString=com.display.maven.util.DateUtil.toDateTimeString(date, "yyyy/MM/dd");
						cellvalue = toString;
					} else {// 如果是纯数字
						// 取得当前Cell的数值
						double value = cell.getNumericCellValue();
						if(isIntegerForDouble(value)){
							cellvalue = String.valueOf(new Double(value).intValue());
						} else {
							cellvalue = String.valueOf(value);
						}
					}
					break;
				}
				case Cell.CELL_TYPE_STRING:// 如果当前Cell的Type为STRING
					// 取得当前的Cell字符串
					cellvalue = cell.getRichStringCellValue().getString();
					break;
				default:// 默认的Cell值
					cellvalue = "";
				}
			} else {
				cellvalue = "";
			}
			return cellvalue;
		}
		
		public static Map<String ,Object> readExcel(String filePath,int startrow,int startcol){
			Map<String,Object> map=new HashMap<String,Object>();
			try {
				ReadExcelUtil excelReader = new ReadExcelUtil(filePath);
				// 对读取Excel表格标题测试
				String[] title = excelReader.readExcleTitle(startrow,startcol);
				// 对读取Excel表格内容测试
				Map<Integer, Map<Integer,Object>> maps = excelReader.readExcelContent(startrow,startcol);
				map.put("title", title);
				map.put("map", maps);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return map;
		}
		
		public boolean isIntegerForDouble(double obj) {
			double eps = 1e-10;
			return obj-Math.floor(obj) < eps;
		}
	
}
