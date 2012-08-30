
$(function(){

	$('#act_publish').fadeOut(0);
	$('#tweet_publish').fadeOut(0);

//  装载活动
	load_activities('#home_content',function(){
		$('.collection_button:first').click();
	});


	//load_tweets('#home_content');
   $('#hot_list').load(__SITE__+'/tags/hot_list');
   $('#ongoing_list').load(__SITE__+'/activities/ongoing_list');
   $('#user_profile').load(__SITE__+'/users/'+__UID__+'/profile');

   $('[home_switch]').toggle(function(){
   	//list的切换
   	$('#home_content').fadeOut();
   	load_activities('#home_content',function(){
   		$('.collection_button').show();
   		$('.collection_button_clicked').show();
		$('.collection_button:first').click();
	},function(){
		$('#home_content').fadeIn();
	});



   	//切换字
   	$(this).html('活动模式');
   	$(this).attr('class','mode_switch_act');

   	$('#act_publish').fadeOut(0);
	$('#tweet_publish').fadeOut(0);
   },function(){
   		//list切换
   	    $('#home_content').fadeOut();
		load_tweets('#home_content',function(){
			$('#home_content').fadeIn();
		});

   	//切换字
   	$(this).html('微博模式');
   	$(this).attr('class','mode_switch_tweet');
   	$('#act_publish').fadeOut(0);
	$('#tweet_publish').fadeOut(0);
   });



   $('#st_button').click(function(){
   	 $('#act_publish').fadeOut(0,function(){
   	 	$('#tweet_publish').fadeIn();
   	 });
   });
   $('#sa_button').click(function(){
   	 $('#tweet_publish').fadeOut(0,function(){
   	 	   	 $('#act_publish').fadeIn();
   	  });
   });
});
function load_tweets(tag,callback){
	$('.collection_button').hide();
	$('.collection_button_clicked').hide();
	$(tag).load(__SITE__+'/tweets/list?part=true&index=user',function(){
		if (callback!=undefined){
			callback();
		}

	});
}


function load_activities(tag,callback,loadback){
	$('.collection_button').click(function(){
		var cid=$(this).attr('collection_id');

		//button class switch::
		$('.collection_button_clicked').each(function(){
			if ($(this).attr('collection_id')==cid){
				$(this).attr('class','collection_button_clicked');
			}else{
				$(this).attr('class','collection_button');
			}
		});
		$('.collection_button').each(function(){
			if ($(this).attr('collection_id')==cid){
				$(this).attr('class','collection_button_clicked');
			}else{
				$(this).attr('class','collection_button');
			}
		});


		$(tag).load(__SITE__+'/activity_user_actions?part=true&index='+cid,function(){
			if (loadback){
				loadback();
			}
		});
	
	});

	if (callback!=undefined){
		callback();
	}
}