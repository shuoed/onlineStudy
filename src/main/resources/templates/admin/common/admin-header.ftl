<div class="navbar">
    <div class="navbar-inner">
    		<a href="/admin/index"  class="cms-logo"  title="网校在线学习平台"></a>
            <span class="brand" >学习管理平台</span>
            
            <@shiro.user>
            <span class="brand" style="float: right;margin-right: 50px;color:#FFF;">
            <@shiro.principal property="username"/>
            </span>
	       </@shiro.user>
    </div>
</div>


