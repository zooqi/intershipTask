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
			fontSize : "20px",
			fontCss : getFontCss
		},

		callback : {
			onClick : details,
			beforeAsync : beforeAsync,
			onAsyncSuccess : onAsyncSuccess,
			onAsyncError : onAsyncError
		}
	};

	/* 添加tab */
	function add_tab(id, title, url) {
		var index;
		var exists = false; //要添加的是否已存在
		var tabs = $('#tree_tabs').tabs('tabs');
		for (var i = 0; i < tabs.length; i++) {
			var tabId = tabs[i].panel('options').id;
			var tabIndex = $('#tree_tabs').tabs('getTabIndex', tabs[i]);
			if (id != tabId) {
				$('#tree_tabs').tabs('close', tabIndex);
			} else {
				index = tabIndex;
				exists = true;
			}
		}

		if (!exists) {
			$('#tree_tabs').tabs('add', {
				title : title,
				href : url,
				closeable : true,
				id : id
			})
		} else {
			$('#tree_tabs').tabs('getTab', index).panel('refresh', url);
		}
	}

	/* 点击显示详情 */
	function details(event, treeId, treeNode) {
		/* 如果是部门 */
		if (treeNode.isParent) {
			add_tab(treeNode.id, treeNode.name, 'getDepartId?departId='
					+ treeNode.id);
			return;
		}
		add_tab(treeNode.id, treeNode.name, 'getUserId?userId=' + treeNode.id);
	}

	function beforeAsync() {
		curAsyncCount++;
	}

	/* 异步加载成功  */
	function onAsyncSuccess(event, treeId, treeNode, msg) {
		curAsyncCount--;
		if (curStatus == "expand") {
			expandNodes(treeNode.children);
		}

		if (curAsyncCount <= 0) {
			if (curStatus != "init" && curStatus != "") {
				asyncForAll = true;
			}
			curStatus = "";
		}
	}

	function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus,
			errorThrown) {
		curAsyncCount--;

		if (curAsyncCount <= 0) {
			curStatus = "";
			if (treeNode != null)
				asyncForAll = true;
		}
	}

	var curStatus = "init", curAsyncCount = 0, asyncForAll = false, goAsync = false;
	function expandAll() {
		if (!check()) {
			return;
		}
		var zTree = $.fn.zTree.getZTreeObj("zTree");
		if (asyncForAll) {
			zTree.expandAll(true);
		} else {
			expandNodes(zTree.getNodes());
			if (!goAsync) {
				curStatus = "";
			}
		}
	}
	function expandNodes(nodes) {
		if (!nodes)
			return;
		curStatus = "expand";
		var zTree = $.fn.zTree.getZTreeObj("zTree");
		for (var i = 0, l = nodes.length; i < l; i++) {
			zTree.expandNode(nodes[i], true, false, false);
			if (nodes[i].isParent && nodes[i].zAsync) {
				expandNodes(nodes[i].children);
			} else {
				goAsync = true;
			}
		}
	}

	function reset() {
		if (!check()) {
			return;
		}
		asyncForAll = false;
		goAsync = false;
		$.fn.zTree.init($("#zTree"), setting);
	}

	function check() {
		if (curAsyncCount > 0) {
			return false;
		}
		return true;
	}

	// 搜索
	function focusKey(e) {
		if (key.hasClass("empty")) {
			key.removeClass("empty");
		}
	}
	function blurKey(e) {
		if (key.get(0).value === "") {
			key.addClass("empty");
		}
	}
	var lastValue = "", nodeList = [];
	function searchNode(e) {
		expandAll();
		var zTree = $.fn.zTree.getZTreeObj("zTree");
		var value = $.trim(key.get(0).value);
		var keyType = "name";

		if (key.hasClass("empty")) {
			value = "";
		}
		if (lastValue === value)
			return;
		lastValue = value;
		if (value === "")
			return;
		updateNodes(false);
		nodeList = zTree.getNodesByParamFuzzy(keyType, value);
		updateNodes(true);
	}
	function updateNodes(highlight) {
		var zTree = $.fn.zTree.getZTreeObj("zTree");
		for (var i = 0, l = nodeList.length; i < l; i++) {
			nodeList[i].highlight = highlight;
			zTree.updateNode(nodeList[i]);
		}
	}
	function getFontCss(treeId, treeNode) {
		return (!!treeNode.highlight) ? {
			color : "#E50027",
			"font-weight" : "bold"
		} : {
			color : "#333",
			"font-weight" : "normal"
		};
	}

	/* 刷新tabs */
	function updateTab(url) {
		var tab = $('#tree_tabs').tabs('getSelected');//获取当前选中tabs  
		var index = $('#tree_tabs').tabs('getTabIndex', tab);//获取当前选中tabs的index  
		$('#tree_tabs').tabs('getTab', index).panel('refresh', url);
	}

	/* 关闭tabs */
	function tabsClose() {
		var tab = $('#tree_tabs').tabs('getSelected');//获取当前选中tabs  
		var index = $('#tree_tabs').tabs('getTabIndex', tab);//获取当前选中tabs的index  
		$('#tree_tabs').tabs('close', index);//关闭对应index的tabs  
	}

	var key;
	$(document)
			.ready(
					function() {
						/* 初始化树 */
						$.fn.zTree.init($("#zTree"), setting);

						/* 绑定事件 */
						key = $("#tree_search_input");
						key.bind("focus", focusKey).bind("blur", blurKey).bind(
								"propertychange", searchNode).bind("input",
								searchNode);
					});
</script>
</head>

<body class="easyui-layout">

	<div data-options="region:'north',border:false,collapsible:false"
		style="width: 100%; margin: 0px; padding: 0px; background-color: #448CCA;">

		<div id="tree_time"
			style="float: right; font-size: 16px; color: #ffffff; margin: 20px;">
		</div>
		<script type="text/javascript">
			change();
			function change() {
				var today;
				today = new Date();
				document.getElementById("tree_time").innerHTML = today
						.toLocaleString();
				setTimeout("change();", 1000);
			}
		</script>
	</div>

	<div data-options="region:'west',title:'导航菜单',split:true"
		style="width: 180px;">
		<div id="tree_select" style="background: #E0ECFF">
			<table style="width: 99%;">
				<tr>
					<td><a id="tree_reload" href="javascript:void(0)"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-reload',plain:true"> </a></td>
					<td><a id="tree_expand" href="javascript:void(0)"
						class="easyui-linkbutton"
						data-options="iconCls:'icon-more',plain:true"> </a></td>
					<td><input id="tree_search_input" style="width: 95%;" /></td>

					<!--
                <td><a id="tree_search" href="javascript:void(0)" class="easyui-linkbutton"
                       data-options="iconCls:'icon-search',plain:true"></a></td>
                -->
				</tr>
			</table>
		</div>

		<ul id="zTree" class="ztree"></ul>
	</div>

	<div data-options="region:'center'" style="background: #eee;">
		<div id="tree_tabs" class="easyui-tabs" data-options="fit:true"></div>
	</div>

	<script type="text/javascript">
		$('#tree_reload').click(function() {
			reset();
		});
		$('#tree_expand').click(function() {
			expandAll();
		});
	</script>

</body>
</html>
