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
    <link rel="stylesheet" href="../assets/materialize/css/materialize.min.css" media="screen,projection"/>
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
<style>
    #dialog {
        width: 970px;
        height: 450px;
        background-color: #ffffff;
        border-radius: 10px;
        margin: auto;
        position: absolute;
        z-index: 3;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        display: none;
    }
</style>
<body>
<div id="wrapper">
    <c:import url="/jsp/iframed.jsp"></c:import>
    <div id="test"></div>
    <div id="dialog" class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-12">
                    <a id="closea" class="glyphicon glyphicon-remove" style="float: right"></a>
                </div>
            </div>
            <div class="row">
                <form class="form-inline" action="${pageContext.request.contextPath}/jsp/journal.do" method="post" style="text-align: left;">
                    <input type="hidden" id="method" name="method" value="add">
                    <input type="hidden" id="eid" name="eid" value="">
                    <div class="form-group col-md-12">
                        <div class="col-md-4">
                            <p style="text-align: center">今天工作内容</p>
                            <textarea style="width: 450px; height: 250px; resize: none" wrap="physical" class="form-control" id="today" name="today"></textarea>
                        </div>
                        <div class="col-md-4 col-lg-offset-2">
                            <p style="text-align: center">明天工作计划</p>
                            <textarea style="width: 450px; height: 250px; resize: none" wrap="physical" class="form-control" id="tomo" name="tomo"></textarea>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <p style="margin-top: 20px">
                            <button type="submit" class="btn btn-success col-md-2 col-md-offset-3">提交</button>
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
                <button id="btn" type="button" class="btn btn-success" style="float: right">添加日志</button>
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
                                    <th>今天工作内容</th>
                                    <th>明天工作计划</th>
                                    <th>时间</th>
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

<script>
    $(document).ready(function () {
/*        var tables=$('#example').DataTable({
            "bProcessing" : true,
            'bStateSave': true,
            "ajax": {
                "url": "../jsp/journal.do",
                "dataSrc": ""
            },
            'columns': [
                {'data': 'id'},
                {'data': 'todaywork'},
                {'data': 'tomowork'},
                {'data': 'datetimes'}
            ],
            "columnDefs": [{
                "targets": 5,//操作按钮目标列
                "data": null,
                "defaultContent": "<button id='selerow' class='btn btn-info' type='button' style='margin-right:10px;'>查看</button><button id='editrow' class='btn btn-primary' type='button' style='margin-right:10px;'>编辑</button>"
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
        });*/

        $('#btn').click(function () {
            shield("add")
        });
        $('#closea').click(function () {
            canceldialog()
        });
        function shield(x) {
            if(x=="add"){
                $("#today").val("");
                $("#tomo").val("");
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
</body>

</html>