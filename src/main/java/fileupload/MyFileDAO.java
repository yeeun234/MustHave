package fileupload;

import java.util.List;
import java.util.Vector;

import common.JDBCConnect;

public class MyFileDAO extends JDBCConnect {
//	
//	//insert 작동하는지 test
//	public static void main(String[] args) {
//		MyFileDAO dao = new MyFileDAO();
//		
//		MyFileDTO dto = new MyFileDTO();
//		dto.setTitle("title");
//		dto.setCate("Cate");
//		dto.setOfile("Ofile");
//		dto.setSfile("Sfile");
//		
//		int ret = dao.insertFile(dto);
//		System.out.println("insert :" +ret);
//	}

	public int insertFile(MyFileDTO dto) {
		int applyResult = 0;
		try {
			String query = "Insert Into myfile(  title, cate, ofile, sfile ) Values (  ? , ? , ?, ? )";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getCate());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());

			applyResult = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("INSERT 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}
	
	public List<MyFileDTO> myFileList(){
		List<MyFileDTO> filelist = new Vector<MyFileDTO>();
		String query = "Select * From myfile order by idx desc";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setCate(rs.getString(3));
				
				String s = rs.getString(4);
				if (s == null)  s = "";
				dto.setOfile(s);

				s = rs.getString(5);
				if (s == null)  s = "";
				dto.setSfile(s);

				dto.setPostdate(rs.getString(6));
				
				filelist.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("select 시 예외 발생");
			e.printStackTrace();
		}
		return filelist;
	}
	
}
