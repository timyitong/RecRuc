
/**  
* 取得某元素在页面中相对页面左上顶点的位置  
*/  
 
function location_pick_box(tag,callback,options)
{
	var head=$(tag).attr('id');
	var lid=$(tag).attr('location_id');

	//$("<div class='lpb_main' id='"+head+"_lpb_main'></div>").appendTo($(tag));
	var data={};
	data['id']=lid;
	$.getJSON(__SITE__+"/locations/pick",data,function(json){
		$(tag).empty();
		$("<div></div>").attr('class','lpb_title').attr('id',tag.substring(1,tag.length)+'_title').html(json.name).appendTo($(tag));
		$(tag).append("<input type='hidden' name='location_id' value='"+lid+"'/>");
		$("<div></div>").attr('class','lpb_main').attr('id',tag.substring(1,tag.length)+'_main').attr('belong_to',tag).appendTo($(tag));
		var obj=$("[belong_to="+tag+"]");  //obj为悬浮下拉框

		

		
		var i=0;
		$("<div></div>").html('路径:').attr('class','lpb_url_head').appendTo(obj);
		while(i<json.parent.length)
		{
			$("<div></div>").attr('class','lpb_url_arrow').appendTo(obj);
			$("<a  href='javascript:void(0);'></a>")
				.attr('class','lpb_url_item')
				.attr('location_id',json.parent[i].id)
				.html(json.parent[i].name)
				.click(function(){switch_location(tag,$(this),callback,options)})
				.appendTo(obj);
			i++;
		}
		$("<div></div>").attr('class','lpb_url_arrow').appendTo(obj);
		$("<span></span>").html(json.name).attr('class','lpb_url_tear').appendTo(obj);
		obj.append("<br/>");


		i=0;
		if (json.child.length==0)
		{
			$("<div></div>").html("无").attr('class','lpb_child_none').appendTo(obj);
			$("<div></div>").html("&nbsp;").attr('class','lpb_child_none').appendTo(obj);
		}
		while(i<json.child.length)
		{
			$("<a  href='javascript:void(0);'></a>")
				.attr('class','lpb_child_item')
				.attr('location_id',json.child[i].id)
				.html(json.child[i].name)
				.click(function(){switch_location(tag,$(this),callback,options);})
				.appendTo(obj);
			i++;
		}
		if ((i%2)!=0 && i!=0)
		{
			$("<div></div>").html("&nbsp;").attr('class','lpb_child_none').appendTo(obj);
		}
	
		if (callback){callback();}
	});
}
function switch_location(tag,obj,callback,options)
{
	$(tag).attr('location_id',$(obj).attr('location_id'));
	location_pick_box(tag,callback,options);
}

