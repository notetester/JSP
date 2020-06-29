package board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;

public class HitServiceImpl implements BoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bno=request.getParameter("bno");
		Cookie[]arr=request.getCookies();
		boolean bool=true;
		for(Cookie c:arr) {
			if(c.getName().equals(bno)) {
//				return;
				bool=false;
				break;
			}
		}
		if(bool) {
			System.out.println(bno);
			BoardDAO dao=BoardDAO.getInstance();
			dao.upHit(bno);
		}
		Cookie cookie=new Cookie(bno,bno);
		cookie.setMaxAge(30);
		response.addCookie(cookie);
	}
	
}