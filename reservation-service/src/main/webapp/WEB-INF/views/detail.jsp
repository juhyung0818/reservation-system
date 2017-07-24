<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<script src="/resources/js/node_modules/jquery/dist/jquery.js"></script>
	<script src="/resources/js/node_modules/@egjs/component/dist/component.js"></script>
	<script src="/resources/js/handlebars-v4.0.10.js"></script>
    <meta charset="utf-8">
    <meta name="description" content="네이버 예약, 네이버 예약이 연동된 곳 어디서나 바로 예약하고, 네이버 예약 홈(나의예약)에서 모두 관리할 수 있습니다.">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
    <title>네이버 예약</title>
    <link href="/resources/css/style.css" rel="stylesheet">
    <style>
    .invisible {
		display: none;
	}
    </style>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=8bYQ0yuErj7kN82FyW8m&submodules=geocoder"></script>
    
</head>

<body>
    <div id="container">
        <div class="header fade">
            <header class="header_tit">
                <h1 class="logo">
                    <a href="/naver" class="lnk_logo" title="네이버"> <span class="spr_bi ico_n_logo">네이버</span> </a>
                    <a href="/" class="lnk_logo" title="예약"> <span class="spr_bi ico_bk_logo">예약</span> </a>
                </h1>
                <a href="/myreservation" class="btn_my"> <span title="내 예약">MY</span> </a>
            </header>
        </div>
        <div class="ct main">
            <div>
                <div class="section_visual">
                    <header>
                        <h1 class="logo">
                            <a href="naver.com" class="lnk_logo" title="네이버"> <span class="spr_bi ico_n_logo">네이버</span> </a>
                            <a href="/" class="lnk_logo" title="예약"> <span class="spr_bi ico_bk_logo">예약</span> </a>
                        </h1>
                        <a href="/myreservation" class="btn_my"> <span title="내 예약">MY</span> </a>
                    </header>
                </div>
                <div class="pagination">
					<div class="bg_pagination"></div>
                        <div class="figure_pagination">
                            <span class="num"></span>
                            <span class="num off">/ <span></span></span>
                        </div>
                    </div>
                </div>
                <div class="section_info">
                </div>
                <a href="/reserve/${id}">
	                <div class="section_btn"> <button type="button" class="bk_btn"> 
	                	<i class="fn fn-nbooking-calender2"></i> <span>예매하기</span> 
	                </button> </div>
                </a>
                <div class="section_review_list">
                    <div class="review_box">
                        <h3 class="title_h3">예매자 한줄평</h3>
                        <div class="short_review_area">
                            <div class="grade_area">
                                <!-- [D] 별점 graph_value는 퍼센트 환산하여 width 값을 넣어줌 -->
                                <span class="graph_mask"> <em class="graph_value"></em> </span>
                                <strong class="text_value"> <span></span> <em class="total">5.0</em> </strong>
                                <span class="join_count"><em class="green"></em> 등록</span>
                            </div>
                            <ul class="list_short_review">
                            </ul>
                        </div>
                        <p class="guide"> <i class="spr_book2 ico_bell"></i> <span>네이버 예약을 통해 실제 방문한 이용자가 남긴 평가입니다.</span> </p>
                    </div>
                    <a class="btn_review_more invisible" href="/review/${id}"> <span>예매자 한줄평 더보기</span> <i class="fn fn-forward1"></i> </a>
                </div>
                <div class="section_info_tab">
                    <!-- [D] tab 선택 시 anchor에 active 추가 -->
                    <ul class="info_tab_lst">
                        <li class="item _detail">
                            <a class="anchor active"> <span>상세정보</span> </a>
                        </li>
                        <li class="item _path">
                            <a class="anchor"> <span>오시는길</span> </a>
                        </li>
                    </ul>
                    <!-- [D] 상세정보 외 다른 탭 선택 시 detail_area_wrap에 hide 추가 -->
                    <div class="detail_area_wrap">
                        <div class="detail_area">
                            <div class="detail_info">
                                <h3 class="blind">상세정보</h3>
                                <ul class="detail_info_group">
                                    <li class="detail_info_lst">
                                        <strong class="in_tit">[소개]</strong>
                                        <p class="in_dsc">
                                            웰메이드 창작 뮤지컬의 대표 브랜드 '김수로 프로젝트' 최신작! 연극, 뮤지컬, 무용 등 매년 작품성 있는 창작 공연을 선보이며, 대한민국 대표 웰메이드 창작 브랜드로 자리매김한 '김수로 프로젝트'의 최신작 입니다. 웰메이드 창작 뮤지컬의 대표 브랜드 '김수로 프로젝트' 최신작! 연극, 뮤지컬, 무용 등 매년 작품성 있는 창작 공연을 선보이며, 대한민국 대표 웰메이드 창작 브랜드로 자리매김한 '김수로 프로젝트'의 최신작 입니다.
                                        </p>
                                    </li>
                                    <li class="detail_info_lst"> <strong class="in_tit">[공지사항]</strong>
                                        <ul class="in_img_group">
                                            <li class="in_img_lst"> <img alt="" class="img_thumb" src="https://ssl.phinf.net/naverbooking/20170131_238/14858250829398Pnx6_JPEG/%B0%F8%C1%F6%BB%E7%C7%D7.jpg?type=a1000"> </li>
                                        </ul>
                                    </li>
                                    <li class="detail_info_lst"> <strong class="in_tit">[공연정보]</strong>
                                        <ul class="in_img_group">
                                            <li class="in_img_lst"> <img alt="" class="img_thumb" data-lazy-image="https://ssl.phinf.net/naverbooking/20170131_255/1485825099482NmYMe_JPEG/%B0%F8%BF%AC%C1%A4%BA%B8.jpg?type=a1000"> </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- [D] 오시는길 외 다른 탭 선택 시 detail_location에 hide 추가 -->
                    <div class="detail_location hide">
                        <div class="box_store_info no_topline">
                            <a href="http://map.naver.com/" class="store_location" title="지도웹으로 연결">
								<div id='map' style="width:100%;height:300px;">
								</div>
                                <span class="img_border"></span>
                                <span class="btn_map"><i class="spr_book2 ico_mapview"></i></span>
                            </a>
                            <h3 class="store_name">엔에이치엔티켓링크(주)</h3>
                            <div class="store_info">
                                <div class="store_addr_wrap">
                                    <span class="fn fn-pin2"></span>
                                    <p class="store_addr store_addr_bold">서울특별시 종로구 종로33길 15 </p>
                                    <p class="store_addr">
                                        <span class="addr_old">지번</span>
                                        <span class="addr_old_detail">서울특별시 종로구 연지동 270 </span>
                                    </p>
                                    <p class="store_addr addr_detail">두산아트센터 연강홀</p>
                                </div>
                                <div class="lst_store_info_wrap">
                                    <ul class="lst_store_info">
                                        <li class="item"> <span class="item_lt"> <i class="fn fn-call2"></i> <span class="sr_only">전화번호</span> </span> <span class="item_rt"> <a href="tel:02-548-0597" class="store_tel">02-548-0597</a></span> </li>
                                    </ul>
                                </div>
                            </div>
							<!-- [D] 모바일 브라우저에서 접근 시 column2 추가와 btn_navigation 요소 추가 -->
                            <div class="bottom_common_path column2">
                                <a href="http://map.naver.com/" class="btn_path"> <i class="fn fn-path-find2"></i> <span>길찾기</span> </a>
								<a href="#" class="btn_navigation before"> <i class="fn fn-navigation2"></i> <span>내비게이션</span> </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <footer>
        <div class="gototop">
            <a href="#" class="lnk_top"> <span class="lnk_top_text">TOP</span> </a>
        </div>
        <div class="footer">
            <p class="dsc_footer">네이버(주)는 통신판매의 당사자가 아니며, 상품의정보, 거래조건, 이용 및 환불 등과 관련한 의무와 책임은 각 회원에게 있습니다.</p>
            <span class="copyright">© NAVER Corp.</span>
        </div>
    </footer>
    <div id="photoviewer"></div>
    <script src="/resources/js/detail.js"></script>
    <script src="/resources/js/product.js"></script>
    <script src="/resources/js/comment.js"></script>
	<script src="/resources/js/background.js"></script>
	<script>
	

Detail.get('${id}');
Product.set_count('${id}');
UTIL.set_size(414);

$(document).on("click", ".bk_btn", check);
function check(){
	if(Detail.get_sales_flag() == 0){
		alert("fail");
	}
}


var index = 0;
$(document).on("click", ".btn_prev", function(){
	index--;
	if(index < -1){
		index = 0;
		$(".visual_img").css("left", -828);
	}
	$(".visual_img").animate({"left": "+=" + 414}, "slow");	
});
$(document).on("click", ".btn_nxt", function(){
	index++;
	if(1 < index){
		index = 0;
		$(".visual_img").css("left", 0);
	}
	$(".visual_img").animate({"left": "-=" + 414}, "slow");
});
/* $('.figure_pagination > span[class=num]').html(slide.get_index() + 1); */
/* $('span[class=num, off] > span').html(product.get_count()); */

	var id ='${id}';
	var view = $('.list_short_review');
	COMMENT.get_sample(id, view);
	COMMENT.get_average_score(id);
	COMMENT.get_count(id);

$(document).on("click", "li._detail > a", function(){
	console.log("detail");
	$('li._path > a').removeClass('active');
	$('li._detail > a').addClass('active');
	$('.detail_location').addClass('hide');
	$('.detail_area_wrap').removeClass('hide');
});

$(document).on("click", "li._path > a", function(){
	console.log("path");
	$('li._detail > a').removeClass('active');
	$('li._path > a').addClass('active');
	$('.detail_area_wrap').addClass('hide');
	$('.detail_location').removeClass('hide');
});

function searchAddressToCoordinate(address) {
    naver.maps.Service.geocode({
        address: address
    }, function(status, response) {
        if (status === naver.maps.Service.Status.ERROR) {
            return alert('Something Wrong!');
        }

        var item = response.result.items[0],
            addrType = item.isRoadAddress ? '[도로명 주소]' : '[지번 주소]',
            point = new naver.maps.Point(item.point.x, item.point.y);

            new naver.maps.Map("map", {
                center: new naver.maps.LatLng(point),
                zoom: 10
            });
    });
}
searchAddressToCoordinate("인천 인중로 614");
	$(document).ready(function() {
		
		$(".visual_img").on("touchstart", function(event) {

			console.log("터치가 시작되었어요.");
			event.preventDefault();	//	이벤트취소

		});

		$(".visual_img").on("touchmove", function(event) {

			//	jQuery 이벤트 객체를 자바스크립트 표준 이벤트 객체로 바꾸기

			//	이유는 jQuery 에서 자바 스크립트

			var event = e.originalEvent;

			console.log('touch 이벤트 중입니다.'); 

			//	div에 터치한 좌표값 넣기

			console.log(event.touches[0].clientX + ", " + event.touches[0].clientY );
			event.preventDefault();

		});

		$(".visual_img").on('touchend', function(e) {

			console.log("터치이벤트가 종료되었어요"); 

		});
	});


</script>
<script id="image-template" type="text/x-handlebars-template">
<li class="item" style="width: 414px;"> 
	<img alt="" class="img_thumb" src="/images/{{this}}">
	<span class="img_bg"></span>
	<div class="visual_txt">
		<div class="visual_txt_inn">
			<h2 class="visual_txt_tit"> <span>뮤지컬 로미오와 줄리엣</span> </h2>
			<p class="visual_txt_dsc"></p>
		</div>
	</div>
</li>
</script>
<script id="detail-product-template" type="text/x-handlebars-template">
                    <div class="group_visual">
                        <div>
                            <div class="container_visual" style="width: 414px;">
                                <ul class="visual_img">
                                </ul>
                            </div>
                            <div class="prev">
                                <div class="prev_inn">
                                    <a href="#" class="btn_prev" title="이전">
                                        <!-- [D] 첫 이미지 이면 off 클래스 추가 -->
                                        <i class="spr_book2 ico_arr6_lt off"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="nxt">
                                <div class="nxt_inn">
                                    <a href="#" class="btn_nxt" title="다음">
                                        <i class="spr_book2 ico_arr6_rt"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    <div class="group_btn_goto">
                        <a class="btn_goto_home" title="홈페이지" href="{{homepage}}" target="siteUrl"> <i class="fn fn-home1"></i> </a>
                        <a class="btn_goto_tel" title="전화" href="tel:{{tel}}"> <i class="fn fn-call1"></i> </a>
						<a class="btn_goto_mail" title="이메일" href="mailto:{{email}}"> <i class="fn fn-mail1"></i> </a>
                        <a href="#" class="btn_goto_path" title="길찾기"> <i class="fn fn-path-find1"></i> </a>
                        <a href="#" class="fn fn-share1 naver-splugin btn_goto_share" title="공유하기"></a>
                    </div>
                </div>
                <div class="section_store_details">
                    <!-- [D] 펼쳐보기 클릭 시 store_details에 close3 제거 -->
                    <div class="store_details close3">
                        <p class="dsc">
				{{description}} <br>
				관람시간 :{{observationTime}} <br>
				장소 :{{placeName}}&nbsp&nbsp{{placeLot}}&nbsp&nbsp{{placeStreet}}
                        </p>
                    </div>
                    <!-- [D] 토글 상황에 따라 bk_more에 display:none 추가 -->
                    <a href="#" class="bk_more _open"> <span class="bk_more_txt">펼쳐보기</span> <i class="fn fn-down2"></i> </a>
                    <a href="#" class="bk_more _close" style="display: none;"> <span class="bk_more_txt">접기</span> <i class="fn fn-up2"></i> </a>
                </div>
                <div class="section_event">
                    <div class="event_info_box">
                        <div class="event_info_tit">
                            <h4 class="in_tit"> <i class="spr_book ico_evt"></i> <span>이벤트 정보</span> </h4>
                        </div>
                        <div class="event_info">
                            <div class="in_dsc">{{event}}<br>R석 50%, S석 60% 할인</div>
                        </div>
                    </div>
                </div>
</script>
<script id="comment-template" type="text/x-handlebars-template">
 <li class="list_item">
	<div>
		<div class="review_area">
			<div class="thumb_area">
				<a href="#" class="thumb" title="이미지 크게 보기"> 
					<img width="90" height="90" class="img_vertical_top" src="http://naverbooking.phinf.naver.net/20170306_3/1488772023601A4195_JPEG/image.jpg?type=f300_300" alt="리뷰이미지"> 
				</a> 
				<span class="img_count">1</span>
			</div>
			<h4 class="resoc_name">{{title}}</h4>
			<p class="review">{{comment}}</p>
		</div>
		<div class="info_area">
			<div class="review_info"> 
				<span class="grade">{{score}}</span> 
				<span class="name">{{userId}}</span> 
				<span class="date">2017.3.5. 방문</span>
			</div>
		</div>
	</div>
</li>
</script>
</body>
</html>
