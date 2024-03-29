<%@page import="model.FoodDAO"%>
<%@page import="model.RecipeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.MyfoodDAO"%>
<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
    UserDTO user = (UserDTO)session.getAttribute("login_User");
    MyfoodDAO mf = new MyfoodDAO();
    String[] nf;
    nf = mf.select_no(user.getU_id());

    FoodDAO dao = new FoodDAO();
    
	ArrayList<RecipeDTO> recipe = (ArrayList<RecipeDTO>)session.getAttribute("recipe");
    int size = 0;

    for (int i=0, j=1; i<5; i++, j++) {
       if(nf[i] != null){
          size++;
       }
    }
    int insert_idx=0; 
    for (int i=0; i<5; i++) {
       if(nf[i] == null){
          insert_idx= i;
          break;
       }
    }

    %>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="EUC-KR">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="jquery-3.6.0.min.js"></script>
<!-- Title -->
<title>냉장고 음식</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Stylesheet -->

<link rel="stylesheet" href="style.css">
<style>
.row {
	display: flex;
}

button {
	all: unset;
}

.btn {
	/* position: relative; */
	/* left: 40%; */
	/* transform: translateX(-50%); */
	margin-bottom: 40px;
	width: 100px;
	height: 40px;
	background: rgb(244, 105, 19);
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: 0.4s;
	display: inline;
	border-radius: 12px;
	/* margin-left: 50px; */
	font-size: 16px;
	padding: 3px 5px;
}

.btn10 {
	position: relative;
	left: 50%;
	line-height: 60px;
	transform: translateX(-50%);
	width: 60px;
	height: 60px;
	background: #f3f5f8;
	color: rgb(0, 0, 0);
	font-weight: bold;
	border: none;
	/* cursor: pointer; */
	/* transition: 0.4s; */
	/* display: inline; */
	font-size: 15px;
}

.list1 {
	/* visibility: hidden; */
	display: none;
	/* display: ; */
}

.food_tb {
	margin-top: 20px;
	background-color: rgb(240, 240, 240);
	border-radius: 11px;
}

.foodlist {
	width: 350px;
	text-align: center;
	border-radius: 10px;
	background-color: rgb(240, 240, 240);
}

.out {
	width: 50px;
	text-align: center;
	background-color: rgb(151, 188, 206);
	color: white;
	border-radius: 10px;
}

.foodlist_text {
	width: 350px;
	height: 50px;
	border-radius: 10px;
	border: rgba(0, 0, 0, 0);
	text-align: center;
}

.in {
	width: 50px;
	text-align: center;
	background-color: rgb(255, 94, 0);
	color: white;
	border-radius: 10px;
}
</style>
<script src="jquery-3.6.0.min.js"></script>
<script>
        let num1 = 0;
        let num2 = 6;
        $(function () {
            $(".list1").slice(num1, num2).attr("style", "display:flex");
            $("#load").click(function () {
                num1 += 6;
                num2 += 6;
                if (num1 < $(".list1").length) {
                    console.log("클릭됨");
                    $(".list1").slice(num1, num2).attr("style", "display:flex");
                }

                else {
                    alert("더이상 없습니다 !!! ");
                }
            });
        });
    </script>
</head>


<body style="font-family: 'allfonts'">

	<!-- 레시피 대표 이미지 -->
	<div id="preloader" algin="center">
		<i class="circle-preloader"></i> <img src="img/core-img/salad.png"
			alt="">
	</div>

	<!-- 검색창 -->
	<div class="search-wrapper">
		<!-- Close Btn -->
		<div class="close-btn">
			<i class="fa fa-times" aria-hidden="true"></i>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<form action="#" method="post">
						<input type="search" name="search"
							placeholder="Type any keywords...">
						<button type="submit">
							<i class="fa fa-search" aria-hidden="true"></i>
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- ##### 헤더 시작 부분/ 삭제 하지 마시오 ##### -->
	<header class="header-area">




		<!-- 메뉴관련 시작 -->
		<div class="delicious-main-menu">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- 메뉴 / 디자인 -->
					<nav class="classy-navbar justify-content-between"
						id="deliciousNav">

						<!-- 로고 -->
						<a class="nav-brand" href="main.jsp"><img
							src="img/core-img/logo.png" alt=""></a>

						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span><span></span><span></span></span>
						</div>

						<!-- 메뉴 / 모바일 화면 3줄 버튼 생성 -->
						<div class="classy-menu">

							<!-- 메뉴 / 모바일 화면 3줄 버튼 닫기 -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- 메뉴 묶음 -->
							<div class="classynav">
								<ul>

									<!-- 그 외 메뉴 -->

									<%
									if (user != null) {
									%>
									

									<li><a href="custom_ingredient.jsp">맞춤 추천</a></li>
									<li><a href="food_filter.jsp">식재료 필터</a></li>
									<%
									}
									%>

									<li><a href="Season_products.jsp">제철 식재료</a></li>
									<li><a href="Disease_high_blood_pressure.jsp">질병 정보</a></li>
									<li><a href="Guide.jsp">이용 안내</a></li>
									<%
									if (user == null) {
									%>
									<!-- 로그인 -->
									<li><a href="login.html"
										style="background-color: rgb(236, 236, 236);">로그인</a></li>

									<!-- 회원가입 -->
									<li><a href="join.jsp"
										style="background-color: rgb(236, 236, 236);">회원가입</a></li>

									<!-- 검색 -->
									<%
									} else {
									%>
									<li id="mypage"><a href="member_info.jsp">마이 페이지</a></li>
									<li><a href="logout.jsp"
										style="background-color: rgb(236, 236, 236);">로그아웃</a></li>
									<%
									}
									%>
									<li>
										<div class="search-btn"
											onclick="location.href='search_main_page.jsp'">
											<i class="fa fa-search" aria-hidden="true"
												style="font-size: 30px;"></i>
										</div>
									</li>
							</div>
							<!-- 메뉴묶음 끝 -->
						</div>

					</nav>
				</div>
			</div>
		</div>
		<!-- 메뉴관련 끝 -->
	</header>
	<!-- ##### 헤더 종료 부분 / 삭제하지 마시오 ##### -->

	<!-- 질병 탭-->
	<hr>
	<div>
		<ul style="text-align: center;">
			<a class="test_font" style="font-size: 30px;"
				href="custom_ingredient.jsp">식재료</a> &nbsp&nbsp
			<a class="test_font"
				style="font-size: 30px; border-bottom: 2px solid #adadad;"
				href="custom_recipe.jsp">레시피</a>
		</ul>
	</div>
	<br>
	</div>
	<div>
		<ul style="text-align: center;">
			<a class="test_font1" style="font-size: 17px; "
				href="custom_recipe.jsp">건강 맞춤</a> &nbsp&nbsp &nbsp&nbsp

			<a class="test_font1"
				style="font-size: 17px; border-bottom: 2px solid #adadad;"
				href="ref_food.jsp">냉장고 맞춤</a>
		</ul>

	</div>
	<br>
	<hr>
	<br>
	<div align="center">
		<div>
			<span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(85, 133, 89);">냉장고</span>
			<span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(65, 64, 64);">속
			</span> <span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(65, 64, 64);">식재료</span>
			<span class="test_font"
				style="font-weight: bold; font-size: 25px; color: rgb(65, 64, 64);">를
				입력하세요!</span>
		</div>

		<div align="center" style="margin: 3% 0px;">
			<span class="test_font"
				style="font-weight: bold; font-size: 17px; color: rgb(97, 97, 97);">
				<span><span style="font-weight:bold; color:black;">Dr.R</span>은 <%=user.getU_name() %>님이 입력한 식재료를 이용한 <span style="color:#024871; font-weight:bold; font-size:30px;">건강 맞춤 </span>요리레시피를
					알려드려요 XD
			</span>
			</span>
		</div>



		<!-- 입력된 식재료 목록 -->
		<% for (int i = 0 ; i< 5; i++) {
      if(nf[i]!=null){%>
		<form action="deleteRefCon" method="post">
			<div align="center" style="margin-top: 50px;">
				<table class="test_font food_tb list">
					<tr>
						<td class="foodlist"><span class="test_font"
							style="font-size: 17px; font-weight: bold;"> <%= nf[i] %>
						</span> <!-- 삭제하고자 하는 식재료 이름을 보내기위해서는 span에 name으로가 아니라 hidden을 사용,
               왜냐면 이방법 아니면 다 null값 뜸 값이 안보내짐 --> <input type="hidden"
							name="no" value="<%= nf[i] %>"></td>
						<input type="hidden" name="index" value="<%=i%>">
						</td>
						<td class="out">
							<!-- 삭제 기능 만드는 곳-->
							<button>-</button>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<%} %>
		<%} %>



		<!-- 새로운 식재료 입력하는 곳-->
		<%if (size != 5) { %>
		<form action="updateRefCon" method="post">
			<table class="test_font food_tb"
				style="margin-top: 100px; margin-bottom: 100px;">
				<tr>
					<td class="foodlist"><input type="text" class="foodlist_text"
						name="nofood" style="font-size: 17px; font-weight: 600;"
						placeholder="추가할 식재료를 입력하세요" name="foodname"> </input></td>
					<input type="hidden" name="size" value="<%=insert_idx%>">
					<td class="in"><button
							style="font-size: 17px; font-weight: 600;">입력</button></td>
				</tr>
			</table>
		</form>
		<!-- 만약 5개 다 입력되면 입력창 사라짐 우오아 쩐당!! -->
		<%}else { %>
		<div style="margin-bottom: 100px"></div>
		<%} %>
		<hr>
		<h3 style="margin-top:40px;">입력한 식재료에 대한 결과예요 :D</h3>
		<section class="small-receipe-area ">
			<div class="container">
				<h5 align="center" style="margin-bottom: 50px;"></h5>
				<div class="row">
					<%
					String[] ntf = (String[])session.getAttribute("notfood");
				 	for(int i=0; i<ntf.length; i++){
						if(ntf[i] == null)
							ntf[i] = "0";
						System.out.println(ntf[i]);
				 	}
					
		for(int i = 0; i < 5; i++){
			if(nf[i] != null){
				for(int j = 0; j < recipe.size(); j++){
					if(recipe.get(j).getRecipe_name().contains(nf[i])){ 
						if(!recipe.get(j).getRecipe_name().contains(ntf[0]) && !recipe.get(j).getRecipe_name().contains(ntf[1])
								&&	!recipe.get(j).getRecipe_name().contains(ntf[2]) && !recipe.get(j).getRecipe_name().contains(ntf[3])
								&& !recipe.get(j).getRecipe_name().contains(ntf[4])){%>
					<div class="col-12 col-sm-6 col-lg-4 list1">
						<div class="single-small-receipe-area d-flex">
							<!-- Receipe Thumb -->

							<div class="receipe-thumb" style="padding: 0px">
								<img style="height: 100px;"
									src="<%= recipe.get(j).getRecipe_img() %>" alt="">
							</div>
							<!-- Receipe Content -->
							<div class="receipe-content "
								style="padding-left: 10px; text-align: left;">
								<br>
								<!-- 좋은 질병 표시-->
								<%-- <span class="test_font"> <% if(recipe.get(j).getRecipe_method() != null){%>
									<%= recipe.get(j).getRecipe_method()%> <%}%>
								</span> --%>
								<span class="test_font" style="font-weight:bold; font-size:15px"> 
								<% if(dao.search_food(nf[i]).size() != 0) {%>
								<%=dao.search_food(nf[i]).get(0).getFood_good()%> 
								<%} else{%>
								<%= recipe.get(j).getRecipe_method() %>
								<%} %>
								</span>
								<!-- 음식 명-->
								<span class="test_font"
									style="font-weight: bold; font-size: 20px; color: black;"><%= recipe.get(j).getRecipe_name() %></span>
								<a class="test_font"
									style="font-size: 11px; padding: 2px 3px; width: fit-content; background-color: #ececec; border-radius: 5px"
									href="recipe_page.jsp?name=<%=recipe.get(j).getRecipe_name()  %>">상세보기</a>
							</div>
						</div>
					</div>
					<% }}
				}
			}
		}
	%>

				</div>
				<p>
					<button id="load" class="btn">더보기</button>
				</p>
			</div>
	</div>




	<!-- ##### Blog Area End ##### -->

	<!-- 포터 시작부분 -->
	<!-- ##### Footer Area Start ##### -->
	<footer class="footer-area">
		<div class="container h-100">
			<div class="row h-100">
				<div
					class="col-12 h-100 d-flex flex-wrap align-items-center justify-content-between">
					<!-- Footer Logo -->
					<div class="footer-logo">
						<a href="main.jsp"><img src="img/core-img/logo.png" alt=""></a>
					</div>
					<!-- Copywrite -->
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Dr.R &copy;
						<script>
                            document.write(new Date().getFullYear());
                        </script>
						| Project Team : 2X4=8 | Made By - ksj,kmj,hjg, kdh
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- ##### Footer Area Start ##### -->






	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
</body>

</html>