package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBCConnect;
import jakarta.servlet.ServletContext;

public class BoardDAO extends JDBCConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}

	// 검색 조건에 맞는 게시물의 개수 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "Select Count(*) From board ";
		if (map.get("searchWord") != null) {
			query += "Where " + map.get("searchField") + " " + "Like '%" + map.get("searchWord") + "%'";
		}

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}

	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();

		String query = "Select * From board ";
		if (map.get("searchWord") != null) {
			query += " Where " + map.get("searchField") + " " + "Like '%" + map.get("searchWord") + "%' ";
		}
		query += "Order By num Desc";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {

				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));

				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}

	// 게시글 데이터를 받아 DB에 추가
	public int insertWrite(BoardDTO dto) {
		int result = 0;

		try {

			String query = "Insert Into Board ( title,content,id,visitcount) Values (  ?,?,?,0)";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();

		try {

			String query = "Select B.*, M.name From Member M Inner Join Board B On M.id =B.id Where num=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("Id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	public void updateVisitCount(String num) {
		String query = "Update Board Set visitcount = visitcount+1 where num = ?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();

		}
	}

	public int updateEdit(BoardDTO dto) {
		int result = 0;
		try {
			String query = "Update board set title =? , content =? where num =? ";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();

		}
		return result;
	}

	public int deletPost(BoardDTO dto) {
		int result = 0;

		try {
			String query = "delete from board where num=?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

	public List<BoardDTO> selectListPage(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		String query = "select * from board ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " ORDER BY num DESC limit ?,? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, (int) map.get("start"));
			psmt.setInt(2, (int) map.get("pageSize"));

			rs = psmt.executeQuery();

			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("Id"));
				dto.setVisitcount(rs.getString(6));
				
				bbs.add(dto);
				
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
}
