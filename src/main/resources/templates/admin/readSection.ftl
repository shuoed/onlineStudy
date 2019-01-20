
<div class="tab-pane fade in active" id="section">
	<#if chapterSection??>
	<#list chapterSection as item>
	<div class="chapter" id="chapter-${item.id!}" >
		<h3>
			<strong id="sectionTitle_${item.id!}" >${item.name!}(${item.time!})</strong>
			<a href="javascript:void(0);" class="chapter-edit" style="margin-right:20px;" onclick="doDeleteSection(${item.id!},0)">删除</a> 
			<a href="javascript:void(0);" class="chapter-edit" onclick="toEditSection(${item.id!},0)">修改</a> 
			<a href="javascript:void(0);" class="chapter-edit" onclick="toSortSection(${item.id!},0)">↑</a> 
			<a href="javascript:void(0);" class="chapter-edit" onclick="toSortSection(${item.id!},1)">↓</a> 
		</h3>
		<ul class="chapter-sub">
			<#if item.sections??>
			<#list item.sections as section>
			<li id="chapter-sub-li-${section.id!}" class="chapter-sub-li">
			<span id="sectionSubTitle_${section.id!}" >${section.name!} (${section.time!})</span>
			<a href="javascript:void(0);" class="chapter-edit" onclick="doDeleteSection(${section.id!},1)">删除</a> 
			<a href="javascript:void(0);" class="chapter-edit" onclick="toEditSection(${section.id!},1)">修改</a> 
			<a href="javascript:void(0);" class="chapter-edit" onclick="toSortSection(${section.id!},0)">↑</a> 
			<a href="javascript:void(0);" class="chapter-edit" onclick="toSortSection(${section.id!},1)">↓</a> 
			</li>
			</#list>
			</#if>
		</ul>
	</div>
	</#list>
	</#if>
</div>


	<!-- 章节弹出层 -start -->
	<div class="modal" id="sectionModal" tabindex="-1" role="dialog"  aria-hidden="true">
		<div class="modal_wapper">
			<div class="modal-dialog w-8" >
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
						<h4 class="modal-title" >课程章节信息</h4>
					</div>
					
					<div class="modal-body">
						<form role="form" id="sectionForm" method="post" action="/courseSection/doMerge">
							<input type="hidden" id="sectionHiddenId" name="id" value=""/>
							<input type="hidden" id="sectionHiddenParentId" name="parentId" value=""/>
							<div class="form-group">
								<label>名称</label> 
								<input type="text" class="form-control" name="name" id="sectionName" placeholder="请输入名称">
							</div>
							<div class="form-group" id="videoUrl-group">
								<label>视频地址</label> 
								<input type="text" class="form-control" name="videoUrl" id="videoUrl" placeholder="请输入url">
							</div>
							<div class="form-group" id="time-group">
								<label>时长</label> 
								<input type="text" class="form-control" name="time" id="sectionTime" placeholder="请输入分钟数">
							</div>
						</form>
						<!-- tip提示-start -->
						<div id="_ocAlertTip" class="alert alert-success f-16" style="display: none;"></div>
						<!-- tip提示-end -->
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" onclick="doSaveSection();">保存</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 章节弹出层 -end -->
	
	<script type="text/javascript">
		//编辑章节 
		function toEditSection(id,type){
			if(type == 1){//节
				$('#videoUrl-group').show();
				$('#time-group').show();
			}else{
				$('#videoUrl-group').hide();
				$('#time-group').hide();
			}
			$.ajax({
				url:'/courseSection/getById',
			    type:'POST',
			    dataType:'json',
			    data:{"id":id},
			    success:function(resp){
			    	var errcode = resp.errcode;
			    	if(errcode == 0){
			    		Modal.show('sectionModal');
			    		$("#sectionForm").fill(resp.data);
			    	}
			    }
			});
		}
		
		//保存章节 
		function doSaveSection(){
			var id = $('#sectionHiddenId').val();
			var parentId = $('#sectionHiddenParentId').val();
			$('#sectionForm').ajaxSubmit({
				datatype : 'json',
				success : function(resp) {
					var resp = $.parseJSON(resp);
					if (resp.errcode == 0) {
						if(parentId == 0){//一级标题 
							$('#sectionTitle_' + id).html($('#sectionName').val());
						}else{//二级标题 
							$('#sectionSubTitle_' + id).html($('#sectionName').val() + "(" + $('#sectionTime').val() + ")");
						}
						Modal.hide('sectionModal');
					} else {
						alert('保存失败');
					}
				},
				error : function(xhr) {
				}
			});
		}
		
		//删除章节 0-章，1-节 
		function doDeleteSection(id,type){
			Modal.confirm('确定删除?',function(){
				$.ajax({
					url:'/courseSection/deleteLogic',
				    type:'POST',
				    dataType:'json',
				    data:{"id":id},
				    success:function(resp){
				    	var errcode = resp.errcode;
				    	if(errcode == 0){
				    		if(type == 0){
				    			$('#chapter-'+id).remove();
				    		}else{
				    			$('#chapter-sub-li-'+id).remove();
				    		}
				    	}
				    }
				});
			});
		}
		//排序
		function toSortSection(id,sortType){
			$.ajax({
				url:'/courseSection/sortSection',
			    type:'POST',
			    dataType:'json',
			    data:{"id":id,"sortType":sortType},
			    success:function(resp){
			    	var errcode = resp.errcode;
			    	if(errcode == 0){
			    		window.location.reload();
			    	}
			    }
			});
		}
	</script>
