package report.web;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.*;
import net.sf.dynamicreports.jasper.builder.*;
import net.sf.dynamicreports.report.builder.DynamicReports;
import net.sf.dynamicreports.report.builder.column.Columns;
import net.sf.dynamicreports.report.builder.component.Components;
import net.sf.dynamicreports.report.builder.datatype.DataTypes;
import net.sf.dynamicreports.report.constant.HorizontalAlignment;
import net.sf.dynamicreports.report.exception.DRException;

class CreateSimpleReport {

    public String PdfReportCreater() {
        String result = "";
        Connection conn = new report.db.Connector().connect();
        JasperReportBuilder report = DynamicReports.report();//a new report
        report
                .columns(
                        Columns.column("Name", "Name", DataTypes.stringType()),
                        Columns.column("Surname", "Surname", DataTypes.stringType()),
                        Columns.column("City", "City", DataTypes.stringType()),
                        Columns.column("Born Date", "BornDate", DataTypes.dateType()))
                .title(//title of the report
                        Components.text("Insanlarin şəxsiyyət vəsiqələri")
                        .setHorizontalAlignment(HorizontalAlignment.CENTER))
                .pageFooter(Components.pageXofY())//show page number on the page footer
                .setDataSource("SELECT Name,Surname,City,BornDate FROM idcards;",
                        conn);

        try {
            //show the report
            //export the report to a pdf file
            report.toPdf(new FileOutputStream("C:\\Users\\M---E\\Documents\\NetBeansProjects\\JasperReport2\\web\\Creport.pdf"));
            report.build();
            result = "ok";
        } catch (DRException e) {
            e.getMessage();
        } catch (FileNotFoundException e) {
            e.getMessage();
        }
        return result;
    }
}
