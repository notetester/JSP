package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardService;
import board.service.ContentServiceImpl;
import board.service.DeleteBoardServiceImpl;
import board.service.GetListServiceImpl;
import board.service.HitServiceImpl;
import board.service.RegistServiceImpl;
import board.service.UpdateBoardServiceImpl;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public BoardController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		doAction(request, response);
	}
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uri=request.getRequestURI();
		String path=request.getContextPath();
		String command=uri.substring(path.length());
		System.out.println(command);
		BoardService service=null;
		if(command.equals("/list.board")) {
			service=new GetListServiceImpl();
			service.execute(request, response);
			request.getRequestDispatcher("bbs.jsp").forward(request, response);
		}else if(command.equals("/write.board")) {
			request.getRequestDispatcher("bbs_write.jsp").forward(request, response);
		}else if(command.equals("/regist.board")) {
			service=new RegistServiceImpl();
			service.execute(request, response);
			response.sendRedirect("list.board");
		}else if(command.equals("/content.board")) {
			service=new ContentServiceImpl();
			service.execute(request, response);
			service=new HitServiceImpl();
			service.execute(request, response);
			request.getRequestDispatcher("bbs_content.jsp").forward(request, response);
		}else if(command.equals("/modify.board")) {
			service=new ContentServiceImpl();
			service.execute(request, response);
			request.getRequestDispatcher("bbs_modify.jsp").forward(request, response);
		}else if(command.equals("/update.board")) {
			service=new UpdateBoardServiceImpl();
			service.execute(request, response);
			response.sendRedirect("content.board?bno="+request.getParameter("bno"));
		}else if(command.equals("/delete.board")) {
			service=new DeleteBoardServiceImpl();
			service.execute(request, response);
			response.sendRedirect("list.board");
		}
	}
}
