<%@ page language="java" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>登录系统</title>
    <link href="easyui/themes/default/easyui.css" rel="stylesheet"/>
    <link href="easyui/themes/icon.css" rel="stylesheet"/>
    <link href="zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">

    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="zTree/js/jquery.ztree.all.min.js"></script>
    <script type="text/javascript">
        var setting = {
            async: {
                enable: true,
                url: "tree",
                autoParam: ["id"]
            },

            callback: {
                onClick: details
            }
        };

        /* 加载树 */
        $(document).ready(function () {
            $.fn.zTree.init($("#tree"), setting);
        });

        /* 显示tab */
        function add_tab(title, url) {
            if (!$('#tabs').tabs('exists', title)) {
                $('#tabs').tabs('add', {
                    title: title,
                    href: url,
                    closable: true
                });
            } else {
                $('#tabs').tabs('select', title);
                var tab = $('#tabs').tabs('getSelected');
                tab.panel('refresh', url);
            }
        }

        /* 点击显示详情 */
        function details(event, treeId, treeNode) {
            /* 如果是部门 */
            if (treeNode.isParent) {
                add_tab(treeNode.name, 'depart.jsp?id=' + treeNode.id);
                return;
            }
            add_tab(treeNode.name, 'user.jsp?id=' + treeNode.id);
        }
    </script>
</head>

<body class="easyui-layout">

<div data-options="region:'north',border:false,collapsible:false"
     style="width: 100%; margin: 0px; padding: 0px; background-color: #448CCA;">

    <div id="time"
         style="float: right; font-size: 16px; color: #ffffff; margin: 20px;">
    </div>
    <script type="text/javascript">
        change();
        function change() {
            var today;
            today = new Date();
            timeString = today.toLocaleString();
            document.getElementById("time").innerHTML = timeString;
            setTimeout("change();", 1000);
        }
    </script>
</div>

<!-- left -->
<!-- fit 自适应父容器，如果设置为true当使用body创建布局的时候，页面会自动最大,默认为false -->
<div data-options="region:'west',title:'导航菜单',split:true"
     style="width: 180px;">
    <ul id="tree" class="ztree"></ul>
</div>

<!--
<div class="easyui-tabs"
     data-options="region:'center',fit:true,border:false" id="tabs">
    <div title="首页" style="padding: 5px; display: block;"></div>
</div>
-->

<div data-options="region:'center'" style="background: #eee;">
    <div id="tabs" class="easyui-tabs" data-options="fit:true"></div>
</div>

</body>
</html>
