<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img2/logo.png"> <!-- 탭에 로고 박기 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap');

body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}

#wrapper {
	height: auto;
	min-height: 100%;
	padding-bottom: 150px;
}

.container {
text-align: center;
 height: 2300px;
}

footer {
	height: 150px;
	background-color: black;
	color: #fff;
}

/* 장바구니 바 설정 */

.hidden_menu {
	position:absolute;
	top: 20px;
	width: 100%;
}

.hidden_menu input {
	border: 0;
	outline: 0;
	display: block;
	margin: auto;
	font-size: 25px;
	padding: 3px;
	background-color: #222;
	color: #fff;
	opacity: 0;
}

.back {
	
}

/* 장바구니바 클릭시 */
input[id="sicon"] {
	display: none;
}

input[id="sicon"] + label {
	display: block;
	cursor: pointer;
	color: black;
	font-weight: bold;
	font-size: 17px;
	position: relative;
	width: 43px;
	height: 33px;
}

input[id="sicon"] + label span {
	display: block;
	position: absolute;
	width: 100%;
	height: 5px;
	border-radius: 1px;
}

input[id="sicon"] + label span:nth-child(1) {
	top:0;
}

input[id="sicon"] + label span:nth-child(2) {
	bottom:0;
}

input[id="sicon"]:checked + label span:nth-child(1) {
	top: 7px;
	left: -50px;
	transform: rotate(45deg);
	background-color: #fff;
	position: relative;
	height: 2px;
	width: 20px;
	transition:all 0.3s;
}

input[id="sicon"]:checked + label span:nth-child(2) {
	bottom: 10px;
	left: -50px;
	transform: rotate(-45deg);
	background-color: #fff;
	height: 2px;
	width: 20px;
	transition:all 0.3s;
}

input[id="sicon"]:checked + label a {
	position: absolute;
	color: #fff;
	transition:all 0.5s;
}

input[id="sicon"]:checked + label {
	z-index: 3;
}

/* 장바구니 바 확장 */

div[class="shopping_bar"] {
	display: block;
	width: 300px;
	height: 100%;
	background: #222;
	position: fixed;
	top: 0;
	right: -300px;
	z-index:2;
	transition:all .35s;
}

input[id="sicon"]:checked + label + div {
	right: 0;
}

/* 장바구니 바 작게했을 때 */

.shopping_bar div[class="shopping_menu"] {
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%,-50%);
	width: 250px;
	height: 85%;
	color: #fff;
	border: 1px solid;
	text-align: center;
}

div div[class="shopping_menu"] #hidebutton {
	position: absolute;
	bottom: 10px;
	font-size: 15px;
    width: 120px;
    padding: 10px;
    background-color: #000;
    color: #fff;
    border: 1px solid;
	transform: translate(-50%);
	cursor: pointer;
}

/* 장바구니 길게 했을 때 */

.maincart {
	text-align: justify;
    display: flex;
    padding-top: 2%;
    padding-left: 15%;
    padding-right: 15%;
    padding-bottom: 2%;
}

.item {
    flex-grow: 900;
}

.checkout {
    flex: 0 0 300px;
    margin-left: 100px;
}

.total {
    position: relative;
}

.check {
    margin-top: 30px;
}

.check input {
    width: 250px;
    font-size: 20px;
    padding-top: 5px;
    padding-bottom: 5px;
}

/* 상품들 */


.bundle {
    display: flex;
}

.item ul {
    list-style: none;
}

.item_img {
    width: 100px;
    height: 100px;
    border: 1px solid;
    flex: 1;
    max-width: 100px;
}

.item_img img {
    width: 100px;
    height: 100px;
}

.item_text {
    flex: 1;
    margin-left: 20px;
    max-width: 80%;
}

.item_amount {
    flex: 1;
    max-width: 50px;
    margin-left: 50px;
    
}

.item_price {
    flex: 1;
    max-width: 50px;
    margin-left: 50px;
    margin-right: 50px;
}

.close-button { 
         float: right; 
         width: 1.5rem; 
         line-height: 1.5rem; 
         text-align: center; 
         cursor: pointer; 
         border-radius: 0.25rem; 
         color: #fff; 
}

/* 햄버거햄버거햄버거햄버거햄버거햄버거햄버거햄버거 바 설정 */

input[id="menuicon"] {
	display:none;	
}

input[id="menuicon"] + label {
	display:block;
	width: 40px;
	height: 30px;
	position: relative;
	cursor:pointer;
	position: fixed;
	margin: 10px;
	z-index: 2;
	top: 5px;
	left: 20px;
}

input[id="menuicon"] + label span {
	display: block;
	position: absolute;
	width: 100%;
	height: 3px;
	border-radius: 30px;
	background: white;
	transition: all .35s;
}

input[id="menuicon"] + label span:nth-child(1) {
	top:0;
}

input[id="menuicon"] + label span:nth-child(2) {
	top:50%;
	transform:translateY(-50%);
}

input[id="menuicon"] + label span:nth-child(3) {
	bottom: 0;
}

input[id="menuicon"]:checked + label span:nth-child(1) {
	top:50%;
	transform:translateY(-50%) rotate(45deg);
}

input[id="menuicon"]:checked + label span:nth-child(2) {
	opacity: 0;
}

input[id="menuicon"]:checked + label span:nth-child(3) {
	bottom: 50%;
	transform:translateY(50%) rotate(-45deg);
}

div[class="sidebar"] {
	display: flex;
	justify-content: center;
	width:300px;
	height: 100%;
	background: #020202;
	position: fixed;
	top: 0;
	left: -300px;
	z-index:2;
	transition:all .35s;
}

input[id="menuicon"]:checked + label + div {
	left: 0;
}

input[id="menuicon"]:checked + label {
	z-index:3;
}

input[id="menuicon"]:checked + label span {
    background:#fff;
}

div div[class="sidemenu"] {
	position:absolute;
	top:100px;
	left:20px;
	width: 250px;
	height: 800px;
	color: #fff;
}

.sidemenu a {
	text-decoration: none;
	color: #fff;
	font-size: 40px;
	font-style: bold;
}

/* 네비 바와 로고 */

.nav {
	border: 2px solid;
	border-color : #1a237e;
	width: 100%;
	position:absolute;
	top: -1%;
	left: -2px;
	height: 70px;
	z-index: 1;
	position: fixed;
	background-color: #3f51b5;
}

.logo {
/* 	position: absolute; */
	top: 25px;
	left: 10%;
/* 	font-family: abster; */
	font-size: 25px;
	margin-top: 1.2%;
	margin-left: 1.5%;
}

.logolink {
	text-decoration: none;
	color: white;
	font-size: 18px;
	font-family: 'Nanum Gothic', sans-serif;
	font-weight: bold;
	
}



/* 네비바 오른쪽 메뉴들 */

.smol .smol_ul {
	position: relative;
	top: 10px;
	background-color: #020202;
	float: right;
}

.smol .smol_li {
	list-style-type: none;
	float:left;
	margin-right: 30px;
}

.smol a {
	text-decoration: none;
	color: white;
	font-weight: bold;
	font-size: 17px;
}

/* 메인 이미지 */

.first img {
	height: 800px;
	width: 100%;
	position: relative;
}

.first .text {
	position : absolute;
	top : 370px;
	left : 950px;
	transform: translate(-50%, -50%);
	text-align: center;
}

/* 이미지 밑의 텍스트 */

.main_text {
	text-align: center;
	margin-top: 90px;
	font-weight: 900;
	font-size: 30px;
}

/* 상품들 */

.product {
	width: 1278px;
	height: 1400px;
	position: absolute;
	left: 50%;
	top: 1650px;
	transform: translate(-50%, -50%);
}

.product .button {
	position: absolute;
	bottom: 5%;
	left: 100px;
}

.product .button a {
	text-decoration: none;
	font-size: 30px;
	border: 1px solid;
	padding: 5px 10px;
	color: #000;
}

.duct {
	width: 230px;
	height: 340px;
}

.product ul {
	list-style: none;
}

.product ul li {
	float: left;
}

.product li {
	margin: 30px;
}

.duct img {
	width: 232px;
	height: 232px;
}

.duct .details {
	width: 232px;
	height: 100px;
	text-align: center;
}

	
	table {
		width: 95%;
		margin-left:auto; 
   		margin-right:auto;
		text-align: center;
		border-collapse: collapse;
		border-spacing: 0;
		border-radius: 12px 12px 0 0;
		background: #fafafa;
	}
	
/* .main table {
	position: relative;
	z-index: 0;
	left: 50%;
	margin-top: 12%;
	transform: translate(-50%,-50%);
	width: 95%;
	border-collapse: collapse;
	border-spacing: 0;
	border-radius: 12px 12px 0 0;
	overflow: hidden;
	box-shadow: 0 2px 12px rgba(32,32,32,.3);
	background: #fafafa;
	text-align: center;
  } */
  th, td {
    padding: 4px 15px;
   
  }
  td {
  	font-size: large;
 	height: 45px;
 	font-family: 'Nanum Gothic', sans-serif;
	font-size: 14px;
  }
  

  
  th{
  	background: #ba68c8;
  	color: #fafafa;
  	text-transform: uppercase;
  }
  
  tr:nth-child(odd){
  	background-color: #eeeeee;
  }
  
  a {
	text-decoration-line: none;
	color: inherit;
  }
  
 #pading {
  background-color: #1a235e;
  font-family: 'Nanum Gothic', sans-serif;
  font-size: 16px;
  color: white;
  }
  
  .but_td {
  	 padding: 0px 0px;
  }
  
  .but_st {
  	width: 60px;
  	padding-top:7px;
  	padding-bottom:7px; 
  	border: 1px solid;
  	color: white;
  	background-color: #9e9e9e;
  	border-color: #9e9e9e;
  	cursor: pointer;
  }

  .but_st:hover {
  	color: white;
  	background-color: black;
  }
  
</style>
</head>
<body>
	<div>
		<div class="nav">
			<div class="logo">
				<a href="managerPage" class="logolink" style="font-size: 25px; font-weight:normal; font-family: 'Do Hyeon', sans-serif;">ANABADA Manager　</a>
				<a class="logolink">　　　|　</a>
				<a href="addProduct" class="logolink">Product Registration</a>
				<a class="logolink">　|　</a>
				<a href="managerTable?num=1" <c:if test="${num == 1 }">style="color: #1a237e"</c:if> class="logolink">Users List</a>
				<a class="logolink">　|　</a>
				<a href="managerProductTable?num=2&key=0" <c:if test="${num == 2 }">style="color: #1a237e"</c:if> class="logolink">Post List</a>
				<a class="logolink">　|　</a>
				<a href="managerTable?num=3" <c:if test="${num == 3 }">style="color: #1a237e"</c:if> class="logolink">Order List</a>
				<a class="logolink">　|　</a>
				<a href="managerTable?num=4" <c:if test="${num == 4 }">style="color: #1a237e"</c:if> class="logolink">Sale List</a>
				<a class="logolink">　|　</a>
				<a href="managerTable?num=5" <c:if test="${num == 5 }">style="color: #1a237e"</c:if> class="logolink">Customer Inquiry</a>
				<a class="logolink">　|　</a>
				<a href="/mars/logout" class="logolink">End Manager</a>
				<a class="logolink">　|　</a>
			</div>
		</div>
	</div>
	
<!-- 메인 이미지 -->
	<div class="container">
		<!-- 메인 상품들 -->
		<div class="main_text">
		<c:if test="${num == null }">
			<h1>관리자 페이지에 오신것을 환영합니다.</h1>
		</c:if>
		
		<c:if test="${num == 1 }">
			<table class="main">
				<tr>
					<td id="pading"><b>ID</b></td>
					<td id="pading"><b>NAME</b></td>
					<td id="pading"><b>SSN</b></td>
					<td id="pading"><b>POSTCODE</b></td>
					<td id="pading"><b>ADDRESS</b></td>
					<td id="pading"><b>DETAILED ADDRESS</b></td>
					<td id="pading"><b>PHONE NUMBER</b></td>
					<td id="pading"><b>EMAIL</b></td>
					<td id="pading"><b>CASH</b></td>
					<td id="pading"><b></b></td>
				</tr>
				<c:forEach var="UserVO" items="${uvl }">
				<tr>
					<td id="user_id"><b>${UserVO.user_id }</b></td>
					<td id="name"><b>${UserVO.name }</b></td>
					<td id="ssn"><b>${UserVO.ssn }</b></td>
					<td id="post_code"><b>${UserVO.post_code }</b></td>
					<td id="address"><b>${UserVO.address }</b></td>
					<td id="detail_address"><b>${UserVO.detail_address }</b></td>
					<td id="phone"><b>${UserVO.phone }</b></td>
					<td id="email"><b>${UserVO.email }</b></td>
					<td id="cash"><b>${UserVO.cash }</b></td>
					<td style="background-color: #9e9e9e; color: white;"><a href="deleteUser?id=${UserVO.user_id }">Delete</a></td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
	
		<c:if test="${num == 2 }">
				
			<table class="a" id="productTable">
				<tr>
					<td style="color: #263238; font-family: 'Nanum Gothic', sans-serif;"><a href="managerProductTable?num=2&key=1">Clothing</a></td>
					<td style="color: #263238; font-family: 'Nanum Gothic', sans-serif;"><a href="managerProductTable?num=2&key=2">Accessory</a></td>
					<td style="color: #263238; font-family: 'Nanum Gothic', sans-serif;"><a href="managerProductTable?num=2&key=3">Electronic</a></td>
					<td style="color: #263238; font-family: 'Nanum Gothic', sans-serif;"><a href="managerProductTable?num=2&key=4">Food</a></td>
					<td style="color: #263238; font-family: 'Nanum Gothic', sans-serif;"><a href="managerProductTable?num=2&key=5">Etc</a></td>
					<td style="color: #263238; font-family: 'Nanum Gothic', sans-serif;"><a href="managerProductTable?num=2&key=0">All</a></td>
				</tr>
			</table>
				
			<table id="productTable">
				<tr>
					<td id="pading"><b>Serial Number</b></td>
					<td id="pading"><b>Product Name</b></td>
					<td id="pading"><b>Image</b></td>
					<td id="pading"><b>Price</b></td>
					<td id="pading"><b>Sort</b></td>
					<td id="pading"><b>Registration Date</b></td>
					<td id="pading"><b>Sales Status</b></td>
					<td id="pading"><b></b></td>
					<td id="pading"><b></b></td>
					<td id="pading"><b></b></td>
				</tr>
		
				<c:forEach var="ProductVO" items="${pvl }">
					<c:if test="${key == 0 }">
						<tr>
							<td id="product_num"><b>${ProductVO.product_num }</b></td>
							<td id="product_name"><b>${ProductVO.product_name }</b></td>
							<td id="product_product_image"><img style="	width: 100px; height: 100px;" src="${ProductVO.product_image }"/></td>
							<td id="product_price"><b>${ProductVO.product_price }</b></td>
							<td id="product_add_date"><b>
							<c:if test="${ProductVO.product_category  == 1 }">Clothing</c:if>
							<c:if test="${ProductVO.product_category  == 2 }">Accessory</c:if>
							<c:if test="${ProductVO.product_category  == 3 }">Electronic</c:if>
							<c:if test="${ProductVO.product_category  == 4 }">Food</c:if>
							<c:if test="${ProductVO.product_category  == 5 }">Etc</c:if>
							</b></td>
							<td id="product_category"><b>${ProductVO.product_add_date }</b></td>
							<c:if test="${ProductVO.product_stock  == 1 }">
							<td id="product_add_date">On Sale</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductStock_0?product_num=${ProductVO.product_num }' ">REZ</button></td>
							</c:if>
							<c:if test="${ProductVO.product_stock  == 0 }">
							<td id="product_add_date">Complete</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductstock_1?product_num=${ProductVO.product_num }' ">Cancel</button></td>
							</c:if>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProduct?product_num=${ProductVO.product_num }' ">Modify</button></td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='deleteProduct?product_num=${ProductVO.product_num }' ">Delete</button></td>
						</tr>
					</c:if>
					
					<c:if test="${key == 1 && ProductVO.product_category == 1}">
						<tr>
							<td id="product_num"><b>${ProductVO.product_num }</b></td>
							<td id="product_name"><b>${ProductVO.product_name }</b></td>
							<td id="product_product_image"><img style="	width: 100px; height: 100px;" src="${ProductVO.product_image }"/></td>
							<td id="product_price"><b>${ProductVO.product_price }</b></td>
							<td id="product_add_date"><b><c:if test="${ProductVO.product_category  == 1 }">의류</c:if></b></td>
							<td id="product_category"><b>${ProductVO.product_add_date}</b></td>
							<c:if test="${ProductVO.product_stock  == 1 }">
							<td id="product_add_date">On Sale</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductStock_0?product_num=${ProductVO.product_num }' ">예약</button></td>
							</c:if>
							<c:if test="${ProductVO.product_stock  == 0 }">
							<td id="product_add_date">Complete</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductstock_1?product_num=${ProductVO.product_num }' ">취소</button></td>
							</c:if>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProduct?product_num=${ProductVO.product_num }' ">수정</button></td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='deleteProduct?product_num=${ProductVO.product_num }' ">삭제</button></td>
						</tr>
					</c:if>
					
					<c:if test="${key == 2 && ProductVO.product_category == 2}">
						<tr>
							<td id="product_num"><b>${ProductVO.product_num }</b></td>
							<td id="product_name"><b>${ProductVO.product_name }</b></td>
							<td id="product_product_image"><img style="	width: 100px; height: 100px;" src="${ProductVO.product_image }"/></td>
							<td id="product_price"><b>${ProductVO.product_price }</b></td>
							<td id="product_add_date"><b><c:if test="${ProductVO.product_category  == 2 }">장신구</c:if></b></td>
							<td id="product_category"><b>${ProductVO.product_add_date }</b></td>
							<c:if test="${ProductVO.product_stock  == 1 }">
							<td id="product_add_date">On Sale</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductStock_0?product_num=${ProductVO.product_num }' ">예약</button></td>
							</c:if>
							<c:if test="${ProductVO.product_stock  == 0 }">
							<td id="product_add_date">Complete</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductstock_1?product_num=${ProductVO.product_num }' ">취소</button></td>
							</c:if>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProduct?product_num=${ProductVO.product_num }' ">수정</button></td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='deleteProduct?product_num=${ProductVO.product_num }' ">삭제</button></td>
						</tr>
					</c:if>
					
					<c:if test="${key == 3 && ProductVO.product_category == 3}">
						<tr>
							<td id="product_num"><b>${ProductVO.product_num }</b></td>
							<td id="product_name"><b>${ProductVO.product_name }</b></td>
							<td id="product_product_image"><img style="	width: 100px; height: 100px;" src="${ProductVO.product_image }"/></td>
							<td id="product_price"><b>${ProductVO.product_price }</b></td>
							<td id="product_add_date"><b><c:if test="${ProductVO.product_category  == 3 }">전자기기</c:if></b></td>
							<td id="product_category"><b>${ProductVO.product_add_date }</b></td>
							<c:if test="${ProductVO.product_stock  == 1 }">
							<td id="product_add_date">On Sale</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductStock_0?product_num=${ProductVO.product_num }' ">예약</button></td>
							</c:if>
							<c:if test="${ProductVO.product_stock  == 0 }">
							<td id="product_add_date">Complete</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductstock_1?product_num=${ProductVO.product_num }' ">취소</button></td>
							</c:if>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProduct?product_num=${ProductVO.product_num }' ">수정</button></td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='deleteProduct?product_num=${ProductVO.product_num }' ">삭제</button></td>
						</tr>
					</c:if>
					
					<c:if test="${key == 4 && ProductVO.product_category == 4}">
						<tr>
							<td id="product_num"><b>${ProductVO.product_num }</b></td>
							<td id="product_name"><b>${ProductVO.product_name }</b></td>
							<td id="product_product_image"><img style="	width: 100px; height: 100px;" src="${ProductVO.product_image }"/></td>
							<td id="product_price"><b>${ProductVO.product_price }</b></td>
							<td id="product_add_date"><b><c:if test="${ProductVO.product_category  == 4 }">식품</c:if></b></td>
							<td id="product_category"><b>${ProductVO.product_add_date }</b></td>
							<c:if test="${ProductVO.product_stock  == 1 }">
							<td id="product_add_date">On Sale</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductStock_0?product_num=${ProductVO.product_num }' ">예약</button></td>
							</c:if>
							<c:if test="${ProductVO.product_stock  == 0 }">
							<td id="product_add_date">Complete</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductstock_1?product_num=${ProductVO.product_num }' ">취소</button></td>
							</c:if>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProduct?product_num=${ProductVO.product_num }' ">수정</button></td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='deleteProduct?product_num=${ProductVO.product_num }' ">삭제</button></td>
						</tr>
					</c:if>
					
					<c:if test="${key == 5 && ProductVO.product_category == 5}">
						<tr>
							<td id="product_num"><b>${ProductVO.product_num }</b></td>
							<td id="product_name"><b>${ProductVO.product_name }</b></td>
							<td id="product_product_image"><img style="	width: 100px; height: 100px;" src="${ProductVO.product_image }"/></td>
							<td id="product_price"><b>${ProductVO.product_price }</b></td>
							<td id="product_add_date"><b><c:if test="${ProductVO.product_category  == 5 }">기타</c:if></b></td>
							<td id="product_category"><b>${ProductVO.product_add_date }</b></td>
							<c:if test="${ProductVO.product_stock  == 1 }">
							<td id="product_add_date">판매중</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductStock_0?product_num=${ProductVO.product_num }' ">예약</button></td>
							</c:if>
							<c:if test="${ProductVO.product_stock  == 0 }">
							<td id="product_add_date">Complete</td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProductstock_1?product_num=${ProductVO.product_num }' ">취소</button></td>
							</c:if>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='updateProduct?product_num=${ProductVO.product_num }' ">수정</button></td>
							<td class="but_td"><button class="but_st" type="button" onclick="location.href='deleteProduct?product_num=${ProductVO.product_num }' ">삭제</button></td>
						</tr>
					</c:if>
				</c:forEach> 
				
			</table>
		</c:if>
			
		<c:if test="${num == 3 }">
			<table id="buyInfoTable">
				<tr>
					<td id="pading"><b>구매번호</b></td>
					<td id="pading"><b>구매자아이디</b></td>
					<td id="pading"><b>제품넘버</b></td>
					<td id="pading"><b>제품이름</b></td>
					<td id="pading"><b>제품가격</b></td>
					<td id="pading"><b>이메일</b></td>
					<td id="pading"><b>전화번호</b></td>
					<td id="pading"><b>우편번호</b></td>
					<td id="pading"><b>도로명 주소</b></td>
					<td id="pading"><b>상세주소</b></td>
					<td id="pading"><b>구매시간</b></td>
					<td id="pading"><b>배송여부</b></td>
					<td id="pading"><b></b></td>
					<td id="pading"><b></b></td>
				</tr>
				<c:forEach var="BuyInfoVO" items="${bvl }">
				<tr>
					<td id="buy_num"><b>${BuyInfoVO.buy_num }</b></td>
					<td id="user_id"><b>${BuyInfoVO.user_id }</b></td>
					<td id="product_num"><b>${BuyInfoVO.product_num }</b></td>
					<td id="product_name"><b>${BuyInfoVO.product_name }</b></td>
					<td id="product_price"><b>${BuyInfoVO.product_price }</b></td>
					<td id="email"><b>${BuyInfoVO.email }</b></td>
					<td id="phone"><b>${BuyInfoVO.phone }</b></td>
					<td id="post_code"><b>${BuyInfoVO.post_code }</b></td>
					<td id="address"><b>${BuyInfoVO.address }</b></td>
					<td id="detail_address"><b>${BuyInfoVO.detail_address }</b></td>
					<td id="buy_time"><b>${BuyInfoVO.buy_time }</b></td>
					<td id="buyInfo_stock"><b>${BuyInfoVO.buyInfo_stock }</b></td>
					<td style="background-color: #9e9e9e; color: white;"><a href="completeBuyInfo?buyinfo_num=${BuyInfoVO.buy_num }">완료</a></td>
					<td style="background-color: #9e9e9e; color: white;">
					<a href="deleteBuyInfo?buyinfo_num=${BuyInfoVO.buy_num }&product_num=${BuyInfoVO.product_num }">삭제</a></td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
		
		<c:if test="${num == 4 }">
			<table id="sellTable">
				<tr>
					<td id="pading"><b>판매번호</b></td>
					<td id="pading"><b>구매자아이디</b></td>
					<td id="pading"><b>제품번호</b></td>
					<td id="pading"><b>제품이름</b></td>
					<td id="pading"><b>제품가격</b></td>
					<td id="pading"><b>유저이메일</b></td>
					<td id="pading"><b>유저전화번호</b></td>
					<td id="pading"><b>판매시간</b></td>
					<td id="pading"><b></b></td>
				</tr>
		 		<c:forEach var="SellVO" items="${svl }">
				<tr>
					<td id="sell_num"><b>${SellVO.sell_num }</b></td>
					<td id="user_id"><b>${SellVO.user_id }</b></td>
					<td id="product_num"><b>${SellVO.product_num }</b></td>
					<td id="product_name"><b>${SellVO.product_name }</b></td>
					<td id="product_price"><b>${SellVO.product_price }</b></td>
					<td id="email"><b>${SellVO.email }</b></td>
					<td id="phone"><b>${SellVO.phone }</b></td>
					<td id="sell_time"><b>${SellVO.sell_time }</b></td>
					<td style="background-color: #9e9e9e; color: white;"><a href="deleteSell?sell_num=${SellVO.sell_num }&product_num=${SellVO.product_num }">삭제</a></td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
		
		<c:if test="${num == 5 }">
			<table id="contactTable">
				<tr>
					<td id="pading"><b>문의번호</b></td>
					<td id="pading"><b>아이디</b></td>
					<td id="pading"><b>이메일</b></td>
					<td id="pading"><b>제목</b></td>
					<td id="pading"><b>정보</b></td>
					<td id="pading"><b>문의내용</b></td>
					<td id="pading"><b></b></td>
				</tr>
		 		<c:forEach var="ContactVO" items="${contactList }">
				<tr>
					<td id="contact_num"><b>${ContactVO.contact_num }</b></td>
					<td id="user_id"><b>${ContactVO.user_id }</b></td>
					<td id="email"><b>${ContactVO.email }</b></td>
					<td id="product_title"><b>${ContactVO.product_title }</b></td>
					<td id="product_info"><b>${ContactVO.product_info }</b></td>
					<td id="user_comment"><b>${ContactVO.user_comment }</b></td>
					<td style="background-color: #9e9e9e; color: white;"><a href="deleteContact?contact_num=${ContactVO.contact_num }">삭제</a></td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
			
		</div>
		<div class="product">
		</div>
	</div>
</body>
</html>