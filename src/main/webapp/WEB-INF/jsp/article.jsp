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
	                        <h1 class="page-header">文章</h1>
	                    </div>
	                    <!-- /.col-lg-12 -->
	                </div>
	                
	                <div id="toolbar">
	                	<button id="insert" class="btn btn-success" onclick="Article.insert()">
				            <i class="glyphicon glyphicon-plus"></i> 增加
				        </button>
				        <button id="update" class="btn btn-warning" onclick="Article.update()">
				            <i class="glyphicon glyphicon-pencil"></i> 修改
				        </button>
				        <button id="remove" class="btn btn-danger" onclick="Article.remove()">
				            <i class="glyphicon glyphicon-remove"></i> 删除
				        </button>
				    </div>
	                <table id="table"></table>
	                
	            </div>
			</div>


		</div>
		<!-- /container -->
		<jsp:include page="include/footer.jsp"></jsp:include>
		
		<script type="text/javascript">
		
			
			function getHeight(){
				var height = window.innerHeight - 200;
				if(height < 400) height = 400
				return height;
			}
			
			$(function(){
				Article.init();
				$('#table').bootstrapTable({
					url: '${ctx}/articleQueryByParam',
					toolbar: "#toolbar",
					height: getHeight(),
					cache: false,
					pagination: true,
	                pageSize: 5,
	                pageList: [5,10,25,50,100,200],
					showRefresh : true,
					showExport : true,
					showColumns : true,
					singleSelect : true,
					striped : true,
					search : true,
					searchOnEnterKey :true,
				    columns: [{
				    	checkbox : true,
				    	align: "center"
				    },{
				        field: 'articleId',
				        title: 'ID',
				        align: "center",
				        valign: "middle",
				        sortable: true
				    },{
				        field: 'articleCaption',
				        align: "center",
				        valign: "middle",
				        title: '标题'
				    },{
				        field: 'articleDigest',
				        halign: "center",
				        align: "left",
				        title: '摘要'
				    },{
				        field: 'articleContent',
				        align: "center",
				        valign: "middle",
				        title: '内容'
				    },{
				        field: 'articleRemark',
				        align: "center",
				        valign: "middle",
				        title: '备注'
				    },{
				        field: 'articleAuthor',
				        align: "center",
				        valign: "middle",
				        title: '作者'
				    },{
				        field: 'userAccount',
				        align: "center",
				        valign: "middle",
				        title: '编辑人',
				        visible : false
				    },{
				        field: 'articleCreateTime',
				        align: "center",
				        valign: "middle",
				        title: '创建时间',
				        visible : false
				    },{
				        field: 'articleUpdateTime',
				        align: "center",
				        valign: "middle",
				        title: '修改时间'
				    },{
				        field: 'articlePageView',
				        align: "center",
				        valign: "middle",
				        title: '浏览量'
				    },{
				        field: 'articleLike',
				        align: "center",
				        valign: "middle",
				        title: '点赞量',
				        visible : false
				    },{
				        field: 'articleDislike',
				        align: "center",
				        valign: "middle",
				        title: '不喜欢量',
				        visible : false
				    },{
				        field: 'articleIsApprove',
				        align: "center",
				        valign: "middle",
				        title: '审核',
				        formatter: function(value){
				        	if(0 == value){
				        		return "未审核";
				        	}
				        	if(1 == value){
				        		return "通过";
				        	}
				        	if(2 == value){
				        		return "未通过";
				        	}
				        	return value;
				        }
				    },{
				        field: 'articleIsDelete',
				        align: "center",
				        valign: "middle",
				        title: '是否删除',
				        visible : false
				    }]
				});		
			});
			var Article = {
				commitUrl : "",
				
				init: function() {
					$('#Modal').modal('hide');
				},
				save: function(){
				    if(!$('#exercisesTitle').val() || !$('#exercisesContent').val() || !$('#exercisesHint').val()
				    		|| !$('#exercisesAnswer').val() || !$('#exercisesDifficultyLevel').val() || !$('#exercisesIntegral').val()){
				    	$('#warningContent').text("所有输入框为必填项目,请补充完整后重试!");
				    	$('#warningDiv').show();
				    	return;
				    }
					$.ajax({
						type: "POST",
						url: Article.commitUrl,
						data: $('#modalForm').serialize(),
						success: function(msg){
							if("exercisesInsert" == Article.commitUrl){
								$.messager.alert("消息","新增成功!" + msg);
								$('#table').bootstrapTable('refresh');
							}
							if("exercisesUpdate" == Article.commitUrl){
								$.messager.alert("消息","修改成功!" + msg);
								$('#table').bootstrapTable('refresh');
							}
						}
					});
					alert("save");
					$('#Modal').modal('hide');
				},
				insert: function() {
					$('#modalForm').form('clear');
					$('#Modal').modal('show');
					Article.commitUrl = "exercisesInsert";
				},
				update: function(){
					var row = $('#table').bootstrapTable('getSelections');
					if ("" == row){
						$.messager.alert("提示","您还未选择");
						return;
					}
					row = row[0];
					
					Article.commitUrl = "exercisesUpdate";
					
					$('#modalForm').form('clear');
					$('#modalForm').form('load',row);
					$('#Modal').modal('show');
					//alert('getSelections: ' + ;JSON.stringify(
				},
				remove: function(){
					Article.commitUrl = "exercisesDelete";
					
					var row = $('#table').bootstrapTable('getSelections');
					if ("" == row){
						$.messager.alert("提示","您还未选择");
						return;
					}
					row = row[0];
					
					var t = $.messager.confirm('警告','您将删除ID为'+row.exercisesId+'的记录!!!', function(){
						$.post( Article.commitUrl, { exercisesId : row.exercisesId},function( data ) {
							$.messager.alert("消息","成功删除!");
							$('#table').bootstrapTable('refresh');
						});
					});
					
					
				}
				
			};	

	        
		</script>
		
	</body>
</html>
