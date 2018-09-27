<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>在装备名单</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<body>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="#">装备列表</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">

					<div class="form-group">
						<input type="text" id="inameID" name="iname" class="form-control"
							placeholder="请输入装备名"> <input type="number" id="ilevelID"
							name="ilevel" class="form-control" placeholder="请输入等级"> <input
							type="text" id="itypeID" name="itype" class="form-control"
							placeholder="请输入职业">
						<button type="button" onclick="insertEquip()"
							class="btn btn-default">新增</button>
					</div>

				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
		<%-- <c:if test="${result=='SUCCESS' }">
			<div class="alert alert-success" role="alert">提示：操作成功</div>
		</c:if>
		<c:if test="${result=='ERROR' }">
			<div class="alert alert-danger" role="alert">警告：操作失败</div>
		</c:if> --%>
		<button type="button" onclick="" class="btn btn-default">删除</button>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>LEVEL</th>
							<th>TYPE</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody id="equipBox"></tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		indexShowAll();
	});
	function insertEquip() {
		var inameID = $("#inameID").val();
		var ilevelID = $("#ilevelID").val();
		var itypeID = $("#itypeID").val();
		$.ajax({
			url : 'insertEquip.do',
			type : 'post',
			data : {
				iname : inameID,
				ilevel : ilevelID,
				itype : itypeID,
			},
			dataType : 'text',
			success : function(res) {
				if (res == "SUCCESS") {
					indexShowAll();
				}
			},
			error : function() {
				alert("发帖失败。");
			}
		});
	}
	function indexShowAll() {
		$
				.ajax({
					url : 'indexShowAll.do',
					type : 'POST',
					data : {

					},
					dataType : 'text',
					success : function(res) {
						$("#equipBox").html("");///清空div内容
						var json = eval("(" + res + ")");//执行输入的代码并返回执行结果，把返回的Json字符串转化为货真价实的Json对象
						for (var i = 0; i < json.length; i++) {//对于Json数组遍历并在页面上添加元素
							$("#equipBox")
									.append(
											"<tr><td>"
													+ json[i].equipId
													+ "</td><td>"
													+ json[i].equipName
													+ "</td><td>"
													+ json[i].equipLevel
													+ "</td><td><a href='javascript:void(0);' onclick='doRemovePeople("
													+ '"'
													+ json[i].equipId
													+ '"'
													+ ")'><span class='glyphicon glyphicon-remove'></span>删除</a></td></tr>");
						}
					},
					error : function() {
						alter("显示失败。");
					}
				});
	}
	function removeEquip(equipId) {
		$.ajax({
			url : 'removeEquip.do',
			type : 'post',
			data : {
				equipID : equipId
			},
			dataType : 'text',
			success : function(res) {
				switch (res) {
				case "SUCCESS":

					indexShowAll();
					break;

				default:
					alter("删除失败");
					break;
				}
			},
			error : function() {
				alter("删除失败");
			}
		});
	}
</script>
</html>