<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<style>
    #depart_toolbar {
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
    <div id="depart_toolbar">
        <a id="depart_add" href="javascript:void(0)" class="easyui-linkbutton"
           data-options="iconCls:'icon-add',plain:true">添加部门</a> <a
            id="depart_add_user" href="javascript:void(0)"
            class="easyui-linkbutton"
            data-options="iconCls:'icon-add',plain:true">添加人员</a><a
            id="user_edit" href="javascript:void(0)" class="easyui-linkbutton"
            data-options="iconCls:'icon-edit',plain:true">编辑</a> <a
            id="user_delete" href="javascript:void(0)" class="easyui-linkbutton"
            data-options="iconCls:'icon-remove',plain:true">删除</a> <a
            id="user_search" href="javascript:void(0)" class="easyui-linkbutton"
            data-options="iconCls:'icon-search',plain:true">搜索</a>
    </div>
    <div id="table">
        <table width="800" cellspacing="1" cellpadding="5" bgcolor="#DADADA"
               border="0"
               style="font-family: '宋体'; font-size: 18px; text-align: center; width: 85%;">
            <tr>
                <td colspan="4" bgcolor="#ffffff">基本信息</td>
            </tr>
            <tr>
                <td width="95" style="text-align: center;" bgcolor="#ffffff">部门Id号</td>
                <td width="140" bgcolor="#ffffff" colspan="3"></td>
            </tr>
            <tr>
                <td width="95" style="text-align: center;" bgcolor="#ffffff">部门简称</td>
                <td width="140" bgcolor="#ffffff"></td>
                <td width="60" style="text-align: center;" bgcolor="#ffffff">曾用名</td>
                <td width="120" bgcolor="#ffffff">vvv</td>
            </tr>

            <tr>
                <td width="60" style="text-align: center;" bgcolor="#ffffff">是否执法办</td>
                <td width="120" bgcolor="#ffffff">ccc</td>
                <td width="95" style="text-align: center;" bgcolor="#ffffff">是否启动</td>
                <td width="140" bgcolor="#ffffff">hhhh</td>
            </tr>

        </table>
    </div>
</div>
