<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Limky</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 		<script src="/resources/assets/js/ie/html5shiv.js"></script> -->
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<!-- 		<link rel="stylesheet" href="/resources/assets/css/ie8.css" /> -->
</head>
<body id="top">
	<jsp:include page="navi.jsp" flush="false" />


	<!-- Main -->
	<div id="main">

		<h1 style="color: #004D40">#안드로이드</h1>

<c:forEach var="android" items="${mAndroid}">
<!-- One -->
<c:url var="addUrl" value="modifyscrap" />
<form method="post" action="${addUrl}" id="form1" runat="server">
		<section id="${android.num}" >
	
			<header>
				<h3>${android.num}. ${android.title}</h3><p>${android.date}</p>
			</header>
			<p>${android.contents}
			</p>
			
			<%

				String rcv_nav = (String) session.getAttribute("loginCheck");
				if(rcv_nav!=null){
			%>
					<ul class="actions" style="margin-top:50px; padding-left: 740px">
					
					<li>
					<input type="hidden" value="${android.num}" name="pk" id="pk"/>
					<input type="submit" value="edit"/></li>
		
					</ul>
					
			<% } %>
			
		</section>
</form>
</c:forEach>

		<jsp:include page="footer.jsp" flush="false" />

	
</body>
</html>