<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#user_toolbar {
	padding-left: 50px;
	background: #E0ECFF;
}

#table {
	padding-top: 0px;
	padding-left: 50px;
	padding-left: 50px;
}
</style>
<div class="easyui-panel" data-options="fit:true,border:false">
	<div id="user_toolbar">
		<a id="user_edit"
			href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-edit',plain:true">保存更新</a> <a
			id="user_delete" href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true">删除</a> 
	</div>
	<div id="table">
		<form id="user_table_fm">
		<table width="800" cellspacing="1" cellpadding="5" bgcolor="#DADADA"
			border="0"
			style="font-family: '宋体'; font-size: 18px; text-align: center; width: 85%">
			<tr>
				<td colspan="4" bgcolor="#ffffff">基本信息</td>
			</tr>
			<tr>
				<td width="95" style="text-align: center;" bgcolor="#ffffff">用户Id号</td>
				<td width="140" bgcolor="#ffffff" colspan="3">
					<input
						name="userId1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center; width: 400px;width: 85%;"
						readOnly="true" value='${userId}'/>
				</td>
			</tr>
			<tr>
				<td width="95" style="text-align: center;" bgcolor="#ffffff">用户简称</td>
				<td width="140" bgcolor="#ffffff">
					<input name="userAbbreviation1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${userAbbreviation}' />
				</td>
				<td width="60" style="text-align: center;" bgcolor="#ffffff">曾用名</td>
				<td width="120" bgcolor="#ffffff">
					<input name="userBeforeName1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${userBeforeName}' />
				</td>
			</tr>

			<tr>
				<td width="60" style="text-align: center;" bgcolor="#ffffff">中文名</td>
				<td width="120" bgcolor="#ffffff">
					<input name="userChineseName1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${userChineseName}' />
				</td>
				<td width="95" style="text-align: center;" bgcolor="#ffffff">年龄</td>
				<td width="140" bgcolor="#ffffff">
					<input name="userAge1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${userAge}' />
				</td>
			</tr>
			<tr>
				<td width="60" style="text-align: center;" bgcolor="#ffffff">性别</td>
				<td width="120" bgcolor="#ffffff">
					<input name="userChineseName1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${userSex}' />
				</td>

				<td width="60" style="text-align: center;" bgcolor="#ffffff">职务</td>
				<td width="120" bgcolor="#ffffff">
					<input name="userChineseName1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${userPosition}' />
				</td>
			</tr>
			<tr>
				<td width="95" style="text-align: center;" bgcolor="#ffffff">学历</td>
				<td width="140" bgcolor="#ffffff">
					<input name="userChineseName1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${userEduction}' />
				</td>

				<td width="60" style="text-align: center;" bgcolor="#ffffff">职称</td>
				<td width="120" bgcolor="#ffffff">
					<input name="userChineseName1"
						style="border: 0px; font-family: '宋体'; font-size: 18px; text-align: center;"
						value='${userTitle}' />
				</td>
			</tr>
		</table>
		</form>
	</div>
	<script type="text/javascript">
		/* 删除用户 */
		$('#user_delete').click(function() {
			alert('${userId}');
			$.messager.confirm('确认', '确认删除该用户吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'deleteUser?userId=' + '${userId}',

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
					top.location.reload();
				}
			});
		});
		
		/*更新用户信息*/
		$('#user_edit').click(function() {
			$.messager.confirm('确认', '确认保存吗？', function(r) {
				if (r) {
					$.ajax({
						type : 'POST',
						url : 'updateUser',
						data : $('#user_table_fm').serialize()
					});
					$.messager.alert('提示', '保存成功！');
					//window.location.reload()
				} 
			});
		});
	</script>
</div>
