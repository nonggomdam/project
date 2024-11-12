/**
 * body.js
 */
 $(function() {
	var s= $('.bTab').on('click', function(a, b){
		if(a.target.nodeName != 'SPAN') return;
		var dd= this.querySelectorAll('span');		
		 
		dd.forEach(a => {
			if(a.className=='active'){
				$(a).removeClass('active');
				$($(a).attr('data')).hide();
			}			
		});
		
		
		$(a.target).addClass('active');
		$($(a.target).attr('data')).show();
	});
	
});