[#assign shiro=JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${message("admin.admin.list")} - Powered By LFX</title>
<meta name="author" content="LFX Team" />
<meta name="copyright" content="LFX" />
 <!--bootstrap样式-->
<link href="${base}/resources/bootstrap/css/bootstrap.min.css?v=3.3.0" rel="stylesheet">
<!-- 图标字体库和CSS框架-->
<link href="${base}/resources/bootstrap/font-awesome/css/font-awesome.css?v=4.3.0" rel="stylesheet">
<!--页面总样式-->
<link href="${base}/resources/bootstrap/css/style.css?v=2.0.0" rel="stylesheet">
<!-- Mainly scripts -->
<script src="${base}/resources/bootstrap/js/jquery-2.1.1.min.js"></script>
<script src="${base}/resources/bootstrap/js/bootstrap.min.js?v=3.3.0"></script>
<script src="${base}/resources/bootstrap/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${base}/resources/bootstrap/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
 	
 	<script>
        $().ready(function () {
        	$("#xtgl").addClass("active");
        	$("#admin").addClass("active");
        	$("#deleteButton").attr("disabled", true);
        });
	</script>
 	<!-- 插件 -->
    <script src="${base}/resources/bootstrap/js/hplus.js?v=2.0.0"></script>
    <script src="${base}/resources/bootstrap/js/plugins/pace/pace.min.js"></script>


<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/admin/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/input.js"></script>
<style type="text/css">
.roles label {
	width: 150px;
	display: block;
	float: left;
	padding-right: 6px;
}
</style>
<script type="text/javascript">
$().ready(function() {

	var $inputForm = $("#inputForm");
	
	[@flash_message /]
	
	// 表单验证
	$inputForm.validate({
		rules: {
			username: {
				required: true,
				pattern: /^[0-9a-z_A-Z\u4e00-\u9fa5]+$/,
				minlength: 2,
				maxlength: 20,
				remote: {
					url: "check_username.jhtml",
					cache: false
				}
			},
			password: {
				required: true,
				pattern: /^[^\s&\"<>]+$/,
				minlength: 4,
				maxlength: 20
			},
			rePassword: {
				required: true,
				equalTo: "#password"
			},
			email: {
				required: true,
				email: true
			},
			roleIds: "required"
		},
		messages: {
			username: {
				pattern: "${message("admin.validate.illegal")}",
				remote: "${message("admin.validate.exist")}"
			},
			password: {
				pattern: "${message("admin.validate.illegal")}"
			}
		}
	});
	
});
</script>
</head>
<body class="list">
<!-- 总体开始-->
<div id="wrapper">
       <!-- 左边导航开始-->
       [#include "/admin/common/left.ftl"]
   		<!-- 左边导航j结束-->
	      <!-- 右边开始-->
	      <div id="page-wrapper" class="gray-bg dashbard-1">
			            <!-- 头部导航开始-->
			            <div class="row border-bottom">
			            	[#include "/admin/common/header.ftl"]
			            </div>
			            <!-- 头部导航结束-->
				<div class="row wrapper border-bottom white-bg page-heading">
                <div class="col-lg-10">
                    </br>
                   
                    <ol class="breadcrumb">
                        <li>
                            <a >系统管理</a>
                        </li>
                        
                        <li>
                            <strong>用户管理</strong>
                        </li>
                    </ol>
                </div>
            </div>						
									
									
	
            <div class="wrapper wrapper-content animated fadeInRight">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-title">
                                <h5>管理员列表&nbsp; </h5>
                                <div class="ibox-tools">
                                    <a class="collapse-link">
                                        <i class="fa fa-chevron-up"></i>
                                    </a>
                                  
                                   
                                    <a class="close-link">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                           
                           
                           
                           
                       
                           
                           
                           
                           
                            <!-- 表格开始 -->
                   	<form id="inputForm" action="save.jhtml" method="post">
		<ul id="tab" class="tab">
			<li>
				<input type="button" value="${message("admin.admin.base")}" />
			</li>
			<li>
				<input type="button" value="${message("admin.admin.profile")}" />
			</li>
		</ul>
		<table class="input tabContent">
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Admin.username")}:
				</th>
				<td>
					<input type="text" name="username" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Admin.password")}:
				</th>
				<td>
					<input type="password" id="password" name="password" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("admin.admin.rePassword")}:
				</th>
				<td>
					<input type="password" name="rePassword" class="text" maxlength="20" />
				</td>
			</tr>
			<tr>
				<th>
					<span class="requiredField">*</span>${message("Admin.email")}:
				</th>
				<td>
					<input type="text" name="email" class="text" maxlength="200" />
				</td>
			</tr>
			<tr class="roles">
				<th>
					<span class="requiredField">*</span>${message("Admin.roles")}:
				</th>
				<td>
					<span class="fieldSet">
						[#list roles as role]
							<label>
								<input type="checkbox" name="roleIds" value="${role.id}" />${role.name}
							</label>
						[/#list]
					</span>
				</td>
			</tr>
			<tr>
				<th>
					${message("admin.common.setting")}:
				</th>
				<td>
					<label>
						<input type="checkbox" name="isEnabled" value="true" checked="checked" />${message("Admin.isEnabled")}
						<input type="hidden" name="_isEnabled" value="false" />
					</label>
				</td>
			</tr>
		</table>
		<table class="input tabContent">
			<tr>
				<th>
					${message("Admin.department")}:
				</th>
				<td>
					<input type="text" name="department" class="text" maxlength="200" />
				</td>
			</tr>
			<tr>
				<th>
					${message("Admin.name")}:
				</th>
				<td>
					<input type="text" name="name" class="text" maxlength="200" />
				</td>
			</tr>
		</table>
		<table class="input">
			<tr>
				<th>
					&nbsp;
				</th>
				<td>
					<input type="submit" class="button" value="${message("admin.common.submit")}" />
					<input type="button" class="button" value="${message("admin.common.back")}" onclick="location.href='list.jhtml'" />
				</td>
			</tr>
		</table>
	</form>
                            
                            
                              <!-- 表格结束 -->
                        </div>
                    </div>
                </div>
                
            </div>
									
									
									
									
									
					
					
					
					
					
					
					 <!-- 底部开始-->
					<div class="footer">
					[#include "/admin/common/footer.ftl"]
		            </div>
		             <!-- 底部结束-->
			 </div>
               <!-- 右边结束-->
                    

</div>
<!-- 总体结束-->


     


    

</body>

</html>