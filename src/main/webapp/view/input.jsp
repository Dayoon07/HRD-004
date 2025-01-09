<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp" />

	<section>
		<h2 style="margin-top: 30px;">회원가입</h2>
		<form action="/view/inputProc.jsp" method="post" style="width: 750px; margin: 30px auto;">
			<table border="1" style="border-collapse: collapse;">
				<tr>
					<td>유저 아이디</td>
					<td><input type="text" id="userid" name="userid" required></td>
				</tr>
				<tr>
					<td>유저 이름</td>
					<td><input type="text" id="username" name="username" required></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" id="password" name="password" required></td>
				</tr>
				<tr>
					<td>주민번호 (예 : 0000001111111)</td>
					<td><input type="text" id="jumin" name="jumin" required></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						남자 : <input type="radio" id="gender" name="gender" value="1" required>
						여자 : <input type="radio" id="gender" name="gender" value="2" required>
					</td>
				</tr>
				<tr>
					<td>주소 (예 : 안양시 안양동)</td>
					<td><input type="text" id="address" name="address" required></td>
				</tr>
				<tr>
					<td>직업 코드 (1: 학생, 2 : 회사원, 3 : 공무원, 4 : 군인, 5 : 기타)</td>
					<td>
						학생 : <input type="radio" id="jobcd" name="jobcd" value="1" required><br>
						회사원 : <input type="radio" id="jobcd" name="jobcd" value="2" required><br>
						공무원 : <input type="radio" id="jobcd" name="jobcd" value="3" required><br>
						군인 : <input type="radio" id="jobcd" name="jobcd" value="4" required><br>
						기타 : <input type="radio" id="jobcd" name="jobcd" value="5" required>
					</td>
				</tr>
				<tr>
					<td>메일 수신 여부(Y, N)</td>
					<td>
						<input type="radio" id="mailrcv" name="mailrcv" value="Y" required> : 예
					<input type="radio" id="mailrcv" name="mailrcv" value="N" required> : 아니오
					</td>
				</tr>
				<tr>
					<td>자기소개말</td>
					<td><input type="text" id="intro" name="intro" required></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="submit" style="padding: 10px 20px; cursor: pointer;">회원가입</button>
					</td>
				</tr>
			</table>
		</form>
	</section>

<jsp:include page="/master/footer.jsp" />