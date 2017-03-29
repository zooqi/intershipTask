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
			data-options="iconCls:'icon-remove',plain:true">删除部门</a>
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
						name="departId1" id="depart_departId"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center; width: 400px; width: 85%;"
						readOnly="true" value='${depart.departId}'></td>
				</tr>
				<tr>
					<td width="95" style="text-align: center;" bgcolor="#ffffff">部门简称</td>
					<td width="140" bgcolor="#ffffff"><input
						name="departAbbreviation1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${depart.departAbbreviation}'></td>
					<td width="95" style="text-align: center;" bgcolor="#ffffff">是否一级部门</td>
					<td width="140" bgcolor="#ffffff"><input name="departMain1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${depart.departMain}'></td>
				</tr>
				<tr>
					<td width="95" style="text-align: center;" bgcolor="#ffffff">中文名</td>
					<td width="140" bgcolor="#ffffff"><input
						name="departChineseName1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${depart.departChineseName}'></td>
					<td width="60" style="text-align: center;" bgcolor="#ffffff">曾用名</td>
					<td width="120" bgcolor="#ffffff"><input
						name="departBeforeName1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${depart.departBeforeName}'></td>
				</tr>
				<tr>
					<td width="60" style="text-align: center;" bgcolor="#ffffff">是否执法办</td>
					<td width="120" bgcolor="#ffffff"><input
						name="departCommisionOffic1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${depart.departCommisionOffic}'></td>
					<td width="95" style="text-align: center;" bgcolor="#ffffff">是否启动</td>
					<td width="140" bgcolor="#ffffff"><input name="departEnable1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${depart.departEnable}'></td>
				</tr>
				<tr>
					<td width="95" style="text-align: center;" bgcolor="#ffffff">排列序号</td>
					<td width="140" bgcolor="#ffffff"><input
						name="departArrayNumber1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${depart.departArrayNumber}'></td>
					<td width="95" style="text-align: center;" bgcolor="#ffffff">是否删除</td>
					<td width="140" bgcolor="#ffffff"><input name="departDelete1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${depart.departDelete}'></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- 对话框:添加部门 -->
	<div id="depart_edit_dlg" class="easyui-dialog"
		style="padding: 0px 0px; width: 550px; height: 270px;"
		data-options="closed:true,buttons:'#depart_edit_dlg-buttons'">
		<form id="depart_edit_fm">
			<div id="depaert_edit_tabs" class="easyui-tabs">
				<div title="编辑部门信息">
					<table class="zooqi-frame-text" border="1"
						style="border-collapse: collapse; border: 2px solid #D6E3F4; margin-left: 3px; margin-right: 1px"
						cellspacing="35%" cellpadding="8">
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
							<td width="60" style="text-align: center;">部门中文名</td>
							<td width="120" style="text-align: center;"><input
								class="easyui-validatebox" name="departChineseName"
								style="border: 0px; width: 130px"></input></td>
							<td width="60" style="text-align: center;">是否一级部门</td>
							<td width="120" style="text-align: center;"><select
								class="easyui-combobox" name="departMain"
								data-options="validType:'length[0,32]'"
								style="width: 144px; height: 23px">
									<option value="   "></option>
									<option value="true">true</option>
									<option value="false">false</option>
							</select></td>
						</tr>
						<tr>
							<td width="60" style="text-align: center;">是否删除</td>
							<td width="120" style="text-align: center;"><select
								class="easyui-combobox" name="departDelete"
								data-options="validType:'length[0,32]'"
								style="width: 144px; height: 23px">
									<option value="   "></option>
									<option value="true">true</option>
									<option value="false">false</option>
							</select></td>
							<td width="60" style="text-align: center;">是否执法办</td>
							<td width="120" style="text-align: center;"><select
								class="easyui-combobox" name="departCommisionOffic"
								data-options="validType:'length[0,32]'"
								style="width: 144px; height: 23px">
									<option value="   "></option>
									<option value="true">true</option>
									<option value="false">false</option>
							</select></td>
						</tr>
						<tr>
							<td width="60" style="text-align: center;">排列序号</td>
							<td width="120" style="text-align: center;"><input
								class="easyui-validatebox" name="departArrayNumber"
								style="border: 0px; width: 130px"></input></td>
							<td width="95" style="text-align: center;">是否启动</td>
							<td width="140" style="text-align: center;"><select
								class="easyui-combobox" name="departEnable"
								data-options="validType:'length[0,32]'"
								style="width: 144px; height: 23px">
									<option value="   "></option>
									<option value="true">true</option>
									<option value="false">false</option>
							</select></td>
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
			onclick="javascript:$('#depart_edit_dlg').dialog('close');"
			style="width: 90px">取消</a>
	</div>

	<!-- 添加用户 -->
	<div id="user_edit_dlg" class="easyui-dialog"
		style="padding: 0px 0px; width: 570px; height: 265px;"
		data-options="closed:true,buttons:'#user_edit_dlg-buttons'">
		<form id="user_edit_fm">
			<div id="user_edit_tabs" class="easyui-tabs">
				<div title="编辑用户信息">
					<table class="zooqi-frame-text" border="1"
						style="border-collapse: collapse; border: 2px solid #D6E3F4; margin-left: 3px; margin-right: 1px"
						cellspacing="35%" cellpadding="8">
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
							<td width="60" style="text-align: center;">最高学历</td>
							<td width="120" style="text-align: center;"><select
								class="easyui-combobox" name="userEducation"
								data-options="validType:'length[0,32]'"
								style="width: 144px; height: 23px">
									<option value="   "></option>
									<option value="中专">中专</option>
									<option value="大专">大专</option>
									<option value="本科">本科</option>
									<option value="硕士">硕士</option>
									<option value="博士">博士</option>
									<option value="其他">其他</option>
							</select></td>
							<td width="95" style="text-align: center;">用户职位</td>
							<td width="140" style="text-align: center;"><input
								class="easyui-validatebox" name="userPosition"
								style="border: 0px; width: 130px"></input></td>
						</tr>
						<tr>
							<td width="60" style="text-align: center;">用户年龄</td>
							<td width="120" style="text-align: center;"><input
								class="easyui-validatebox" name="userAge"
								style="border: 0px; width: 130px"></input></td>
							<td width="95" style="text-align: center;">用户性别</td>
							<td width="140" style="text-align: center;"><select
								class="easyui-combobox" name="userSex"
								data-options="validType:'length[0,32]'"
								style="width: 144px; height: 23px">
									<option value="   "></option>
									<option value="男">男</option>
									<option value="女">女</option>
							</select></td>
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
			onclick="javascript:$('#user_edit_dlg').dialog('close');"
			style="width: 90px">取消</a>
	</div>


	<script type="text/javascript">
		/* 删除部门 */
		$('#depart_delete').click(function() {
			$.messager.confirm('确认', '确认删除吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'deleteDepart',
						data : {
							departId : '${depart.departId}'
						},
						success : function(data) {
							if (data.success) {
								$.messager.alert('提示', '删除成功！');
								reset();
								setTimeout("expandAll();", 500);
							} else {
								$.messager.alert('提示', '删除失败，请稍后再试！');
							}
						},
					});
				}
			});
		});

		
		/* 保存部门 */
		$('#depart_add_depart').click(function() {
			$('#depart_edit_dlg').dialog('open').dialog('setTitle', '添加部门');
		});
		$('#depart_edit_submit_button').click(function() {
			$.messager.confirm('确认', '确认保存吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'addDepart?departId=' + $('#depart_departId').val(),
						data : $('#depart_edit_fm').serialize(),
						success : function(data) {
							if (data.success) {
								$.messager.alert('提示', '保存成功！');
								$('#depart_edit_dlg').dialog('close');
								reset();
								setTimeout("expandAll();", 500);
							} else {
								$.messager.alert('提示', '保存失败，请稍后再试！');
							}
						},
					});
				} else {
					$('#depart_edit_dlg').dialog('close');
				}
				$('#depart_edit_fm').form('clear');
			});
		});

		/* 保存用户 */
		$('#depart_add_user').click(function() {
			$('#user_edit_dlg').dialog('open').dialog('setTitle', '添加用户');
		});
		$('#user_edit_submit_button').click(function() {
			$.messager.confirm('确认', '确认保存吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'addUser?departId=' + $('#depart_departId').val(),
						data : $('#user_edit_fm').serialize(),
						success : function(data) {
							if (data.success) {
								$.messager.alert('提示', '保存成功！');
								$('#user_edit_dlg').dialog('close');
								reset();
								setTimeout("expandAll();", 500);
							} else {
								$.messager.alert('提示', '保存失败，请稍后再试！');
							}
						},
					});
				} else {
					$('#user_edit_dlg').dialog('close');
				}
				$("#user_edit_fm").form('clear');
			});
		});

		/*更新部门信息*/
		$('#depart_edit').click(function() {
			$.messager.confirm('确认', '确认保存吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'updateDepart',
						data : $('#depart_table_fm').serialize(),
						success : function(data) {
							if (data.success) {
								$.messager.alert('提示', '保存成功！');
								$('#depart_edit_dlg').dialog('close');
							} else {
								$.messager.alert('提示', '保存失败，请稍后再试！');
							}
						},
					});
				}
				$("#depart_edit_fm").form('clear');
			});
		});
	</script>
</div>