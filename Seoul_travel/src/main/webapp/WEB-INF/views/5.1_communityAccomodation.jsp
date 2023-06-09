<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 사진 띠 부분-->
<section class="bg-dark-overlay-4"
	style="background-image: url('${path}/resources/img/community/d94ed70d0a33341d.jpg' ); background-position: center left; background-size: cover; margin-top: 120px;">
	<div class="container ">
		<div class="row ">
			<div class="col-lg-8 py-xxl-5 my-lg-4 ">
				<a href="#" class="badge text-bg-primary mb-2"><i class="fas fa-circle me-2 small fw-bold"></i></a>
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
			<li class="breadcrumb-item"><a href="/mvc/main"><strong>Home</strong></a></li>
			<li class="breadcrumb-item"><strong>커뮤니티</strong></li>
			<li class="breadcrumb-item active" aria-current="page"><strong>숙소</strong></li>
		</ol>
	</nav>
	<!-- Sponsored posts-->
</div>


<div class="container mb-md-4 py-2" style="margin-top: 60px;">

	<!-- List of posts + Sidebar-->
	<form name="searchform" action="${path}/community/accomodation" method="get">
	<div class="row">
		<!-- Sidebar (offcanvas)-->
		<aside class="col-lg-3">
			<div class="offcanvas offcanvas-start offcanvas-collapse" id="blog-sidebar">
				<div class="offcanvas-header shadow-sm mb-2">
					<h2 class="h5 offcanvas-title">Sidebar</h2>
					<button class="btn-close" type="button" data-bs-dismiss="offcanvas"></button>
				</div>
				<div class="offcanvas-body">
					<!-- 검색 -->
					<c:set var="searchType" value="${param.searchType}"/>
					<c:if test="${empty searchType}">
						<c:set var="searchType" value="${'title'}"/>
					</c:if>
					<div class="position-relative mb-4">
							<input type="hidden" name="page" value="1">
							<input class="form-control pe-5" type="text" placeholder="검색어를 입력해주세요."
									id="searchValue" name="searchValue" value="${param.searchValue}" />
					</div>
					
					<!-- 플로팅 메뉴 -->
					<div class="card card-flush pb-2 pb-lg-0 mb-4">
						<div class="card-body">
							<h3 class="h5">커뮤니티</h3>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0"
								href="notice">공지사항</a>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0"
								href="food">맛집</a>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0"
								href="accomodation">숙소</a>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0"
								href="hotplace">핫플레이스</a>
							<a class="nav-link fw-normal d-flex justify-content-between py-1 px-0"
								href="qna">문의 남기기</a>
						</div>
					</div>
				</div>
			</div>
		</aside>
		
		
		<!-- 게시글 링크 -->
		<div class="col-lg-9">
			<div class="ps-lg-3">
				<!-- 게시글이 검색되지 않을 때 -->
				<c:if test="${empty list}">
					<tr>
						<td colspan="6">조회된 글이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:if test="${not empty list}">			
					<!-- 목록 호출 -->
					<c:forEach var="bitem" items="${list}">
						<article class="card card-horizontal border-0 mb-4">
							<div class="card-body px-0 pt-0 pb-lg-5 pb-sm-4 pb-2">
								<h3 class="h5 pt-1 mb-2">
									<a class="nav-link" href="${path}/board/view?no=${bitem.bno}">
										<c:out value="${bitem.title}"/>
									</a>
								</h3>
								<p class="fs-sm text-muted">${bitem.content}</p>
								<a class="d-flex align-items-center text-decoration-none" href="#">
									<div class="ps-2">
										<h6 class="fs-sm text-nav lh-base mb-1"><c:out value="${bitem.writerId}"/></h6>
										<div class="d-flex text-body fs-xs">
											<span class="me-2 pe-1">
												<i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i><fmt:formatDate type="date" value="${bitem.createDate}"/>
											</span>
											<span>
												<i class="fi-chat-circle opacity-70 mt-n1 me-1 align-middle"></i>comments exist
											</span>
										</div>
									</div> 
								</a>
							</div>
						</article>
					</c:forEach>
				</c:if>
				
									
				<!-- 글쓰기 버튼 -->			
				<c:if test="${loginMember != null}">
						<button class="btn btn-lg btn-primary w-sm-auto w-100 mt-2" type="button" id="btn-add" onclick="location.href='${path}/community/write'">글쓰기</button>
				</c:if>
				
	<!-- Pagination-->
<nav class="border-top pb-md-4 pt-4" aria-label="Pagination">
    <ul class="pagination mb-1">
        <li class="page-item">
    <c:choose>
        <c:when test="${page > 1}">
            <a class="page-link next-page" href="accomodation?page=${page-1}&searchValue=${searchValue}" aria-label="Previous">
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
                <a class="page-link" href="accomodation?page=${page-2}&searchValue=${searchValue}">${page - 2}</a>
            </li>
        </c:if>

        <c:if test="${page > 2}">
            <li class="page-item d-none d-sm-block">
                <a class="page-link" href="accomodation?page=${page-1}&searchValue=${searchValue}">${page - 1}</a>
            </li>
        </c:if>

        <li class="page-item active d-none d-sm-block" aria-current="page">
            <span class="page-link">${page}<span class="visually-hidden">(current)</span></span>
        </li>

        <c:if test="${page <= maxPage}">
            <li class="page-item d-none d-sm-block">
                <a class="page-link" href="accomodation?page=${page+1}&searchValue=${searchValue}">${page + 1}</a>
            </li>
        </c:if>

        <c:if test="${page < maxPage-1}">
            <li class="page-item d-none d-sm-block">
                <a class="page-link" href="accomodation?page=${page+2}&searchValue=${searchValue}">${page + 2}</a>
            </li>
        </c:if>
        
		 <c:if test="${page < maxPage}">
        <li class="page-item">
            <a class="page-link next-page" href="accomodation?page=${page+2}&searchValue=${searchValue}" aria-label="Next">
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
</div>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script type="text/javascript">
	function movePage(page){
		searchform.page.value = page;
		searchform.submit();
	}
</script>







