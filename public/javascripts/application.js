// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	
  $("#users th a, #users .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  
  $("#users_search input").keyup(function(){
  	$.get($("#users_search").attr("action"), $("#users_search").serialize(), null, "script");
  	return false;
  });
  $("#tgs_id").change(function() {
  		    window.location.reload();
        	$.ajax({url: '/tippgemeinschafts/' + this.value + '/chooseTippgemeinschaft',
	          data: 'id=' + this.value,
	          type:'post',
	          dataType: 'script'});

    });
  
});