var code = {
	show : function(width, height, url, title){
		var w = width || 500;
		var h = height || 300;
		var u = url || "#";
		var t = title || "";
		
		var wh = $("body").height() < $(window).height() ? $(window).height() : $("body").height();
		var wt = ($(window).height()-h)/2 + $(window).scrollTop();
		var wl = ($(window).width()-w)/2;
		
		var d = '';
		d += '<div id="code" style="height:'+wh+'px"><div class="code_bg" style="height:'+wh+'px"></div>';
		d += '<div class="code_show" style="width:'+w+'px;height:'+h+'px;top:'+wt+'px;left:'+wl+'px;">';
		
		d += '<div class="code_title">';
		if(t.length > 0){
			d += '<strong>'+ t +'</strong>';
		}
		d += '<span onclick="code.exit()" class="exit">X</span></div>';
		
		if(t.length > 0){
			h = h-30;
		}
		d += '<div class="code_data" style="height:'+(h-30)+'px;"><iframe style="height:'+h+'px;" src="'+ u +'" width="100%" height="266" scrolling="no" frameborder="0"></iframe></div>';
		d += '</div>'
		d += '</div>'
		$("body").append(d);
	},
	exit : function(){
		$("#code").remove();
	}
}