package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.UserDAO;

public class DeleteUserServiceImpl implements UserService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String id=(String)request.getSession().getAttribute("id");
		String password=request.getParameter("password");
		UserDAO dao=UserDAO.getInstance();
		if(dao.login(id,password)==1) {
			return dao.delete(id);
		}else {
			return 2;
		}
	}
	
}