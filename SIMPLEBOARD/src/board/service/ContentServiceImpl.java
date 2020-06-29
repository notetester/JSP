package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.BoardVO;

public class ContentServiceImpl implements BoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bno=request.getParameter("bno");
		BoardDAO dao=BoardDAO.getInstance();
		BoardVO vo=dao.getContent(bno);
		request.setAttribute("vo",vo);
	}
	
}