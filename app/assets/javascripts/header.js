

var __SITE__="http://www.recruc.com";
//var __SITE__="http://localhost";
$(document).ready(function(){




 //scroll UP BUTTON
  $('#backtop_button').click(function(){
  		$(window).scrollTo(0,400);
     // getup($(window).scrollTop());

  });
  $('.scroll_to_top').hide();
  $(window).scroll(function(){
  	var bot=50;

  	var h=500;


    //WHEN show and close SCROLL button:
  	if ($(window).scrollTop()>=h){
  		 $('.scroll_to_top').show();
  	}
  	if ($(window).scrollTop()<h){
  		 $('.scroll_to_top').hide();
  	}

  	//WHEN to load new data:
  	if ((bot + $(window).scrollTop()) >= ($(document).height() - $(window).height())) {

         
    }

  });


  
  
  //auto match @

  /*
    var key1='0';
    var stat='close';
    var head=0;
    var tear=0;
    $('#tweet_content').keydown(function(e){
      if (key1=='16' && e.which=='50')
      {
        document.write('shit');
      }
      if (key1=='16' && e.which=='51')
      {
        document.write('shit2');
      }
      if (e.which=='8'){ 
        head=head-1;
      }else{
        head=head+1;
      }
      key1=e.which;
    });

    function popup(){

    }
  */



  //retweet

  //follow someone
  $('#follow_select_form').bind('ajax:success', function(evt,data,status,xhr) {
    $('#follow').hide();
    $('#follow').after("<a href='/user_group_follows/cancel_follow?user_id="+xhr.responseText+"' class='user_follow_cancel'>cancel_follow</a>");
    }).bind("ajax:error", function(e,xhr){
       document.write(xhr.responseText);
 	});


  //point delete
  $('.point_delete').bind('ajax:success',function(evt,data,status,xhr){
    $('.point_delete').hide();
  });

  
  //show certain group
 /* $('.user_group').bind('ajax:success',function (evt,data,status,xhr){
  	var json=JSON.parse(xhr.responseText);
  	var i=0;
  	$('#tweets_box').empty();
  	while (i<json.length)
  	{
  	$('#tweets_box').append("<div class='tweet_line'>"+json[i].content+'</div>');
  	i=i+1;
  	}
  }).bind("ajax:error", function(e,xhr){
    document.write(xhr.responseText);
  });
  */
  
  //follow button
  	$('#follow').click(function(){
		$("#follow_select_form").dialog("open");
	});
	$('#follow_select_form').dialog({
		autoOpen: false,
		height: 300,
		width: 350,
		modal: true,
		buttons:{
			"Follow": function(){
				$(this).submit();
				$(this).dialog("close");
			},
			Cancel: function(){
				$(this).dialog("close");
			}
		}
	});
	
	
	//   users/home.html  auto_load_group-->all
	$('#user_group1').trigger("click");
	
	






     $('#top_add_bar').hide();

     var timer;
     function showbar(){
       $('#top_add_bar').show();
     }
     $('#top_add').mouseenter(function(){
      //showbar();
      // document.write('shit');
        timer=setTimeout(showbar,500);
     });
     $('#top_add').mouseleave(function(){
        clearTimeout(timer);
        $('#top_add_bar').hide();
     });




//SEARCH AUTOComplete
    var availableTags = [];
    $('#search_input').autocomplete({
      source: __SITE__+"/public/search_autocomplete",
      select:function (event, ui){

        window.open(__SITE__+ui.item.href);
        //$(tagid).val('123');

      },
      focus: function(){
        return false;
      },
      close: function(event, ui) {
      }

    }).data( "autocomplete" )._renderItem = function( ul, item ) {  // Here defines the layout of autocomplete
      return $( "<li></li>" )
        .data( "item.autocomplete", item )
        .append( "<a style='cursor:pointer;' href='"+__SITE__+item.href+"' ><span style='float:left;width:auto;'>" + item.label + "</span><br/></a>")
        .appendTo( ul );
    };
//Search Autocomplete END

});
