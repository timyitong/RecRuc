$(document).ready(function (){
  
  
  $('#activities_datepicker_start').datepicker();
  $('#activities_datepicker_start').datepicker( "option", "dateFormat", "yy-mm-dd" );
  
  $('#activities_datepicker_end').datepicker();
  $('#activities_datepicker_end').datepicker( "option", "dateFormat", "yy-mm-dd" );
  
  $('#activities_be_drag').fadeOut();
  $('#activities_drag').toggle(function(){$('#activities_be_drag').fadeIn();},function(){$('#activities_be_drag').fadeOut();});



  $('#new_activity').submit(function(){
      
      
      $('#activity_starttime').val($('#activities_datepicker_start').val()+" "+$('#activities_datepicker_start_h').val()+":"+$('#activities_datepicker_start_m').val()+":00.000");
      $('#activity_endtime').val($('#activities_datepicker_end').val()+" "+$('#activities_datepicker_end_h').val()+":"+$('#activities_datepicker_end_m').val()+":00.000");
      //xhr.activity[title]='shit!';
      
      //return true;    
    });
 
    $('.edit_activity').each(function(){
    	$(this).submit(function(){
      
	      
	      $('#activity_starttime').val($('#activities_datepicker_start').val()+" "+$('#activities_datepicker_start_h').val()+":"+$('#activities_datepicker_start_m').val()+":00.000");
	      $('#activity_endtime').val($('#activities_datepicker_end').val()+" "+$('#activities_datepicker_end_h').val()+":"+$('#activities_datepicker_end_m').val()+":00.000");
	      //xhr.activity[title]='shit!';
	      
	      //return true;    
	    });
    });
    


});




