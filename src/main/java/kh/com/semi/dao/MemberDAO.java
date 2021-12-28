package kh.com.semi.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import kh.com.semi.dto.BusinessFileDTO;
import kh.com.semi.dto.MemberDTO;


public class MemberDAO {
	private BasicDataSource bds = new BasicDataSource();
	
	public MemberDAO() {
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
	
	//로그인 검사
	public boolean isLoginOk(String id, String password) {
		String sql = "select*from tbl_member where id = ? and password = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) return true;
			}catch(Exception e) {
				e.printStackTrace();
		}
		return false;
	}
	
	public boolean searchId(String id,String name, String email) {
		String sql = "select * from tbl_member where id=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) return true;
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return false;
	}
/*	
	//아이디 찾기
	public MemberDTO searchId(String name, String email) {
		String sql = "select * from tbl_member where name=? and email=? ";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
		
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			ResultSet rs = pstmt.executeQuery();
			int rs = pstmt.executeUpdate();
			if(rs != -1) return rs;
				while(rset.next()){
					m.setMemberId(rset.getString("member_id"));
					m.setMemberPw(rset.getString("member_pw"));
					m.setMemberName(rset.getString("member_name"));
					m.setAge(rset.getInt("age"));
					m.setEmail(rset.getString("email"));
					m.setPhone(rset.getString("phone"));
					m.setEnrollDate(rset.getDate("enroll_date"));				
			}catch(Exception e) {
				e.printStackTrace();	
			return null;
		}
	
		
		//비밀번호 찾기
		public MemberDTO searchPw(Connection conn, String memberId, String memberName, String email) {
		
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query = "select * from member where member_id=? and member_name=? and email=?";
			Member m = null;
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberName);
				pstmt.setString(3, email);
				rset = pstmt.executeQuery();
				while(rset.next()){
					m = new Member();
					m.setMemberId(rset.getString("member_id"));
					m.setMemberPw(rset.getString("member_pw"));
					m.setMemberName(rset.getString("member_name"));
					m.setAge(rset.getInt("age"));
					m.setEmail(rset.getString("email"));
					m.setPhone(rset.getString("phone"));
					m.setEnrollDate(rset.getDate("enroll_date"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				JDBCTemplate.close(pstmt);
				JDBCTemplate.close(rset);
		}	
			return m;
		}	
	
*/	
	//일반 회원가입
	public int insert(MemberDTO dto) {
		String sql = "insert into tbl_member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,'general', null, null, sysdate,default)";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getNickname());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getEmail());
			pstmt.setInt(7, dto.getPostcode());
			pstmt.setString(8, dto.getRoadAddr());
			pstmt.setString(9, dto.getExtraAddr());
			pstmt.setString(10, dto.getDetailAddr());
			
//			pstmt.setString(11, dto.getMember_category());
//			pstmt.setString(12, dto.getBusiness_no());
//			pstmt.setInt(13, dto.getCenter_seq());
//			pstmt.setDate(14, dto.getSignup_date());
			
			int rs = pstmt.executeUpdate();
			if(rs != -1) return rs;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	//사업자 회원가입
	public int insertBusiness(MemberDTO dto) {
		String sql = "insert into tbl_member values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,'business', ?, null, sysdate, default)";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getNickname());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getEmail());
			pstmt.setInt(7, dto.getPostcode());
			pstmt.setString(8, dto.getRoadAddr());
			pstmt.setString(9, dto.getExtraAddr());
			pstmt.setString(10, dto.getDetailAddr());
//			pstmt.setString(11, dto.getMember_category());			
			pstmt.setString(11, dto.getBusiness_no());
//			pstmt.setInt(13, dto.getCenter_seq());
//			pstmt.setDate(14, dto.getSignup_date());
			
			int rs = pstmt.executeUpdate();
			if(rs != -1) return rs;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	//사업자 등록증 파일 첨부(경로)
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
	
	//사업자 등록증 파일첨부
	public int insertBusinessFile(String id, String origin_name, String system_name, String fileAddr) {
		String sql = "insert into tbl_file values(business_picSeq.nextval, ?, ?, ?, ?)";
		
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
	
	//로그인 정보
	public MemberDTO selectById(String id) {
		String sql = "select*from tbl_member where id=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			MemberDTO dto = new MemberDTO();
			if(rs.next()) {
				dto.setId(rs.getString("id")); 
				dto.setName(rs.getString("name"));
				dto.setNickname(rs.getString("nickname"));				
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setPostcode(rs.getInt("postcode"));
				dto.setRoadAddr(rs.getString("roadAddr"));
				dto.setExtraAddr(rs.getString("extraAddr"));
				dto.setDetailAddr(rs.getString("detailAddr"));
				dto.setMember_category(rs.getString("member_category"));
				dto.setBusiness_no(rs.getString("business_no"));		
				}
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	

	
	//팝업창 아이디 중복체크
	public boolean checkId(String id) {
		String sql = "select * from tbl_member where id=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) return true;
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return false;
	}
	
	//팝업창 사업자번호 중복체크
	public boolean checkBn(String business_no) {
		String sql = "select * from tbl_member where business_no=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, business_no);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) return true;
		}catch(Exception e) { 
			e.printStackTrace();
		}
		return false;
	}
	
	//일반회원 정보수정
	public int modifyById(MemberDTO dto) {
		String sql = "update tbl_member set nickname=?, phone=?, email=?, postcode=?, roadAddr=?, extraAddr=?,  detailAddr=? where id=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, dto.getNickname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getEmail());
			pstmt.setInt(4, dto.getPostcode());
			pstmt.setString(5, dto.getRoadAddr());
			pstmt.setString(6, dto.getExtraAddr());
			pstmt.setString(7, dto.getDetailAddr());
			pstmt.setString(8, dto.getId());

			int rs = pstmt.executeUpdate();
			if(rs != -1) return rs;	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

	//사업자회원 정보수정
	public int modifyBusiness(MemberDTO dto) {
		String sql = "update tbl_member set nickname=?, phone=?, email=?, postcode=?, roadAddr=?, extraAddr=?,  detailAddr=? where id=?";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, dto.getNickname());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getEmail());
			pstmt.setInt(4, dto.getPostcode());
			pstmt.setString(5, dto.getRoadAddr());
			pstmt.setString(6, dto.getExtraAddr());
			pstmt.setString(7, dto.getDetailAddr());
			pstmt.setString(8, dto.getId());

			int rs = pstmt.executeUpdate();
			if(rs != -1) return rs;	
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	
	//회원 탈퇴
	public int deleteById(String id) {
		String sql = "delete from tbl_member where id =?";
		try(Connection con = this.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			
			pstmt.setString(1, id);
			
			int rs = pstmt.executeUpdate();
			if(rs != -1) return rs;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
}
