package com.myweb.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebFilter({"/board/modify.board","/board/update.board","/board/delete.board"})
public class BoardFilter2 implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//수정,변경,삭제의 경우 작성자와 세셔닝 동일한 경우만 삭제
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		req.setCharacterEncoding("UTF-8");
		String id=(String)session.getAttribute("user_id");//세선아이디
		String writer=request.getParameter("writer");//화면에서 넘어오는 작성자
		if(writer==null||!id.equals(writer)) {
			res.setContentType("text/html; charset=UTF-8");//응답에 대한 내용 선언
			PrintWriter out=res.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다')");
			out.println("location.href='/MyWeb/main.do'");//홈 화면
			out.println("</script>");
			return;//필터의 종료
		}
		//세번째 매개변수 FilterChain 클래스의 메서드인 doFilter()를 실행해서 서블릿이나, 다른 필터 클래스를 실행시켜줘야 합니다.
		chain.doFilter(request,response);
	}
}