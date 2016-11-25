<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chicago books</title>

<!-- Theme skin -->
<link href="skins/default.css" rel="stylesheet" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

</head>
<body>

	<div>
		<div class="headerbg">	
			<jsp:include page="header.jsp"></jsp:include>
		</div>
		<div id="content">
		<div class="container background-white" >
		<jsp:include page="${jsp }"></jsp:include>
		</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>	
	</div>

</body>
</html>