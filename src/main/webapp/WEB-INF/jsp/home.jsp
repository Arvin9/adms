<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ page isELIgnored ="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>Home</title>
		<jsp:include page="include/header.jsp"></jsp:include>
		

	</head>

	<body>
		<div class="wrapper">
			<!-- 导航栏 -->
			<jsp:include page="include/top.jsp"></jsp:include>

			<div id="page-wrapper">
				<div class="container-fluid">
	                <div class="row">
	                    <div class="col-lg-12">
	                        <h1 class="page-header">Blank</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
	                
	                <div class="row">
	                	<div class="col-md-7">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            <i class="fa fa-bar-chart-o fa-fw"></i> 用户访问页面量
		                        </div>
		                        <!-- /.panel-heading -->
		                        <div class="panel-body">
		                        
		                        	<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    								<div id="echartsMain" style="width: 100%;height:400px;"></div>
		                            
		                            
		                        </div>
                        		<!-- /.panel-body -->
                    		</div>
	                	</div>
	                </div>
	                
	            </div>
			</div>


		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
			var userVisitPageMap = ${userVisitPageMap};
			
			$(function(){
				// 基于准备好的dom，初始化echarts实例
		        var myChart = echarts.init(document.getElementById('echartsMain'), 'infographic');
				
		     	// 使用刚指定的配置项和数据显示图表。
		        myChart.setOption(option);
			});
			
			

	        // 指定图表的配置项和数据
	        var option = {
				    title : {
				        text: '用户访问页面量',
				        subtext: 'PV',
				        x:'center'
				    },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				        orient: 'vertical',
				        left: 'left',
				        data: userVisitPageMap.legendData
				    },
				    series : [
				        {
				            name: '访问页面',
				            type: 'pie',
				            radius : '55%',
				            center: ['50%', '60%'],
				            data: userVisitPageMap.seriesData,
				            itemStyle: {
				                emphasis: {
				                    shadowBlur: 10,
				                    shadowOffsetX: 0,
				                    shadowColor: 'rgba(0, 0, 0, 0.5)'
				                }
				            }
				        }
				    ]
				};

	        
		</script>
		
	</body>
</html>
