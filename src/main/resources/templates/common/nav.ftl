
<img id="userNavHeader" class="setting-header" src=""></img>
	<div>ww</div>
<div class="split-line" style="margin-bottom: 20px;"></div>

<ul class="user-menu-nav-block">
	<a href="/user/home">
		<li <#if curNav?? && curNav =="home">class="user-menu-nav-cur"<#else>class="user-menu-nav"</#if>>主页 <span>&gt;</span></li>
	</a>
	<a href="/user/course">
		<li <#if curNav?? && curNav =="course">class="user-menu-nav-cur"<#else>class="user-menu-nav"</#if> >我的课程  <span>&gt;</span></li>
	</a>
	<a href="/user/collect">
		<li <#if curNav?? && curNav =="collect">class="user-menu-nav-cur"<#else>class="user-menu-nav"</#if> >我的收藏  <span>&gt;</span></li>
	</a>
	<a href="/user/info">
		<li <#if curNav?? && curNav =="info">class="user-menu-nav-cur"<#else>class="user-menu-nav"</#if> >个人信息  <span>&gt;</span></li>
	</a>
	<a href="/user/passwd">
		<li <#if curNav?? && curNav =="passwd">class="user-menu-nav-cur"<#else>class="user-menu-nav"</#if> >修改密码  <span>&gt;</span></li>
	</a>
	<a href="/user/qa">
		<li <#if curNav?? && curNav =="qa">class="user-menu-nav-cur"<#else>class="user-menu-nav"</#if> >答疑  <span>&gt;</span></li>
	</a>
</ul>
<script type="text/javascript">
	$(function(){
		$('.user-menu-nav').hover(function(){
			$(this).find('span').css('color','#0089D2');
		},function(){
			$(this).find('span').css('color','#777');
		});
		
		var headPhoto = $('#userNavHeader').attr('src');
		if(headPhoto == null || headPhoto == '' || headPhoto == 'null'){
			var headPhoto = "/res/i/header.jpg";
			$('#userNavHeader').attr('src',headPhoto);
		}
	});	
</script>