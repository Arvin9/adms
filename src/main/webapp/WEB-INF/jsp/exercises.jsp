<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
	                <!-- /.row -->
	                <!-- Modal -->
					<div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
					      		<div class="modal-header">
					        		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					        		<h4 class="modal-title" id="ModalLabel">Modal title</h4>
					      		</div>
					      		<form id="modalForm" method="post" enctype="multipart/form-data">
						      		<div class="modal-body">
						      		
						      		</div>
						     		<div class="modal-footer">
						        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						        		<button type="button" class="btn btn-primary">Save changes</button>
						      		</div>
					      		</form>
					    	</div>
					  	</div>
					</div>
	                
	                
	                <div id="toolbar">
	                	<button id="insert" class="btn btn-success" onclick="Exercises.insert()">
				            <i class="glyphicon glyphicon-plus"></i> 增加
				        </button>
				        <button id="update" class="btn btn-warning">
				            <i class="glyphicon glyphicon-pencil"></i> 修改
				        </button>
				        <button id="remove" class="btn btn-danger" disabled>
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
		
		$(function(){
			Exercises.init();
			$('#table').bootstrapTable({
				url: '${ctx}/queryByParam',
				toolbar: "#toolbar",
				height: $(window).height() - 200,
				cache: false,
				pagination: true,
                pageSize: 3,
                pageList: [5,10, 25, 50, 100, 200],
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
			        field: 'exercisesId',
			        title: 'ID',
			        align: "center",
			        valign: "middle",
			        sortable: true
			    },{
			        field: 'exercisesTitle',
			        align: "center",
			        valign: "middle",
			        title: '标题'
			    },{
			        field: 'exercisesContent',
			        halign: "center",
			        align: "left",
			        title: '内容'
			    },{
			        field: 'exercisesHint',
			        align: "center",
			        valign: "middle",
			        title: '提示'
			    },{
			        field: 'exercisesAnswer',
			        align: "center",
			        valign: "middle",
			        title: '答案'
			    },{
			        field: 'exercisesDifficultyLevel',
			        align: "center",
			        valign: "middle",
			        title: '困难度',
			        formatter: function(value){
			        	if(1 == value){
			        		return "简单";
			        	}
			        	if(2 == value){
			        		return "中等";
			        	}
			        	if(3 == value){
			        		return "困难";
			        	}
			        	return value;
			        }
			    },{
			        field: 'exercisesIntegral',
			        align: "center",
			        valign: "middle",
			        title: '积分值'
			    },{
			        field: 'answerCount',
			        align: "center",
			        valign: "middle",
			        title: '回答数',
			        visible : false
			    },{
			        field: 'answerCorrectCount',
			        align: "center",
			        valign: "middle",
			        title: '回答正确数',
			        visible : false
			    }]
			});		
		});
		var Exercises = {
			init: function() {
				$('#Modal').modal('hide');
			},
			insert: function() {
				$('#Modal').modal('show');
			}
		};	
			
		</script>
		
	</body>
</html>
