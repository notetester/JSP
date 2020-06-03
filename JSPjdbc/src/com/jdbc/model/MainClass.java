package com.jdbc.model;

public class MainClass {

	public static void main(String[] args) {
		
		String id = "kkk123";
		String pw = "1234";
		
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.login(id, pw);
		
		if(result == 1) {
			System.out.println("성공");
		} else {
			System.out.println("실패");
		}
		
		
	}
}
