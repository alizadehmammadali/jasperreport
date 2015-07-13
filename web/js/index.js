function showReport() {
    /**$.ajax({
     url: "ReportShower",
     type: 'POST'
     });*/
    window.location.href = 'Report.jsp';
}
function showReport2() {
    $.ajax({
        url: "ReportViewer",
        type: 'POST',
        success: function (response) {
            if (response === "ok") {
                $('#result').html("Pdf file is created in application report folder");
            }
        }

    });

}

