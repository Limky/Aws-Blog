<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Limky의 스크랩</title>
<meta charset="utf-8" />
<meta name="description" content="실무 개발 전선에서 직접 개발하며 삽질하며 느끼고 얻은 경험과 자산들을 축적해놓은 개발블로그입니다. "/>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 		<script src="/resources/assets/js/ie/html5shiv.js"></script> -->
<link rel="stylesheet" href="/resources/assets/css/main.css" />
<!-- 		<link rel="stylesheet" href="/resources/assets/css/ie8.css" /> -->
</head>
<body id="top">
	<jsp:include page="header.jsp" flush="false" />


<script type="text/javascript">
		function goDelete() {
			frm.action = "deletescrap";
			frm.method = "post";
			confirm("정말로 삭제를 할까요 ??\n"
					+ "제목 : " 
					+ frm.title.value);
			frm.submit();
		}
		

</script>
	<!-- Main -->
	<div id="main">

		<h1 style="color: #004D40">#스크랩 수정하기</h1>
		<div class="row">
			<c:url var="addUrl" value="updatescrap" />
			<form method="post" action="${addUrl}" id="form1" runat="server" name="frm">
				<div style="width: 1100px">

					<div class="row uniform 50%">
						<div class="6u 12u$(xsmall)">
							<input type="hidden" value="${modifiedBoard.num}" name="pk"
								id="pk" /> <input type="text" value="${modifiedBoard.title}"
								name="title" id="title" placeholder="title" />
						</div>
						<div class="6u$ 12u$(xsmall)">
							<input type="text" value="${modifiedBoard.subject}"
								name="subject" id="subject" placeholder="subject" />
						</div>
						<div class="12u$">

							<textarea class="edittext" onkeyup="resize(this)" name="contents"
								placeholder="contents" rows="4">${modifiedBoard.contents}</textarea>

						</div>
					</div>


					<ul class="actions" style="margin-top: 30px">
						<li><input type="submit" value="edit" /></li>
						<li><input type="submit" value="delete" onclick="javascript:goDelete()" /></li>
					</ul>
				</div>
				</form>
		</div>

		<script>
			window.onload = function() {

				$(".edittext").height($(".edittext")[0].scrollHeight);
			};
		</script>
</body>
</html>