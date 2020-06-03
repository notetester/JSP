package com.forward;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Forward")
public class Forward extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Forward() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		System.out.println("1번화면에서 넘어온값:" + id);
		
		/*
		 * id를 받고, DB처리를 하는 코드가 들어갈 수 있습니다.
		 */

		//request에 강제로 값을 저장하는 방법
		request.setAttribute("name", "홍길자");
		
		//자바에서 포워드를 사용하는 방법.(매개변수로 이동할 경로를 적음)
		RequestDispatcher dp = request.getRequestDispatcher("actionTag/forward_ex04.jsp");
		dp.forward(request, response);
	
		//response.sendRedirect("actionTag/forward_ex04.jsp");
	}

}

