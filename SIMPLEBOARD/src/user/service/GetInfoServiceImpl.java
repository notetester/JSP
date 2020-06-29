package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.UserDAO;

public class GetInfoServiceImpl implements UserService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("id")==null) {
			return 0;
		}
		String id=(String)request.getSession().getAttribute("id");
		System.out.println(id);
		UserDAO dao=UserDAO.getInstance();
		request.setAttribute("vo",dao.getInfo(id));
		return 1;
	}
	
}