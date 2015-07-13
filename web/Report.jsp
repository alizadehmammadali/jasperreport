<%@page import="java.io.File"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="net.sf.dynamicreports.report.exception.DRException"%>
<%@page import="net.sf.dynamicreports.report.constant.HorizontalAlignment"%>
<%@page import="net.sf.dynamicreports.report.builder.component.Components"%>
<%@page import="net.sf.dynamicreports.report.builder.datatype.DataTypes"%>
<%@page import="net.sf.dynamicreports.report.builder.column.Columns"%>
<%@page import="net.sf.dynamicreports.report.builder.DynamicReports"%>
<%@page import="net.sf.dynamicreports.jasper.builder.JasperReportBuilder"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn = new report.db.Connector().connect();
            File reportFile = new File(application.getRealPath("//report/report.jasper"));//your report_name.jasper file
            Map parameters = new HashMap();
            byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parameters, conn);
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "filename=report.pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outStream = response.getOutputStream();
            outStream.write(bytes, 0, bytes.length);
            outStream.flush();
            outStream.close();
        %>

        %>
    </body>
</html>
