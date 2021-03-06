<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base>
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
	<#list fieldList as var>
		<#if var[3] == "是">
		check_blank("#${var[7] }",'请输入${var[2] }！');
		</#if>
	</#list>
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="${objectNameLower}/${r"${msg }"}.do" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${r"${pd."}ID${r"}"}"/>
		<div id="zhongxin">
		<table id="table_report" class="table table-striped table-bordered table-hover">
<#list fieldList as var>
	<#if var[3] == "是">
		<#if var[1] == 'Date'>
			<tr>
				<td class="edit_td">${var[2] }:</td>
				<td><input class="span10 date-picker" name="${var[7] }" id="${var[7] }" value="${r"${pd."}${var[7] }${r"}"}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="${var[2] }" title="${var[2] }"/></td>
			</tr>
		<#elseif var[1] == 'Integer'>
			<tr>
				<td class="edit_td">${var[2] }:</td>
				<td><input type="number" name="${var[7] }" id="${var[7] }" value="${r"${pd."}${var[7] }${r"}"}" maxlength="32" placeholder="这里输入${var[2] }" title="${var[2] }"/></td>
			</tr>
		<#else>
			<tr>
				<td class="edit_td">${var[2] }:</td>
				<td><input type="text" name="${var[7] }" id="${var[7] }" value="${r"${pd."}${var[7] }${r"}"}" maxlength="32" placeholder="这里输入${var[2] }" title="${var[2] }"/></td>
			</tr>
		</#if>
	</#if>
</#list>
			<tr>
				<td style="text-align: center;" colspan="10">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
    	<script type="text/javascript" src="static/js/myjs/validate.js"></script>NO
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
</body>
</html>