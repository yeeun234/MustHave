package servlet;

import java.io.IOException;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/12Servlet/LifeCycle.do")
public class LifeCycle extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@PostConstruct
	public void myPost() {
		System.out.println("myPost() 호출");
	}
	
	@Override
	public void init() throws ServletException{
		System.out.println("init() 호출");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		req.setAttribute("test", "Get");
		req.getRequestDispatcher("/12Servlet/LifeCycle.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		req.setAttribute("test", "Post");
		req.getRequestDispatcher("/12Servlet/LifeCycle.jsp").forward(req, resp);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출");
		super.service(req, resp);
	}

	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
		
	}
	
	@PreDestroy
	public void myDestroy() {
		System.out.println("myDestroy() 호출");
	}

}
