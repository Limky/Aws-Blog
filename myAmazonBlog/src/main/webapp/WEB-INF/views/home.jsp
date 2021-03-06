<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Limky의 삽질블로그</title>
<meta charset="utf-8" />
<meta name="description" content="실무 개발 전선에서 직접 개발하며 삽질하며 느끼고 얻은 경험과 자산들을 축적해놓은 개발블로그입니다. "/>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 		<script src="/resources/assets/js/ie/html5shiv.js"></script> -->
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<!-- 		<link rel="stylesheet" href="/resources/assets/css/ie8.css" /> -->
</head>
<body id="top">

	<jsp:include page="header.jsp" flush="false" />


	<!-- Main -->
	<div id="main">
		<h1 style="color: #004D40">
			#림키 개발 블로그<br>
			<p>자신을 높이는 사람은 낮아지고, 자신을 낮추는 사람은 높아질 것이다.</p>
		</h1>

		<section id="one" style="margin-top: -60px">
			<h3>최근 스크랩</h3>
			<table class="table">
				<thead>
					<tr>

						<th>Subject</th>
						<th>Title</th>
						<th>Updated Date</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="latestRecordList" items="${latestRecord}">
						<tr>
							<td><p style="color: #004D40; font-weight:bolder;">${latestRecordList.subject}</p></td>
							<td><a
								href="scrap/${latestRecordList.subject}#${latestRecordList.num}"
								style="font-size: 15px">${latestRecordList.title}</a></td>
							<td><p>${latestRecordList.date}</p></td>
						</tr>
						<tr>
					</c:forEach>

				</tbody>
			</table>
		</section>


		<!-- <img src="/resources/images/home/aboutme.jpg" alt=""
			style="margin: 0 auto; width: 850px;height:450px" /> -->

		<section id="one" style="margin-top: -60px">

			<header class="major">
				<h3>#About me</h3>

			</header>
			<h4>#임경호 / 림키 / Limky / 개발자</h4>
			<p>
				삽질 많이 하는 개발자. 잔 꾀도 많고 호기심 많은 개발자. <br /> 팀원과 소통하는 개발자. 디테일의 중요성을 아는
				개발자. <br /> 세상이 필요로 하는 것을 개발하는 개발자.<br /> 왜 개발해야하는지 생각하는 개발자.
			</p>
			<h4 style="margin-top: 30px">#좋아하는 것</h4>
			<p>
				인문학 서적 탐독,평론가 평점 8점넘는 영화보기,무한도전,웹툰,운동(탁구,볼링,근력)<br /> 예술하는 친구들과
				가십하기,코딩하기,음악감상,데이터수집하기
			</p>

			<h4 style="margin-top: 30px">#주로 쓰는 언어</h4>
			<p>
				C,C++,JAVA(학부시절 배웠던 언어)<br /> JAVA(주로 안드로이드 업무)<br />
				node,javaScript(취미)
			</p>

			<h4 style="margin-top: 30px">#요즘 하고있는 프로젝트</h4>
			<p>
				● 순창 미디어 아트 키넥트 물체 좌표 인식<br />
				● 토니버거 자동결제 시스템 ( node, soket.io )<br />
				● 평창올림픽 리모트 셀프 카메라 ( 간단히 설명하자면,원격으로 CCTV접속 및 캡춰링하는 앱 )<br />
				● 현대 자동차 공정관리 태플릿 앱 유지보수건<br>
				● 개인 블로그<a href="http://limky.me/">( www.limky.me )</a><br>
				● 웹 크롤링해서 데이터 가져와서 장난치기 ( 취미 )
			</p>



			<h4 style="margin-top: 30px">#Contact & Info</h4>
			<p>
				Specification : <a style="color: #006064"
					href="https://github.com/Limky/specification">github.com/Limky/specification</a><br/>
				 Trello : <a style="color: #006064"
					href="https://trello.com/limky91">https://trello.com/limky91</a>
			</p>
			<p>
				Email : <a style="color: #006064" href="#">Limky@sqisoft.com</a>
			</p>

			<ul class="actions" style="margin-top: 30px">
				<li><a href="https://github.com/Limky/specification"
					class="button">Learn More</a></li>
			</ul>

		</section>


		<jsp:include page="footer.jsp" flush="false" />
</body>
</html>