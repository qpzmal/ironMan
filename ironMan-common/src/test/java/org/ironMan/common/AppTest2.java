package org.ironMan.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Unit test for simple App.
 */
public class AppTest2  {
	private static final String SYS_CODE = "1007";
	
	public static void main(String[] args) {
		readContent("C:/Users/13240/Desktop/20180607.xls");
	}
	
	
    /**
     * 从excel读取内容
     */
    private static void readContent(final String fileName) {
        boolean isE2007 = false;    //判断是否是excel2007格式
        if (fileName.endsWith("xlsx")) {
            isE2007 = true;
        }
        try {
            InputStream input = new FileInputStream(fileName);  //建立输入流
            Workbook wb  = null;
            //根据文件格式(2003或者2007)来初始化
            if (isE2007) {
                wb = new XSSFWorkbook(input);
            } else {
                wb = new HSSFWorkbook(input);
            }
            Sheet sheet = wb.getSheetAt(0);     //获得第一个表单
            Iterator<Row> rows = sheet.rowIterator(); //获得第一个表单的迭代器

            ObjectMapper mapper = new ObjectMapper();  
            StringBuffer sb = new StringBuffer();
            
            while (rows.hasNext()) {
            	sb.append("curl -XPOST 'http://127.0.0.1:8065/ams/trans/intf/server.intf' -H 'Content-Type:application/json' -d '");
                Row row = rows.next();  //获得行数据
                System.out.println("Row #" + row.getRowNum());  //获得行号从0开始
                String index = "";
                if (row.getRowNum() < 9) {
                	index = "0" + (row.getRowNum() + 1);
                } else {
                	index = row.getRowNum() + 1 + "";
                }
                
                
                Map map = new HashMap();
                Head head = new Head();
                Body body = new Body();
                map.put("head", head);
                map.put("body", body);

                // head
                head.setTransType("T");
                head.setTransCode("BP13");
                head.setTransDate(row.getCell(1).toString());
                head.setTransTime(row.getCell(2).toString());
                head.setTransSerialNo(SYS_CODE + row.getCell(1).toString().substring(2, 8) + "044223450000" + index);
                head.setChannelNo(row.getCell(11).toString());
                head.setSysCode(SYS_CODE);

                // body
                body.setCustNo(row.getCell(3).toString());
                body.setUserRole(row.getCell(4).toString());
                body.setUserName(row.getCell(5).toString());
                body.setCertType(row.getCell(6).toString());
                body.setCertNo(row.getCell(7).toString());
                body.setAcctType("0400");
                body.setPhoneNo(row.getCell(8).toString());
                body.setBankNo(row.getCell(9).toString());
                body.setRegBank(row.getCell(10).toString());
                body.setLegalName(row.getCell(11).toString());
                body.setLegalCertType("01");
                body.setLegalCertNo("5001011980091102" + index);
                body.setBusiLiceNo("");
                body.setTaxNo("");
                body.setNote(row.getCell(14).toString());
                body.setAsynBackUrl("");
                
                //User类转JSON  
                String json = mapper.writeValueAsString(map);  
//                System.out.println(json);  
                sb.append(json).append("';").append(System.getProperty("line.separator"));
            }

            System.out.println();
            System.out.println();
            System.out.println(sb.toString());
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}

class Head {
	private String transType;
	private String transCode;
	private String transDate;
	private String transTime;
	private String transSerialNo;
	private String channelNo;
	private String sysCode;
	public String getTransType() {
		return transType;
	}
	public void setTransType(String transType) {
		this.transType = transType;
	}
	public String getTransCode() {
		return transCode;
	}
	public void setTransCode(String transCode) {
		this.transCode = transCode;
	}
	public String getTransDate() {
		return transDate;
	}
	public void setTransDate(String transDate) {
		this.transDate = transDate;
	}
	public String getTransTime() {
		return transTime;
	}
	public void setTransTime(String transTime) {
		this.transTime = transTime;
	}
	public String getTransSerialNo() {
		return transSerialNo;
	}
	public void setTransSerialNo(String transSerialNo) {
		this.transSerialNo = transSerialNo;
	}
	public String getChannelNo() {
		return channelNo;
	}
	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}
	public String getSysCode() {
		return sysCode;
	}
	public void setSysCode(String sysCode) {
		this.sysCode = sysCode;
	}
	
}
class Body {
	private String custNo;
	private String userRole;
	private String userName;
	private String certType;
	private String certNo;
	private String acctType;
	private String phoneNo;
	private String bankNo;
	private String regBank;
	private String legalName;
	private String legalCertType;
	private String legalCertNo;
	private String busiLiceNo;
	private String taxNo;
	private String note;
	private String asynBackUrl;
	public String getCustNo() {
		return custNo;
	}
	public void setCustNo(String custNo) {
		this.custNo = custNo;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCertType() {
		return certType;
	}
	public void setCertType(String certType) {
		this.certType = certType;
	}
	public String getCertNo() {
		return certNo;
	}
	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}
	public String getAcctType() {
		return acctType;
	}
	public void setAcctType(String acctType) {
		this.acctType = acctType;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getBankNo() {
		return bankNo;
	}
	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}
	public String getRegBank() {
		return regBank;
	}
	public void setRegBank(String regBank) {
		this.regBank = regBank;
	}
	public String getLegalName() {
		return legalName;
	}
	public void setLegalName(String legalName) {
		this.legalName = legalName;
	}
	public String getLegalCertType() {
		return legalCertType;
	}
	public void setLegalCertType(String legalCertType) {
		this.legalCertType = legalCertType;
	}
	public String getLegalCertNo() {
		return legalCertNo;
	}
	public void setLegalCertNo(String legalCertNo) {
		this.legalCertNo = legalCertNo;
	}
	public String getBusiLiceNo() {
		return busiLiceNo;
	}
	public void setBusiLiceNo(String busiLiceNo) {
		this.busiLiceNo = busiLiceNo;
	}
	public String getTaxNo() {
		return taxNo;
	}
	public void setTaxNo(String taxNo) {
		this.taxNo = taxNo;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getAsynBackUrl() {
		return asynBackUrl;
	}
	public void setAsynBackUrl(String asynBackUrl) {
		this.asynBackUrl = asynBackUrl;
	}
	
}