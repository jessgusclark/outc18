$(document).ready(function(){
    $(this).StructuredDataBreadcrumbs();
    
    $.fn.StructuredDataBreadcrumbs = function(){
		var i = 1;
		$("ul.breadcrumbs li").each(function(){
			$(this).find("meta").attr("content", i);
			i++;
		});
    };
    
});

