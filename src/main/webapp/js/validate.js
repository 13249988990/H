function validate($columns,event){
	$columns.each(function(index){
		var reg = new RegExp($(this).attr("data-reg"));
		if($(this).val()==null || $(this).val()==""){
			$(this).focus();
			event.preventDefault();
			return false;
		}
		if(!reg.test($(this).val())){
			var columnName = $(this).parent().prev().text();
			alert(columnName + " --條碼有誤 "+$(this).val()+"=="+reg);
			$(this).focus().val("");
			event.preventDefault();
			return false;
		}
	});
}

