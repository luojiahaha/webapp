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
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js"></script>
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
                            
                            <div class="path">
		<a href="${base}/admin/common/index.jhtml">${message("admin.path.index")}</a> &raquo; ${message("admin.admin.list")} <span>(${message("admin.page.total", page.total)})</span>
	</div>
	<form id="listForm" action="list.jhtml" method="get">
		<div class="bar">
			<a href="add.jhtml" class="iconButton">
				<span class="addIcon">&nbsp;</span>${message("admin.common.add")}
			</a>
			<div class="buttonWrap">
				<a href="javascript:;" id="deleteButton" class="iconButton disabled">
					<span class="deleteIcon">&nbsp;</span>${message("admin.common.delete")}
				</a>
				<a href="javascript:;" id="refreshButton" class="iconButton">
					<span class="refreshIcon">&nbsp;</span>${message("admin.common.refresh")}
				</a>
				<div class="menuWrap">
					<a href="javascript:;" id="pageSizeSelect" class="button">
						${message("admin.page.pageSize")}<span class="arrow">&nbsp;</span>
					</a>
					<div class="popupMenu">
						<ul id="pageSizeOption">
							<li>
								<a href="javascript:;"[#if page.pageSize == 10] class="current"[/#if] val="10">10</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 20] class="current"[/#if] val="20">20</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 50] class="current"[/#if] val="50">50</a>
							</li>
							<li>
								<a href="javascript:;"[#if page.pageSize == 100] class="current"[/#if] val="100">100</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="menuWrap">
				<div class="search">
					<span id="searchPropertySelect" class="arrow">&nbsp;</span>
					<input type="text" id="searchValue" name="searchValue" value="${page.searchValue}" maxlength="200" />
					<button type="submit">&nbsp;</button>
				</div>
				<div class="popupMenu">
					<ul id="searchPropertyOption">
						<li>
							<a href="javascript:;"[#if page.searchProperty == "username"] class="current"[/#if] val="username">${message("Admin.username")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "email"] class="current"[/#if] val="email">${message("Admin.email")}</a>
						</li>
						<li>
							<a href="javascript:;"[#if page.searchProperty == "name"] class="current"[/#if] val="name">${message("Admin.name")}</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<table id="listTable" class="list">
			<tr>
				<th class="check">
					<input type="checkbox" id="selectAll" />
				</th>
				<th>
					<a href="javascript:;" class="sort" name="username">${message("Admin.username")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="email">${message("Admin.email")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="name">${message("Admin.name")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="department">${message("Admin.department")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="loginDate">${message("Admin.loginDate")}</a>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="loginIp">${message("Admin.loginIp")}</a>
				</th>
				<th>
					<span>${message("admin.admin.status")}</span>
				</th>
				<th>
					<a href="javascript:;" class="sort" name="createDate">${message("admin.common.createDate")}</a>
				</th>
				<th>
					<span>${message("admin.common.handle")}</span>
				</th>
			</tr>
			[#list page.content as admin]
				<tr>
					<td>
						<input type="checkbox" name="ids" value="${admin.id}" />
					</td>
					<td>
						${admin.username}
					</td>
					<td>
						${admin.email}
					</td>
					<td>
						${admin.name}
					</td>
					<td>
						${admin.department}
					</td>
					<td>
						[#if admin.loginDate??]
							<span title="${admin.loginDate?string("yyyy-MM-dd HH:mm:ss")}">${admin.loginDate}</span>
						[#else]
							-
						[/#if]
					</td>
					<td>
						${(admin.loginIp)!"-"}
					</td>
					<td>
						[#if !admin.isEnabled]
							<span class="red">${message("admin.admin.disabled")}</span>
						[#elseif admin.isLocked]
							<span class="red"> ${message("admin.admin.locked")} </span>
						[#else]
							<span class="green">${message("admin.admin.normal")}</span>
						[/#if]
					</td>
					<td>
						<span title="${admin.createDate?string("yyyy-MM-dd HH:mm:ss")}">${admin.createDate}</span>
					</td>
					<td>
						<a href="edit.jhtml?id=${admin.id}">[${message("admin.common.edit")}]</a>
					</td>
				</tr>
			[/#list]
		</table>
		[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
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