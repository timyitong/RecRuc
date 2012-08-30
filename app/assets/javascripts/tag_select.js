	//tag_select_auto_complete
$(document).ready(function(){
	//tag_select_auto_complete

	$(function(){
		var tags =[];
		$('#tag_select_input').autocomplete({
			source: __SITE__+"/tags/search",
			select: function (event, ui){
				var w=$('#tag_select_input').css('width');

				//add the new tag box
			
				$('#tag_select_input').before("<a class='tag_post' tag_id='"+ui.item.id+"'>"+ui.item.value+'<div class="tag_post_close" tag_id="'+ui.item.id+'" ></div></a>');
				
				//definde the close tag function
				$('.tag_post_close:last').click(function (){

					var tag_id=$(this).attr('tag_id');
					var input_w=$('#tag_select_input').css('width');


					var tag_w=$(".tag_post[tag_id="+tag_id+"]").css('width');
					    tag_w=tag_w.substring(0,tag_w.length-2);



					var old_w=(input_w.substring(0,input_w.length-2)-0)+(tag_w-0)+24;
					
					$(".tag_post[tag_id="+tag_id+"]:last").remove();
					$("input[name=tag[]][value="+tag_id+"]:last").remove()
					$('#tag_select_input').css('width',old_w+'px');
					





				});

				//calculate the new input length
				var tag_w=$('.tag_post:last').css('width');
				tag_w=tag_w.substring(0,tag_w.length-2);

			    var new_w=w.substring(0,w.length-2)-tag_w-24;

				$('#tag_select_input').css('width',new_w+'px');
				$('#tag_select_input').after("<input type='hidden' name='tag[]' value='"+ui.item.id+"' />");
				

			},
			focus: function(){
				return false;
			},
			close: function(event, ui) {
				$('#tag_select_input').val(null);
			}
		}).data( "autocomplete" )._renderItem = function( ul, item ) {  // Here defines the layout of autocomplete
			return $( "<li></li>" )
				.data( "item.autocomplete", item )
				.append( "<a><span style='float:left;width:auto;'>" + item.label + "</span><span style='float:left;color:#b4b4b4;margin-left:15px;font-size:12pt;'>"+" x "+item.refnum+"</span><br/><span style='float:left;margin-left:20px;font-size:6pt;'>"+ item.desc+"</span></a>")
				.appendTo( ul );
		};

	});


	//CREATE new tag:
	$('.tag_new_box').hide();
	$('.add_new_tag').click(function(){
		$('.tag_new_box').show();
	});

	$('#nt_cancel').click(function(){
		$('.tag_new_box').hide();
	});
	$('#nt_create').click(function (){
		var tag={};
		tag['name']=$('#nt_text').val();
		$.getJSON(__SITE__+'/tags/quickcreate',tag,function(json){

			$('.tag_new_box').hide();

			if (json!='null') {
				var w=$('#tag_select_input').css('width');


				$('#tag_select_input').before("<a class='tag_post' tag_id='"+json.id+"'>"+json.name+'<div class="tag_post_close" tag_id="'+json.id+'" ></div></a>');

				//definde the close tag function
				$('.tag_post_close:last').click(function (){

					var tag_id=$(this).attr('tag_id');
					var input_w=$('#tag_select_input').css('width');


					var tag_w=$(".tag_post[tag_id="+tag_id+"]").css('width');
					    tag_w=tag_w.substring(0,tag_w.length-2);

					var old_w=(input_w.substring(0,input_w.length-2)-0)+(tag_w-0)+24;
					
					$(".tag_post[tag_id="+tag_id+"]:last").remove();
					$("input[name=tag[]][value="+tag_id+"]:last").remove()
					$('#tag_select_input').css('width',old_w+'px');
				});



				//calculate the new input length
				var tag_w=$('.tag_post:last').css('width');
				tag_w=tag_w.substring(0,tag_w.length-2);

			    var new_w=w.substring(0,w.length-2)-tag_w-24;

				$('#tag_select_input').css('width',new_w+'px');
				$('#tag_select_input').after("<input type='hidden' name='tag[]' value='"+json.id+"' />");



			}


		})
	});



});



     

