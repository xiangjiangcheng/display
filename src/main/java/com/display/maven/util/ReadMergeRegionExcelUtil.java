package com.display.maven.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReadMergeRegionExcelUtil {
	private Logger logger =LoggerFactory.getLogger(ReadExcelUtil.class);
	private Workbook wb;//工作簿
	private Sheet sheet;//整个数据表
	private Row row;//行
	
	public ReadMergeRegionExcelUtil(String filePath){//构造方法
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
	
	public static Map<String ,Object> readRegionExcel(String filePath){
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			ReadMergeRegionExcelUtil excelReader = new ReadMergeRegionExcelUtil(filePath);
			// 对读取Excel表格标题测试
			excelReader.readExcel();
			// 对读取Excel表格内容测试
			//Map<Integer, Map<Integer,Object>> maps = excelReader.readExcelContent(notitle);
			/*map.put("title", title);*/
			//map.put("map", maps);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	/**
	* 读取excel文件
	* @param wb 
	* @param sheetIndex sheet页下标：从0开始
	* @param startReadLine 开始读取的行:从0开始
	* @param tailLine 去除最后读取的行
	 * @throws Exception 
	*/
	private void readExcel() throws Exception {
		if(wb==null){
			throw new Exception("Workbook对象为空！");
		}
		Sheet sheet = wb.getSheetAt(0);
		row=null;
		int k=sheet.getLastRowNum();
		for(int i=0; i<k; i++) {
		row = sheet.getRow(i);
		if(row!=null){
			for(Cell c : row) {
				boolean isMerge = isMergedRegion(sheet, i, c.getColumnIndex());
				//判断是否具有合并单元格
				if(isMerge) {
				String rs = getMergedRegionValue(sheet, row.getRowNum(), c.getColumnIndex());
				System.out.print(rs + "");
				}else {
				System.out.print(c.getRichStringCellValue()+"");
				}
			}
			System.out.println("=================");
			}else{
				System.out.println("这行是空的");
			}
		}

	}

	/** 
	* 获取合并单元格的值 
	* @param sheet 
	* @param row 
	* @param column 
	* @return 
	*/  
	public String getMergedRegionValue(Sheet sheet ,int row , int column){  
	    int sheetMergeCount = sheet.getNumMergedRegions();  
	      
	    for(int i = 0 ; i < sheetMergeCount ; i++){  
	        CellRangeAddress ca = sheet.getMergedRegion(i);  
	        int firstColumn = ca.getFirstColumn();  
	        int lastColumn = ca.getLastColumn();  
	        int firstRow = ca.getFirstRow();  
	        int lastRow = ca.getLastRow();  
	          
	        if(row >= firstRow && row <= lastRow){  
	              
	            if(column >= firstColumn && column <= lastColumn){  
	                Row fRow = sheet.getRow(firstRow);  
	                Cell fCell = fRow.getCell(firstColumn);  
	                return getCellValue(fCell) ;  
	            }  
	        }  
	    }  
	      
	    return null ;  
	}  

	/**
	* 判断合并了行
	* @param sheet
	* @param row
	* @param column
	* @return
	*/
	private boolean isMergedRow(Sheet sheet,int row ,int column) {
	  int sheetMergeCount = sheet.getNumMergedRegions();
	  for (int i = 0; i < sheetMergeCount; i++) {
	CellRangeAddress range = sheet.getMergedRegion(i);
	int firstColumn = range.getFirstColumn();
	int lastColumn = range.getLastColumn();
	int firstRow = range.getFirstRow();
	int lastRow = range.getLastRow();
	if(row == firstRow && row == lastRow){
	if(column >= firstColumn && column <= lastColumn){
	return true;
	}
	}
	  }
	  return false;
	}

	/**
	* 判断指定的单元格是否是合并单元格
	* @param sheet 
	* @param row 行下标
	* @param column 列下标
	* @return
	*/
	private boolean isMergedRegion(Sheet sheet,int row ,int column) {
	  int sheetMergeCount = sheet.getNumMergedRegions();
	  for (int i = 0; i < sheetMergeCount; i++) {
	CellRangeAddress range = sheet.getMergedRegion(i);
	int firstColumn = range.getFirstColumn();
	int lastColumn = range.getLastColumn();
	int firstRow = range.getFirstRow();
	int lastRow = range.getLastRow();
	if(row >= firstRow && row <= lastRow){
	if(column >= firstColumn && column <= lastColumn){
	return true;
	}
	}
	  }
	  return false;
	}

	/**
	* 判断sheet页中是否含有合并单元格 
	* @param sheet 
	* @return
	*/
	private boolean hasMerged(Sheet sheet) {
	        return sheet.getNumMergedRegions() > 0 ? true : false;
	    }

	/**
	* 合并单元格
	* @param sheet 
	* @param firstRow 开始行
	* @param lastRow 结束行
	* @param firstCol 开始列
	* @param lastCol 结束列
	*/
	private void mergeRegion(Sheet sheet, int firstRow, int lastRow, int firstCol, int lastCol) {
	sheet.addMergedRegion(new CellRangeAddress(firstRow, lastRow, firstCol, lastCol));
	}

	/** 
	* 获取单元格的值 
	* @param cell 
	* @return 
	*/  
	public String getCellValue(Cell cell){  
	      
	    if(cell == null) return "";  
	      
	    if(cell.getCellType() == Cell.CELL_TYPE_STRING){  
	          
	        return cell.getStringCellValue();  
	          
	    }else if(cell.getCellType() == Cell.CELL_TYPE_BOOLEAN){  
	          
	        return String.valueOf(cell.getBooleanCellValue());  
	          
	    }else if(cell.getCellType() == Cell.CELL_TYPE_FORMULA){  
	          
	        return cell.getCellFormula() ;  
	          
	    }else if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){  
	          
	        return String.valueOf(cell.getNumericCellValue());  
	          
	    }  
	    return "";  
	}
}
