$(document).ready(function(){
	$('.profile_o_button').click(function(){
		var uid=$(this).attr('uid');
		var at=$(this).attr('action_type');
		//document.write(__SITE__+"/activity_user_actions?part=true&user_id="+uid+"&action_type="+at);
		$('#user_feed_box').load(__SITE__+"/activity_user_actions?part=true&user_id="+uid+"&action_type="+at,function(){
		});
		$('.profile_o_button_clicked[action_type!='+at+']').attr('class','profile_o_button');
		$('.profile_o_button[action_type='+at+']').attr('class','profile_o_button_clicked');
	});
	$('.profile_o_button:first').click();
});

