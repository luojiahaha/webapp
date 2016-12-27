<nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                 	
					<li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle">
                     
                             </span><span class="block m-t-xs"> <strong class="font-bold">欢迎您：[@shiro.principal /]</strong> <b class="caret"></b></span> </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                              
                                <li><a href="profile.html">个人资料</a>  </li>
                              
                               
                              	
                                <li class="divider"></li>
                                <li><a href="../logout.jsp">安全退出</a>
                                </li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            弦基币后台管理
                        </div>

                    </li>
                 
                 
                    <li id="wdzzt">
                        <a href="${base}/admin/common/main.jhtml"><i class="fa fa-laptop"></i> <span class="nav-label">我的工作台</span></a>
                    </li>                    
                  
					
                     <li id="xtgl">
                        <a ><i class="fa fa-gears"></i> <span class="nav-label">系统管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                        	[@shiro.hasPermission name="admin:admin"]
                            <li id="admin"><a href="../admin/list.jhtml">用户管理</a></li>
                            [/@shiro.hasPermission]
                        	
                        	
                        	[@shiro.hasPermission name="admin:role"]
                            <li id="role"><a href="../role/list.jhtml">角色管理</a></li>
                            [/@shiro.hasPermission]
                        
                        	[@shiro.hasPermission name="admin:area"]
                            <li id="admin"><a href="../area/list.jhtml">地区管理</a></li>
                            [/@shiro.hasPermission]
					
							[@shiro.hasPermission name="admin:test"]
							 <li id="admin"><a href="../test/list.jhtml">测试</a></li>
							[/@shiro.hasPermission]
				
                        </ul>
                    </li>
                    
                    
                    
                    <li id="cpgl">
                        <a ><i class="fa fa-gears"></i> <span class="nav-label">产品管理</span><span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
							[@shiro.hasPermission name="admin:test"]
							 <li id="cplx"><a href="../pmFundType/list.jhtml">产品类型</a></li>
							[/@shiro.hasPermission]
				
                        </ul>
                    </li>
                  
                    
                </ul>

            </div>
  </nav>