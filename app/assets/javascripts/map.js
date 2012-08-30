function at_here(location_id){
    var url=__SITE__+'/locations/at_here?location_id='+location_id;
    $.getJSON(url,function(){
    });
}
function load_map(tag,id,callback,options)
{
	 var url=__SITE__+'/location_map_points';
	  data={};
	  if (id!=null) data['location_id']=id;
	  //$(tag).empty();
	  $.getJSON(url,data,function(json){
	  	$('<img/>').attr('src',json.mapurl).attr('lid',json.lid).attr('up_lid',json.up_lid).css('float','left').appendTo(tag);
	    var i=0;
	    points=json.points;
	    while (i<points.length){
            var title='';
            if (options && options.location_name=='true') title=points[i].point_name;
	    	var html="<div pid='"+points[i].id+"'  onclick='show_location(this,"+points[i].target_id+");' style='width:"+points[i].width+"px;height:"+points[i].height+"px;left:"+points[i].cox+"px;top:"+points[i].coy+"px;'></div>";
	  		$(html).attr('title',title).attr('class','point_button').attr('target_id',points[i].target_id).appendTo(tag);
	  		
	  		

        $('[pid='+points[i].id+']').each(function(){
                $(this).html($(this).attr('title'));

                $(this).after("<div class='tooltip' id='location_tip_"+$(this).attr('target_id')+"' ></div>");
                $('#location_tip_'+$(this).attr('target_id')).load(__SITE__+"/locations/mini_show?location_id="+$(this).attr('target_id'));

                $(this).tooltip({
                effect:"slide",
                relative:true,
                offset: [10, 105],
                predelay: 200
                });


        });
            i++;
	  	}
        if(callback){callback();}
	  });	

}


//鼠标点击后切换地点的函数
function show_location(obj,id){
    get_map(id,'click');
}


//mousewheel begin
var client = function () {
        var engine = {
            //呈现引擎
            ie: 0,
            gecko: 0,
            webkit: 0,
            khtml: 0,
            opera: 0,
            //具体版本号
            ver: null
        };
        var browser = {
            //浏览器
            ie: 0,
            firefox: 0,
            konq: 0,
            opera: 0,
            chrome: 0,
            safari: 0,
            //具体版本号
            ver: null
        };
        var system = {
            win: false,
            mac: false,
            x11: false
        };
        //在此检测呈现引擎、平台设备
        return {
            engine: engine,
            browser: browser,
            system: system
        };
    }();
var EventUtil = {
    getEvent: function (event) {
        return event ? event : window.event;
    },
    addHandler: function (element, type, handler) {
        if (element.addEventListener) {
            element.addEventListener(type, handler, false);
        } else if (element.attachEvent) {
            element.attachEvent("on" + type, handler);
        } else {
            element["on" + type] = handler;
        }
    },
    getWheelDelta: function (event) {
        if (event.wheelDelta) {
            return (client.engine.opera && client.engine.opera < 9.5 ? -event.wheelDelta : event.wheelDelta);
        } else {
            return -event.detail * 40;
        }
    }
};
//MOUSEWHEEL END






