<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script>var rootPath = "${rootPath}"</script>
<title>Loo9 SHOP 입니다</title>
</head>
<style>
	header {
		background-images
	}
</style>
<body>
	<header>
		<h2>Loo9 SHOP 매입매출 관리시스템</h2>
	</header>

	<section id="main-section">
		<c:choose>
			<c:when test="${BODY == 'IO-HOME'}">
				<%@ include file="/WEB-INF/views/iolist/io-list.jsp" %>
			</c:when>
			<c:when test="${BODY =='IO-INPUT'}">
				<%@ include file="/WEB-INF/views/iolist/io-input.jsp"%>
			</c:when>
			<c:when test="${BODY == 'IO-DETAIL'}">
				<%@ include file ="/WEB-INF/views/iolist/io-detail.jsp"%>
			</c:when>
			
		</c:choose>
	</section>


	<footer>
		<address>CopyRight &copy; ssyy0622@gmail.com</address>
	</footer>
</body>
</html>