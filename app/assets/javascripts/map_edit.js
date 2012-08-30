
//开始加载




    var up_id=0;
    var cur_location={};
    var points;
    var newpointnum=0;
    function newpoint(){
    	$('#map_box').append("<div onclick='show_location_info(this,-1);' class='point_button' newpoint='"+newpointnum+"'>#new_box"+newpointnum+"</div>");
    	var obj=$("[newpoint='"+newpointnum+"']").click();
    	
    	obj.resizable();
    	obj.draggable();
    	
    	newpointnum++;
    }
    function saveall (){
    	$('[pid]').each(function(){
    		var id=$(this).attr('pid')
    		var head='#point_'+id+'_';
    		$(head+'width').val($(this).css('width').substring(0,$(this).css('width').length-2));
    		//document.write($(this).css('width').substring(0,$(this).css('width').length-2));
    		$(head+'height').val($(this).css('height').substring(0,$(this).css('height').length-2));
    		$(head+'cox').val($(this).css('left').substring(0,$(this).css('left').length-2));
    		$(head+'coy').val($(this).css('top').substring(0,$(this).css('top').length-2));
    	});
    	$('[newpoint]').each(function(){
    		var id=$(this).attr('newpoint');
    		var head='#newpoint_'+id+'_';
    		
    		//$('#points_form').append('<input id="'+head+'width" name="newpoint[][width]" type="hidden"/>');
    		//$('#points_form').append('<input id="'+head+'height" name="newpoint[][height]" type="hidden"/>');
    		//$('#points_form').append('<input id="'+head+'cox" name="newpoint[][height]" type="hidden"/>');
    		//$('#points_form').append('<input id="'+head+'coy" name="newpoint[][height]" type="hidden"/>');
    		
    		//赋值：
    		$(head+'width').val($(this).css('width').substring(0,$(this).css('width').length-2));
    		//document.write($(this).css('width').substring(0,$(this).css('width').length-2));
    		$(head+'height').val($(this).css('height').substring(0,$(this).css('height').length-2));
    		$(head+'cox').val($(this).css('left').substring(0,$(this).css('left').length-2));
    		$(head+'coy').val($(this).css('top').substring(0,$(this).css('top').length-2));
    	});
		$('#points_form').submit();
    }
//图片部分
	function load_points(id){
	  var url=__SITE__+'/location_map_points';
	  data={};
	  if (id!=null) data['location_id']=id;
	  $('#map_box').empty();
	  $.getJSON(url,data,function(json){
	    var i=0;
	    points=json;
	    while (i<json.length){
	    	var html="<div pid='"+json[i].id+"'  onclick='show_location_info(this,"+json[i].target_id+");' class='point_button' style='width:"+json[i].width+"px;height:"+json[i].height+"px;left:"+json[i].cox+"px;top:"+json[i].coy+"px;'>#box"+json[i].id+"</div>";
	  		$('#map_box').append(html);
	  		
	  		i++;
	  	}
	  	$('.point_button').resizable();
	  	$('.point_button').draggable();
	  });	
	}
//文字部分
	function getup(){
	    if (cur_id!=1) load_locations(up_id);
	}
	function load_locations(id){
		$('#info_index').empty();
		var url=__SITE__+'/locations';
		if (id!=null) url=url+'?id='+id;
		var data={};
		//load locations index
		$.getJSON(url,data,function (json){
			var i=0;
			
			while (i<json.length)
			{
				var html='<div><a  >'+json[i].name+'</a><a>关联</a></div>';
				$('#info_index').append(html);
				i++;
			}
		    up_id=cur_id;
		    cur_id=id;
		});
		
		//load location route
		var url2=__SITE__+'/locations/'+id;
		var data2={};
		$.getJSON(url2,data2,function (json){
			cur_location['name']=json.name;
			cur_location['uptree']=json.uptree;
		
		    var rs=new Array();
		    rs=json.uptree.match(/\d+/g);
		    $('.routeline').empty();
		    //$('.routeline').append('::'+rs.length+'::');
			if (rs!=null){
			   var i=0;
			   while(i<rs.length){
			   	$('.routeline').append('>><a id="route_'+rs[i]+'" ></a>');
				
			   	$.getJSON(__SITE__+'/locations/'+rs[i],{},function(json){
			   		$('#route_'+json.id).text(json.name);
			   		//document.write(json.name);
			   	});
			   	i++;
			   }
			}
			$('.routeline').append('>>'+'<a id="route_x">'+json.name+'</a>');
			
			
		});
		
	}
	

	
	function connectLocation(){
		
	}

