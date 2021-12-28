package kh.com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import kh.com.semi.dto.BusinessFileDTO;

public class BusinessFileDAO {

	private BasicDataSource bds = new BasicDataSource();

	public BusinessFileDAO() {
		try {
			Context iCtx = new InitialContext();
			Context envCtx = (Context)iCtx.lookup("java:comp/env");
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds");
	}catch(Exception e) {
		e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	
	
	public BusinessFileDTO getBusinessFileNames(String id) {
		String sql = "select * from tbl_businessPic where id = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int business_picSeq = rs.getInt("business_picSeq");
				String origin_name = rs.getString("origin_name");
				String system_name = rs.getString("system_name");
				String fileAddr = rs.getString("fileAddr");
				return new BusinessFileDTO(business_picSeq, id, origin_name, system_name,fileAddr);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int insertBusinessFile(String id, String origin_name, String system_name, String fileAddr) {
		String sql = "insert into tbl_businessPic values(business_picSeq.nextval, ?, ?, ?, ?)";
		
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, id);
			pstmt.setString(2, origin_name);
			pstmt.setString(3, system_name);
			pstmt.setString(4, fileAddr);
			
			int rs = pstmt.executeUpdate();
			if(rs != -1) return rs;			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	
}
