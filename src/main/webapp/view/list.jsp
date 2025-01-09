<%@page import="vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	TestDao dao = new TestDao();
	ArrayList<MemberVo> list = dao.findAll();
%>
<jsp:include page="/master/header.jsp" />

	<section style="margin-top: 30px;">
		<h2>회원목록조회 / 수정</h2>
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td>유저 아이디</td>
				<td>유저 이름</td>
				<td>비밀번호</td>
				<td>주민번호</td>
				<td>성별</td>
				<td>주소</td>
				<td>직업 코드</td>
				<td>메일 수신 여부</td>
				<td>자기소개말</td>
				<td>삭제여부</td>
			</tr>
			<%
				if (list != null) {
					for (MemberVo vo : list) {
			%>
			<tr>
				<td><a href="/view/update.jsp?userid=<%= vo.getUserid() %>"><%= vo.getUserid() %></a></td>
				<td><%= vo.getUsername() %></td>
				<td><%= vo.getPassword() %></td>
				<td><%= vo.getJumin() %></td>
				<td><%= vo.getGender() %></td>
				<td><%= vo.getAddress() %></td>
				<td><%= vo.getJobcd() %></td>
				<td><%= vo.getMailrcv() %></td>
				<td><%= vo.getIntro() %></td>
				<td>
					<form action="/view/delete.jsp?userid=<%= vo.getUserid() %>" method="post">
						<button type="submit" style="cursor: pointer; padding: 5px;">삭제</button>
					</form>
				</td>
			</tr>
			<%
					}
				} else {
			%>
				<h1>저장된 값이 없습니다</h1>
			<%
				}
			%>
		</table>
	</section>

<jsp:include page="/master/footer.jsp" />