<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#depart_toolbar {
	padding-left: 45px;
	background: #E0ECFF;
}

#table {
	padding-top: 0px;
	padding-left: 50px;
	padding-left: 50px;
}
</style>
<div class="easyui-panel" data-options="fit:true,border:false">
	<div id="depart_toolbar">
		<a id="depart_add_depart" href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true">添加部门</a> <a
			id="depart_add_user" href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true">添加人员</a><a
			id="depart_edit" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit',plain:true">保存更新</a> <a
			id="depart_delete" href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>
	<div id="table">
		<form id="depart_table_fm">
			<table width="800" cellspacing="1" cellpadding="5" bgcolor="#DADADA"
				border="0"
				style="font-family: '宋体'; font-size: 18px; text-align: center; width: 85%;">
				<tr>
					<td colspan="4" bgcolor="#ffffff">基本信息</td>
				</tr>
				<tr>
					<td width="95" style="text-align: center;" bgcolor="#ffffff">唯一标识</td>
					<td width="400" bgcolor="#ffffff" colspan="3"><input
						name="departId1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center; width: 400px;width: 85%;"
						readOnly="true" value='${departId}'></td>
				</tr>
				<tr>
					<td width="95" style="text-align: center;" bgcolor="#ffffff">部门简称</td>
					<td width="140" bgcolor="#ffffff"><input
						name="departAbbreviation1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${departAbbreviation}'></td>
					<td width="60" style="text-align: center;" bgcolor="#ffffff">曾用名</td>
					<td width="120" bgcolor="#ffffff"><input name="departBeforeName1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${departBeforeName}'></td>
				</tr>

				<tr>
					<td width="60" style="text-align: center;" bgcolor="#ffffff">是否执法办</td>
					<td width="120" bgcolor="#ffffff"><input
						name="departCommisionOffic1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${departCommisionOffic}'></td>
					<td width="95" style="text-align: center;" bgcolor="#ffffff">是否启动</td>
					<td width="140" bgcolor="#ffffff"><input name="departEnable1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${departEnable}'></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 对话框:添加部门 -->
	<div id="depart_edit_dlg" class="easyui-dialog"
		style="padding: 0px 0px; width: 550px; height: 215px;"
		data-options="closed:true,buttons:'#depart_edit_dlg-buttons'">
		<form id="depart_edit_fm">
			<div id="depaert_edit_tabs" class="easyui-tabs">
				<div title="编辑部门信息">
					<table class="zooqi-frame-text" border="1"
						style="border-collapse: collapse; border: 2px solid #D6E3F4; margin-left: 3px; margin-right: 1px"
						cellspacing="35%" cellpadding="8">
						<tr>
							<td width="100" style="text-align: center;">父部门标识</td>
							<td width="100" colspan="3" style="text-align: center;"><input
								class="easyui-validatebox" name="departId"
								style="border: 0px; width: 300px" value='${departId}'></input></td>
						</tr>

						<tr>
							<td width="95" style="text-align: center;">部门简称</td>
							<td width="140" style="text-align: center;"><input
								class="easyui-validatebox" name="departAbbreviation"
								style="border: 0px; width: 130px"></input></td>
							<td width="60" style="text-align: center;">曾用名</td>
							<td width="120" style="text-align: center;"><input
								class="easyui-validatebox" name="departBeforeName"
								style="border: 0px; width: 130px"></input></td>
						</tr>

						<tr>
							<td width="60" style="text-align: center;">是否执法办</td>
							<td width="120" style="text-align: center;"><input
								class="easyui-validatebox" name="departCommisionOffic"
								style="border: 0px; width: 130px"></input></td>
							<td width="95" style="text-align: center;">是否启动</td>
							<td width="140" style="text-align: center;"><input
								class="easyui-validatebox" name="departEnable"
								style="border: 0px; width: 130px"></input></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	<!-- 按钮 -->
	<div id="depart_edit_dlg-buttons">
		<a id="depart_edit_submit_button" href="javascript:void(0)"
			class="easyui-linkbutton c6" data-options="iconCls:'icon-ok'"
			style="width: 90px">保存</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			onclick="javascript:$('#depart_edit_dlg').dialog('close');$('#depart_edit_fm').form('clear');"
			style="width: 90px">取消</a>
	</div>

	<!-- 添加用户 -->
	<div id="user_edit_dlg" class="easyui-dialog"
		style="padding: 0px 0px; width: 570px; height: 290px;"
		data-options="closed:true,buttons:'#user_edit_dlg-buttons'">
		<form id="user_edit_fm">
			<div id="user_edit_tabs" class="easyui-tabs">
				<div title="编辑用户信息">
					<table class="zooqi-frame-text" border="1"
						style="border-collapse: collapse; border: 2px solid #D6E3F4; margin-left: 3px; margin-right: 1px"
						cellspacing="35%" cellpadding="8">
						<tr>
							<td width="100" style="text-align: center;">父部门标识</td>
							<td width="100" colspan="3" style="text-align: center;"><input
								class="easyui-validatebox" name="departId"
								style="border: 0px; width: 300px" value='${departId}'></input></td>
						</tr>

						<tr>
							<td width="95" style="text-align: center;">用户简称</td>
							<td width="140" style="text-align: center;"><input
								class="easyui-validatebox" name="userAbbreviation"
								style="border: 0px; width: 130px"></input></td>
							<td width="60" style="text-align: center;">曾用名</td>
							<td width="120" style="text-align: center;"><input
								class="easyui-validatebox" name="usertBeforeName"
								style="border: 0px; width: 130px"></input></td>
						</tr>

						<tr>
							<td width="60" style="text-align: center;">登录名</td>
							<td width="120" style="text-align: center;"><input
								class="easyui-validatebox" name="userLoginName"
								style="border: 0px; width: 130px"></input></td>
							<td width="95" style="text-align: center;">中文名</td>
							<td width="140" style="text-align: center;"><input
								class="easyui-validatebox" name="userChineseName"
								style="border: 0px; width: 130px"></input></td>
						</tr>
						<tr>
							<td width="60" style="text-align: center;">学历</td>
							<td width="120" style="text-align: center;"><input
								class="easyui-validatebox" name="userEducation"
								style="border: 0px; width: 130px"></input></td>
							<td width="95" style="text-align: center;">职位</td>
							<td width="140" style="text-align: center;"><input
								class="easyui-validatebox" name="userPosition"
								style="border: 0px; width: 130px"></input></td>
						</tr>
						<tr>
							<td width="60" style="text-align: center;">年龄</td>
							<td width="120" style="text-align: center;"><input
								class="easyui-validatebox" name="userAge"
								style="border: 0px; width: 130px"></input></td>
							<td width="95" style="text-align: center;">性别</td>
							<td width="140" style="text-align: center;"><input
								class="easyui-validatebox" name="userSex"
								style="border: 0px; width: 130px"></input></td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	<!-- 按钮 -->
	<div id="user_edit_dlg-buttons">
		<a id="user_edit_submit_button" href="javascript:void(0)"
			class="easyui-linkbutton c6" data-options="iconCls:'icon-ok'"
			style="width: 90px">保存</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" data-options="iconCls:'icon-cancel'"
			onclick="javascript:$('#user_edit_dlg').dialog('close');$('#user_edit_fm').form('clear');"
			style="width: 90px">取消</a>
	</div>


	<script type="text/javascript">
		/* 删除部门 */
		$('#depart_delete').click(function() {
			$.messager.confirm('确认', '确认删除该部门吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'deleteDepart?departId=' + '${departId}',

					/*
					success : function(data) {
						if (data.success) {
							$.messager.alert('提示', '删除成功！');
						} else {
							$.messager.alert('提示', '删除失败，请稍后再试！');
						}
					},*/
					});
					$.messager.alert('提示', '删除成功！');
					//top.location.reload();
				}
			});
		});

		/* 保存部门 */
		$('#depart_add_depart').click(function() {
			$('#depart_edit_dlg').dialog('open').dialog('setTitle', '添加部门');

		});
		$('#depart_edit_dlg-buttons').click(function() {
			$.messager.confirm('确认', '确认添加吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'addDepart',
						data : $('#depart_edit_fm').serialize(),

					});
					$.messager.alert('提示', '保存成功！');
					$('#depart_edit_dlg').dialog('close');
					//top.location.reload();
				} else {
					$('#depart_edit_dlg').dialog('close');
				}
			});
		});

		/* 保存用户*/
		$('#depart_add_user').click(function() {
			$('#user_edit_dlg').dialog('open').dialog('setTitle', '添加部门');

		});
		$('#user_edit_dlg-buttons').click(function() {
			$.messager.confirm('确认', '确认添加吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'addUser',
						data : $('#user_edit_fm').serialize(),

					});
					$.messager.alert('提示', '保存成功！');
					$('#user_edit_dlg').dialog('close');
					//top.location.reload();
				} else {
					$('#user_edit_dlg').dialog('close');
				}
			});
		});

		/*更新部门信息*/
		$('#depart_edit').click(function() {
			$.messager.confirm('确认', '确认保存吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'updateDepart',
						data : $('#depart_table_fm').serialize()
					});
					$.messager.alert('提示', '保存成功！');
					//window.location.reload()
				} 
			});
		});

	</script>

</div>