<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<title>jQuery点击弹出提示对话框插件带20种效果</title>

<!--主要样式-->

<!--主要样式-->

<link rel="stylesheet" href="css/dialog.css">
</head>
<body>


<button id="sendSuccessToTop">发送成功的提示框（置顶）</button>


<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/jquery.dialog.js"></script>
<script>
// 发送成功的提示框（置顶）
$('#sendSuccessToTop').on('click', function() {
	
  $.sendSuccessToTop('发送成功的提示框', 3000, function() {
	console.log('sendSuccessToTop closed');
  });
});
</script>
</body>
</html>
