<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>SSJA</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous">
	
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/js/barscript.js">
	
</script>
<script src="/js/footer.js">
	
</script>
<link href="/css/footerstyle.css?after" rel="stylesheet">
<link href="/css/barstyle.css?after" rel="stylesheet">

<link rel="stylesheet"
	href="https://webfontworld.github.io/NanumSquare/NanumSquare.css">

<style>
@font-face {
	font-family: 'fonts';
	src: url("https://webfontworld.github.io/NanumSquare/NanumSquare.css")
		fotmat('font1');
}

body {
	font-family: 'fonts', NanumSquare;
	background-color: #f7f0e8;
}

#logo_img {
	width: 3.5em;
	height: 3em;
}
</style>
<style>
#icon_div  img {
	width: 40%;
	text-align: center;
}

#icon_div {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#icon_container {
	padding: 1.5em;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

#icn_txt {
	text-align: center;
}

.table {
	border: 0;
}
</style>
</head>

<body>
	<header>
		<div id="title_bar" class=" fixed-top">
			<div class="py-2 px-1" id="top-bar">

				<button type="toggle-button" class="top_btn" id="top_btn"></button>
				<a href=""><img id="logo_img"
					src="/images/utilities/logoSSJA.png"></a>
				<form action="http://www.naver.com" id=searchForm method="get">

				</form>
				<button id="search_icon"></button>
				<a id="cart_link"><img id="cart_img"></a> <a id="user_link"><img
					id="login_img"></a>
			</div>

		</div>
		<nav id="total_bar">
			<div id="home_user_bar"></div>
			<div id="sub_bar"></div>
		</nav>
	</header>

	<div id="side_bar">
		<div id="side_links" class="w-100"></div>
	</div>
	<main>
		<div id="main_container">

			<h1>글 보기</h1>
			<form action="${pageContext.request.contextPath}/qna/modify_view"
				method="post">
				<input type="hidden" name="bno" value="${content_view.bno}">
				<table class="table" border="1"
					style="width: 500; background-color: gray;">
					<tr>
						<td style="background-color: pink">번호</td>
						<td style="background-color: white">${content_view.bno}</td>
					</tr>
					<tr>
						<td style="background-color: pink">조회수</td>
						<td style="background-color: white"><input type="text"
							name="bhit" size="50" value="${content_view.bhit}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<td style="background-color: pink">이름</td>
						<td style="background-color: white"><input type="text"
							name="bwriter" size="50" value="${content_view.bwriter}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<td style="background-color: pink">제목</td>
						<td style="background-color: white"><input type="text"
							name="btitle" size="50" value="${content_view.btitle}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<td style="background-color: pink">내용</td>
						<td style="background-color: white"><textarea name="bcontent"
								rows="10" readonly="readonly">${content_view.bcontent}</textarea></td>
					</tr>
					<tr>
						<td style="background-color: white" colspan="2">
							<!-- data-likebmno 값 변경 필요 -->
							<button id="like-button" data-likebno="${content_view.bno}"
								data-likebmno="${content_view.bmno}">좋아요</button>
							<p>
								좋아요 수: <span id="like-count">${content_view.blike}</span>
							</p>
						</td>
					</tr>
					<tr>
						<td style="background-color: pink" colspan="2"><input
							type="submit" value="수정"> &nbsp;&nbsp;<a
							href="${pageContext.request.contextPath}/qna/list">되돌아가기</a> <%-- &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/qna/delete?bno=${content_view.bno}">삭제</a> --%>
							<%-- <sec:authorize access="hasRole('ROLE_ADMIN')">
								&nbsp;&nbsp;<a
									href="${pageContext.request.contextPath}/qna/${content_view.bno}">답변</a>
							</sec:authorize> <sec:authorize access="!hasRole('ROLE_ADMIN')">

							</sec:authorize> --%></td>
					</tr>
				</table>
			</form>
		</div>

	</main>

	<footer>
		<div id="first_footer" class="p-3"></div>
		<div id="second_footer"></div>
		<div id="third_footer"></div>
	</footer>

</body>
<script>
	$(document).ready(
			function() {
				$('#like-button').click(
						function() {
							// 기본 제출 동작 방지
							event.preventDefault();

							let bno = $(this).data('likebno');
							console.log(bno);
							let likebmno = $(this).data('likebmno'); // 현재 상태 확인
							console.log(likebmno);
							// console.log(JSON.stringify({ no : bno, liked : liked })); 
							// console.log(liked); : bno, liked : liked })); 
							// console.log(liked);
							$.ajax({
								beforeSend : function(xhr) {
									xhr.setRequestHeader(header, token);
								},
								url : '/api/likes/toggle/' + bno,
								type : 'POST',
								//contentType: 'application/json', // JSON 형식으로 요청을 보낼 것임을 명시
								//data: JSON.stringify({ no : bno, liked : liked }), // JSON 형식으로 데이터 전달
								data : {
									'bno' : bno,
									'mno' : likebmno
								},
								success : function(response) {
									console.log("successed");
									console.log(response);
									$('#like-count').text(response.afterLikes);
									$('#like-button').text(
											response.isLiked == 1 ? '좋아요 취소'
													: '좋아요');
								},
								error : function(xhr, status, error) {
									console.log("Error: " + error);
									console
											.log("Response: "
													+ xhr.responseText);
									alert('좋아요를 변경하는 중 오류가 발생했습니다.');
								}
							});
						});
			});
</script>
</html>