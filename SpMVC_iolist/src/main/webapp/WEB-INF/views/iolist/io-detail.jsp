<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
section#view_main {
	display: flex;
	margin: 10px auto;
	width: 90%;
	justify-content: center;
}

article {
	width: 40%;
	margin: 10px;
}

#pro_info h3, #pro_info p {
	display: inline-block;
	padding: 8px;
	margin: 8px 4px;
	border-bottom: 2px solid #ccc;
}

#pro_info h3 {
	background-color: #dddddd;
	color: blue;
	font-weight: bold;
	text-align: right;
	border-bottom: 2px solid #dddddd;
}

#pro_info p {
	width: 60%;
}
</style>
<script>
	$(function(){
		$("#pro_delete").click(function(){
			
			if(confirm("${IoVO.io_pname}\n 상품데이터를 삭제합니다.")) {
				/*
					href history 기능
					weh서핑 할때 사용자가 href 등을 클릭해서 페이지 전환하였다가 이전을 누르면
					되돌아 가기 기능이 있다
					location.href는 이전 화면을 history에 저장한 후 다음 화면으로 전환을 하여 뒤로가기를
					눌렀을 때 이전화면을 복원해주는 기능이 포함되어 있다. 
					
					location.replace() 는 이전화면을 history에 저장하지 말고 다음화면을 현재화면과 겹치도록 열어라 ..
					뒤로가기를 눌렀을 때 이전화면이 복원되지 않는다. 
				
				*/
				// document.location.href ="${rootPath}/product/delete?id=${PRO_VO.p_code}"
				document.location.replace("${rootPath}/delete?seq=${IoVO.seq}") // replace 함수
				//삭제하고 뒤로 가기 눌렀을 때 삭제된 사진 다시 안뜨게 하는 기능
			}
		})
		
	})
	
</script>
 <table id="book-detail">
	 <tr class="title"><td colspan="2"><h3>${IOLISTVO.io_pname}</h3></td></tr>
	 <tr class="info">
	 	<td><img src="${IOLISTVO.io_pname}"></td>
	 	<td>
	 		<table>
	 			   
			        <tr class="author"><th>SEQ</th><td>${IOLISTVO.seq }</td></tr>
				<tr class="author"><th>일자</th><td>${IOLISTVO.io_date }</td></tr>	
				<tr class="price"><th>시각</th><td>${IOLISTVO.io_time}</td></tr>
				<tr class="pub"><th>단가</th><td>${IOLISTVO.io_price}</td></tr>
				<tr class="pub"><th>수량</th><td>${IOLISTVO.io_quan}</td></tr>
				<tr class="pub"><th>합계</th><td>${IOLISTVO.io_total}</td></tr>	
			      
			        
	 		</table>
	 	</td>
        </tr>
          		       
    </table>
    <section id="detail">
    	<a href="${rootPath }/update?id=${IOLISTVO.seq}">수정</a>
    	<a href="${rootPath }/delete?seq=${IOLISTVO.seq}">삭제</a>
    	
    </section>
<hr /> <!-- 닫는 태그!! -->