package board.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.BoardVO;
import util.PageVO;

public class GetListServiceImpl implements BoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao=BoardDAO.getInstance();
		int pageNum=1;
		int amount=10;
		if(request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		if(request.getParameter("amount")!=null) {
			amount=Integer.parseInt(request.getParameter("amount"));
		}
		ArrayList<BoardVO> list=dao.getList(pageNum,amount);
		int total=dao.getTotal();
		PageVO pageVO=new PageVO(pageNum,total,amount);
		request.setAttribute("pageVO",pageVO);
		request.setAttribute("list",list);
	}
	
}