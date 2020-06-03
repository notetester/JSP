package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.UserDAO;
public class LoginServiceImpl implements UserService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		UserDAO dao=UserDAO.getInstance();
		return dao.login(id,password);
	}
	
}