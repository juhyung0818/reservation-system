function draw_category(categoryVO) {
	var str = '<li class="item" data-category="0"> <a class="anchor active"> <span>전체</span> </a> </li>';
	for ( var index in categoryVO) {
		str += '<li class="item" data-category="' + categoryVO[index].id + '">'
				+ '<a class="anchor"> <span>' + categoryVO[index].name
				+ '</span> </a>' + '</li>';
	}
	$('#categoryList').append(str);
}

function get_category_list(callback) {
	$.ajax({
		type : 'get',
		url : '/category',
		dataType : 'json',
		success : function(result) {
			callback(result);
		}
	});
}

function list_category() {
	get_category_list(draw_category);
}

function remove_category_view(view, id) {
	view.remove();
}

function remove_category(view, id, callback) { 
	$.ajax({
		type:'delete',
		url:'/category' + id,
		success:function() {
			callback(view, id);
		}
	});
}


	 