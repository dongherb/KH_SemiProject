package kh.com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import kh.com.semi.dto.CenterPicDTO;

public class CenterPicDAO {
	private BasicDataSource bds;
	
	public CenterPicDAO() {
		try {
			Context iCtx = new InitialContext(); // �꽌踰꾩뿉�꽌 而ㅻ꽖�뀡 愿�由�
			Context envCtx = (Context)iCtx.lookup("java:comp/env"); // 由ъ냼�뒪 寃쎈줈 �뀑�똿
			bds = (BasicDataSource)envCtx.lookup("jdbc/bds"); //由ъ냼�뒪 �꽕�엫媛� �뀑�똿 �븯怨� bds蹂��닔�뿉 �떞湲�
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws Exception{
		return bds.getConnection();
	}
	
	public int insertCenterPic(CenterPicDTO dto) {
		String sql= "insert into tbl_centerPic values(center_picSeq.nextval, ?, ?, ?, ?)";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, dto.getCenter_seq());
			pstmt.setString(2, dto.getOrigin_name());
			pstmt.setString(3, dto.getSystem_name());
			pstmt.setString(4, dto.getPicAddr());
			
			int rs = pstmt.executeUpdate();
			if(rs != -1) {
				return rs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public CenterPicDTO getFileNames(int center_seq) {
	      String sql = "SELECT * FROM tbl_centerPic WHERE center_seq = ?";
	      try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
	         pstmt.setInt(1, center_seq);
	         ResultSet rs = pstmt.executeQuery();

	         if (rs.next()) {
	            int center_picSeq = rs.getInt("center_picSeq");
	            String origin_name = rs.getString("origin_name");
	            String system_name = rs.getString("system_name");
	            String picAddr = rs.getString("picAddr");
	            return new CenterPicDTO(center_picSeq, center_seq, origin_name, system_name,picAddr);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	   }
	
}
