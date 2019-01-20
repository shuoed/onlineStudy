
<div class="tab-pane fade" id="studentCount">
	<div id="report-1" style="width:70%;height:400px;"></div>
</div>

<script type="text/javascript">
		<#--<#if staticsVo??>-->
			$(function () {
				
				<#--var staticsVo = ${staticsVo!};//后台数据 -->
				<#--var categories = staticsVo.categories;-->
				<#--var data = staticsVo.data; -->
				
				var categories = ['03-19', '03-20', '03-21', '03-22', '03-23', '03-24','03-25', '03-26'];
				var data = [100, 200, 300, 145, 182, 215, 252, 265];
				
			    $('#report-1').highcharts({
			        title: {
			            text: '课程学习人数(7天)',
			            x: -20 //center
			        },
			        subtitle: {
			            text: '',
			            x: -20
			        },
					credits: {
			            enabled: false
			        },
			        xAxis: {
			            categories: categories
			        },
			        yAxis: {
			            title: {
			                text: '学习人数'
			            },
			            plotLines: [{
			                value: 0,
			                width: 1,
			                color: '#0089D2'
			            }]
			        },
			        tooltip: {
			            valueSuffix: '人'
			        },
			        legend: {
			            layout: 'vertical',
			            align: 'center',
			            verticalAlign: 'middle',
			            borderWidth: 0
			        },
			        series: [{
			            name: '学习人数',
			            data: data
			        }]
			    });
			});
		<#--</#if>-->
</script>