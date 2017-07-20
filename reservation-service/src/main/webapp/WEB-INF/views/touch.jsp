<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>Mask, Layer popup</title>
    <style>
        .setDiv {
            padding-top: 300px;
            text-align: center;
        }
        .mask {
            position:absolute;
            left:0;
            top:0;
            z-index:10;
            background-color:#000;
            display:none;
        }
        .window {
            display: none;
            background-color: #ffffff;
            height: 500px;
            width: 80%;
            z-index:10;
        }
    </style>
</head>
<body>
<div>
	<ul>
		<li class="list_item">
			<div>
				<div class="review_area">
					<div class="thumb_area">
						<a href="#" class="thumb" title="이미지 크게 보기"> 
							<img width="90" height="90" class="img_vertical_top" src="http://naverbooking.phinf.naver.net/20170306_3/1488772023601A4195_JPEG/image.jpg?type=f300_300" alt="리뷰이미지"> 
						</a> 
						  <div class="mask"></div>
					    <div class="window">
					        <input type="button" class="close" value="X"/>
					        <img width="90" height="90" class="img_vertical_top" src="http://naverbooking.phinf.naver.net/20170306_3/1488772023601A4195_JPEG/image.jpg?type=f300_300" alt="리뷰이미지">
					        
					    </div>
						<span class="img_count">1</span>
					</div>
					<h4 class="resoc_name">{{title}}</h4>
					<p class="review">{{comment}}</p>
				</div>
			</div>
		</li>
	</ul>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
    function wrapWindowByMask(){
        // 화면의 높이와 너비를 변수로 만듭니다.
        var maskHeight = $(document).height();
        var maskWidth = $(window).width();
 
        // 마스크의 높이와 너비를 화면의 높이와 너비 변수로 설정합니다.
        $('.mask').css({'width':maskWidth,'height':maskHeight});
 
        // fade 애니메이션 : 1초 동안 검게 됐다가 80%의 불투명으로 변합니다.
        $('.mask').fadeIn(1000);
        $('.mask').fadeTo("slow",0.8);
 
        // 레이어 팝업을 가운데로 띄우기 위해 화면의 높이와 너비의 가운데 값과 스크롤 값을 더하여 변수로 만듭니다.
        var left = ( $(window).scrollLeft() + ( $(window).width() - $('.window').width()) / 2 );
        var top = ( $(window).scrollTop() + ( $(window).height() - $('.window').height()) / 2 );
 
        // css 스타일을 변경합니다.
        $('.window').css({'left':left,'top':top, 'position':'absolute'});
 
        // 레이어 팝업을 띄웁니다.
        $('.window').show();
    }
 
    $(document).ready(function(){
        // showMask를 클릭시 작동하며 검은 마스크 배경과 레이어 팝업을 띄웁니다.
        $(".thumb").click(function(e){
            // preventDefault는 href의 링크 기본 행동을 막는 기능입니다.
            e.preventDefault();
            wrapWindowByMask();
        });
 
        // 닫기(close)를 눌렀을 때 작동합니다.
        $('.window .close').click(function (e) {
            e.preventDefault();
            $('.mask, .window').hide();
        });
 
        // 뒤 검은 마스크를 클릭시에도 모두 제거하도록 처리합니다.
        $('.mask').click(function () {
            $(this).hide();
            $('.window').hide();
        });
    });
</script>
</body>
</html>



