package com.myweb.util.upload;

import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig(
		location="D:\\course\\JSP\\UPLOAD", //임시로 업로드할 경로
		maxFileSize=-1,						//최대파일허용크기
		maxRequestSize=-1,					//요청에 대한 최대파일 허용 크기
		fileSizeThreshold=1024				//임시저장하는 크기
)
@WebServlet("/MultiUploadServlet")
public class MultiUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MultiUploadServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//doGet(request, response);
		ArrayList<String>list=new ArrayList<>();//파일 이름을 추가할 리스트
		String realFileName="";
		try {
			Collection<Part>parts=request.getParts();
			for(Part part:parts) {//파일 데이터가 담겨있는 객체를 찾는 작업
//				System.out.println(part.getContentType());
//				System.out.println(part.getName());
				if(part.getHeader("Content-Disposition").contains("filename=")) {//업로드된 객체를 확인하는 코드
					realFileName=part.getSubmittedFileName();//실제 업로드된 파일명
					if(part.getSize()>0) {//파일이 있는 경우
						part.write("D:\\course\\JSP\\UPLOAD\\"+realFileName);
						part.delete();
					}
					list.add(realFileName);
				}
			}
		}catch(Exception e) {
			System.out.println("업로드중에 에러발생");
		}
		System.out.println(list.toString());
//		Connection conn=null;
//		PreparedStatement pstmt=null;
//		try {
//			conn=DriverManager.getConnection(url, user, password);
//			for(String fileName:list) {
//				pstmt=conn.prepareStatement("insert into upload(id,filename) values(?,?)");
//				pstmt.setString(1, "kkk123");
//				pstmt.setString(2, fileName);
//				pstmt.executeUpdate();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

}
