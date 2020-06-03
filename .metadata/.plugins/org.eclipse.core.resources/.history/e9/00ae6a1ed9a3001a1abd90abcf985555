package com.myweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. 어느테이션을 확장자 패턴으로 변경(.test로 끝나는 요청을 다 받아들여줍니다)
@WebServlet("*.test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public TestController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		System.out.println("실행됨");
		doAction(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
		doAction(request,response);
	}
	//2. get요청과 post 요점을 하나로 묶어줍니다.
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//3. 요청분기(uri정보기반)
		String uri=request.getRequestURI();
		String path=request.getContextPath();//컨패트
		String command=uri.substring(path.length());
		System.out.println("========");
		System.out.println(uri);
		System.out.println(path);
		System.out.println(command);
		System.out.println("========");
		if(command.equals("/controller/login.test")) {
			//....로그인 처리
		}
	}
}
