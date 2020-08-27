<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Good Ball (로그아웃 상태)</title>
	<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
		integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/GB_frame.css">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<style>
		body {
			/* background-image: url("img/bg.jpg"); */
			background-size: cover;
		}

		.bd-placeholder-img {
			font-size:
				1.125rem;
			text-anchor:
				middle;
			-webkit-user-select:
				none;
			-moz-user-select:
				none;
			user-select:
				none;
		}

		@media (min-width : 768px) {
			.bd-placeholder-img-lg {
				font-size: 3.5rem;
			}
		}

		.bd-placeholder-img {
			font-size: 1.125rem;
			text-anchor: middle;
			-webkit-user-select: none;
			-moz-user-select: none;
			user-select: none;
		}

		@media (min-width: 768px) {
			.bd-placeholder-img-lg {
				font-size:
					3.5rem;
			}
		}

		img {
			display: block;
			margin: 120px auto;
		}


		#Rememberme {
			color: white;
		}

		.form-control {
			width: 400px;
			margin: 0 auto;
		}

		.btn-block {
			width: 200px;
			margin: 50px auto;
		}

		.ship1 {
			text-align: center;
			margin: 10px;
			border: 1x;
		}

		.ship {
			width: 200px;
			background-color: rgb(76, 227, 218);
			border-radius: 10px;
			font-size: 20px;
			border-radius: 10px;

		}

		#mb-4 {
			margin: 100px;
		}


		.form-control {
			border-radius: 10px;
		}

		.btn-primary{
			background-color: rgb(76,227, 218);
			border-style:none;
		}
	</style>
</head>

<body>
	<header>
		<div><br></div>
		<p></p>
	</header>

	<div id="page">
		<!-- BODY -->
		<section id="content">
			<div class="container-content">
				<boby class="test-center">
					<form class="form=signin" action="<%= request.getContextPath()%>/login.me" method="post">
						<img class="mb-4" src="img/logo.png" alt width="172px" height="172px">


						<br> <input type="text" id="email" class="form-control" placeholder="ID" width="300px"> <br>
						<br> <input type="password" id="pwd" class="form-control" placeholder="password"
							required>
						<div class="checkbox mb-3_web-inspector-hide-shirtcut" align="center">

						</div>
						<button class="btn btn-lg btn-primary btn-block" type="submit">로그인
						</button>
			</div>
	</div>


	<div class="ship1">
		<input type="button" class="ship" value=" 아이디 찾기" onclick="location.href = 'Corporate Membership.html'">
		<input type="button" class="ship" value=" 비밀번호  찾기" onclick="location.href = 'Corporate Membership.html'"> <br>
		<input type="button" class="ship" value="회원가입" onclick="location.href = 'memberShip.html'">
		<input type="button" class="ship" value=" 기업회원가입" onclick="location.href = 'Corporate Membership.html'">
		<input type="button" class="ship" value="카카오 회원가입">

		<p class="mt-5 mb-3 text-muted" align="center">ⓒ2020-2020 Good ball</p>
	</div>
	</section>

</body>

</html>