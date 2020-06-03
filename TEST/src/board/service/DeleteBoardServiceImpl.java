package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;

public class DeleteBoardServiceImpl implements BoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bno=request.getParameter("bno");
		System.out.println(bno);
		BoardDAO dao=BoardDAO.getInstance();
		dao.delete(bno);
	}
	
}