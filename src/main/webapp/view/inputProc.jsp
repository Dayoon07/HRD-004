<%@page import="vo.MemberVo"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String jumin = request.getParameter("jumin");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	String jobcd = request.getParameter("jobcd");
	String mailrcv = request.getParameter("mailrcv");
	String intro = request.getParameter("intro");
	
	TestDao dao = new TestDao();
	MemberVo vo = new MemberVo();
	int n = 0;
	
	vo.setUserid(userid);
	vo.setUsername(username);
	vo.setPassword(password);
	vo.setJumin(jumin);
	vo.setGender(gender);
	vo.setAddress(address);
	vo.setJobcd(jobcd);
	vo.setMailrcv(mailrcv);
	vo.setIntro(intro);
	
	n = dao.save(vo);
	
	if (n > 0) {
%>
	<script>
		alert("input 성공");
		location.href = "/view/list.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("input 실패");
		history.back();
	</script>
<%
	}
%>