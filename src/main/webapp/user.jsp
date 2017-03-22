<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
        <a id="user_add" href="javascript:void(0)" class="easyui-linkbutton"
           data-options="iconCls:'icon-add',plain:true">添加</a> <a id="user_edit"
                                                                  href="javascript:void(0)" class="easyui-linkbutton"
                                                                  data-options="iconCls:'icon-edit',plain:true">编辑</a>
        <a
                id="user_delete" href="javascript:void(0)" class="easyui-linkbutton"
                data-options="iconCls:'icon-remove',plain:true">删除</a> <a
            id="user_search" href="javascript:void(0)" class="easyui-linkbutton"
            data-options="iconCls:'icon-search',plain:true">搜索</a>
    </div>
    <div id="table">
        <table width="800" cellspacing="1" cellpadding="5" bgcolor="#DADADA" border="0"
               style="font-family: '宋体'; font-size: 18px; text-align: center;width:85%">
            <tr>
                <td colspan="4" bgcolor="#ffffff">基本信息</td>
            </tr>
            <tr>
                <td width="95" style="text-align: center;" bgcolor="#ffffff">用户Id号</td>
                <td width="140" bgcolor="#ffffff" colspan="3"></td>
            </tr>
            <tr>
                <td width="95" style="text-align: center;" bgcolor="#ffffff">登录名</td>
                <td width="140" bgcolor="#ffffff"></td>
                <td width="60" style="text-align: center;" bgcolor="#ffffff">曾用名</td>
                <td width="120" bgcolor="#ffffff">vvv</td>
            </tr>

            <tr>
                <td width="60" style="text-align: center;" bgcolor="#ffffff">中文名</td>
                <td width="120" bgcolor="#ffffff">ccc</td>
                <td width="95" style="text-align: center;" bgcolor="#ffffff">年龄</td>
                <td width="140" bgcolor="#ffffff">hhhh</td>
            </tr>
            <tr>
                <td width="60" style="text-align: center;" bgcolor="#ffffff">性别</td>
                <td width="120" bgcolor="#ffffff"></td>

                <td width="60" style="text-align: center;" bgcolor="#ffffff">职务</td>
                <td width="120" bgcolor="#ffffff"></td>
            </tr>
            <tr>
                <td width="95" style="text-align: center;" bgcolor="#ffffff">学历</td>
                <td width="140" bgcolor="#ffffff">看看</td>

                <td width="60" style="text-align: center;" bgcolor="#ffffff">职称</td>
                <td width="120" bgcolor="#ffffff"></td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">

    </script>
</div>
