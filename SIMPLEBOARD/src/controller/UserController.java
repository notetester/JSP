package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.GetUserWriteServiceImpl;
import user.service.DeleteUserServiceImpl;
import user.service.GetInfoServiceImpl;
import user.service.JoinServiceImpl;
import user.service.LoginServiceImpl;
import user.service.UpdateUserServiceImpl;
import user.service.UserService;

@WebServlet("*.user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UserController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doAction(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		doAction(request,response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri=request.getRequestURI();
		String path=request.getContextPath();
		String command=uri.substring(path.length());
		System.out.println(command);
		UserService service=null;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		if(command.equals("/join.user")) {
			if(request.getSession().getAttribute("id")==null) {
				request.getRequestDispatcher("user_join.jsp").forward(request,response);
			}else {
				out.println("<script>");
				out.println("alert('이미 로그인 되어있습니다.')");
				out.println("location.href='mypage.user'");
				out.println("</script>");
			}
		}else if(command.equals("/joinForm.user")) {
			if(request.getSession().getAttribute("id")==null) {
				service=new JoinServiceImpl();
				int result=service.execute(request,response);
				if(result==0) {
					out.println("<script>");
					out.println("alert('회원 등록에 실패하였습니다.')");
					out.println("location.href='join.user'");
					out.println("</script>");
				}else if(result==1){
					out.println("<script>");
					out.println("alert('성공적으로 가입하였습니다.')");
					out.println("location.href='login.user'");
					out.println("</script>");
				}else if(result==2) {
					out.println("<script>");
					out.println("alert('이미 존재하는 회원입니다.')");
					out.println("location.href='join.user'");
					out.println("</script>");
				}
			}else {
				out.println("<script>");
				out.println("alert('이미 로그인 되어있습니다.')");
				out.println("location.href='mypage.user'");
				out.println("</script>");
			}
		}else if(command.equals("/login.user")) {
			if(request.getSession().getAttribute("id")==null) {
				request.getRequestDispatcher("user_login.jsp").forward(request,response);
			}else {
				out.println("<script>");
				out.println("alert('이미 로그인 되어있습니다.')");
				out.println("location.href='mypage.user'");
				out.println("</script>");
			}
		}else if(command.equals("/loginForm.user")) {
			if(request.getSession().getAttribute("id")==null) {
				service=new LoginServiceImpl();
				int result=service.execute(request,response);
				if(result==1) {
					request.getSession().setAttribute("id",request.getParameter("id"));
					response.sendRedirect("mypage.user");
				}else {
					out.println("<script>");
					out.println("alert('아이디 비밀번호를 확인하세요.')");
					out.println("location.href='login.user'");
					out.println("</script>");
				}
			}else {
				out.println("<script>");
				out.println("alert('이미 로그인 되어있습니다.')");
				out.println("location.href='mypage.user'");
				out.println("</script>");
			}
		}else if(command.equals("/mypage.user")) {
			if(request.getSession().getAttribute("id")==null) {
				out.println("<script>");
				out.println("alert('로그인하십시오.')");
				out.println("location.href='login.user'");
				out.println("</script>");
			}else {
				GetUserWriteServiceImpl boardService=new GetUserWriteServiceImpl();
				boardService.execute(request,response);
				request.getRequestDispatcher("user_mypage.jsp").forward(request,response);
			}
		}else if(command.equals("/update.user")) {
			if(request.getSession().getAttribute("id")==null) {
				out.println("<script>");
				out.println("alert('로그인하십시오.')");
				out.println("location.href='login.user'");
				out.println("</script>");
			}else {
				service=new GetInfoServiceImpl();
				service.execute(request,response);
				request.getRequestDispatcher("user_mypageinfo.jsp").forward(request,response);
			}
		}else if(command.equals("/updateForm.user")) {
			if(request.getSession().getAttribute("id")==null) {
				out.println("<script>");
				out.println("alert('로그인하십시오.')");
				out.println("location.href='login.user'");
				out.println("</script>");
			}else {
				service=new UpdateUserServiceImpl();
				int result=service.execute(request,response);
				if(result==1) {
					request.getSession().setAttribute("id",request.getParameter("id"));
					out.println("<script>");
					out.println("alert('회원 정보 수정에 성공했습니다.')");
					out.println("location.href='mypage.user'");
					out.println("</script>");
				}else {
					out.println("<script>");
					out.println("alert('회원 정보 수정에 실패했습니다.')");
					out.println("location.href='mypage.user'");
					out.println("</script>");
				}
			}
		}else if(command.equals("/delete.user")) {
			if(request.getSession().getAttribute("id")==null) {
				out.println("<script>");
				out.println("alert('로그인하십시오.')");
				out.println("location.href='login.user'");
				out.println("</script>");
			}else {
				service=new DeleteUserServiceImpl();
				int result=service.execute(request,response);
				if(result==0) {
					out.println("<script>");
					out.println("alert('회원 탈퇴에 실패하였습니다.')");
					out.println("location.href='mypage.user'");
					out.println("</script>");
				}else if(result==1){
					request.getSession().invalidate();
					out.println("<script>");
					out.println("alert('회원 탈퇴에 성공하였습니다.')");
					out.println("location.href='login.user'");
					out.println("</script>");
				}else if(result==2){
					out.println("<script>");
					out.println("alert('비밀번호를 확인하세요.')");
					out.println("location.href='mypage.user'");
					out.println("</script>");
				}
			}
		}else if(command.equals("/logout.user")) {
			request.getSession().invalidate();
			out.println("<script>");
			out.println("alert('로그아웃 하였습니다.')");
			out.println("location.href='login.user'");
			out.println("</script>");
		}
	}
}
