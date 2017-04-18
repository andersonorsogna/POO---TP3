<%@page import="java.text.DecimalFormat"%>;

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>Sistema de Amortização Americano</title>
        <!-- BOOTSTRAP CORE STYLE CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONTAWESOME STYLE CSS -->
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLE CSS -->
        <link href="assets/css/style.css" rel="stylesheet" />    
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    </head>    
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <br/><br/><br/>

        <div class="container" style="align-content: center">
            <h2>Sistema de Amortização Americano</h2>
            <hr/>
            <%
                int p = 0;
                try {
                    p = Integer.parseInt(request.getParameter("p"));
                } catch (Exception e) {
                }
                float v = 0;
                try {
                    v = Float.parseFloat(request.getParameter("v"));
                } catch (Exception e) {
                }
                float j = 0;
                try {
                    j = Float.parseFloat(request.getParameter("j"));
                } catch (Exception e) {
                }
                DecimalFormat cv = new DecimalFormat("#0.00");
                DecimalFormat cj = new DecimalFormat("#0.00");
            %>

            <div class="fundo container">
                <br/>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="p" class="col-sm-2 control-label">Período(meses)</label>
                        <div class="col-sm-2">
                            <input class="form-control" type="number" name="p" placeholder="ex: 12"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="v" class="col-sm-2 control-label">Valor(R$)</label>
                        <div class="col-sm-2">
                            <div class="input-group">
                                <div class="input-group-addon">$</div>
                                <input class="form-control" type="number" step="0.01" name="v" placeholder="ex: 12000,67"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="j" class="col-sm-2 control-label">Juros(%a.m.)</label>
                        <div class="col-sm-2">
                                <input class="form-control" type="number" step="0.01" name="j" placeholder="ex: 12,5"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-success">Gerar</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="container">
                <h2>Resultado:</h2>
                <div class="row">
                    <div class="col-sm-6">
                        <table class="table">
                            <tr>
                                <th>Mês</th>
                                <th>Saldo Devedor (R$)</th>
                                <th>Amortização (R$)</th>
                                <th>Juros (R$)</th>
                            </tr>
                            <%for (int i = 0; i <= p; i++) {%>
                            <tr>
                                <td><%=i%></td>
                                <%if (i == p) {
                                        out.println("<td>" + cv.format(0) + "</td>");
                                    } else {
                                        out.println("<td>" + cv.format(v) + "</td>");
                                    }%>
                                <%if (i == p) {
                                        out.println("<td>" + cv.format(v) + "</td>");
                                    } else {
                                        out.println("<td>" + cv.format(0) + "</td>");
                                    }%>
                                <%if (i != 0) {
                                        out.println("<td>" + cj.format(v * j * 0.01) + "</td>");
                                    } else {
                                        out.println("<td>" + cj.format(0) + "</td>");
                                    }%>                
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <div class="col-sm-4">
                        <span><h4>O total de juros é de: R$ <%=cj.format(p * v * j * 0.01)%></h4></span>
                        <br/>
                        <span><h4>O total a pagar é de: R$ <%=cv.format((p * v * j * 0.01) + v)%></h4></span>

                    </div>
                </div>

            </div>
        </div>

        <br/>
        <br/>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
        <script src="assets/plugins/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="assets/plugins/bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="assets/js/custom.js"></script>
    </body>
</html>