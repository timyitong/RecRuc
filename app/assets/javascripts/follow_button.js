$(document).ready(function(){
	$('[followbutton]').click(function(){
		var data={};
		var t=$(this).attr('type');
		data[t]=$(this).attr('follow_id');



		if ($(this).attr('followbutton')=='follow')
		{
			$.getJSON(__SITE__+'/public/addfollow',data,function(){

			});
			$(this).attr('class','follow_button_cancel');
			$(this).html('取消关注');
			$(this).attr('followbutton','cancel');
		}else{
			$.getJSON(__SITE__+'/public/cancelfollow',data,function(){

			});
			$(this).attr('class','follow_button');
			$(this).html('关注');
			$(this).attr('followbutton','follow');
		}
	});
});