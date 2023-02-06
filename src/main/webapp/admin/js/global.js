$(function(){
//二级主导航
$('dl.nav dd').mousemove(function(){
$(this).addClass('hover');
$(this).find('ul').slideDown();
});
$('dl.nav dd').mouseleave(function(){
$(this).removeClass('hover');
$(this).find('ul').slideUp("fast");
});
//常见问题
$('div.ask_box .show').addClass('dl_click');
$('div.ask_box .show dd').show('slow');
$('div.ask_box dl dt').click(function(){
$(this).parent().toggleClass('dl_click').siblings().removeClass('dl_click');
$(this).parent().children('dd').slideToggle().end().siblings().children('dd').slideUp();
});
//左导航
$('dl.left_nav dd').click(function(){
$(this).addClass('light').siblings().removeClass('light');	
});
//关闭微信
$('a.code_close').click(function(){
$(this).parent().parent().parent('div.code_wei').slideUp();	
});
//首页的微信经过出现大微信
$('span.wei').hover(function(){
$(this).parent().parent().parent().parent().parent().children('div.code_wei').slideDown();	
});
//内页的微信显示大微信
$('a.wei').hover(function(){
$(this).parent().parent().parent().parent().children('div.code_wei').slideDown();	
});
});