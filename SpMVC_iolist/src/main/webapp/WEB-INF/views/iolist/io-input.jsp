<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
* {
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}

body, html {
	padding: 20px;
	margin: 0 auto;
	width: 60%;
}

section#section-write {
	background-color: rgb(245, 219, 227);
	padding: 20px;
}

legend {
	background-color: indianred;
	color: white;
	padding: 8px;
	margin: 8px auto;
	text-align: center;
}

label {
	flex: 1;
}

#flex6 {
	flex: 3;
}

input {
	display: inline-block;
	flex: 3;
	width: 90%;
	padding: 10px;
	margin: 2px auto;
}

section#section-btn {
	display: inline-block;
	text-align: center;
}

section#section-btn button {
	background-color: indianred;
	border: none;
	color: white;
	border-radius: 5px;
	align-items: right;
	padding: 5px 8px;
	margin: 8px auto;
	text-align: center;
	cursor: pointer;
}

legend div p {
	display: flex;
	border-right: 1px solid white;
}

#home a {
	text-decoration: none;
	color: white;
}
</style>

<!-- </head>
<body> -->
<h3>추가 등록하기</h3>
<section id="section-write">
	<form:form modelAttribute="iovo">
		<legend>📄 매입매출 입력 📄</legend>
		<div>
			<label><form:input class="flex6" type="hidden" path="seq"
					placeholder="seq" /></label>
		</div>

		<div>
			<label>상품명<form:input class="flex6" path="io_pname"
					placeholder="상품명" /></label>
		</div>

		<div>

			<label>매입/매출 구분 <form:select path="io_input">

					<c:choose>
						<c:when test="${IoVO.io_input == false}">
							<option selected>매입</option>
						</c:when>
						<c:when test="${IoVO.io_input == true}">
							<option selected>매출</option>
						</c:when>
						<c:otherwise>
							<option selected-------------></option>
						</c:otherwise>
					</c:choose>
					<option value="0">매입</option>
					<option value="1">매출</option>

				</form:select>
			</label>
		</div>


		<div>

			<label>단가<form:input class="flex6" path="io_price"
					placeholder="단가" /></label>
		</div>
		<div>

			<label>수량<form:input class="flex6" path="io_quan"
					placeholder="수량" /></label>
</section>

<section id="section-btn">
	<div>
		<button id="home">
			<a href="${rootPath}">처음으로</a>
		</button>
		<button type="submit">입력완료</button>
	</div>
</section>
</form:form>