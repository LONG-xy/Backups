function GridCheckRow(grid, id,lastValue,content) {
    //debugger;
    var gridview = document.getElementById(grid);
    var lastvalue = document.getElementById(lastValue);
    if (document.getElementById(id).checked == true) {
        if (gridview) {
            if (gridview.tagName == "TABLE") {
                for (i = 1; i < gridview.rows.length; i++) {
                    if (gridview.rows[i].cells[0].childNodes[0]) {
                        if (gridview.rows[i].cells[0].getElementsByTagName("INPUT").item(0).checked == true &&
                        gridview.rows[i].cells[0].getElementsByTagName("INPUT").item(0).id == id) {
                            gridview.rows[i].className = "checkrow";
                            lastvalue.value = content;                            
                        }
                        else {
                            gridview.rows[i].className = "";
                        }
                    }
                }
            }
        }
    }
    else {
        if (gridview) {
            if (gridview.tagName == "TABLE") {
                for (i = 1; i < gridview.rows.length; i++) {
                    if (gridview.rows[i].cells[0].childNodes[0]) {
                        if (gridview.rows[i].cells[0].getElementsByTagName("INPUT").item(0).id == id) {
                            gridview.rows[i].className = ""; break;
                        }
                    }
                }
            }
        }
    }
}