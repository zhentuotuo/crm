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
</head>
<style>

</style>
<body>
<div id="wrapper">
    <c:import url="/jsp/iframed.jsp"></c:import>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div class="header">
            <h1 class="page-header">
            </h1>
        </div>

        <div id="page-inner">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-action">
                            我的信息
                        </div>
                        <div class="card-content">
                            <form class="col s12" action="${pageContext.request.contextPath}/jsp/details.do" method="post">
                                <input type="hidden" id="method" name="method" value="add">
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input id="uname" name="uname" type="text" class="validate">
                                        <label for="uname"></label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="phone" name="phone"  type="text" class="validate">
                                        <label for="phone"></label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <select id="educ" name="educ" class="form-control">
                                            <option selected value="0">学历</option>
                                            <option value="1">高中</option>
                                            <option value="2">大专</option>
                                            <option value="3">研究生</option>
                                            <option value="4">学士</option>
                                        </select>
                                    </div>
                                    <div class="input-field col s6">
                                        <input name="mari" type="radio" id="mari1" value="1"/>
                                        <label for="mari1">未婚</label>
                                        <input name="mari" type="radio" id="mari2" value="2"/>
                                        <label for="mari2">已婚</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <button id="btn" type="submit" class="btn btn-success" style="float: right">确 定</button>
                                    </div>
                                </div>
                            </form>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>
            </div>
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
    <script>
        $(function () {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/jsp/details.do",
                data:{"method":"sele"},
                dataType:"json",
                success:function(result){
                    for(var i=0;i<result.length;i++){
                        $("#uname").val(result[i].uname);
                        $("#phone").val(result[i].uphone);
                        $("#educ").val(result[i].educ);
                        if(result[i].mari==1){
                            $("#mari1").attr("checked",true);
                        }else {
                            $("#mari2").attr("checked",true);
                        }
                    }
                }
            })
        })
    </script>

</div>

</body>

</html>