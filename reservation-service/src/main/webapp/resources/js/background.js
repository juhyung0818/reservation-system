	/*scroll */
	//더 보기를 하였을 때 page를 1증가 시키고 해당 category의 product를 10개 더 불러온다.
	function click_product(){
		var id = $('a.anchor.active').closest(".item").data('category');
		page++;
		if(id == 0){
			list_product();
		}else{
	 		product_list_by_category(id);
		}
	}
	
	//promotion갯수 받아와서 사용
	//numberOfImg = $('#countSaleProduct').html().slice(0,-2);

	var numberOfImg = 3-1;
	var index = 0;
	var isMove = 0;
	
	function slideImg() {
   		intervalId = setInterval(checkImg, 2000);
	}
	function delayImg() {
		clearInterval(slideImg);
		timeoutId = setTimeout(slideImg, 4000);
	}
	slideImg();

	function checkImg(){
			if(isMove == 0){
   			isMove = 1;
   			index++;
				if(numberOfImg < index){
					index = 0;
					$(".visual_img").css("left", 0);
				}
			$(".visual_img").animate({"left": "-=338px"}, "slow" );
			}
			isMove = 0;
    }
	$(".visual_img").css("left", "-338px");
    
	$(".btn_pre_e").click(function() {
		if(isMove == 0){
			isMove = 1;
			index--;
       		if(index < 0){
   				index = numberOfImg;
   				$(".visual_img").css("left", -338*(numberOfImg+2));
   			}
       		$(".visual_img").animate({"left": "+=338px"}, "slow", function(){
	       		clearInterval(intervalId);
	       		delayImg();
	       		isMove = 0;
       		});
		}
    });
    
	$(".btn_nxt_e").click(function(){
		if(isMove == 0){
		isMove = 1;
		index++;
		if(numberOfImg < index){
			index = 0;
			$(".visual_img").css("left", 0);
		}
		$(".visual_img").animate({"left": "-=338px"}, "slow", function(){
			clearInterval(intervalId);
			delayImg();
			isMove = 0;
		});
		}
	});

	/* 카운트 */
	function get_count() {
		$.ajax({
			type:'get',
			url:'/product/count',
			dataType:'json',
			success:function(result) {
				result += "개 ";
				$('#countSaleProduct').html(result);
				numberOfImg = $('#countSaleProduct').html().slice(0,-2);
			}
		});
	}

