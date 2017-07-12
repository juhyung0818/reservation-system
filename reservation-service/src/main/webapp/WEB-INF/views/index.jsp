<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Category</title>
</head>

<body>

	<h1>Categories</h1>

	<div id = 'addReply'>
		<form method="post" action="/category/create">
			<div>
				<label for="name">NAME : </label>
				<input type="text" name="name"><br>
			</div>
			<div>
				<input type="submit" value="확인">
			</div>
		</form>
	</div>

	<div id = 'listReply'>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>MODIFY</th>
				<th>REMOVE</th>
			</tr>
	
			<c:forEach items="${categories}" var="categoryVO">
				<tr class="category" id="${categoryVO.id}">
					<td>${categoryVO.id}</td>
					<td class ='old-name'>${categoryVO.name}</td>
					<td>
						<div class="update">
							<div>
								<input type="text" class="new-name" placeholder="NEW NAME"><br>
							</div>
							<div class="button">
								<button value="수정" class="modify">MODIFY</button>
							</div>
						</div>
					</td>
					<td>
						<div class="button">
							<button value="삭제" class="destory"> REMOVE </button>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script src="resources/js/category.js"></script>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"> </script>
</body>
</html>

<script>
$(function(){
	/* 삭제부분 */
	function remove_category_view(view, id) {
		view.remove();
	}

	function remove_category(view, id, callback) { 
		$.ajax({
			type:'delete',
			url:'/rest/category/' + id,
			success:function() {
				callback(view, id);
			}
		});
	}
	$(document).on("click", ".destory", function(event){
		var view = $(event.target).closest('.category');
		var id = view.attr('id');
		remove_category(view, id, remove_category_view);
	});
	
	
	/* 수정 부분 */
	function modify_category_view(view, newName, id) {
		view.find('.old-name').html(newName);
		view.find('.new-name').val("");
	}

	function modify_category(view, id, name, callback) { 
		var data =JSON.stringify({
				id : id,
				name : name
		});
		$.ajax({
			type:'put',
			url:'/rest/category/' + id,
			contentType: "application/json; charset=utf-8",
			data:data,
			success:function() {
				 modify_category_view(view, name);
			}
		});
	}
	$(document).on("click", ".modify", function(event){
		var view = $(event.target).closest('.category');
		var newName = view.find('.new-name').val();
		var id = view.attr('id');
		modify_category(view, id, newName);
	});
	
});
 </script>