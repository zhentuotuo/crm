<%--
  Created by IntelliJ IDEA.
  User: yt
  Date: 2022-02-18
  Time: 16:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>精翼管理系统</title>
    <link rel="shortcut icon" href="../assets/ico/favicon.png">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!-- Bootstrap Styles-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Morris Chart Styles-->
    <link href="../assets/js/morris/morris-0.4.3.min.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="../assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="../assets/js/Lightweight-Chart/cssCharts.css">
    <link href="../assets/css/main.css" rel="stylesheet">
</head>

<body>
<div id="wrapper">
    <c:import url="/jsp/iframe.jsp"></c:import>
    <div id="test"></div>
    <div id="dialog" class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <a id="closea" class="glyphicon glyphicon-remove" style="float: right"></a>
                </div>
            </div>
            <div class="row">
                <form class="form-inline" action="${pageContext.request.contextPath}/jsp/employ.do" method="get" style="text-align: left;">
                    <input type="hidden" id="method" name="method" value="add">
                    <input type="hidden" id="eid" name="eid" value="">
                    <div class="form-group col-md-12">
                        <div class="col-md-12">
                            <label for="ename">员工姓名</label>
                            <input type="text" class="form-control" name="ename" id="ename" placeholder="">
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <div class="col-md-12">
                            <label for="epwd">员工密码</label>
                            <input type="text" class="form-control" id="epwd" name="epwd" placeholder="">
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <div class="col-md-12">
                            <label for="edepa">所属部门</label>
                            <select name="edepa" id="edepa" class="form-control">
                                <option selected value="0">请选择</option>
                                <option value="1">软件部</option>
                                <option value="2">机械部</option>
                                <option value="3">电气部</option>
                                <option value="4">电子部</option>
                                <option value="5">行政部</option>
                                <option value="6">生产部</option>
                                <option value="7">工程部</option>
                                <option value="8">销售部</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <div class="col-md-12">
                            <label for="eregi">销售区域</label>
                            <select name="eregi" id="eregi" class="form-control">
                                <option selected value="0">请选择</option>
                                <option value="1">中西南大区经理</option>
                                <option value="2">东区经理</option>
                                <option value="3">西北区经理</option>
                                <option value="4">南部区经理</option>
                                <option value="5">东北区经理</option>
                            </select>
                            <label>* 销售和工程人员请选择</label>
                        </div>
                    </div>
                    <div class="form-group col-md-12">
                        <div class="col-md-12">
                            <label for="epost">所属职务</label>
                            <select name="epost" id="epost" class="form-control">
                                <option selected value="0">请选择</option>
                                <option value="1">员工</option>
                                <option value="2">经理</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <p style="margin-top: 20px">
                            <button id="#tj" type="submit" class="btn btn-success col-md-2 col-md-offset-3">提交</button>
                            <button type="reset" class="btn btn-warning col-md-2 col-md-offset-2">取消</button>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /. NAV SIDE  -->
<div id="page-wrapper">
    <div class="header">
        <h1 class="page-header">
        </h1>
    </div>

    <div id="page-inner">
        <div class="row">
            <div class="col-md-12">
                <button id="btn" type="button" class="btn btn-success" style="float: right">添加员工</button>
            </div>
            <div class="col-md-12">
                <!-- Advanced Tables -->
                <div class="card">
                    <div class="card-content">
                        <div class="table-responsive">
                            <table id="example" class="table table-striped table-bordered table-hover dataTables"
                                   aria-describedby="dataTables-example_info">
                                <thead>
                                <tr>
                                    <th>序列号</th>
                                    <th>姓名</th>
                                    <th>密码</th>
                                    <th>部门</th>
                                    <th>职务</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>


</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../assets/js/jquery-1.10.2.js"></script>

<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>

<script src="../assets/materialize/js/materialize.min.js"></script>

<!-- Metis Menu Js -->
<script src="../assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="../assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="../assets/js/morris/morris.js"></script>


<script src="../assets/js/easypiechart.js"></script>
<script src="../assets/js/easypiechart-data.js"></script>

<script src="../assets/js/Lightweight-Chart/jquery.chart.js"></script>

<!-- Custom Js -->
<script charset="utf-8" src="../assets/js/dataTables/jquery.dataTables.js"></script>
<script charset="utf-8" src="../assets/js/dataTables/dataTables.bootstrap.js"></script>
<!-- Custom Js -->
<script src="../assets/js/custom-scripts.js"></script>
<script src="../assets/js/common.js"></script>
<script>
    $(document).ready(function () {
        var tables=$('#example').DataTable({
            "bProcessing" : true,
            'bStateSave': true,
            "ajax": {
                "url": "../jsp/employ.do",
                "dataSrc": ""
            },
            'columns': [
                {'data': 'id'},
                {'data': 'emplName'},
                {'data': 'emplPwd'},
                {'data': 'emplDepa',
                    render: function (data, type, row) {
                        switch (data) {
                            case 1:
                                return "软件部";
                            case 2:
                                return "机械部";
                            case 3:
                                return "电气部";
                            case 4:
                                return "电子部";
                            case 5:
                                return "行政部";
                            case 6:
                                return "生产部";
                            case 7:
                                return "工程部";
                            case 8:
                                return "销售部";

                            default:
                                "请选择";
                        }
                    }
                },
                {
                    'data': 'emplPost',
                    render: function (data, type, row) {
                        switch (data) {
                            case 1:
                                return "员工";
                            case 2:
                                return "经理";
                            default:
                                "请选择";
                        }
                    }
                },
            ],
            "columnDefs": [{
                "targets": 5,//操作按钮目标列
                "data": null,
                "defaultContent": "<button id='selerow' class='btn btn-info' type='button' style='margin-right:10px;'>查看</button><button id='editrow' class='btn btn-primary' type='button' style='margin-right:10px;'>编辑</button><button id='delrow' class='btn btn-danger' type='button'>删除</button>"
            }]
        });
        $('#example tbody').on( 'click', 'button#selerow', function () {
            alert("sele")
        });
        $('#example tbody').on( 'click', 'button#editrow', function () {
            var data = tables.row( $(this).parents('tr') ).data();
            $("#eid").val(data.id);
            $("#ename").val(data.emplName);
            $("#epwd").val(data.emplPwd);
            $("#edepa").val(data.emplDepa);
            $("#eregi").val(data.emplRegion);
            $("#epost").val(data.emplPost);
            $("#method").val("upde");
            shield("upde");
        });
        $('#example tbody').on( 'click', 'button#delrow', function () {
            var data = tables.row( $(this).parents('tr') ).data();
            if(confirm("是否确认删除这条信息")){
                $.ajax({
                    url:'${pageContext.request.contextPath}/jsp/employ.do',
                    data:{id:data.id,method:"dele"},
                    timeout:"3000",
                    cache:"false",
                    success:function(str){
                        if(str.data){
                            tables.row().remove();
                            window.location.reload();
                        }
                    },
                    error:function(err){
                        alert("获取数据失败");
                    }
                });
            }
        });

        $('#btn').click(function () {
            shield("add")
        });
        $('#closea').click(function () {
            canceldialog()
        });
        function shield(x) {
            if(x=="add"){
                $("#ename").val("");
                $("#epwd").val("");
                $("#edepa").val(0);
                $("#eregi").val(0);
                $("#epost").val(0);
            }
            var s = document.getElementById("test");
            s.style.display = "block";

            var l = document.getElementById("dialog");
            l.style.display = "block";
        };

        function canceldialog() {
            var s = document.getElementById("test");
            s.style.display = "none";

            var l = document.getElementById("dialog");
            l.style.display = "none";
        }
    });
</script>

</div>

</body>

</html>
