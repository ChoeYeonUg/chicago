<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- today=String.valueOf(Integer.parseInt(today)+1); -->
 
	${year}
	${month}
	${day} 
	${yeapString} <!-- 요일 -->
	${thisDayMiner}
	${thisDayMore}
	<!-- java.util.Date today = new java.util.Date();	
	SimpleDateFormat formatTime = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss", Locale.KOREAN);
	StringtodayString = formatTime.format(today);	
	System.out.println(todayString);
	 -->
<%-- 	 	<table width="100%" border="0" cellspacing="1" cellpadding="1" id="KOO" bgcolor="#F3F9D7" style="border:1px solid #CED99C">
 
<tr>
<td height="60">
        
 	   <table width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr>
             <td height="10">
             </td>
       </tr>
      
       <tr>
             <td align="center" >
                    <a href="<c:url value='/event_week.do' />?year=${year-1}&amp;month=${month}" target="_self">
                           <b>&lt;&lt;</b><!-- 이전해 -->
                    </a>
                    <c:choose>
                    <c:when test="${(month > 0) }">
                    <a href="<c:url value='/event_week.do' />?year=${year}&amp;month=${month-1}" target="_self">
                           <b>&lt;</b><!-- 이전달 -->
                    </a>
                    </c:when>
                    </c:choose>
                    
                   <!--  <b>&lt;</b> -->
                    &nbsp;&nbsp;
                    ${year }년
                   
                    ${month+1}월
                    &nbsp;&nbsp;
                    <c:choose>
                    <c:when test="${(month< 11)}" >
                    <a href="<c:url value='/event_week.do' />?year=${year}&amp;month=${month+1 }" target="_self">
                           <!-- 다음달 --><b>&gt;</b>
                    </a>
                    </c:when>
                    <c:otherwise>
                           <b>&gt;</b>
                    </c:otherwise>
                    </c:choose>
                    <a href="<c:url value='/event_week.do' />?year=${year+1 }&amp;month=${month}" target="_self">
                           <!-- 다음해 --><b>&gt;&gt;</b>
                    </a>
             </td>
       </tr>
       </table>
</td>
</tr>
</table>
	 --%> 
	 
	 
	<thead>
		<tr>
			<th>
				<span>time</span>
			</th>
			<th>
				<span>${day} ${dotw}</span>
			</th>
			<th>
				<span>${day+1} ${dotw}</span>
			</th>
			<th>
				<span>${day+2} ${dotw}</span>
			</th>
			<th>
				<span>${day+3} ${dotw}</span>
			</th>
			<th>
				<span>${day+4} ${dotw}</span>
			</th>
			<th>
				<span>${day+5} ${dotw}</span>
			</th>
			<th>
				<span>${day+6} ${dotw}</span>
			</th>
		</tr>	
	</thead>
	<tbody>
		<th></th>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
		<td></td>
	</tbody>
	
	

</body>
</html>