package kh.com.semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import kh.com.semi.dto.FreeBoardDTO;

public class FreeBoardDAO {
	private BasicDataSource bds;

	public FreeBoardDAO() {
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

	// board_seq를 얻어오는 메서드
	public int getBoardSeq() {
		String sql = "SELECT board_seq FROM tbl_board ORDER BY 1 DESC";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next())
				return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 게시판에 글 등록하는 메서드
	public int insert(FreeBoardDTO dto) {
		String sql = "INSERT INTO tbl_board VALUES(board_seq.nextval,?,?,?,sysdate,0,0,'자유',?)";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, dto.getWriter_nickname());
			pstmt.setString(2, dto.getBoard_title());
			pstmt.setString(3, dto.getBoard_content());
			pstmt.setString(4, dto.getId());

			int rs = pstmt.executeUpdate();
			if (rs != -1) {
				return rs;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 게시판 전체 목록 갖고오는 메서드
	public ArrayList<FreeBoardDTO> selectAll() {
		String sql = "SELECT * FROM tbl_board WHERE board_category = '자유'";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			ResultSet rs = pstmt.executeQuery();
			ArrayList<FreeBoardDTO> list = new ArrayList<>();
			while (rs.next()) {
				int board_seq = rs.getInt("board_seq");
				String writer_nickname = rs.getString("writer_nickname");
				String board_title = rs.getString("board_title");
				String board_content = rs.getString("board_content");
				Date written_date = rs.getDate("written_date");
				int view_count = rs.getInt("view_count");
				int recommended_count = rs.getInt("recommended_count");
				String board_category = rs.getString("board_category");
				String id = rs.getString("id");

				list.add(new FreeBoardDTO(board_seq, writer_nickname, board_title, board_content, written_date,
						view_count, recommended_count, board_category, id));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 마이페이지에서 내가 쓴 글 (모든 게시판) 가져오는 메서드
	public ArrayList<FreeBoardDTO> selectMyBoard(String id,int startRange,int endRange){
		String sql = "SELECT * FROM " + "(SELECT ROW_NUMBER() OVER (ORDER BY board_seq desc) 순위,"
				+ "a.* FROM tbl_board a WHERE id=?)" + "WHERE 순위 BETWEEN ? AND ?";
		
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);
			pstmt.setInt(2,startRange);
			pstmt.setInt(3, endRange);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<FreeBoardDTO> list = new ArrayList<FreeBoardDTO>();
			while(rs.next()) {
				int board_seq = rs.getInt("board_seq");
				String writer_nickname = rs.getString("writer_nickname");
				String board_title = rs.getString("board_title");
				String board_content = rs.getString("board_content");
				Date written_date = rs.getDate("written_date");
				int view_count = rs.getInt("view_count");
				int recommended_count = rs.getInt("recommended_count");
				String board_category = rs.getString("board_category");
				id = rs.getString("id");
				list.add(new FreeBoardDTO(board_seq,writer_nickname,board_title,board_content,written_date,view_count,recommended_count,board_category,id));
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 마이페이지에서 내가 쓴 글 (모든 게시판) 가져올 때 전체 데이터 갯수
	public int myCountAll(String id) {
		String sql = "SELECT count(*) FROM tbl_board WHERE id = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

	// 추천수 + 해주는 메서드
	public int plusRecommended_count(int board_seq) {
		String sql = "UPDATE tbl_board SET recommended_count = recommended_count +1 WHERE board_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, board_seq);
			int rs = pstmt.executeUpdate();
			if (rs != -1) {
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 조회수 - 해주는 메서드 (추천 눌렀을 때 reload 되서 조회수 올라가는게 거슬려서 작성함)
	public int minusView_count(int board_seq) {
		String sql = "UPDATE tbl_board SET view_count = view_count -1 WHERE board_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, board_seq);
			int rs = pstmt.executeUpdate();
			if (rs != -1) {
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 조회수 + 해주는 메서드
	public int plusView_count(int board_seq) {
		String sql = "UPDATE tbl_board SET view_count = view_count +1 WHERE board_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, board_seq);
			int rs = pstmt.executeUpdate();
			if (rs != -1) {
				return rs;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// board_seq 내용 조회하는 메서드
	public FreeBoardDTO selectBySeq(int board_seq) {
		String sql = "SELECT * FROM tbl_board WHERE board_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, board_seq);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				String writer_nickname = rs.getString("writer_nickname");
				String board_title = rs.getString("board_title");
				String board_content = rs.getString("board_content");
				Date written_date = rs.getDate("written_date");
				int view_count = rs.getInt("view_count");
				int recommended_count = rs.getInt("recommended_count");
				String board_category = rs.getString("board_category");
				String id = rs.getString("id");

				FreeBoardDTO dto = new FreeBoardDTO(board_seq, writer_nickname, board_title, board_content,
						written_date, view_count, recommended_count, board_category, id);
				return dto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	// 게시글 삭제하는 메서드
	public int deleteBySeq(int board_seq) {
		String sql = "DELETE FROM tbl_board WHERE board_seq = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, board_seq);
			int rs = pstmt.executeUpdate();
			if (rs != -1) {
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 게시글 수정하는 메서드
	public int modifyBySeq(int board_seq, String board_title, String board_content) {
		String sql = "UPDATE tbl_board SET board_title=?, board_content=? WHERE board_seq =? ";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setString(1, board_title);
			pstmt.setString(2, board_content);
			pstmt.setInt(3, board_seq);

			int rs = pstmt.executeUpdate();
			if (rs != -1) {
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 게시글 총 개수 조회하는 메서드 (페이징에 필요)
	public int countAll() {
		String sql = "SELECT count(*) FROM tbl_board";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	// 시작 범위 끝 범위 조회하는 메서드 (페이징에 필요)
	public ArrayList<FreeBoardDTO> getBoardList(int startRange, int endRange) {
		String sql = "SELECT * FROM " + "(SELECT ROW_NUMBER() OVER (ORDER BY board_seq desc) 순위,"
				+ "a.* FROM tbl_board a)" + "WHERE board_category ='자유' AND (순위 BETWEEN ? AND ?)";

		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {

			pstmt.setInt(1, startRange);
			pstmt.setInt(2, endRange);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<FreeBoardDTO> list = new ArrayList<>();
			while (rs.next()) {
				int board_seq = rs.getInt("board_seq");
				String board_title = rs.getString("board_title");
				String writer_nickname = rs.getString("writer_nickname");
				Date written_date = rs.getDate("written_date");
				int view_count = rs.getInt("view_count");
				int recommended_count = rs.getInt("recommended_count");
				String board_category = rs.getString("board_category");
				list.add(new FreeBoardDTO(board_seq, writer_nickname, board_title, null, written_date, view_count,
						recommended_count, board_category, null));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
