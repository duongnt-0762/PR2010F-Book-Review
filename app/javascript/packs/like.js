// Xử lý like hoặc unlike comment
$(document).ready(function(){
	$(".btn_like_or_unlike").click(function(){
		let comment_id = parseInt($(this).parent().children()[0].value);
		let user_id = parseInt($(this).parent().children()[1].value);
		let total_like = parseInt($(this).parent().children()[2].value);
		let text_btn = typeof($(this).parent().children()[5].innerHTML);
		if($(this).parent().children()[5].innerHTML == "Unlike"){
			$(this).parent().children()[5].innerHTML = "Like";
		}else if($(this).parent().children()[5].innerHTML == "Like"){
			$(this).parent().children()[5].innerHTML = "Unlike";
		}
	});
});