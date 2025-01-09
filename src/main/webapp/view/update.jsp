<%@page import="vo.MemberVo"%>
<%@page import="dao.TestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String req = request.getParameter("userid");
	TestDao dao = new TestDao();
	MemberVo vo = dao.particluerPage(req);
%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2 style="margin-top: 30px;">회원가입</h2>
		<form action="/view/updateProc.jsp" method="post" style="width: 750px; margin: 30px auto;">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td>유저 아이디</td>
					<td><input type="text" id="userid" name="userid" value="<%= vo.getUserid() %>" required></td>
				</tr>
				<tr>
					<td>유저 이름</td>
					<td><input type="text" id="username" name="username" value="<%= vo.getUsername() %>" required></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" id="password" name="password" value="<%= vo.getPassword() %>" required></td>
				</tr>
				<tr>
					<td>주민번호 (예 : 0000001111111)</td>
					<td><input type="text" id="jumin" name="jumin" value="<%= vo.getJumin() %>" required></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						남자 : <input type="radio" id="gender" name="gender" value="1" <%= vo.getGender().equals("1") ? "checked" : "" %> required>
						여자 : <input type="radio" id="gender" name="gender" value="2" <%= vo.getGender().equals("2") ? "checked" : "" %> required>
					</td>
				</tr>
				<tr>
					<td>주소 (예 : 안양시 안양동)</td>
					<td><input type="text" id="address" name="address" value="<%= vo.getAddress() %>" required></td>
				</tr>
				<tr>
					<td>직업 코드 (1: 학생, 2 : 회사원, 3 : 공무원, 4 : 군인, 5 : 기타)</td>
					<td>
						학생 : <input type="radio" id="jobcd" name="jobcd" value="1" <%= vo.getJobcd().equals("1") ? "checked" : "" %> required><br>
						회사원 : <input type="radio" id="jobcd" name="jobcd" value="2" <%= vo.getJobcd().equals("2") ? "checked" : "" %> required><br>
						공무원 : <input type="radio" id="jobcd" name="jobcd" value="3" <%= vo.getJobcd().equals("3") ? "checked" : "" %> required><br>
						군인 : <input type="radio" id="jobcd" name="jobcd" value="4" <%= vo.getJobcd().equals("4") ? "checked" : "" %> required><br>
						기타 : <input type="radio" id="jobcd" name="jobcd" value="5" <%= vo.getJobcd().equals("5") ? "checked" : "" %> required>
					</td>
				</tr>
				<tr>
					<td>메일 수신 여부(Y, N)</td>
					<td>
						예 : <input type="radio" id="mailrcv" name="mailrcv" value="Y" <%= vo.getMailrcv().equals("Y") ? "checked" : "" %> required>
						아니오 : <input type="radio" id="mailrcv" name="mailrcv" value="N" <%= vo.getMailrcv().equals("N") ? "checked" : "" %> required>
					</td>
				</tr>
				<tr>
					<td>자기소개말</td>
					<td><input type="text" id="intro" name="intro" value="<%= vo.getIntro() %>" required></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" style="padding: 10px 20px; cursor: pointer;" onclick="location.href='/view/list.jsp'">돌아가기</button>
						<button type="submit" style="padding: 10px 20px; cursor: pointer;">수정</button>
					</td>
				</tr>
			</table>
		</form>
	</section>

<jsp:include page="/master/footer.jsp" />