function btnover(obj) {
    obj.className = "butdiv";
}
function btnout(obj) {
    obj.className = "";
}

function showDialog(title,content) {
        var d = new dialog(); d.init();
        d.set('src', '../Themes/Images/FileManager/dlgico_excal.gif');
        d.set('title', title);
        d.event(content, 'new dialog().reset();', '', '');
        return;
    }

    function createDir() {
        var obj = new Object();
        window.showModalDialog("CreateDir.aspx", obj, "dialogWidth=320px;dialogHeight=180px;center=yes;help=no;resizable=no;status=no;scroll=no");
}
