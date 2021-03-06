<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../system/admin/top.jsp"%>
</head>
<body>

<div class="container-fluid" id="main-container">


	<div id="page-content" class="clearfix">

		<div class="row-fluid">

			<div class="row-fluid">

				<!-- 检索  -->
				<form action="cwProject/list.do" method="post" name="Form" id="Form">
					<table>
						<tr>
							<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="NO" value="${pd.NO}" placeholder="项目名称" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
							</td>
							<%--<td><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart" value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>--%>
							<%--<td><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd" value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>--%>
							<td style="vertical-align:top;">
								<select class="chzn-select" name="STATUS" id="STATUS" data-placeholder="状态" class="select_top">
									<option  value=""></option>
									<option <c:if test="${pd.STATUS==-1}">selected</c:if> value="">全部</option>
									<option <c:if test="${pd.STATUS==0}">selected</c:if> value="0">新建</option>
									<option <c:if test="${pd.STATUS==1}">selected</c:if> value="1">发布</option>
									<option <c:if test="${pd.STATUS==2}">selected</c:if> value="2">已满标</option>
									<option <c:if test="${pd.STATUS==3}">selected</c:if> value="3">待结算</option>
									<option <c:if test="${pd.STATUS==4}">selected</c:if> value="4">已结算</option>
									<option <c:if test="${pd.STATUS==5}">selected</c:if> value="5">已偿还</option>
								</select>
							</td>
							<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
							<%--<c:if test="${QX.cha == 1 }">--%>
							<%--<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>--%>
							<%--</c:if>--%>
						</tr>
					</table>
					<!-- 检索  -->


					<table id="table_report" class="table table-striped table-bordered table-hover">

						<thead>
						<tr>
							<th class="center">
								<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
							</th>
							<th class="center">序号</th>
							<th class="center">标的名称</th>
							<%--<th class="center">产品信息</th>--%>
							<%--<th class="center">保障级别</th>--%>
							<%--<th class="center">付息方式</th>--%>
							<th class="center">融资金额</th>
							<th class="center">结算金额</th>
							<th class="center">已融资金额</th>
							<%--<th class="center">市场价</th>--%>
							<th class="center">预期年化收益率</th>
							<th class="center">服务费率</th>
							<th class="center">开放时间</th>
							<th class="center">关闭时间</th>
							<th class="center">满标时间</th>
							<th class="center">状态</th>
							<th class="center">创建时间</th>
							<th class="center">是否推荐</th>
							<%--<th class="center">预留信息1</th>--%>
							<%--<th class="center">预留信息2</th>--%>
							<%--<th class="center">预留信息3</th>--%>
							<th class="center">结算</th>
							<th class="center">还款</th>
						</tr>
						</thead>

						<tbody>

						<!-- 开始循环 -->
						<c:choose>
							<c:when test="${not empty varList}">
								<c:if test="${QX.cha == 1 }">
									<c:forEach items="${varList}" var="var" varStatus="vs">
										<tr>
											<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids' value="${var.ID}" /><span class="lbl"></span></label>
											</td>
											<td class='center' style="width: 30px;">${vs.index+1}</td>
											<td class='center'>${var.NO}</td>
												<%--<td>${var.GUARANTEE}</td>--%>
												<%--<td>${var.PAY_INTEREST_WAY}</td>--%>
											<td class='center'><fmt:formatNumber value="${var.AMOUNT}" pattern="#,##0.00#"/></td>
											<td class='center'><fmt:formatNumber value="${var.FINAL_AMOUNT}" pattern="#,##0.00#"/></td>
											<td class='center'><fmt:formatNumber value="${var.SELLED_AMOUNT}" pattern="#,##0.00#"/></td>
											<td class='center'>${var.ANNUAL_RATE}</td>
											<td class='center'>${var.SERVICE_RATE}</td>
											<td class='center'>${var.OPEN_DATE}</td>
											<td class='center'>${var.END_DATE}</td>
											<td class='center'><fmt:formatDate value="${var.SOLD_OUT_DATE}" pattern="yyyy-MM-dd HH:mm"/></td>
											<td class='center'>${var.STATUSSTR}</td>
											<td class='center'><fmt:formatDate value="${var.CREATE_TIME}" pattern="yyyy-MM-dd HH:mm"/></td>
											<td class='center'>${var.RECOMMENDSTR}</td>
											<td style="width: 30px;" class="center">
												<div class='hidden-phone visible-desktop btn-group'>
													<div class="inline position-relative">
														<c:choose>
															<c:when test="${var.STATUS == 2}">
																<button class="btn btn-mini btn-info" data-toggle="dropdown" onclick="complete('${var.ID}')"><i class="icon-cog icon-only"></i>满标</button>
															</c:when>
															<c:otherwise>
																<button class="btn btn-mini" data-toggle="dropdown"><i class="icon-cog icon-only"></i>满标</button>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</td>
											<td style="width: 30px;" class="center">
												<div class='hidden-phone visible-desktop btn-group'>
													<div class="inline position-relative">
														<c:choose>
															<c:when test="${var.STATUS == 4}">
																<button class="btn btn-mini btn-info" data-toggle="dropdown" onclick="repayment('${var.ID}')"><i class="icon-cog icon-only"></i>还款</button>
															</c:when>
															<c:otherwise>
																<button class="btn btn-mini" data-toggle="dropdown"><i class="icon-cog icon-only"></i>还款</button>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
											</td>
										</tr>

									</c:forEach>
								</c:if>
								<c:if test="${QX.cha == 0 }">
									<tr>
										<td colspan="100" class="center">您无权查看</td>
									</tr>
								</c:if>
							</c:when>
							<c:otherwise>
								<tr class="main_info">
									<td colspan="100" class="center" >没有相关数据</td>
								</tr>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					<div class="page-header position-relative">
						<table style="width:100%;">
							<tr>
								<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
							</tr>
						</table>
					</div>
				</form>
			</div>




			<!-- PAGE CONTENT ENDS HERE -->
		</div><!--/row-->

	</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->

<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only"></i>
</a>

<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/ace-elements.min.js"></script>
<script src="static/js/ace.min.js"></script>

<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
<!-- 引入 -->
<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
<script type="text/javascript" src="static/js/myjs/validate.js"></script>
<script type="text/javascript">

	$(top.hangge());

	//检索
	function search(){
		top.jzts();
		$("#Form").submit();
	}

	//满标状态修改
	function complete(ID) {
		bootbox.confirm("确认满标吗?", function(result) {
			if(result) {
				//top.jzts();
				var url = "<%=basePath%>cwProject/completeSub.do?ID="+ID+"&tm="+new Date().getTime();
				$.get(url,function(data){
					if(data.code == 0) {
						top.jzts();
						setTimeout("self.location=self.location",1000);
					} else if(data.code == 1) {
						bootbox.alert('满标失败!');
					} else {
						bootbox.alert('操作失败!');
					}
						/*top.jzts();
						setTimeout("self.location=self.location",100);*/

				});
			}
		});
	}

	//修改标的状态为还款
	function repayment(ID) {
		bootbox.confirm("确认还款吗?", function(result) {
			if(result) {
				//top.jzts();
				var url = "<%=basePath%>cwProject/repayment.do?ID="+ID+"&tm="+new Date().getTime();
				$.get(url,function(data){
					if(data.code == 0) {
						top.jzts();
						setTimeout("self.location=self.location",1000);
					} else if(data.code == 1) {
						bootbox.alert('还款失败!');
					} else {
						bootbox.alert('操作失败!');
					}
				});

			}
		});
	}

	/*//新增
	function add(){
		top.jzts();
		var diag = new top.Dialog();
		diag.Drag=true;
		diag.Title ="新增";
		diag.URL = '<%=basePath%>project/goAdd.do';
		diag.Width = 550;
		diag.Height = 355;
		diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				if('${page.currentPage}' == '0'){
					top.jzts();
					setTimeout("self.location=self.location",100);
				}else{
					nextPage(${page.currentPage});
				}
			}
			diag.close();
		};
		diag.show();
	}*/

	function showDesr(str){
		bootbox.alert('3123123');
	}

	//修改状态
	function upd(Id) {
		bootbox.confirm("标的状态将被改为发布?", function(result) {
			if(result) {
				top.jzts();
				var url = "<%=basePath%>project/updateStatus.do?ID="+Id+"&tm="+new Date().getTime();
				$.get(url,function(data){
					nextPage(${page.currentPage});
				});
			}
		});
	}

	//删除
	function del(Id){
		bootbox.confirm("确定要删除吗?", function(result) {
			if(result) {
				top.jzts();
				var url = "<%=basePath%>project/deleteStatus.do?ID="+Id+"&tm="+new Date().getTime();
				$.get(url,function(data){
					nextPage(${page.currentPage});
				});
			}
		});
	}

	//修改
	function edit(Id){
		top.jzts();
		var diag = new top.Dialog();
		diag.Drag=true;
		diag.Title ="编辑";
		diag.URL = '<%=basePath%>project/goEdit.do?ID='+Id;
		diag.Width = 450;
		diag.Height = 355;
		diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				nextPage(${page.currentPage});
			}
			diag.close();
		};
		diag.show();
	}
</script>

<script type="text/javascript">

	$(function() {

		//下拉框
		$(".chzn-select").chosen();
		$(".chzn-select-deselect").chosen({allow_single_deselect:true});
		$('.date-picker').datepicker();

		//复选框
		$('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});

		});

	});


	//批量操作
	function makeAll(msg){
		bootbox.confirm(msg, function(result) {
			if(result) {
				var str = '';
				for(var i=0;i < document.getElementsByName('ids').length;i++)
				{
					if(document.getElementsByName('ids')[i].checked){
						if(str=='') str += document.getElementsByName('ids')[i].value;
						else str += ',' + document.getElementsByName('ids')[i].value;
					}
				}
				if(str==''){
					bootbox.dialog("您没有选择任何内容!",
							[
								{
									"label" : "关闭",
									"class" : "btn-small btn-success",
									"callback": function() {
										//Example.show("great success");
									}
								}
							]
					);

					$("#zcheckbox").tips({
						side:3,
						msg:'点这里全选',
						bg:'#AE81FF',
						time:8
					});

					return;
				}else{
					if(msg == '确定要删除选中的数据吗?'){
						top.jzts();
						$.ajax({
							type: "POST",
							url: '<%=basePath%>project/deleteAll.do?tm='+new Date().getTime(),
							data: {DATA_IDS:str},
							dataType:'json',
							//beforeSend: validateData,
							cache: false,
							success: function(data){
								$.each(data.list, function(i, list){
									nextPage(${page.currentPage});
								});
							}
						});
					}
				}
			}
		});
	}

	//导出excel
	function toExcel(){
		window.location.href='<%=basePath%>project/excel.do';
	}
</script>

</body>
</html>

