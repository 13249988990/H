function validate($columns,event){
	$columns.each(function(index){
		var max=parseInt($(this).attr('max'));
		if(max==0){
			max=1000
		}
		//alert(100)
		var min=parseInt($(this).attr('min'));
		var value=parseInt($(this).val());
		//alert(value)
		//alert(min);
		if($(this).val()==''){
			$(this).focus();
			$(this).css({'background-color':'gray'});
			event.preventDefault();
			return false;
		}else{
			$(this).css({'background-color':'white'});
			if(min<=value&&value<=max){
				$(this).css({'background-color':'white'});
			}else{
				$(this).focus();
				$(this).css({'background-color':'gray'});
				event.preventDefault();
				return false;
				
			}
		}
		
	});
}

