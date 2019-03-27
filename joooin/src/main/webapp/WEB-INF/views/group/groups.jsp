<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<style>
	#main {
		width: 1200px;
		margin: auto;
		position: relative;
		top: 120px;
	}
	
	.team-back{
	Line-height:100pt;
	}
	
	p {
		font-size:40px;
	}
</style>
<title>Insert title here</title>
 <!-- ---- Include the above in your HEAD tag -------- -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <!-- ---- Include the above in your HEAD tag -------- -->
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/grouptype.css'/>">
</head>
<body>
<jsp:include page="${request.contextPath}/navbar"/>
	<div id="main">
<h1 class="text-center">Groups</h1>


    <div class="container">
        <div class="row">

            <!--team-1-->
            <div class="col-lg-4">
                <div class="our-team-main">
                    <div class="team-front">
                        <img src="<c:url value='/resources/img/icon_sport_01.png'/>"  class="img-fluid" />
                        <h3>運動</h3>
                        
                    </div>

                    <div class="team-back text-center">
	                    <c:choose>
				            <c:when test="${sport == 0}">
				              	<span>
	                            	<p><strong>暫無社團</strong></p>
	                        	</span>
				            </c:when>
				            <c:otherwise>
				                 <span>
	                            	<a href="${pageContext.request.contextPath}/groups/sport" ><p><strong>${sport} 個社團</strong></p></a>
	                        	</span>
				            </c:otherwise>
	        			</c:choose>
                    </div>

                </div>
            </div>
            <!--team-1-->

            <!--team-2-->
            <div class="col-lg-4">
                <div class="our-team-main">

                    <div class="team-front">
                        <img src="<c:url value='/resources/img/icon_food_01.png'/>" class="img-fluid" />
                        <h3>美食</h3>
                        
                    </div>

                    <div class="team-back text-center">
                         <c:choose>
				            <c:when test="${food == 0}">
				              	<span>
	                            	<p><strong>暫無社團</strong></p>
	                        	</span>
				            </c:when>
				            <c:otherwise>
				                 <span>
	                            	<a href="${pageContext.request.contextPath}/groups/food" ><p><strong>${food} 個社團</strong></p></a>
	                        	</span>
				            </c:otherwise>
	        			</c:choose>
                    </div>

                </div>
            </div>
            <!--team-2-->

            <!--team-3-->
            <div class="col-lg-4">
                <div class="our-team-main">

                    <div class="team-front">
                        <img src="<c:url value='/resources/img/icon_entertainment_01.png'/>" class="img-fluid" />
                        <h3>娛樂</h3>
                    </div>

                    <div class="team-back text-center">
                         <c:choose>
				            <c:when test="${entertainment == 0}">
				              	<span>
	                            	<p><strong>暫無社團</strong></p>
	                        	</span>
				            </c:when>
				            <c:otherwise>
				                 <span>
	                            	<a href="${pageContext.request.contextPath}/groups/entertainment" ><p><strong>${entertainment} 個社團</strong></p></a>
	                        	</span>
				            </c:otherwise>
	        			</c:choose>
                    </div>

                </div>
            </div>
            <!--team-3-->

            <!--team-4-->
            <div class="col-lg-4">
                <div class="our-team-main">

                    <div class="team-front">
                        <img src="<c:url value='/resources/img/icon_other_01.png'/>" class="img-fluid" />
                        <h3>其他</h3>
                    </div>

                    <div class="team-back text-center">
                        <c:choose>
				            <c:when test="${other == 0}">
				              	<span>
	                            	<p><strong>暫無社團</strong></p>
	                        	</span>
				            </c:when>
				            <c:otherwise>
				                 <span>
	                            	<a href="${pageContext.request.contextPath}/groups/other" ><p><strong>${other} 個社團</strong></p></a>
	                        	</span>
				            </c:otherwise>
	        			</c:choose>
                    </div>

                </div>
            </div>
            <!--team-4-->

            <!--team-5-->
            <div class="col-lg-4">
                <div class="our-team-main">

                    <div class="team-front">
                        <img src="<c:url value='/resources/img/icon_all_01.png'/>" class="img-fluid" />
                        <h3>全部</h3>
                    </div>

                    <div class="team-back text-center">
	                    	<c:choose>
					            <c:when test="${all == 0}">
					              	<span>
		                            	<p><strong>暫無社團</strong></p>
		                        	</span>
					            </c:when>
					            <c:otherwise>
					                 <span>
		                            	<a href="${pageContext.request.contextPath}/groups/groups_type" ><p><strong>${all} 個社團</strong></p></a>
		                        	</span>
					            </c:otherwise>
		        			</c:choose>
                    </div>

                </div>
            </div>
            <!--team-5-->

            <!--team-6-->
            <div class="col-lg-4">
                <div class="our-team-main">

                    <div class="team-front">
                        <img src="<c:url value='/resources/img/icon_create_01.png'/>" class="img-fluid" />
                        <h3>創建</h3>
                    </div>

                    <div class="team-back text-center">
                        <span>
                            	<a href="${pageContext.request.contextPath}/groups/create"><p style="color:red"><strong>創立社團</strong></p></a>
                        </span>
                    </div>

                </div>
            </div>
            <!--team-6-->



        </div>
    </div>
	</div>
</body>
</html>