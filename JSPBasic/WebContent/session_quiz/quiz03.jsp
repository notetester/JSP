<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num");
	String item = request.getParameter("item");
	String price = request.getParameter("price");

	//1개의 세션 List
	ArrayList<HashMap<String, String>> list = new ArrayList<>();
	
	if(session.getAttribute("items") != null ) { //세션에 items가 있다면
		list = (ArrayList<HashMap<String, String>>)session.getAttribute("items");
	}
	
	
	
	boolean bool = true; //상품이 있었는지 없었는지 확인할 변수
	if( !list.isEmpty() ) { //list값이 비어있지 않다면
		
		for(HashMap<String, String> map : list) {
			
			if(map.get("num").equals(num) ) { //상품번호 기반으로 찾는다.
				map.put("count",   String.valueOf( Integer.parseInt( map.get("count")) + 1 ) );
				bool = false;
				break;
			}
		}
		
	}
	
	if(bool) {
		HashMap<String, String> newMap = new HashMap<>(); //새상품
		
		newMap.put("num", num);
		newMap.put("item", item);
		newMap.put("price", price);
		newMap.put("count", "1");
		list.add(newMap);
		
	}
	session.setAttribute("items", list); //세션에 리스트를 추가

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="center">
		<p><strong><%=item %></strong>이 추가 되었습니다</p>
		<a href="quiz02.jsp">계속 쇼핑하기</a>
		<a href="quiz04.jsp">장바구니 확인하기</a>
	</div>



</body>
</html>