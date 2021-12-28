package kh.com.semi.dao;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.fasterxml.jackson.databind.ObjectMapper;

import kh.com.semi.dto.CenterDTO;
import kh.com.semi.dto.CenterSearchDTO;
import kh.com.semi.dto.KaKaoLocalResultDTO;

public class CenterDAO {
	private BasicDataSource bds;

	public CenterDAO() {
		try {
			Context iCtx = new InitialContext(); 
			Context envCtx = (Context) iCtx.lookup("java:comp/env"); 
			bds = (BasicDataSource) envCtx.lookup("jdbc/bds"); 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() throws Exception {
		return bds.getConnection();
	}

	public int insert(CenterDTO dto) {
		String sql = "insert into tbl_center values(center_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, dto.getCenter_name());
			pstmt.setInt(2, dto.getCenter_price());
			pstmt.setString(3, dto.getExercise());
			pstmt.setString(4, dto.getCenter_tel());
			pstmt.setInt(5, dto.getPostcode());
			pstmt.setString(6, dto.getDetailAddr());
			pstmt.setString(7, dto.getRoadAddr());
			pstmt.setString(8, dto.getExtraAddr());
			pstmt.setString(9, dto.getBusiness_no());
			pstmt.setDouble(10, dto.getLat());
			pstmt.setDouble(11, dto.getLng());

			int rs = pstmt.executeUpdate();
			if (rs != -1) {
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public CenterDTO selectByBn(String business_no) {
		String sql = "select * from tbl_center where business_no = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, business_no);
			ResultSet rs = pstmt.executeQuery();
			CenterDTO dto = new CenterDTO();
		if (rs.next()) {
			int center_seq = rs.getInt("center_seq");
			String center_name = rs.getString("center_name");
			int center_price = rs.getInt("center_price");
			String exercise = rs.getString("exercise");
			String center_tel = rs.getString("center_tel");
			int postcode = rs.getInt("postcode");
			String detailAddr = rs.getString("detailAddr");
			String roadAddr = rs.getString("roadAddr");
			String extraAddr = rs.getString("extraAddr");
			Double lat = rs.getDouble("lat");
			Double lng = rs.getDouble("lng");
			dto = new CenterDTO(center_seq, center_name, center_price, exercise, center_tel, postcode,
					detailAddr, roadAddr, extraAddr, business_no, lat, lng);
		}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	   public CenterDTO selectBySeq(int center_seq) {
	      String sql = "SELECT * FROM tbl_center WHERE center_seq = ?";
	      try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
	         pstmt.setInt(1, center_seq);
	         ResultSet rs = pstmt.executeQuery();
	         if (rs.next()) {
	        	 	String center_name = rs.getString("center_name");
	        	 	int center_price = rs.getInt("center_price");
					String exercise = rs.getString("exercise");
					String center_tel = rs.getString("center_tel");
					int postcode = rs.getInt("postcode");
					String detailAddr = rs.getString("detailAddr");
					String roadAddr = rs.getString("roadAddr");
					String extraAddr = rs.getString("extraAddr");
					String business_no = rs.getString("business_no");
					Double lat = rs.getDouble("lat");
					Double lng = rs.getDouble("lng");

					CenterDTO dto = new CenterDTO(center_seq, center_name, center_price, exercise, center_tel, postcode,
							detailAddr, roadAddr, extraAddr, business_no, lat, lng);
	            return dto;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return null;

	   }

	public int modifyByBn(CenterDTO dto) {
		String sql = "update tbl_center set center_name=? ,center_price =?, exercise =?, center_tel=?, postcode=?, detailAddr=?, roadAddr=?, extraAddr=?, lat=? ,lng=? where business_no =?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			
			pstmt.setString(1, dto.getCenter_name());
			pstmt.setInt(2, dto.getCenter_price());
			pstmt.setString(3, dto.getExercise());
			pstmt.setString(4, dto.getCenter_tel());
			pstmt.setInt(5, dto.getPostcode());
			pstmt.setString(6, dto.getDetailAddr());
			pstmt.setString(7, dto.getRoadAddr());
			pstmt.setString(8, dto.getExtraAddr());
			pstmt.setDouble(9, dto.getLat());
			pstmt.setDouble(10, dto.getLng());
			pstmt.setString(11, dto.getBusiness_no());
			
			int rs = pstmt.executeUpdate();
			if (rs != -1) {
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<CenterSearchDTO> getCenterList(String searchAddr,String searchExercise,String orderBy) {
		String sql = "SELECT center_seq,center_name, center_price, exercise, center_tel, extraAddr,lat,lng, center_picSeq ,origin_name ,system_name , picAddr FROM tbl_center tc\r\n"
				+ "INNER JOIN tbl_centerpic\r\n"
				+ "USING (center_seq) \r\n"
				+ "WHERE 1 = 1 ";
		sql += generateLikeSearchQuery(searchAddr, "tc.extraAddr");
		if(searchExercise != "") {
			sql += generateLikeSearchQuery(searchExercise, "tc.exercise");
		}
		if(orderBy.equals("asc")) {
			sql += "order by center_price asc";
		}else if(orderBy.equals("desc")) {
			sql += "order by center_price desc";
		}
		System.out.println(sql);
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql)) {
			ResultSet rs = pstmt.executeQuery();
			ArrayList<CenterSearchDTO> list = new ArrayList<>();
			while (rs.next()) {
				int center_seq = rs.getInt("center_seq");
				String center_name = rs.getString("center_name");
				int center_price = rs.getInt("center_price");
				String exercise = rs.getString("exercise");
				String center_tel = rs.getString("center_tel");
				String extraAddr = rs.getString("extraAddr");
				Double lat = rs.getDouble("lat");
				Double lng = rs.getDouble("lng");
				int center_picSeq = rs.getInt("center_picSeq");
				String origin_name = rs.getString("origin_name");
				String system_name = rs.getString("system_name");
				String picAddr = rs.getString("picAddr");
				
				list.add(new CenterSearchDTO(center_seq, center_name, center_price, exercise,center_tel,extraAddr, lat, lng,center_picSeq,origin_name,system_name,picAddr));
				;
				
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public boolean checkCenter(String business_no) { // 센터등록여부 확인
		String sql = "select * from tbl_center where business_no = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, business_no);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	}
	
	public String generateLikeSearchQuery(String searchParams, String columnName) {
		String queryString = "";
		List<String> searchAddressArray = List.of(searchParams.split(",")); // ["헬스", "요가"]
		if (searchAddressArray.size() > 0) {
			queryString += " and (";
			for (int i = 0; i < searchAddressArray.size(); i++) {
				String address = searchAddressArray.get(i).trim();
				queryString += columnName + " like '%" + address + "%'";
				if (i < searchAddressArray.size() - 1) {
					queryString += " or ";
				}
			}
			queryString += ")";
		}
		return queryString;
	}
	
	public KaKaoLocalResultDTO getKakaoLocalSearch(String searchAddress) throws URISyntaxException, IOException {
		//카카오 API 전송 헤더 인증 키
		String kakaoApiKey = "KakaoAK e43b1a5d4ceca562dba92ae1b279974d";

		//카카오 API와 통신하기위한 HttpClient 생성
		HttpClient client = HttpClientBuilder.create().build();

		//Get Request 생성
		HttpGet getRequest = new HttpGet("https://dapi.kakao.com/v2/local/search/address.json");
		//검색 주소를 파라미터로 설정
		URI uri = new URIBuilder(getRequest.getURI()).addParameter("query", searchAddress).build();
		getRequest.setURI(uri);
		getRequest.addHeader("Authorization", kakaoApiKey); // KEY 입력

		//카카오 API 찌르기
		HttpResponse response = client.execute(getRequest);

		//Response 출력 
		if (response.getStatusLine().getStatusCode() == 200) {
			ResponseHandler<String> handler = new BasicResponseHandler();
			String strBody = handler.handleResponse(response);
			ObjectMapper objectMapper = new ObjectMapper();
			
			Map<String, Object> body = objectMapper.readValue(strBody, Map.class);
			
			List<Map<String, Object>> documents = (List<Map<String, Object>>) body.get("documents");
			if (documents.size() == 0) {
				throw new RuntimeException("주소를 찾을 수 없습니다.");
			}
			double y = Math.round(Double.parseDouble(documents.get(0).get("y").toString()) * 1000000000) / 1000000000.0; //위도
			double x = Math.round(Double.parseDouble(documents.get(0).get("x").toString()) * 1000000000) / 1000000000.0; //경도

			return new KaKaoLocalResultDTO(y, x);
			
		} else {
			throw new RuntimeException("kakao response error : " + response.getStatusLine().getStatusCode());
		}
	}

	

}
