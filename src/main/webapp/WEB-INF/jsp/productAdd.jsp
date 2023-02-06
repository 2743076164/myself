<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品上传</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/styles.css">


<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/boo.css">

<!--Icons css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/ic.css">

<!--mCustomScrollbar css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/jm.css">

<!--Sidemenu css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/sm.css">

</head>
<body>

	<div class="card">
		<div class="card-header">
			<h4>商品信息</h4>
		</div>
		<div class="card-body">
		<form action="insertProduct" method="Post"  class="form-horizontal" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-md-1 col-form-label">商品名称</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="productname" value="">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-md-1 col-form-label">商品类型</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="category" value="">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-md-1 col-form-label">价格</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="price" value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-md-1 col-form-label">图片上传</label>
					<div class="col-md-9"><input type="file" class="form-control" name="file" accept="images/jpeg" id='file' onchange='change()' >
					</div>
				</div>
				<div class="form-group row">
					<label class="col-md-1 col-form-label">图片预览</label>
					<div class="col-md-9"><img src="" alt="" width="200" height="200" id='preview' />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-md-1 col-form-label">条形码</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="barcode">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-md-1 col-form-label">二维码</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="qrcode"
							value="">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-md-1 col-form-label">产品详情</label>
					<div class="col-md-9">
						<input type="text" class="form-control" name="description"
							value="">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-md-1 col-form-label">修改时间</label>
					<div class="col-md-9">
						<input class="form-control" type="date" name="protime">
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-md-1 col-form-label"></label>
					
					
					<div class="col-md-9">
						<input type="submit" class="form-control"
							value="提交">
					</div>
					
					
				</div>




			</form>
		</div>
	</div>
<script>
function change() {
    var pic = document.getElementById("preview"),
        file = document.getElementById("file");
    var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();
     // gif在IE浏览器暂时无法显示
     if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
         alert("图片的格式必须为png或者jpg或者jpeg格式！"); 
         file.value='';
         return;
     }
     var isIE = navigator.userAgent.match(/MSIE/)!= null,
         isIE6 = navigator.userAgent.match(/MSIE 6.0/)!= null;
     if(isIE) {
        file.select();
        var reallocalpath = document.selection.createRange().text;
        // IE6浏览器设置img的src为本地路径可以直接显示图片
         if (isIE6) {
            pic.src = reallocalpath;
         }else {
            // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
             pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\"" + reallocalpath + "\")";
             // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
             pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
         }
     }else {
        html5Reader(file);
     }
}
 function html5Reader(file){
     var file = file.files[0];
     var reader = new FileReader();
     reader.readAsDataURL(file);
     reader.onload = function(e){
         var pic = document.getElementById("preview");
         pic.src=this.result;
     }
 }
</script>

</body>
</html>