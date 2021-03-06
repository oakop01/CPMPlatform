﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefRoleLimitLeft.aspx.cs" Inherits="EIS.Studio.SysFolder.Permission.DefRoleLimitLeft" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>角色权限设置</title>
     <link href="../../css/appstyle.css" rel="stylesheet" type="text/css" />    
     <link href="../../css/tree.css" rel="stylesheet" type="text/css" />
     <style type="text/css">
     	#tree
	    {
	        border:#c3daf9 1px solid;
	        background:#f9fafe;
	        padding:5px;
	        margin:5px;
	    }
     </style>    
	</head>
	<body>
		<form id="Form1" method="post" runat="server">
		<br />
        <div id="tree"> 
        </div>
        
    <script src="../../js/jquery-1.7.min.js" type="text/javascript"></script>
    <script src="../../js/jquery.tree.js" type="text/javascript"></script>
   
    <script type="text/javascript">
        var userAgent = window.navigator.userAgent.toLowerCase();
        $.browser.msie8 = $.browser.msie && /msie 8\.0/i.test(userAgent);
        $.browser.msie7 = $.browser.msie && /msie 7\.0/i.test(userAgent);
        $.browser.msie6 = !$.browser.msie8 && !$.browser.msie7 && $.browser.msie && /msie 6\.0/i.test(userAgent);
        <%=treedata %>;
        function load() {
            var o = {
                showcheck: false,
                onnodeclick: function (item) {
                    //var obj = EIS.Studio.Permission.DefRoleLimitLeft;
                    var d = new Date();
                    if (item.id.length == 36)
                        window.open("DefRoleLimitEdit.aspx?roleId=" + item.value + "&rolename=" + item.text + "&t=" + d.getMilliseconds(), "DefRoleLimMain");

                },
                blankpath: "../../Img/common/",
                cbiconpath: "../../Img/common/",
                url: "../Common/TreeData.ashx?queryid=rolebycatid"
            };
            o.data = treedata;
            $("#tree").treeview(o);

        }
        if ($.browser.msie6) {
            load();
        }
        else {
            $(document).ready(load);
        }
    </script>
		</form>
	</body>
</html>
