package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBCConnect;
import jakarta.servlet.ServletContext;


public class BoardDAO extends JDBCConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//검색 조건에 맞는 게시물의 개수 반환
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "Select Count(*) From board ";
		if (map.get("searchWord") != null) {
			query += "Where "+ map.get("searchField")+ " " + 
					"Like '%"+map.get("searchWord")+"%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<BoardDTO> selectList(Map<String,Object> map){
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		String query =  "Select * From board ";
		if(map.get("searchWord")!=null) {
			query += " Where " + map.get("searchField") + " "
					+ "Like '%" +map.get("searchWord") + "%' ";
		}
		query += "Order By num Desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
}

