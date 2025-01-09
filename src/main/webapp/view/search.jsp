<%@page import="vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String c = (String) request.getAttribute("c");
	String f = (String) request.getAttribute("f");
	String s = (String) request.getAttribute("s");
	ArrayList<MemberVo> list = (ArrayList<MemberVo>) request.getAttribute("list");
%>
<jsp:include page="/master/header.jsp" />

	<section style="margin-top: 30px;">
		<h2>회원 검색</h2>
		
		<table border="1" style="border-collapse: collapse;">
			<tr>
				<td colspan="5">
					<form action="/view/searchProc.jsp" method="post">
						검색조건 :
						<select name="c" id="c">
							<option value="userid" <%= c != null && c.equals("userid") ? "selected" : "" %>>회원 ID</option>
							<option value="usrename" <%= c != null && c.equals("username") ? "selected" : "" %>>회원 이름</option>
						</select>
						
						<input type="text" name="f" id="f" value="<%= f !=null ? f : "" %>" placeholder="검색" required>
						<button type="submit" onclick="return check()" style="cursor: pointer;">검색</button>
					</form>
				</td>
			</tr>
			<tr>
				<td>회원 ID</td>
				<td>회원명</td>
				<td>생년월일</td>
				<td>성별</td>
				<td>직업</td>
			</tr>
			<%
				if (list != null) {
					if (request.getAttribute("s").equals("no")) {
						out.print("<tr><td colspan='5'>검색된 데이터가 없습니다.</td></tr>");
					} else {
						for (MemberVo vo : list) {
			%>
				<tr>
					<td><a href="/view/update.jsp?userid=<%= vo.getUserid() %>"><%= vo.getUserid() %></a></td>
					<td><%= vo.getUsername() %></td>
					<td><%= vo.getJumin() %></td>
					<td><%= vo.getGender() %></td>
					<td><%= vo.getJobcd() %></td>
				</tr>
			<%
						}
					}
				}
			%>
		</table>
		
	</section>
	
	<script>
		function check() {
			if (document.querySelector("#f").value.trim() == "") {
				alert("검색 조건을 입력하세요.");
				document.querySelector("#f").focus();
			}
		}
	</script>

<jsp:include page="/master/footer.jsp" />