<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구매 내역</title>
<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
	crossorigin="anonymous"></script>
<!-- 부트스트랩 cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- 폰트 설정 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hahmlet&display=swap"
	rel="stylesheet">
<!-- 아이콘 cdn-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<!-- 애니메이션 cdn-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<style>
body {
	font-family: 'Hahmlet', serif;
}

.custom-carousel-img {
	max-width: 100%;
	height: 280px;
	object-fit: cover;
}

.custom-card-img {
	max-width: 100%;
	height: 300px;
	object-fit: cover;
}

.custom-main-padding {
	padding-bottom: 200px;
}

.custom-card-body-height {
	height: 100px;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.5);
}
</style>
<!-- 로딩 이벤트 -->
<script type="text/javascript" src="resources/js/loading.js"></script>
<script type="text/javascript">

//foreach 쓰자
$(function() {
	var tableRow = document.querySelectorAll('#table-row .row');

	tableRow.forEach((row) => {
		var confirmButton  = row.querySelector('#confirm');
		var order_id = row.querySelector('#confirm').value;
		
		confirmButton .addEventListener('click', function() {
			$.ajax({
				type : 'POST',
				url : '/gogo',
				data : JSON.stringify({
					order_id : order_id,
				}),
				contentType : "application/json",
				dataType : 'json',
				success : function(response) {
					if (response.success) {
						alert("구매 확정이 완료 되었습니다.");
						window.location.reload();
					} else {
						alert("구매 확정 처리중 오류가 발생 하였습니다.");
					}
				}
			});
		  });
		});
	});


</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<main class="container custom-main-padding border-bottom">
		<div class="row">
			<jsp:include page="mypagemenu.jsp" />
			<article class="offset-1 col-8">
				<fmt:setLocale value="ko_KR" />
				<div class="row" id="table-row">
					<c:forEach items="${data}" var="d" varStatus="loop">
						<c:if test="${d['quantity'] != 0 or data[loop.index + 1]['quantity'] != 0 or data[loop.index + 2]['quantity'] != 0}">
							<c:if test="${loop.first || d['order_id'] != data[loop.index - 1]['order_id']}">
								<div class="w-100"></div>
								<!-- 새로운 구역 시작 -->
								<h4 class="mb-3">
									주문번호: ${d['order_id']}
									<c:choose>
									<c:when test="${d['checkorder'] != true and d['checkrefund'] != true }">
										<button class="btn btn-outline-success" onclick="location.href='gogo?order_id=${d['order_id']}'"
											value="${d['order_id']}">구매 확정 하러 가기</button>
									</c:when>
									<c:when test="${d['checkrefund']}">
										<button class="btn btn-danger" disabled>환불 처리 완료</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-success" disabled>구매 확정 완료</button>
									</c:otherwise>
									</c:choose>
								</h4>
							</c:if>
							<div class="col-md-4 mb-5 ">
								<div class="card">
									<div class="card-body">
										<h5 class="card-title">주문번호 : ${d['order_id']}</h5>
										<p class="card-text">${d['a_name']}</p>
										<p class="card-text">${d['promotion_name']}</p>
										<p class="card-text">${d['ticket_name']}</p>
										<p class="card-subtitle mb-2 text-muted">
											<fmt:formatNumber
												value="${d['ticket_price']*(1-d['discount'])}"
												pattern="#,##0₩" type="currency" currencySymbol="₩" />
											* ${d['quantity']}
										</p>
										<c:if test="${d['checkorder']}">
										<p class="card-text">
											결제금액 :
											<fmt:formatNumber
												value="${(d['ticket_price']*(1-d['discount']))*d['quantity']}"
												pattern="#,##0₩" type="currency" currencySymbol="₩" />
										</p>
										</c:if>
										<c:if test="${d['checkrefund']}">
										<del><p class="text-danger">
											결제금액 :
											<fmt:formatNumber
												value="${(d['ticket_price']*(1-d['discount']))*d['quantity']}"
												pattern="#,##0₩" type="currency" currencySymbol="₩" />
										</p></del>
										</c:if>
										<p class="card-text">구매 날짜 : ${d['order_date'] }</p>
										<c:set var="Point" value="${(d['ticket_price']*(1-d['discount']))*d['quantity']*0.05}" />
										<p class="Point" data-point="<fmt:formatNumber value="${Point}" pattern="#,##0" />">
										구매 확정 시 적립 포인트 : <fmt:formatNumber value="${Point}" pattern="#,##0" />
										</p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
					</div>
			</article>
		</div>
	</main>
	<jsp:include page="footer.jsp" />
</body>
</html>