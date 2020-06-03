package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.model.UserDAO;
import user.model.UserVO;

public class JoinServiceImpl implements UserService{

	@Override
	public int execute(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String hp1=request.getParameter("hp1");
		String hp2=request.getParameter("hp2");
		String hp3=request.getParameter("hp3");
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		String addrbasic=request.getParameter("addrbasic");
		String addrdetail=request.getParameter("addrdetail");
		UserDAO dao=UserDAO.getInstance();
		if(dao.checkId(id)==1) {
			return 2;
		}else {
			UserVO vo=new UserVO(id,password,name,hp1,hp2,hp3,email1,email2,addrbasic,addrdetail,null);
			return dao.insert(vo);
		}
	}
	
}