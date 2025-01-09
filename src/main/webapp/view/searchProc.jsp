<%@page import="vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String c = request.getParameter("c");
	String f = request.getParameter("f");
	
	TestDao dao = new TestDao();
	ArrayList<MemberVo> list = dao.getSearch(c, f);
	
	request.setAttribute("list", list);
	request.setAttribute("c", c);
	request.setAttribute("f", f);
	
	System.out.println("요청을 하는 방식은 : " + request.getMethod());
	
	if (!list.isEmpty()) {
		request.setAttribute("s", "yes");
		System.out.println("쿼리 결과 " + request.getAttribute("s"));
	} else {
		request.setAttribute("s", "no");
		System.out.println("쿼리 결과 " + request.getAttribute("s"));
	}

	RequestDispatcher rd = request.getRequestDispatcher("/view/search.jsp");
	rd.forward(request, response);

%>