$(document).ready(function(){

	$('.profile_o_button').click(function(){
		var tid=$(this).attr('tag_id');
		$('#tag_feed').load(__SITE__+"/activity_user_actions?part=true&tag_id="+tid,function(){

		});
		$('.profile_o_button_clicked').attr('class','profile_o_button');
		$(this).attr('class','profile_o_button_clicked');
	});
	$('.profile_o_button:first').click();
});
