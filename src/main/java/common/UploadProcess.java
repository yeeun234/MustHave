package common;

import java.io.IOException;

import fileupload.MyFileDAO;
import fileupload.MyFileDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/13FileUpload/UploadProcess.do")
@MultipartConfig(
		maxFileSize = 1024 * 1028 *1 ,
		maxRequestSize = 1024 * 1024 * 10
		)


public class UploadProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String saveDirectory = getServletContext().getRealPath("/Uploads");
			String originalFileName = FileUtil.uploadFile(req, saveDirectory);
			String saveFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			insertMyFile(req,originalFileName,saveFileName);
			resp.sendRedirect("FileList.jsp");
		}
		catch(Exception e) {
			req.setAttribute("errorMessage", "파일 업로드 오류");
			e.getStackTrace();
			
			
			req.getRequestDispatcher("FileUploadMian.jsp").forward(req, resp);
		}
	}

	private void insertMyFile(HttpServletRequest req, String oFileName, String sFileName) {
		String title = req.getParameter("title");
		String[] cateArray = req.getParameterValues("cate");
		StringBuffer cateBuf = new StringBuffer();
		if(cateArray == null) {
			cateBuf.append("선택한 항목 없음");
		}
		else {
			for(String s : cateArray) {
				cateBuf.append(s+",");
			}
		}
		
		MyFileDTO dto = new MyFileDTO();
		dto.setTitle(title);
		dto.setCate(cateBuf.toString());
		dto.setOfile(oFileName);
		dto.setSfile(sFileName);
		
		MyFileDAO dao = new MyFileDAO();
		dao.insertFile(dto);
		dao.close();
		
				
	}
	
	
	
}
