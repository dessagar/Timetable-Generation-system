/**
 * 
 */


$("#search").on("keyup", function() {
    var value = $(this).val();

    $("table tr").each(function(index) {
        if (index !== 0) {

            $row = $(this);

            // var id = $row.find("td:first").text(); 
            var id = $row.find("td:eq(1)").text(); 


            if (id.indexOf(value) !== 0) {
                $row.hide();
            }
            else {
                $row.show();
            }
        }
    });
});
