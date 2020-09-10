<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, reservation.model.vo.*"%>
    
<%
// 선택한 구장 정보 싹다 있음.
Stadium stadium = (Stadium) request.getAttribute("stadium");
System.out.println("예약페이지 => "+stadium);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>예약페이지</title>

<!--favicon  -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/common/favicon/favicon.ico"
   type="image/x-icon">

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- jquery-ui -->
<!-- 
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 -->

<!-- swiper api -->
<link type="text/css" rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link type="text/css" rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<!--fontawesome  -->
<script src="https://kit.fontawesome.com/09697e2134.js" crossorigin="anonymous"></script>


<!-- <link rel="stylesheet" href="style.css"> -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/stadium_reservation.css" type="text/css">

<!-- time-slider.css -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/time_slider.css">

<!-- calendar css/js -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/calendar.css">

<!--bootstrap  -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>
/*리뷰부분 스타일*/
.checked {
  color: orange;
}
.form-horizontal{
		width:100%;
		margin:0 auto;
		padding:0 50px;
		box-sizing:border-box;
	}

	.form-group{
		width:300px;
		height:35px;
		margin: 10px 0 30px 0;
		position:relative;
		display:inline-block;
	} 
	
	.form-group > input{
		width:100%;
		height:100%;
		border:none;
		border:2px solid #03D392;
		font-size:18px;
	}
	.form-group > .review_info{
		width:440px;
		border:none;
		border:2px solid #03D392;
		font-size:18px;
	}
	
	.form-group > input[type="date"]{
		font-size:12px;
	}
	
	.form-group > label{
		position:absolute;
		top:2px;
		left:15px;
		transform:translateY(-50%);
		font-size:15px;
		color:#03D392;
		padding:0px;
		background:#fff;
	}
	.form-detail textarea{
		padding-top:10px;
	}
	
	.form-group > textarea{
		border-color:#03D392;
		border-width:2px;
	}
	/* 버튼 */
	.btn-groups{
		text-align:center;
	}
	
	.btn-groups input{
		background-color:#03D392;	
		color:#fff;
		border:0;
		width:70%;
		height:40px;
		margin-left:-10px;
	}
	
	.btn-groups > button:first-of-type {
		margin-right:10px;
	}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 20px;
    height: 20px;
    background-image: url('./resources/common/images/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}
.wrap{
    max-width: 480px;
    margin: 0 auto; /* 화면 가운데로 */
    background-color: #fff;
    height: 100%;
    padding: 20px;
    box-sizing: border-box;

}
.reviewform textarea{
    width: 100%;
    padding: 10px;
    box-sizing: border-box;
}
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('./resources/common/images/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}

.warning_msg {
    display: none;
    position: relative;
    text-align: center;
    background: #ffffff;
    line-height: 26px;
    width: 100%;
    color: red;
    padding: 10px;
    box-sizing: border-box;
    border: 1px solid #e0e0e0;
}
.starRating,
.starRating span{ display:inline-block; height:14px; height:14px; background:transparent url(icoFiveStar.gif) no-repeat; overflow:hidden;}
.starRating{ width:79px; vertical-align:middle;}
.starRating span{ font-size:0; line-height:0; vertical-align:top; text-indent:-100px; *text-indent:0; background-position:0 -14px;}


</style>

</head>
<body>	



<div id="main-container-content">
        <!-- navbar -->

		<%@include file="/WEB-INF/views/common/navbar.jsp"%>
        <header>
            <!-- scroll-spy -->
            <div class="scroll-spy-menu" id="scroll-spy-menu">
                <ul id="scroll_menu_ul">
                    <li class="scroll_menu_li active">
                        <a class="scroll_menu_li_link" href="#branch-info-section">구장 상세정보</a>
                    </li>

                    <li class="scroll_menu_li">
                        <a class="scroll_menu_li_link" href="#stadium-notice-info-section">이용 안내 사항</a>
                    </li>

                    <li class="scroll_menu_li">
                        <a class="scroll_menu_li_link" href="#stadium-changerf-info-section">변경 및 환불 안내</a>
                    </li>

                    <li class="scroll_menu_li">
                        <a class="scroll_menu_li_link" href="#stadium-reservation-section">예약</a>
                    </li>

                    <li class="scroll_menu_li">
                        <a class="scroll_menu_li_link" href="#stadium-review-section">이용 후기(Review)</a>
                    </li>
                </ul>
            </div>
        </header>



        <!-- BRANCH와 STADIUM테이블을 참고하면됩니다. -->
        <section class="section" id="branch-info-section">

            <!-- 구장정보박스 -->
            <div class="info-box-1" id="branch-info-box">

                <!-- 지점/구장 이름 박스-->
                <div class="info-box-2" id="branch-name-info-box">
                    <!-- 구장의 지점 번호 : STADIUM_BRANCH_NUM-->
                    <input type="hidden" id="STADIUM_BRANCH_NUM" name="STADIUM_BRANCH_NUM" value="<%=stadium.getBranch_num()%>">

                    <!-- 구장 번호: STADIUM_NUM -->
                    <input type="hidden" id="STADIUM_NUM" name="STADIUM_NUM" value="<%=stadium.getStadium_num() %>">

                    <!-- 구장 이름박스 -->
                    <div id="stadium-name-box">
                        <!-- 구장 이름 : STADIUM_NAME-->
                        <h1 class="section-title" id="STADIUM_NAME"><%=stadium.getStadium_name() %></h1>
                    	
                    	<!--  branch_branchInfo -->
                    	<h3 id="BRANCH_BRANCHINFO"><%=stadium.getBranch_branchInfo() %></h3>
                    </div>
                </div>


                <!-- 지점이미지 박스-->
                <div class="info-box-2" id="branch-img-box">

                    <!-- 지점 이미지: BRANCH_IMG 
                        ./img/fb.png는 샘플 이미지입니다.
                    -->
                    <img src="<%=request.getContextPath() %>/resources/storage/<%=stadium.getBranch_manager_email() %>/branch_img/<%=stadium.getBranch_img() %>" alt="BRANCH_IMG" id="BRANCH_IMG">
                </div>



                <!--지점 상세 정보 박스-->
                <div class="info-box-2" id="branch-detail-info-box">

                    <!-- 지점옵션 -->
                    <div id="branch-options">
                        <h2 class="section-sub-title">지점 옵션</h2>

                        <div class="branch-options-group3">
                        	<%if(stadium.getBranch_option_shower().equals("Y")){%>
	                            <div class="branch_option" id="BRANCH_OPTION_SHOWER">
	                                <img src="<%=request.getContextPath() %>/resources/common/images/img_option/shower.png" alt="shower">
	                                <p>샤워</p>
	                            </div>
                            <%} %>


							<%if(stadium.getBranch_option_park().equals("Y")){%>
	                            <div class="branch_option" id="BRANCH_OPTION_PARK">
	                                <img src="<%=request.getContextPath() %>/resources/common/images/img_option/parking.png" alt="parking">
	                                <p>주차장 유무</p>
	                            </div>
                            <%} %>

							<%if(stadium.getBranch_option_uniform().equals("Y")){ %>
                            <div class="branch_option" id="BRANCH_OPTION_UNIFORM">
                                <img src="<%=request.getContextPath() %>/resources/common/images/img_option/uniform.png" alt="uniform">
                                <p>유니폼 대여 가능 여부</p>
                            </div>
                            <%} %>
                        </div>


                        <div class="branch-options-group3">
                        	<%if(stadium.getBranch_option_shoes().equals("Y")){ %>
	                            <div class="branch_option" id="BRANCH_OPTION_SHOES">
	                                <img src="<%=request.getContextPath() %>/resources/common/images/img_option/shoes.png" alt="shoes">
	                                <p>풋살화 대여 가능 여부</p>
	                            </div>
                            <%} %>
							
							<%if(stadium.getBranch_option_ball().equals("Y")){ %>
	                            <div class="branch_option" id="BRANCH_OPTION_BALL">
	                                <img src="<%=request.getContextPath() %>/resources/common/images/img_option/ball.png" alt="ball">
	                                <p>볼 대여 가능 여부</p>
	                            </div>
                            <%} %>
                            
                            
							<%if(stadium.getBranch_option_inout().equals("Y")){ %>
	                            <div class="branch_option" id="BRANCH_OPTION_INOUT">
	                                <img src="<%=request.getContextPath() %>/resources/common/images/img_option/stadium.png" alt="실내실외">
	                                <p>실내/실외 <br>(여기는 데이터 불러와야될듯)</p>
	                            </div>
                            <%} %>
                        </div>
                        <script>
                        $(function(){
                        	let branch_info=$('.branch-options-group3').text();
                        	
                       		if(branch_info.trim()==''){
                       			console.log(branch_info.trim()=='');
                       			$('#branch-options').css('display','none');
                       		}
                       		
                        });
                        	
                        </script>
                    </div>
                </div>

                <!-- 구장 상세정보 박스 -->
                <div class="info-box-2" id="stadium-detail-info-box">
                    <h2 class="section-sub-title">지점 상세 정보</h2>

                    <div id="stadium-detail-info">
                        <!-- 지점이름 -->
                        <div class="stadium-detail-box">
                            <div class="stadium-detail-info-label-box">
                                <label class="stadium-detail-info-label">구장 이름</label>
                            </div>
                            <span><%=stadium.getStadium_name() %></span>
                        </div>
                        
                        
                        <!-- 매치유형 -->
                        <div class="stadium-detail-box">
                            <div class="stadium-detail-info-label-box">
                                <label class="stadium-detail-info-label">인원 수</label>
                            </div>
                            <span>
                            <%
                            	String matchType= stadium.getStadium_match_member();
                            	int personNum=matchType.charAt(0)-'0';
                            %>
                            <%=matchType %> ( <b><%=personNum*2%>명</b>)
                            </span>
                        </div>

                        <div class="stadium-detail-box">
                            <div class="stadium-detail-info-label-box">
                                <label class="stadium-detail-info-label">별점</label>
                            </div>
                            <span>
                            	<%for (int i = 0; i < stadium.getBranch_point(); i++) { %><span style="font-size:1em" class="fa fa-star checked"></span> <%}%>
							    <%for (int i = 0; i < 5-stadium.getBranch_point(); i++) { %><span style="font-size:1em" class="fa fa-star"></span> <% }%>
                            </span>
                        </div>


                        <!-- 지점주소 -->
                        <div class="stadium-detail-box">
                            <div class="stadium-detail-info-label-box">
                                <label class="stadium-detail-info-label">지점 주소</label>
                            </div>
                            <span><%= stadium.getBranch_address()%></span>
                        </div>

                        <!-- 지점 전화번호 -->
                        <div class="stadium-detail-box">
                            <div class="stadium-detail-info-label-box">
                                <label class="stadium-detail-info-label">지점 전화번호</label>
                            </div>
                            <span><%=stadium.getBranch_phone() %></span>
                        </div>

                        <!-- sns -->
                        <div class="stadium-detail-box">
                            <div class="stadium-detail-info-label-box">
                                <label class="stadium-detail-info-label">SNS</label>
                            </div>
                            <span><a id="sns-website" href="<%=stadium.getBranch_website()%>"><%=stadium.getBranch_website() %></a></span>
                        </div>


                        <!-- 영업시간 박스 -->
                        <div class="stadium-detail-box">
                            <div class=" stadium-detail-info-label-box ">
                                <label class=" stadium-detail-info-label">영업시간</label>
                            </div>

                            <!--영업시작/ 종료 시간 박스  -->
                            <div class="open-close-times">
                                <span id="STADIUM_RESERVATION_START_TIME"><%=stadium.getStadium_reservation_start_time() %></span>
                                <span>~</span>
                                <span id="STADIUM_RESERVATION_END_TIME"><%=stadium.getStadium_reservation_end_time() %></span>
                            </div>
                        </div>


                        <div class="stadium-detail-box">
                            <div class="stadium-detail-info-label-box">
                                <label class="stadium-detail-info-label">공간 소개</label>
                            </div>

                            <div class="stadium-describe-box">
                               <%=stadium.getBranch_detailInfo() %>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </section>



        <!--이용 안내사항-->
        <section class="section" id="stadium-notice-info-section">
            <div class="info-box-1">
                <h1 class="section-title">이용 안내사항</h1>
                

                <div class="info-box-2  stadium-notices">
                	<h2 class="section-sub-title">예약 주의사항</h2>
                	<ul class="stadium-notices-ul" style="color: red;">
                		<li><%=stadium.getBranch_notes() %></li>
                	</ul>
                
                    <h2 class="section-sub-title">이용 규칙</h2>
                    <ul class="stadium-notices-ul" style="list-style:square">
                        <li>풋살장 예약 시간 준수</li>
                        <li>풋살장 내 취사, 흡연 및 음주행위, 지나친 소음행위 금지(적발 시 이용불가)</li>
                        <li>시설 사용 후 정리정돈 ( 쓰레기 반드시 처리 )</li>
                        <li>고의 및 과실로 인한 시설물 훼손 및 파손시 사용자가 배상하며 경기중 부상은 본인이 책임집니다.</li>
                        <li>잔디보호와 부상방지를 위하여 스터드가 있는 축구화(SG, FG, HG, AG)는 착용이 금지되며 풋살화(TF)만 착용 가능 합니다.</li>

                        <li>
                            사회적 거리두기 2단계 동안에는 다음내용이 적용됩니다.
                            <ul style="list-style:circle;" class="stadium-notices-ul2">
                                <li>운동시에는 마스크를 꼭 착용해주셔야합니다. 호흡이 어려운 경우 운동템포와 휴식시간을 조정해주세요.</li>
                                <li>실내구장의 경우에는 휴식시에도 마스크를 착용해주셔야합니다.</li>
                                <li>야외구장의 경우에는 휴식시 2M 이상 거리를 유지해주세요.</li>
                            </ul>
                        </li>

                        <li style="font-weight: bold;">위 내용이 지켜지지 않을 경우 퇴장조치 될 수 있으니 예약시 꼭 참고부탁드립니다.</li>

                        <li style="font-weight: bold;">
                            <span style="color: red;">
                                규정 외 요청은 적용이 불가합니다. 예약 전 반드시 확인해 주시기 바랍니다.
                            </span>
                        </li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- 변경 및 환불안내 사항 -->
        <section class="section" id="stadium-changerf-info-section">
            <div class="info-box-1">
                <h1 class="section-title">변경 및 환불 안내 사항(테스트)</h1>

                <!-- 변경 -->
                <div class="info-box-2 stadium-notices">
                    <h2 class="section-sub-title">변경 규정</h2>

                    <ul align="left" class="stadium-notices-ul" style="list-style:square;">
                        <li>시작시간이 지난 후 요청 했을 경우에는 환불 및 변경 모두 불가능합니다.
                        <li>구장 이용 중 비가 오기 시작 할 경우 환불 및 변경가능 여부는 구장 관리자가 결정합니다.
                        <li>아래의 조건에 해당될 경우 내용을 아이엠그라운드 카카오톡 채널로 예약 시작 시간 전까지 남겨주시면 고객센터 운영 시간에 확인 후 처리해 드리겠습니다.
                        <li>변경은 하단 환불 규정 기준 100% 환불인 경우에만 가능하며, 변경 가능한 횟수는 1회 입니다.</li>
                        <li>1회 변경된 예약은 환불 및 재변경이 불가능합니다.</li>
                        <li>날씨에 의한 변경은 야외구장에만 적용됩니다.</li>
                    </ul>

                </div>

                <!-- 환불 -->
                <div class="info-box-2 stadium-notices">
                    <h2 class="section-sub-title">환불 규정</h2>

                    <ul align="left" class="stadium-notices-ul" style="list-style:square;">
                        <li>환불은 예약날짜를 기준으로만 적용합니다. (예약 시간으로는 적용되지 않습니다)</li>
                        <li>예를들어, 5월 7일 예약일 경우 다음과 같습니다 
                        	<ul class="stadium-notices-ul">
                        		<li>이용 5일 전까지 : <b style="color:red;">100% 환불</b> </li>
                            	<li>4일 전 ~ 3일 전: <b style="color:red;">50% 환불</b> </li>
                            	<li>2일 전 ~ 대관 당일 : <b style="color:red;">환불 불가</b></li>
                            </ul>
                        <li>다음과 같은 경우에는 상단 규정대로 처리됩니다.<br>
                            <ul style="list-style:circle;" class="stadium-notices-ul2">
                                <li>고객의 사정으로 예약된 날짜에 구장 이용을 못하는 경우</li>
                                <li>구장, 날짜, 시간 등을 실수로 잘못 선택했을 경우</li>
                                <li>단순 변심으로 인해 환불이나 변경을 요청하는 경우</li>
                            </ul>
                        <li>날씨에 의한 환불은 야외구장에만 적용됩니다</li>
                        <li>다음과 같을 때는 환불이 가능합니다.<br>
                            <ul style="list-style:circle;" class="stadium-notices-ul2">
                                <li>예약 당일, 기상청에서 천재지변에 해당하는 특보를 예약한 지역에 발표한 경우에 적용 (특보가 해제된 후에는 적용이 불가능합니다.)</li>
                                <li>구장, 날짜, 시간 등을 실수로 잘못 선택했을 경우</li>
                                <li>단순 변심으로 인해 환불이나 변경을 요청하는 경우</li>
                            </ul>
                    </ul>
                </div>
            </div>
        </section>


        <!-- 예약 -->
        <section class="section" id="stadium-reservation-section">
            <h1 class="section-title">예약</h1>

            <div class="info-box-2 stadium-notices">
                <!-- 예약날짜, 예약 시간,  예약금액 -->

                <!-- 예약날짜 -->
                <div class="info-box2">
                    <h2 class="section-sub-title">예약 날짜 선택</h2>
                    <div class="container" id="reservation_date_select_box">
                        <div class="my-calendar clearfix">
                            <div class="clicked-date">
                                <div class="cal-day"></div>
                                <div class="cal-date"></div>
                            </div>
                            <div class="calendar-box">
                                <div class="ctr-box clearfix">
                                    <button type="button" title="prev" class="btn-cal prev">
                                    </button>
                                    <span class="cal-month"></span>
                                    <span class="cal-year"></span>
                                    <button type="button" title="next" class="btn-cal next">
                                    </button>
                                </div>
                                <table class="cal-table">
                                    <thead>
                                        <tr>
                                            <th>일</th>
                                            <th>월</th>
                                            <th>화</th>
                                            <th>수</th>
                                            <th>목</th>
                                            <th>금</th>
                                            <th>토</th>
                                        </tr>
                                    </thead>
                                    <tbody class="cal-body"></tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                </div>

                <!-- 예약시간 -->
                <div class="info-box2" id="reservation_time_select_box">
                    <h2 class="section-sub-title">예약 시간 선택</h2>
                    <div class="swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-free-mode"
                        id="swiper-container2">

                        <ul class="swiper-wrapper time_list"
                            style="transition-duration:0ms; transform:translate3d(0px, 0px, 0px); list-style:none;">

							<%
								int openTime=stadium.getStadium_reservation_start_time();
								int closeTime=stadium.getStadium_reservation_end_time();
								for(int i=0; i<24; i++){
								// open시간 이전: i<open시간
								// close시간 이후: i>=close시간
								
									if(i>=openTime && i<closeTime){//able
							%>
										<li class="swiper-slide ">
		                                	<a class="time_box">
		                                    	<span class="time"><%=i %></span>
		                                    
		                                    	<%--
		                                    	1시간당 이용 가격어딨죠....ㅠㅠㅋㅋㅋ? 
		                                    	가격 10000원으로 해놓겠습니당...ㅋ
		                                    	--%>
		                                    	<span class="price able">10000</span> 
		                                	</a>
	                            		</li>
							
							<%		}else{ //disable
							%>
									<li class="swiper-slide ">
		                                	<a class="time_box">
		                                    	<span class="time"><%=i %></span>
		                                    
		                                    	<%--
		                                    	1시간당 이용 가격어딨죠....ㅠㅠㅋㅋㅋ? 
		                                    	가격 10000원으로 해놓겠습니당...ㅋ
		                                    	--%>
		                                    	<span class="price disable">&nbsp;</span> 
		                                	</a>
	                            	</li>
									
								<%}%>
							<%}%>

                            <!-- 
                            <li class="swiper-slide disable">
                                0시와 12시에만 존재합니다.
                                <span class="time_half">오전</span>
                                <a class="time_box">
                                    <span class="time">0</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">
                                <a class="time_box">
                                    <span class="time">1</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">
                                <a class="time_box">
                                    <span class="time">2</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">3</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">4</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">
                                <a class="time_box">
                                    <span class="time">5</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">6</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide able">

                                <a class="time_box">
                                    <span class="time">7</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">8</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">9</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">10</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">11</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide able">
                                <span class="time time_half">오후</span>
                                <a class="time_box">
                                    <span class="time">12</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide able">

                                <a class="time_box">
                                    <span class="time">13</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide able">

                                <a class="time_box">
                                    <span class="time">14</span>
                                    <span class="price">1900</span>
                                </a>
                            </li>


                            <li class="swiper-slide able">

                                <a class="time_box">
                                    <span class="time">15</span>
                                    <span class="price">8900</span>
                                </a>
                            </li>


                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">16</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">17</span>
                                    <span class="price">1000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">18</span>
                                    <span class="price">900</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">19</span>
                                    <span class="price">1900</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">20</span>
                                    <span class="price">8000</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">21</span>
                                    <span class="price">900</span>
                                </a>
                            </li>


                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">22</span>
                                    <span class="price">7100</span>
                                </a>
                            </li>

                            <li class="swiper-slide disable">

                                <a class="time_box">
                                    <span class="time">23</span>
                                    <span class="price">8700</span>
                                </a>
                            </li> 
                            -->

                        </ul>
                    </div>
                </div>

                <!-- 예약 버튼 -->
                <div class="info-box2" id="reservation-btn-box">
					<!-- <input type="date" name="date" id="date">  -->
					<input type="button" name="reservationRegistBtn" id="reservationRegistBtn" value="예약하기">
                </div>
            </div>

        </section>


        <!-- 리뷰 -->
        <section class="section" id="stadium-review-section">
            <h1 class="section-title">이용후기 (리뷰)</h1>

            <div class="stadium-notices">
            	<!--  review  -->
				<div class="wrap">

					    <br>
					    <form name="reviewform" class="reviewform" method="post" action="/save">
					        <input type="hidden" name="rate" id="rate" value="0"/>
					        <p class="title_star">별점과 리뷰를 남겨주세요.</p>
					        
	        				<div class="review_rating">
	            				<div class="warning_msg">별점을 선택해 주세요.</div>
		        				<hr style="width:300px; margin-left:-2px;">
	            				<div class="rating">
	                				<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
	                				<input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
					                <label for="rating1"></label>
					                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
					                <label for="rating2"></label>
					                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점">
					                <label for="rating3"></label>
					                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
					                <label for="rating4"></label>
					                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
					                <label for="rating5"></label>
	            				</div>
	        				</div>
	        				
							<div class="form-group">
								<label for="reviewInfo">리뷰 작성 <span id="count1">(0 / 최대 200자)</span></label>
								<textarea rows="10" name="reviewContent" id="reviewContent" maxlength="200" placeholder="리뷰남겨주세요..." style="font-size:12px;"/></textarea>
							</div> 
					        <div class="btn-groups" style="width:427px; margin-left:-58px;">
								<input type="button" id="registBtn" value="리뷰등록">
							</div>
					        <hr>
							<div id="list">
							</div>
							<div id="reviewList">
							</div>
							<!-- <div id="loading">
							</div> -->
							<br> <br>
						</form>
				</div>
            </div>
        </section>
        


        <!-- top버튼 -->
        <div id="go-to-top">
        	<i id="top-arrow" class="fas fa-arrow-up"></i>
        </div>
        <script>
			//top버튼 & scroll-spy 스크롤링 효과
			$(function(){
				// top버튼
				let top_btn=$('#go-to-top');
				
				// scroll-spy
				let scroll_spy_menu= $('#scroll-spy-menu');
				
				
				$(window).scroll(function(e){
					if($(window).scrollTop()>500){
						top_btn.addClass('go-top-show');
						scroll_spy_menu.addClass('scroll-show');
					}else{
						top_btn.removeClass('go-top-show');
						scroll_spy_menu.removeClass('scroll-show');
					}
				});
				
				$('#go-to-top').click(function(e){
					e.preventDefault();
					$('html , body').animate({scrollTop: 0}, 300);
				});
			});
		</script>
        
        
    </div>

    <!-- footer -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>

<!-- timeslider - swiper api를 이용  -->
<script type="module">
    		import Swipper from 'https://unpkg.com/swiper/swiper-bundle.esm.browser.min.js'

    		//시간대별 해당하는 박스를 클릭하면

    		// 랜더링 시작하자마자 실행하는 함수
    		$(function () {
        		const mySwiper2 = new Swiper('#swiper-container2', {
            	watchSlidesProgress: true,
            	watchSlidesVisibility: true,
            	slidesPerView: 14
        	});

        	//드래그를 해보자
        	/*$('.time_list').draggable({
            	axis: 'x'
        	});*/

        	const $ables = $('ul.time_list li.able .price');
        	let isClicked = false;

        	$ables.each(function () {
            	// console.log($(this));
        	}).click(function () {
            
			$(this).css('cursor', 'pointer');

            	if (!isClicked) {
                	//선택 안된 상태 => 선택됨
                	isClicked = true;
                	$(this).css({
                    	'background': '#272929',
                    	'color': 'rgb(76, 227, 218)'
                	});
            	} else {
                	isClicked = false;
               	 	$(this).css({
            	        'background': 'rgb(116,227, 218)',
        	            'color': '#272929'
    	            });
	            }

        	});
    	});
</script>



<!-- 캘린더 script -->
<script src="<%=request.getContextPath() %>/resources/js/calendar.js"></script>

<!-- 예약 날짜를 클릭하면 => 예약시간선택 박스가 나온다. -->
<script>
   $(function () {
	   //예약날짜를 클릭하면=> 예약시간 선택박스가 나오도록한다.
       $('.day').click(function () {
           
           $('#reservation_time_select_box').css('display', 'block');
       });
	   
       
       $('.cal-body').click(function(){
    	   	//이거 RESERVATIONLIST의  RESERVATION_STADIUM_NUM 컬럼인가요?
	   		//var reservation_stadium_num = '1';
	   		 
	   		 
	   		//var reservation_usage_start_date = $(this).val();
	   		let activeDate= init.activeDate;
	   		let activeYear= activeDate.getFullYear(); //년도
	   		let activeMonth= activeDate.getMonth()+1; //월
	   		let activeDay= activeDate.getDate(); //일
	   		
	   		var reservation_usage_start_date= activeYear+'-'+activeMonth+'-'+activeDay;
	   		//console.log(reservation_usage_start_date);
	   		
	   		
	   		//예약바를 able로 초기화  =>>??????
			//$('.swiepr-slide .price').removeClass('disable');
			//$('.swiper-slide .price').addClass('able');
	   		
	   		$.ajax({
	   			 url: 'reservationDateInfo.me',
	   			 data: {reservation_stadium_num:<%=stadium.getStadium_num()%>, 
	   				 reservation_usage_start_date:reservation_usage_start_date},
	   			 success: function(data) {
	   				 console.log(data);
	   				
	   				 //예약바를 able로 초기화  =>>??????
	   						 
	   				/*  $('.swiepr-slide .price').removeClass('disable');
					 $('.swiper-slide .price').addClass('able'); */
	   				 
	   				 console.log(data['reservation'] );
	   				 $.each(data, function(key, value) {
	   					 if(key == "reservation"){
	   						 for (var i = 0; i < value.length; i++) {
	   							 //console.log(i+'번째 reservation추출 => '+value[i].reservation);
	   							 //예약되어있다고 표시. 
	   							 /*
	   							 운영시간: 9~22
	   							 (disable) -> 이미 예약 15~17, 20~22
	   							  
	   							 (able, disable 표시.)
	   							 */
	   							// for문 돌려서 반복문으로 갖고와야한다. 
	   							 //예약 시간 상태 표시
	   							 
	   							 	
	   							 // number: startTime, endTime
	   							 var startTime=parseInt(value[i].reservation_usage_start_time);
	   							 var endTime=parseInt(value[i].reservation_usage_end_time);
	   							 
	   							 console.log('startTime: '+startTime);
	   							 console.log('endTime: '+ endTime);
	   							 
	   							 
	   							 var swiperStart= $('.swiper-slide:nth-child('+startTime+')');
	   							 console.log(swiperStart);
	   							 
	   							 for(var t=startTime; t<endTime; t++){
	   								 // startTime, startTime+1, ...., endTime-1 까지는 이미 예약됨.
	   								 
	   								 //해당 li.swiper-slide는 disable로 적용됨.
	   								 $('li.swiper-slid:nth-child('+t+') .price').removeClass('able');
	   								 $('li.swiper-slide:nth-child('+t+') .price').addClass('disable');
	   								
	   							 }
	   						
	   							
	   							 /* testEval += '<p>'+ value[i].reservation_usage_start_time +'</p>';			 
	   							 testEval += '<p>'+ value[i].reservation_usage_end_time +'</p>'; */			 
	   							//page reload? - reservation 유무 상관없이 reloading?
	   							//location.reload();
	   							
	   						 }
	   					 }

	   				 });
	   			 }
	   		 });
       });
   });
</script>




<script type="text/javascript">
	//창섭씨꺼 틀	
	$('#date').change(function(){
		
		//이거 RESERVATIONLIST의  RESERVATION_STADIUM_NUM 컬럼인가요?
		var reservation_stadium_num = '1';
		 
		 
		var reservation_usage_start_date = $(this).val();
		
		
		
		console.log(reservation_usage_start_date);
		$.ajax({
			 url: 'reservationDateInfo.me',
			 data: {reservation_stadium_num:<%=stadium.getStadium_num()%>, 
				 reservation_usage_start_date:reservation_usage_start_date}, //reservation_usage_start_date: 날짜.
			 success: function(data) {
				 
				 //console.log(data);
				 $.each(data, function(key, value) {
					 if(key == "reservation"){
						 for (var i = 0; i < value.length; i++) {
							 console.log(i+'번째 reservation추출 => '+value[i].reservation);
							 //예약되어있다고 표시. 
							 // 해당날짜. 2020년 9월 18일 
							 /*
							 운영시간: 9~22
							 (disable) -> 이미 예약 15~17, 20~22
							  
							 (able, disable 표시.)
							 */
								// for문 돌려서 반복문으로 갖고와야한다. 
							 	//예약 시간 상태 표시
							 	
							 var startTime=parseInt(value[i].reservation_usage_start_time);
							 var endTime=parseInt(value[i].reservation_usage_end_time);
							 console.log('예약 시작시각: '+ startTime);
							 console.log('예약 종료시각: '+ endTime);
							 
							 for(var t=startTime; t<endTime; t++){
								 // startTime, startTime+1, ...., endTime-1 까지는 이미 예약됨.
								 $('.swiper-slide:nth-child('+t+')').addClass('disable');
							 } 
							 testEval += '<p>'+ value[i].reservation_usage_start_time +'</p>';			 
							 testEval += '<p>'+ value[i].reservation_usage_end_time +'</p>'; 			 
							 
						 }
					 }
						 
				 });
				 $('#wrap').html(testEval); 
			 }
		 });
	});
	
	
	
	$('#reservationRegistBtn').click(function(){
		
		var userId = '<%= userId%>';
			if(userId != null) {
				var reservation_branch_num = '<%=stadium.getBranch_num()%>';
				var reservation_stadium_num = '<%=stadium.getStadium_num()%>';
				
				// 예약 가격
				var reservation_price = $('#reservation_price').val();
				
				// 예약 시작 시간
				var reservation_usage_start_time = $('#reservation_usage_start_time').val();
				
				// 예약 사용 시간
				var reservation_usage_time = $('#reservation_usage_time').val();
				
				// 예약 끝 시간
				var reservation_usage_end_time = $('#reservation_usage_end_time').val();
				
				//예약 날짜 
				var reservation_usage_start_date = $('#date').val();
		
				if(reservation_usage_start_time == "" && reservation_usage_end_time == "") {
					alert('예약시간 선택해주세요');
					 $("#reservation_usage_start_time").focus();
				}else {
					if (confirm("예약하시겠습니까?") == true){
						$.ajax({
							 url: 'reservationRegist.me',
							 data: {reservation_branch_num:reservation_branch_num, reservation_stadium_num:reservation_stadium_num, reservation_price:reservation_price,
								 reservation_usage_start_time:reservation_usage_start_time, reservation_usage_time:reservation_usage_time, reservation_usage_end_time:reservation_usage_end_time},
							 success: function(data) {
								 console.log(data);
								 
								 if(data == 1) {
									 alert('예약완료');
								 }
							 }
						 });
					}else{
					     return false;
					}
				}
			}else {
				alert('로그인후이용가능');
			}
		
	});

	// review 쪽 
	$('#registBtn').click(function() {
			var branch_num = '<%= stadium.getBranch_num()%>';
			var review_content = $('#reviewContent').val();
			var rating = $("input:checkbox[name='rating']:checked").length;
			var userId = '<%= userId%>';
			console.log(branch_num);
			console.log(review_content);
			console.log(rating);
			console.log(userId);
			if(userId != 'null') {
				if(review_content == "") {
					alert('리뷰남겨주세요');
					$('#reviewContent').focus();
				}else {
					if (confirm("등록하시겠습니까?") == true){
						   $.ajax({
								 url: 'reviewRegist.me',
								 data: {
									 branch_num:branch_num, 
									 review_content:review_content, 
									 review_point:rating
								},
								 success: function(data) {
									 console.log(data);
									 
									 if(data == 1) {
										 alert('중복등록불가');
									 }else if(data == 2){
										 alert('등록되었습니다');
										 location.href = location.href; //RELOAD
										 
									 }else {
										 alert('이용후등록가능');
										 
									 }
								 }
							 });
						   
					   }else{
						     return false;
						     
					   }
				}
				
			}else {
				alert('로그인후이용가능');
				
			}
			
		});
		
		
		//리뷰삭제
		$(document).on('click', '#deleteBtn', function(){
			var branch_num = '<%= stadium.getBranch_num()%>';
		   var review_num = $(this).attr('review_num');
		   console.log(review_num);
		   if (confirm("삭제하시겠습니까?") == true){
			   $.ajax({
					 url: 'reviewDelete.me',
					 data: {branch_num:branch_num, review_num:review_num},
					 success: function(data) {
						 console.log(data);
						 
						 if(data == 1) {
							 alert('삭제되었습니다');
							 location.href = location.href;
						 }
					 }
				 });
			   
		   }else{
			     return false;
			     
		   }
		   
		   
		});
	 
		var page = 1;
		
		$(function(){
		     getList(page);
		     page++;
		     
		}); 
		
		
		
		
		//spinner - not using;
		$(window).scroll(function(){
			var testEval = '';
		     if($(window).scrollTop() >= $(document).height() - $(window).height()){
		          getList(page);
		          testEval += '<div class="d-flex justify-content-center"><div class="spinner-border" role="status"><span class="sr-only">Loading...</span></div></div>';
		          $("#loading").append(testEval);
		          page++;
		          
		     } 
		});
		 
		function getList(page){
		 	var branch_num = '<%= stadium.getBranch_num()%>';
		 	var userId = '<%= userId%>';
		    $.ajax({
		        url: 'review.me',
		        data: {branch_num:branch_num, page:page},
		        success: function(data) {
		        	console.log(data);
		            var testEval = "";
		            
		            if (data.pi.currentPage==1){
		                  $("#list").html(""); 
		            }
		            
		            // 덧글 등록하기 - 페이지별로 등록한 댓글 최대 5개만을 불러온다.
		            if (data.pi.currentPage<=data.pi.maxPage){
		            	$.each(data, function(key, value) {
							 if(key == "review") {
								 for (var i = 0; i < value.length; i++) {
									 testEval += '<div class="review_info"><h5>'+ value[i].name +'('+ value[i].review_email +')&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별점:&nbsp;';
									 for (var j = 0; j < value[i].review_point; j++) {
										testEval +='<span class="fa fa-star checked"></span>';
								     }
									 testEval += '</h5><div class="review_content"><p>: '+ value[i].review_content +'</p></div></div><br>';
									 testEval += '<p style="float: left;">'+ value[i].review_date +'</p>';
									 if(userId == value[i].review_email){
										 testEval +='<input type="button" id="deleteBtn" review_num="'+ value[i].review_num +'" style="background-color:#03D392; color:#fff; border:0; font-size:20px; float: right;" value="삭제">';
									 }
									 testEval += '<br><hr>';
									 
										
								 }
							 }
						});
		            	
		            }
		            testEval = testEval.replace(/%20/gi, " ");
		            if (data.pi.currentPage==1){
		                $("#list").html(testEval); 
		            }else{
		                $("#reviewList").append(testEval);
		            }
		       }
		    });
		    
		}
		
		//리뷰 에서 부여 별점 부여.
		//별점 마킹 모듈 프로토타입으로 생성
		function Rating() {
		};
		Rating.prototype.rate = 0;
		Rating.prototype.setRate = function(newrate) {
			//별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
			this.rate = newrate;
			let items = document.querySelectorAll('.rate_radio');
			items.forEach(function(item, idx) {
				if (idx < newrate) {
					item.checked = true;
				} else {
					item.checked = false;
				}
			});
		}
		let rating = new Rating();//별점 인스턴스 생성

		document.addEventListener('DOMContentLoaded', function() {
			//별점선택 이벤트 리스너
			document.querySelector('.rating').addEventListener('click',
					function(e) {
						let elem = e.target;
						if (elem.classList.contains('rate_radio')) {
							rating.setRate(parseInt(elem.value));
						}
					})
		});
	
</script>
</html>