[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title></title>
<meta name="author" content="LFX Team" />
<meta name="copyright" content="LFX" />
 <link href="${base}/resources/bootstrap/css/bootstrap.min.css?v=3.3.0" rel="stylesheet">
    <link href="${base}/resources/bootstrap/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">

    <!-- Morris -->
    <link href="${base}/resources/bootstrap/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

    <!-- Gritter -->
    <link href="${base}/resources/bootstrap/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

    <link href="${base}/resources/bootstrap/css/animate.css" rel="stylesheet">
    <link href="${base}/resources/bootstrap/css/style.css?v=2.0.0" rel="stylesheet">

</head>
<body>
<div id="wrapper">
       <!-- 左边导航-->
 		[#include "admin/common/left.ftl"]
	      <div id="page-wrapper" class="gray-bg dashbard-1">
		            <div class="row border-bottom">
		            [#include "admin/common/header.ftl"]
		            </div>
		            
					<div class="wrapper wrapper-content">
						
					</div>
					
					<div class="footer">
		            [#include "admin/common/footer.ftl"]
		            </div>
			 </div>
              
                    


      
		</div>



     <!-- Mainly scripts -->
    <script src="${base}/resources/bootstrap/js/jquery-2.1.1.min.js"></script>
    <script src="${base}/resources/bootstrap/js/bootstrap.min.js?v=3.3.0"></script>
    <script src="${base}/resources/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${base}/resources/bootstrap/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <!-- Flot -->
    <script src="${base}/resources/bootstrap/js/plugins/flot/jquery.flot.js"></script>
    <script src="${base}/resources/bootstrap/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="${base}/resources/bootstrap/js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="${base}/resources/bootstrap/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="${base}/resources/bootstrap/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="${base}/resources/bootstrap/js/plugins/flot/jquery.flot.symbol.js"></script>

    <!-- Peity -->
    <script src="${base}/resources/bootstrap/js/plugins/peity/jquery.peity.min.js"></script>
    <script src="${base}/resources/bootstrap/js/demo/peity-demo.js"></script>

    <!-- Custom and plugin javascript -->
    <script src="${base}/resources/bootstrap/js/hplus.js?v=2.0.0"></script>
    <script src="${base}/resources/bootstrap/js/plugins/pace/pace.min.js"></script>

    <!-- jQuery UI -->
    <script src="${base}/resources/bootstrap/js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Jvectormap -->
    <script src="${base}/resources/bootstrap/js/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="${base}/resources/bootstrap/js/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

    <!-- EayPIE -->
    <script src="${base}/resources/bootstrap/js/plugins/easypiechart/jquery.easypiechart.js"></script>

    <!-- Sparkline -->
    <script src="${base}/resources/bootstrap/js/plugins/sparkline/jquery.sparkline.min.js"></script>

    <!-- Sparkline demo data  -->
    <script src="${base}/resources/bootstrap/js/demo/sparkline-demo.js"></script>
    
    
    <!-- 右上角弹出层 -->
    <script src="${base}/resources/bootstrap/js/plugins/gritter/jquery.gritter.min.js"></script>
    
    
    
    
    
    
    <script>
        $(document).ready(function () {
            WinMove();
            setTimeout(function () {
                $.gritter.add({
                    title: '您有2条未读信息',
                    text: '请前往<a href="#" class="text-warning">收件箱</a>查看今日任务',
                    time: 2000
                });
            }, 1000);


           
        });
    </script>

</body>
</html>