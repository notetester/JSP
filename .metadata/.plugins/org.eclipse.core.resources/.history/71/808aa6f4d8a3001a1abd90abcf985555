package com.myweb.user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.user.model.UserDAO;

public class GetInfoServiceImpl implements UserService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		//ID는 세션에서 얻음.
		String id=(String)request.getSession().getAttribute("user_id");
		System.out.println(id);
		UserDAO dao=UserDAO.getInstance();
		request.setAttribute("vo",dao.getInfo(id));
		return 0;
	}
	
}