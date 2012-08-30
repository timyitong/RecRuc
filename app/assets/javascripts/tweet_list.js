$(function(){

	//$('.comment_feed').slideUp(0);
    

	$('.tweet_comment_button').toggle(function(){
	  
	  var tid=$(this).attr('tweet_id');
	  $('.comment_feed[tweet_id='+tid+']').attr('stat','open');
	  $('.comment_feed[tweet_id='+tid+']').load(__SITE__+"/comments?partial=true&tweet_id="+tid,function(){
	  			 $(this).slideUp(0);$(this).slideDown(400);
	  });


	},function(){
		var tid=$(this).attr('tweet_id');
		$('.comment_feed[tweet_id='+tid+']').slideUp(500);
	});

});

function loadcomments_tweet(tid){
	  $('.comment_feed[tweet_id='+tid+']').load(__SITE__+"/comments?partial=true&tweet_id="+tid,function(){

	  });
}

