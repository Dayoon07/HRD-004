<%@ page import="vo.MemberVo"%>
<%@ page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String req = request.getParameter("userid");
	TestDao dao = new TestDao();
	
	int n = dao.deleteById(req);
	if (n > 0) {
%>
	<script>
		alert("삭제 성공");
		location.href = "/view/list.jsp";
	</script>
<%
	} else {
%>
	<script>
		alert("삭제 실패");
		history.back();
	</script>
<%
	}
%>