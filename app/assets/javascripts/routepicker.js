

	function load_locations_entire(id){
		$('#routepicker_box').load(__SITE__+"/locations/routepicker?id="+id,function(){
		});
	}
	function load_locations_ini(id){
		$('#routepicker_box').load(__SITE__+"/locations/routepicker?id="+id,function(){
			$('#rp_switch').click();
		});
	}

    var stat='open';
	function box_switch(){
		if (stat=='open')
		{
			$('#rp_main').hide();
			stat='close';
		}
		else{
			$('#rp_main').show();
			stat='open';

		}
	}


/*
	function load_locations(id){
		$('#rp_cur').html($('#location_namecard_'+id).html());
		$('#rp_cur').attr('location_id',id);
		
		$('#rp_locations').empty();
		var url=__SITE__+'/locations';
		if (id!=null) url=url+'?id='+id;
		var data={};
		//load locations index
		$.getJSON(url,data,function (json){
			var i=0;
			
			while (i<json.length)
			{
				var html='<a id="location_namecard_'+json[i].id+'" class="location_namecard" href="javascript:void(0)" onclick="load_locations('+json[i].id+')">'+json[i].name+'</a>';
				$('#rp_locations').append(html);
				i++;
			}

		});
		
		//load location route
		var url2=__SITE__+'/locations/'+id;
		var data2={};
		$.getJSON(url2,data2,function (json){

		
		    var rs=new Array();
		    rs=json.uptree.match(/\d+/g);
		    $('#rp_route').html("	<span>路径：</span>");
		    //$('#rp_route').append('::'+rs.length+'::');
			if (rs!=null){
			   var i=0;
			   while(i<rs.length){
			   	$('#rp_route').append('<img alt="Arrow1" src="/assets/arrow/arrow1.gif"><a  id="location_namecard_'+rs[i]+'" href="javascript:void(0);" onclick="load_locations('+rs[i]+');"></a>');
				
			   	$.getJSON(__SITE__+'/locations/'+rs[i],{},function(json){
			   		$('#location_namecard_'+json.id).attr('class','location_namecard');
			   		$('#location_namecard_'+json.id).text(json.name);
			   		//document.write(json.name);
			   	});
			   	i++;
			   }
			   
			}
			

			
			
		});
		
	}*/



