<%@page import="report.db.Idcards"%>
<%@page import="report.beans.Person"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/index.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%
            ArrayList<Person> people = new ArrayList<Person>();
            people = new Idcards().retrievelist();

        %>
    </head>
    <body>
        <table border="1px;" style="border-collapse: collapse;">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Age</th>
                    <th>Job</th>
                    <th>Salary</th>
            </thead>
        </tr> 
        <tbody>
            <%                    for (Person person : people) {
            %>
            <tr>
                <td> <%=person.getName()%></td>
                <td><%=person.getSurname()%></td>
                <td><%=person.getAge()%></td>
                <td><%=person.getJob()%></td>
                <td><%=person.getSalary()%></td>
            </tr>
            <%}
            %>
        </tbody>
    </table>
    <input type="button" value="ReportWithJasper" id="report" onclick="showReport();">
    <input type="button" value="ReportWithjavaCode" id="report2" onclick="showReport2();">
    <div id="result"></div>
</body>
</html>
