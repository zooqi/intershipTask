<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>登录系统</title>
<link href="easyui/themes/default/easyui.css" rel="stylesheet" />
<link href="easyui/themes/icon.css" rel="stylesheet" />
<link href="zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">

<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="zTree/js/jquery.ztree.all.min.js"></script>
<script type="text/javascript">
	var setting = {
		async : {
			enable : true,
			url : "tree",
			autoParam : [ "id" ]
		},

		view : {
			fontSize : "20px"
		},

		callback : {
			onClick : details
		}
	};

	/* 加载树 */
	$(document).ready(function() {
		$.fn.zTree.init($("#tree"), setting);
	});

	/* 显示tab */
	function add_tab(title, url) {
		if (!$('#tabs').tabs('exists', title)) {
			$('#tabs').tabs('add', {
				title : title,
				href : url,
				closable : true
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
			//add_tab(treeNode.name, 'depart.jsp?id=' + treeNode.id);
			add_tab(treeNode.name,'getDepartId?departId='+treeNode.id)
			return;
		}
		//add_tab(treeNode.name, 'user.jsp?id=' + treeNode.id);
		add_tab(treeNode.name,'getUserId?userId='+treeNode.id)
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

	<div data-options="region:'west',title:'导航菜单',split:true"
		style="width: 180px;">
		<div id="select" style="background: #E0ECFF">
			<table style="width: 99%;">
				<tr>
					<td><a href="javascript:void(0)" class="easyui-linkbutton"
						data-options="iconCls:'icon-search',plain:true"> </a></td>
					<td><input style="width: 100%"></input></td>
					<td><a id="reload" href="javascript:void(0)"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-reload',plain:true"></a></td>
				</tr>
			</table>
		</div>

		<ul id="tree" class="ztree"></ul>
	</div>

	<div data-options="region:'center'" style="background: #eee;">
		<div id="tabs" class="easyui-tabs" data-options="fit:true"></div>
	</div>
	<script type="text/javascript">
		/* 显示所有 */
		$('#reload').click(function() {
			window.location.reload();
		});
	</script>
</body>
</html>
