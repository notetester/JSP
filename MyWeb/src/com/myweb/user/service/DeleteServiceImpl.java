package com.myweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.user.model.UserDAO;

public class DeleteServiceImpl implements UserService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String id=(String)request.getSession().getAttribute("user_id");
		String pw=request.getParameter("pw");
		UserDAO dao=UserDAO.getInstance();
		if(dao.login(id,pw)==1) {
			return dao.delete(id);
		}else {
			return 0;
		}
	}
	
}