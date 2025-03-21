package servlet;

import java.io.IOException;

import Membership.MemberDAO;
import Membership.MemberDTO;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet(urlPatterns = "/12Servlet/MemberAuth.mvc",initParams = {
		@WebInitParam(name="admin_id",value="ndkja"),
		@WebInitParam(name="admin_pw",value="1234"),
})
public class MemberAuth extends HttpServlet {  

	private static final long serialVersionUID = 1L;
	MemberDAO dao;
	
	@Override
	public void init() throws ServletException {
		
		ServletContext application = this.getServletContext();
		
		String driver = application.getInitParameter("MySQLDriver");
		String connectUrl = application.getInitParameter("MySQLURL");
		String Id = application.getInitParameter("MySQLId");
		String Pass = application.getInitParameter("MySQLPwd");
		
		dao = new MemberDAO(driver,connectUrl,Id,Pass);

	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String admin_id = this.getInitParameter("admin_id");
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		MemberDTO memberDTO = dao.getMemberDTO(id, pass);
		
		String memberNmae = memberDTO.getName();
		
		if(memberNmae !=null) {
			req.setAttribute("authMessage", memberNmae +"회원님 방가");
		}
		else {
			if(admin_id.equals(id))
				req.setAttribute("authMessage",admin_id+"는 최고관리자입니다.");
			else 
				req.setAttribute("authMessage", "비회원");
		}
		req.getRequestDispatcher("/12Servlet/MemberAuth.jsp").forward(req, resp);
		
	}
	
	@Override
	public void destroy() {
		dao.close();
	}
	

	
	
}
