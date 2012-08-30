$(document).ready(function(){
	//activity_comment _button
		$('.comment_button').each(function(){
			$(this).toggle(function(){
				
				var activity_id=$(this).attr('activity_id');
				var aid=$(this).attr('aid');

				loadcomments(activity_id,aid)

			},function(){
				var data={};
				data['activity_id']=$(this).attr('activity_id');
				var aid=$(this).attr('aid');
				$('.activity_comment_main[aid='+aid+']').slideUp(500);
				//$('.activity_comment_main[aid='+aid+']').empty();
				$('.activity_comment_main[aid='+aid+']').attr('stat','close');
			});
		});	
});
function loadcomments(activity_id,aid){
			if (aid)
			{
				$('.activity_comment_main[aid='+aid+']').attr('stat','open');
				$('.activity_comment_main[aid='+aid+']').load(__SITE__+"/activity_comments?part=true&activity_id="+activity_id,function(json){
					$(this).slideUp(0);
					$(this).slideDown(400);
				});
			}
			else{
				$('.activity_comment_main[stat=open][activity_id='+activity_id+']').load(__SITE__+"/activity_comments?part=true&activity_id="+activity_id,function(json){
					$(this).slideUp(0);
					$(this).slideDown(400);
				});
			}
}
