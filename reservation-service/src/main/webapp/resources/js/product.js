function get_promotion_list(callback) {
	$.ajax({
		type : 'get',
		url : '/product/promotion',
		dataType : 'json',
		success : function(result) {
			callback(result);
		}
	});
}

function list_promotion() {
	get_promotion_list(draw_promotion);
}
function draw_promotion(productVO) {
	var str = '';
	for (var index in productVO) {
		str += '<li class="item" style="background-image:' + 
				'url(resources/img/black.png); width: 338px;>' +
        		'<a href="#"> <span class="img_btm_border"></span> <span class="img_right_border"></span> <span class="img_bg_gra"></span>'+
            	'<div class="event_txt">'+
                '<h4 class="event_txt_tit">'+ productVO[index].name +'</h4>'+
                '<p class="event_txt_adr">'+ productVO[index].event +'</p>'+
                '<p class="event_txt_dsc">'+ productVO[index].event +'</p>'+
                '</div>'+
            	'</a>'+
        		'</li>';
	}
	$('.visual_img').append(str);
}

/* 상품 */
function draw_product(productDTO) {
	var str = '';
	for ( var index in productDTO) {
		/* 사진도 가져 와야함 */    			
		str = '<li class="item">\
					<a href="#" class="item_book">\
					<div class="item_preview">\
						<img alt="' + productDTO[index].name + '"class="img_thumb"\
						src="resources/img/temp_product/' + productDTO[index].id+ '.png">\
						<span class="img_border"></span>\
					</div>\
					<div class="event_txt">\
						<h4 class="event_txt_tit"> <span>' + productDTO[index].event + '</span>\
						<small class="sm">'+ 
						productDTO[index].placeName + " " + productDTO[index].placeLot + " " + productDTO[index].placeStreet +
						'</small> </h4>\
						<p class="event_txt_dsc">' + productDTO[index].description + '</p>\
					</div>\
					</a>\
				</li>';

		if (index % 2 == 0) {
			$('#productLeftList').append(str);
		} else {
			$('#productRightList').append(str);
		}
		str = '';
	}
}

function get_product_list(callback) {
	$.ajax({
		type : 'get',
		url : '/product/'+ page,
		success : function(result) {
			callback(result);
		}
	});
}

page = 1;
function list_product() {
	get_product_list(draw_product);
}

/* 카테고리별 상품 리스트*/
function product_list_by_category(id) {
get_product_list_by_category(id, draw_product);
}

function get_product_list_by_category(id, callback) {
$.ajax({
	type : 'get',
	url : '/product/categories/' + id +'/' + page,
	dataType : 'json',
	success : function(result) {
		callback(result);
	}
});
}
