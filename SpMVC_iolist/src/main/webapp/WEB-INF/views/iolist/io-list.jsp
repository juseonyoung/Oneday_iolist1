<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
table {
	border-collapse: collapse;
	border: 1px solid #ccc;
	width: 80%;
	margin: 10px auto;
}

th, td {
	border: 1px solid #ccc;
	padding: 8px;
	text-align: left;
}

/* child 속성에 연산식을 사용하는 방법
 n : 1~ child 개수만큼 +1씩 증가하는 값
 An + b 형식의 연산식을 사용한다
 th와 td값에 4번째 위치 이후에 동일한 특성(style)을 지정하라 */
th:nth-child(n+4), td:nth-child(n+4) {
	text-align: right;
}

tbody tr:nth-child(odd) {
	background-color: #f1f1f1;
}

tbody tr:nth-child(even) {
	background-color: #fff;
}

tbody tr:hover {
	background-color: #ddd;
	cousor: pointer;
}

article {
	width: 80%;
	margin: 5px auto;
	text-align: right;
}

article a {
	display: inline-block;
	padding: 8px 16px;
	background-color: navy;
	color: white;
	cursor: pointer;
	text-decoration: none;
	border-radius: 5px;
}

article a:hover {
	background-color: #ddd;
	color: black;
	-webkit-box-shadow: 9px 22px 24px 2px rgba(94, 204, 123, 1);
	-moz-box-shadow: 9px 22px 24px 2px rgba(94, 204, 123, 1);
	box-shadow: 9px 22px 24px 2px rgba(94, 204, 123, 1);
}
</style>
<script>
	$(function() {

		$(".pro_item").click(function() {

			// tr 들 중에 한 항목을 클릭하면 
			// 그 항목에 대한 정보가 this에 담겨 있게 된다. 
			// this에 담긴 정보중에 자손 태그(td)들을 찾고 자손 태그 들 중에 0번째에 있는 
			// 자손의 text값을 가져와서 p_code 변수에 담아라 
			const seq = $(this).children().eq(0).text() //리스트에 상품정보 보일 때 alert 가져옴
			//alert(p_code)

			const seq1 = $(this).data("seq") //리스트에 상품정보 안보일 때는 이 방법 써라 
			//alert(p_code1)

			// 문자열 탬플릿트
			// Es6(ESCMA 2015)버전에서는 백틱`을 사용하여 변수명과 문자열을 합성할 수 있다.
			// 하지만 JSP에서는 EL 태그와 문법충돌로 인하여 사용이 불가능 하다 
			document.location.href = "${rootPath}/detail?seq=" + seq //p_code보다는 id나 시퀀스 쓰는 것이 더 좋음 
			// ?id=P00001 형식으로 주소창에 뜸
		})
	})
</script>
<body>
	<section>
		
		<table id="io-table">
			<th>No.</th>
			<th>일자</th>
			<th>시각</th>
			<th>상품명</th> 
			<th>구분</th> 
			<th>단가</th>
			<th>수량</th>
			

			<c:choose> 
				<c:when test="${empty IOLIST}">
					<tr>
						<td colspan="9">데이터가 없음!</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${IOLIST}" var="vo" varStatus="i">
						<tr class="io_item">
							<td>${i.count}</td>
							<td>${vo.io_date}</td>
							<td>${vo.io_time}</td>
							<td>${vo.io_pname}</td>
							<td>${vo.io_input}</td>
							<td>${vo.io_price}</td>
							<td>${vo.io_quan}</td>
						</tr>

					</c:forEach>


				</c:otherwise>

			</c:choose>

		</table>
		<div id="writebox-link">
		
				<a href="${rootPath }/input">새로작성</a>
			
		</div>

	</section>
</body>