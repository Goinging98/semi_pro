<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<c:forEach var="aItem" items="${aList}">
 	${aItem.title}
 	<br>
</c:forEach>

<!-- 상단 사진 띠 부분-->
<section class="bg-dark-overlay-4"
	style="background-image: url( '${path}/resources/img/city-guide/accommodation/hotel2.jpeg' ); background-position: center left; background-size: cover; margin-top: 120px;">
	<div class="container ">
		<div class="row ">
			<div class="col-lg-8 py-xxl-5 my-lg-4 ">
				<h1 class="mice text-white fw-bold mb-2"></h1>
				<p class="mice lead text-white fw-bold mb-0"></p>
			</div>
		</div>
	</div>
</section>

<!-- Page container-->
<div class="container mb-md-4 mt-0 pt-4">
	<!-- Breadcrumb-->
	<nav class="pt-md-3" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="main"><strong>Home</strong></a></li>
			<li class="breadcrumb-item active" aria-current="page"><strong>숙소</strong></li>
		</ol>
	</nav>
</div>

<form name="searchForm" action="${path}/accomMain" method="get">
<div class="container mb-md-4 py-2" style="margin-top: 60px;">
	<!-- List of posts + Sidebar-->
	<div class="row">
		<!-- Sidebar (offcanvas)-->
		<aside class="col-lg-3">
			<div class="offcanvas offcanvas-start offcanvas-collapse" id="blog-sidebar">
				<div class="offcanvas-body">
					<!-- Search-->
					<div class="position-relative mb-4">
						<input class="form-control pe-5" type="text"name="searchValue" placeholder="검색어를 입력해주세요.">
					</div>
					<!-- Categories 카테고리 -->
					<div class="card card-flush pb-2 pb-lg-0 mb-4">
						<div class="card-body">
							<h3 class="h5">카테고리</h3>
							<a	class="nav-link fw-normal d-flex justify-content-between py-1 px-0" href="${path}/accomMain">
								전체<span class="text-muted ms-394">${count}</span></a>
							<a	class="nav-link fw-normal d-flex justify-content-between py-1 px-0" href="${path}/accomMain?cat3=B02010100">
								호텔<span class="text-muted ms-394">${hotelcount}</span></a>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0" href="${path}/accomMain?cat3=B02010600">
								유스호스텔<span class="text-muted ms-300">${youthcount}</span></a>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0" href="${path}/accomMain?cat3=B02010900">
								비즈니스호텔<span class="text-muted ms-300">${businesscount}</span></a>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0" href="${path}/accomMain?cat3=B02011600">
								한옥<span class="text-muted ms-2">${hanokcount}</span></a>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0" href="${path}/accomMain?cat3=B02011100">
								민박<span class="text-muted ms-2">${foreigncount}</span></a>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0" href="${path}/accomMain?cat3=etc">
								기타<span class="text-muted ms-2">${elsecount}</span></a>
						</div>
					</div>
				</div>
			</div>
		</aside>
		
		<!-- 숙소 리스트 -->
		<div class="col-lg-8 col-xl-9 position-relative overflow-hidden pb-5 pt-0 px-3 px-xl-4 px-xxl-5">
			<!-- Title-->
			<div class="d-sm-flex align-items-center justify-content-between pb-3 pb-sm-4">
				<h1 class="h2 mb-sm-0">숙소 검색결과</h1>
			</div>
			
			<!-- Catalog grid-->
			<div class="row row-cols-xl-3 row-cols-sm-2 row-cols-1 gy-4 gx-3 gx-xxl-4 py-4" >
				<c:forEach var="item" items="${list}">
					<!-- Item-->
					<div class="col pb-sm-2">
						<article class="position-relative">
							<div class="position-relative mb-3">
									<button
										class="btn btn-icon btn-light-primary btn-xs text-primary rounded-circle position-absolute top-0 end-5.5 m-2 zindex-5"
										type="button" data-bs-toggle="tooltip"
										data-bs-placement="left" title="Add to Favorites">
										<i class="fi-heart"></i>
									</button>
									<c:if test="${empty item.firstimage}">
										<img class="rounded-3" src="${path}/resources/images/hotel.jpg" style="width: 18rem; height: 12rem;" alt="Image">
									</c:if>
									<c:if test="${not empty item.firstimage}">
										<img class="rounded-3" src="${item.firstimage}" style="width: 18rem; height: 12rem;" alt="Article img">
									</c:if>
							</div>
							<h3 class="mb-2 fs-lg">
								<a class="nav-link stretched-link" href="${path}/accomDetail?id=${item.contentid}">${item.title}</a>
							</h3>
							<ul class="list-inline mb-0 fs-xs">
								<li class="list-inline-item pe-1">
									<i class="fi-map-pin fs-lg opacity-70 me-2"></i>${item.addr1}
								</li>
							</ul>
						</article>
					</div>
				</c:forEach>
				
			</div>
				<!-- Pagination-->
<nav class="border-top pb-md-4 pt-4" aria-label="Pagination">
    <ul class="pagination mb-1">
        <li class="page-item">
    <c:choose>
        <c:when test="${page > 1}">
            <a class="page-link next-page" href="accomMain?page=${page-1}&searchValue=${searchValue}" aria-label="Previous">
                <i class="fi-chevron-left"></i>
            </a>
        </c:when>
        <c:otherwise>
            <span class="page-link next-page disabled" aria-label="Previous">
                <i class="fi-chevron-left"></i>
            </span>
        </c:otherwise>
    </c:choose>
</li>

        <c:if test="${page > 3}">
            <li class="page-item d-none d-sm-block">
                <a class="page-link" href="accomMain?page=${page-2}&searchValue=${searchValue}">${page - 2}</a>
            </li>
        </c:if>

        <c:if test="${page > 2}">
            <li class="page-item d-none d-sm-block">
                <a class="page-link" href="accomMain?page=${page-1}&searchValue=${searchValue}">${page - 1}</a>
            </li>
        </c:if>

        <li class="page-item active d-none d-sm-block" aria-current="page">
            <span class="page-link">${page}<span class="visually-hidden">(current)</span></span>
        </li>

        <c:if test="${page <= maxPage}">
            <li class="page-item d-none d-sm-block">
                <a class="page-link" href="accomMain?page=${page+1}&searchValue=${searchValue}">${page + 1}</a>
            </li>
        </c:if>

        <c:if test="${page < maxPage-1}">
            <li class="page-item d-none d-sm-block">
                <a class="page-link" href="accomMain?page=${page+2}&searchValue=${searchValue}">${page + 2}</a>
            </li>
        </c:if>
        
		 <c:if test="${page < maxPage}">
        <li class="page-item">
            <a class="page-link next-page" href="accomMain?page=${page+2}&searchValue=${searchValue}" aria-label="Next">
                <i class="fi-chevron-right"></i>
            </a>
        </li>
        </c:if>
    </ul>
</nav>


			</div>
	</div>
</div>

</form>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
