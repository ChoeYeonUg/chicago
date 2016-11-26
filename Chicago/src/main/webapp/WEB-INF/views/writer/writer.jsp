<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/writer.css" rel="stylesheet" />
</head>
<body>
	<div class="col-md-3">
					<ul class="nav_bar">
						<c:forEach begin="1" end="${categoryCount }" var="i" step="1">
							<li class="list-group-item"><a href="writer.do?book_category=${i }"><spring:message code="newBook.hd${i }"/></a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="col-md-9">
					<div id="wDB_List">
						<form>
							<input type="text" name="ss">
							<input type="submit" value="검색" class="btn total">
						</form>
					
						<h2>
							<div class="cateTit" id="cateTit11">작가DB</div>
							<div class="sortTxt">
								<p>Chicago에 등록된 책 기준</p>
							</div>
						</h2>
						
						<div class="listSort">
						</div>
						
					<c:forEach items="${list }" var="vo">
						<div class="listWrap">
							<div class="wPic">
								<a href="writerDetail.do?writer_no=${vo.writer_no }">
									<c:if test="${vo.img == null }">
										<img src="images\writer_noimage.gif" class="bd" alt="${vo.writer_name }">
									</c:if>
									<c:if test="${vo.img != null && fn:indexOf(vo.img,'http://') == -1 }">
										<img src="imageSrc.do?src=${vo.img }" class="bd" alt="${vo.writer_name }">
									</c:if>
									<c:if test="${vo.img != null && fn:indexOf(vo.img,'http://') != -1 }">
										<img src="${vo.img }" class="bd" alt="${vo.writer_name }">
									</c:if>
								</a>
							</div>
							<dl>
								<dt><a href="writerDetail.do?writer_no=${vo.writer_no }">${vo.writer_name }</a></dt>
								<dd class="bone">
								출생 : <c:if test="${vo.birth == null }">?</c:if>
									 <c:if test="${vo.birth != null }"><fmt:formatDate value="${vo.birth }" pattern="yyyy.MM.dd"/> </c:if>
									 /
									 <c:if test="${vo.death == null }">?</c:if>
									 <c:if test="${vo.death != null }"><fmt:formatDate value="${vo.death }" pattern="yyyy.MM.dd"/></c:if>
								</dd>
								<dd class="pubook">출간도서 : 
									<span>${vo.list.size() }</span>
									종
								</dd>
							</dl>
							<ol>
								<c:forEach items="${vo.list }" var="book" begin="0" end="4" step="1">
									<li>
										<div class="bookView">
											<span class="bShadow">
												<span class="bookFrontbg"></span>
													<a href="bookDetail.do?book_code=${book.book_code }">
														<c:if test="${book.img == null }"><img src="http://bimage.interpark.com/renewPark/bookDB/common/writer_noimage.gif" class="bd" alt="${book.book_name }"></c:if>
														<c:if test="${book.img != null }"><img src="${book.img }" class="bd" alt="${book.book_name }"></c:if>
													</a>
											</span>
											
										</div>
										<div class="bookName">
												<c:if test="${book.book_name.length() > 9 }">
													${fn:substring(book.book_name, 0, 6)}...
												</c:if>
												<c:if test="${book.book_name.length() <= 9 }">
													${book.book_name }
												</c:if>
											</div>
									</li>
								</c:forEach>
							</ol>
						
						</div>
					</c:forEach>
					<table>
						<tr>
							<td align="center">
								<ul class="pagination pagination-sm">
								<li><a href="writer.do?book_category=${book_category}&ss=${ss}&page=${(formpage - block) >= 1 ? formpage-block : curpage }">&laquo;</a></li>
								<c:forEach begin="${formpage }" end="${topage }" var="i" step="1">
									<li><a href="writer.do?page=${i }&book_category=${book_category}&ss=${ss}"> ${i }</a></li>
								</c:forEach>
								<li><a href="writer.do?book_category=${book_category}&ss=${ss}&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">&raquo;</a></li>
							</ul> 
						</td>
						</tr>
					</table>
					<!-- 기봉 -->
					<!-- <div id="pageNaviType">
						<span><a href="writer.do?book_category=${book_category}&ss=${ss}&page=${(formpage - block) >= 1 ? formpage-block : curpage }">이전</a></span>
						<ul>
							<c:forEach begin="${formpage }" end="${topage }" var="i" step="1">
							<li><a href="writer.do?page=${i }&book_category=${book_category}&ss=${ss}"> ${i }</a></li>
							</c:forEach>
						</ul>
						<span><a href="writer.do?book_category=${book_category}&ss=${ss}&page=${(formpage + block)<=totalpage ? formpage+block : curpage }">다음</a></span>
					</div>-->
				</div> 
			</div>
</body>
</html>