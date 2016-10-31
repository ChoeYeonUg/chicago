<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/store.css" rel="stylesheet" />
</head>
<body>
	<div id="content">
		<div class="container background-white">
			<div class="row margin-vert-40">
				<div class="col-md-3">
					<ul class="nav_bar">
						<c:forEach items="${storeList }" var="name">
							<li class="list-group-item"><a href="storeInfo.do?store_name=${name }">${name }</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-md-9">
		
				</div>
			</div>
		</div>
	</div>
</body>
</html>