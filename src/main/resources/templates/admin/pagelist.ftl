<!DOCTYPE html>
<html>
   <head>
        <title>后台管理</title>
        <meta charset="utf-8">
        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <!-- 引入资源文件 -->
        <#include "common/admin-res.ftl" />
   </head>
   
   <body class=""> 
  	<!-- top 导航 -->
    <#include "common/admin-header.ftl" />
	
	<!-- 菜单导航 -->
    <#include "admin-nav.ftl" />
    
    <div class="content">
    	<input type="button" class="search-btn mt-10" style="margin-left: 15px;" onclick="window.location.href='/admin/carouselToMerge'" value=" 添加轮播配置" />
        <div class="container-fluid">
            
            <div class="row-fluid">
            	<form id="queryPageForm" class="mt-15" >
				<div class="block span6">
					<div id="widget2container" class="block-body">
						<table class="table list">
							<tbody>
								<#if (page.items)??>
								<#list page.items as item>
								<tr id="tr-${item.id!}">
									<td style="width:600px;">
										<p>
											<img src="${item.picture!}" style="width: 250px;height:150px;float: left;">
											<div class="ml-15" style="float:left;">
												<p class="ellipsis"  title="${item.name!}">${item.name!}</p>
												<p class="ellipsis-multi h-40" title="${item.brief!}">链接：
												<a href="${item.url!}" target="_blank">${item.url!}</a>
												</p>
											</div> 
										</p>
									</td>
									<td style="width:120px;">
										<p>推荐权重：${item.weight!}</p> 
										<p><a href="/admin/carouselToMerge?id=${item.id!}">修改</a></p>
										<p><a href="javascript:void(0);" onclick="doDelete(${item.id!});">删除</a></p> 
									</td>
								</tr>
								</#list>
								</#if>
							</tbody>
						</table>
						<p><#include "common/tailPage.ftl"/></p>
					</div>
				</div>
				</form>
			</div>
            
    	</div>
	</div>
	
	<!-- 弹出层 alert 信息 -->  
    <div class="modal" id="_ocDialogModal" tabindex="-1" aria-hidden="true">
		<div class="modal_wapper small">
			<div class="modal-dialog w-4" >
				<div class="modal-content">
					<div class="modal-header">
						<div class="modal-title f-16" >提示信息</div>
					</div>
					<div class="modal-body">
						<div><span class="color-oc f-16 oc-content"></span></div>
					</div>
					<div class="modal-footer modal-center">
						<button type="button" class="btn btn-primary oc-ok">确 定</button>
						<button type="button" class="btn btn-default oc-cancel">取 消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
  <!-- 弹出层 alert 信息 --> 
	
	<script type="text/javascript">
		//删除 
		function doDelete(id,el){
			Modal.confirm('确定删除?',function(){
				$.ajax({
					url:'/admin/carouselDelete',
				    type:'POST',
				    dataType:'json',
				    data:{"id":id},
				    success:function(resp){
				    	var errcode = resp.errcode;
				    	if(errcode == 0){
				    		$('#tr-'+id).remove();//删除成功，直接移除 tr 
				    	}
				    } 
				});
			});
		}
		
	</script>
  </body>
</html>

