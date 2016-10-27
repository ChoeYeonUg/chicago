<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서목록 - 메인</title>
<link rel="stylesheet" type="text/css" href="css/book_main.css">
<link rel="stylesheet" type="text/css" href="css/nivoslider.css">
</head>
<body>
	<div class="list_container">
		<div class="div_lmenu">
			<ul class="category">
				<li><a href="#" class="active">카테고리</a></li>
				<li><a href="#">전공·대학교재</a></li>
				<li><a href="#">자격서·수험서</a></li>
				<li><a href="#">컴퓨터·인터넷</a></li>
				<li><a href="#">여행·취미레저</a></li>
			</ul>
		</div>
		<div class="div_content">
			<!-- 새로나온 책 시작 -->
			<div id="accordion" class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">새로나온 책</h4>
					</div>
					<div id="collapse-One" class="accordion-body collapse in">
						<div class="panel-body">
							<div class="row">
								<!-- 전공대학교재 신간1 -->
								<h5>&nbsp;|전공·대학교재</h5>
								<div class="col-md-13">
									<img src="images/newBook1.jpg" alt="book1" width="150"
										height="200">
								</div>
								<div height="300">
									<h3 class="description">맨큐의 경제학</h3>
									<p>『맨큐의 경제학』은 경제학에 대한 이론적 내용을 다룬 책이다. 학생 시절에는 학교 교육을 얼마나
										받아야 할지 결정해야 하며, 취직을 하고 나면 소득 중의 얼마를 소비하고, 저축하며, 저축한 돈을 어떻게
										투자해야 할지 결정해야 한다. 또한 훗날 중소기업이나 대기업의 경영을 맡게 되어 회사에서 생산하는 제품 가격을
										결정해야 할지도 모른다. 이 책의 여러 장에서 공부할 내용들은 이러한 의사결정을 하는 데 도움이 될 새로운
										시각을 제공해준다.</p>
									<p>
										<a href="$">+자세히보기</a>
									</p>
									<p>
										<a href="#">저자 : N. Gregory Mankiw</a> | 출판사 : Cengage
										Learning | 출간일 : 2015년 1월 26일 | 가격 : 39,000원
									</p>
								</div>
								<br />
								<h5>&nbsp;|자격서·수험서</h5>
								<div class="col-md-13">
									<img src="images/newBook2.jpg" alt="book2" width="150"
										height="200">
								</div>
								<div>
									<h3 class="description">감정 노동 관리사</h3>
									<p>『관리자의 핵심 역량으로 각광 받게 될 감정노동관리! 자기 자신은 물론, 부하 직원들의 감정관리를
										하는 관리자가 성공할 수 있다. 이 책은 감정노동과 관련한 실무지식과 감정노동과 관련한 실무적인 대안을
										체계적으로 이해하고 이를 현장에서 직접 활용할 수 있도록 하는데 목적이 있다. 본 수험서는 국내 최초로 오프라인
										테스트를 통해 감정노동과 관련한 자격시험을 준비하고 자격증을 취득하고자하는 수험생들을 위한 학습서다.</p>
									<p>
										<a href="$">+자세히보기</a>
									</p>
									<p>
										<a href="#">저자 : 한국CS경영아카데미 </a> | 출판사 : 책과나무 | 출간일 : 2016년 9월
										5일 | 가격 : 22,000원
									</p>
								</div>
								<br />
								<h5>&nbsp;|컴퓨터·인터넷</h5>
								<div class="col-md-13">
									<img src="images/newBook3.jpg" alt="book2" width="150"
										height="200">
								</div>
								<div>
									<h3 class="description">코딩 트레이닝</h3>
									<p>[코딩 트레이닝]은 현실 시나리오를 바탕으로 하는 57가지의 연습문제를 통해 코딩 기술을 지속적으로
										다듬도록 도와준다. 처음에는 간단한 입출력 프로그램부터 시작한다. 그런 다음 환율 변환, 혈중 알코올 농도
										계산, 파일 내 단어 치환, 레코드 필터링, 웹 서비스를 이용한 날씨 안내, 데이터 저장, 현재 우주인이 몇 명
										있는지 등 좀 더 복잡한 프로그램을 다룬다. 마지막으로 이렇게 연습한 과제들을 종합하는 규모 있는 프로그램과
										씨름하게 될 것이다.</p>
									<p>
										<a href="$">+자세히보기</a>
									</p>
									<p>
										<a href="#">저자 : 브라이언 호건</a> | 출판사 : 인사이트 | 출간일 : 2016년 8월 2일
										| 가격 : 13,000원
									</p>
								</div>
								<br />
								<h5>&nbsp;|여행·취미레저</h5>
								<div class="col-md-13">
									<img src="images/newbook4.jpg" alt="book1" width="150"
										height="200">
								</div>
								<div>
									<h3 class="description">피렌체를 맛보다</h3>
									<p>이탈리아 스타 셰프 파비오 피키의 피렌체 감성 가이드 『피렌체를 맛보다』. 이는 요리에 대한 변함없는
										열정을 자랑하는 파비오 피키가 알수록 빠져들게 만드는 피렌체의 유쾌한 피오렌티노들의 일상을 공개한 책이다.
										저자는 작고 아담한 도시지만 값진 문화유산으로 가득 찬 아름답고 기품 넘치는 피렌치에 대해 애정을 가득 담아
										안내한다. 뿐만 아니라 피렌체에서 가장 사랑받는 '치브레오'레스토랑의 비밀 레시피도 수록했다.</p>
									<p>
										<a href="$">+자세히보기</a>
									</p>
									<p>
										<a href="#">저자 : 파비오 피키</a> | 출판사 : 심포지아 | 출간일 : 2016년 8월 16일
										| 가격 : 14,500원
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 새로나온 책 끝  -->
			<br />
			<!-- 이벤트 소개 시작 -->
			<div id="accordion" class="panel-group">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">이벤트 소개</h4>
					</div>
					<div id="carousel-example-2" class="carousel slide alternative"
						data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-2" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-2" data-slide-to="1"></li>
						</ol>
						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<div class="row">
									<div class="col-md-3">
										<img src="images/banner1.jpg" style="max-width: 100%;">
									</div>
									<div class="col-md-3">
										<img src="images/banner2.jpg" style="max-width: 100%;">
									</div>
									<div class="col-md-3">
										<img src="images/banner3.jpg" style="max-width: 100%;">
									</div>
									<div class="col-md-3">
										<a href="http://www.kyobobook.co.kr" target="_blank"><img
											src="images/banner4.jpg" style="max-width: 100%;"></a>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="row">
									<div class="col-md-3">
										<img src="images/banner1.jpg" style="max-width: 100%;">
									</div>
									<div class="col-md-3">
										<img src="images/banner2.jpg" style="max-width: 100%;">
									</div>
									<div class="col-md-3">
										<img src="images/banner3.jpg" style="max-width: 100%;">
									</div>
									<div class="col-md-3">
										<a href="http://www.kyobobook.co.kr" target="_blank"><img
											src="images/banner4.jpg" style="max-width: 100%;"></a>
									</div>
								</div>
							</div>
						</div>
						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-2"
							data-slide="prev"><span
							class="glyphicon glyphicon-chevron-left"></span></a> <a
							class="right carousel-control" href="#carousel-example-2"
							data-slide="next"><span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</div>
			<!-- 이벤트 소개 끝 -->
			<br /> <br />
			<!-- 베스트샐러 시작 -->
			<!-- 첫번째줄 베스트샐러 -->
			<div class="row">
				<div class="col-md-6">
					<!-- Warning Panel -->
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h3 class="panel-title">Warning Panel</h3>
						</div>
						<div class="panel-body">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Iusto, aliquam, quasi, nostrum
							molestias distinctio rerum adipisci ducimus alias commodi at fuga
							minus voluptatibus labore! Cum, excepturi officiis adipisci unde
							rerum!</div>
					</div>
					<!-- End Warning Panel -->
				</div>
				<div class="col-md-6">
					<!-- Danger Panel -->
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">Danger Panel</h3>
						</div>
						<div class="panel-body">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Iusto, aliquam, quasi, nostrum
							molestias distinctio rerum adipisci ducimus alias commodi at fuga
							minus voluptatibus labore! Cum, excepturi officiis adipisci unde
							rerum!</div>
					</div>
					<!-- End Danger Panel -->
				</div>
			</div>
			<!-- 두번째줄 베스트샐러 -->
			<div class="row">
				<div class="col-md-6">
					<!-- Warning Panel -->
					<div class="panel panel-warning">
						<div class="panel-heading">
							<h3 class="panel-title">Warning Panel</h3>
						</div>
						<div class="panel-body">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Iusto, aliquam, quasi, nostrum
							molestias distinctio rerum adipisci ducimus alias commodi at fuga
							minus voluptatibus labore! Cum, excepturi officiis adipisci unde
							rerum!</div>
					</div>
					<!-- End Warning Panel -->
				</div>
				<div class="col-md-6">
					<!-- Danger Panel -->
					<div class="panel panel-danger">
						<div class="panel-heading">
							<h3 class="panel-title">Danger Panel</h3>
						</div>
						<div class="panel-body">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Iusto, aliquam, quasi, nostrum
							molestias distinctio rerum adipisci ducimus alias commodi at fuga
							minus voluptatibus labore! Cum, excepturi officiis adipisci unde
							rerum!</div>
					</div>
					<!-- End Danger Panel -->
				</div>
			</div>
	<!-- 베스트샐러 끝 -->
		</div>
	</div>
</body>
</html>