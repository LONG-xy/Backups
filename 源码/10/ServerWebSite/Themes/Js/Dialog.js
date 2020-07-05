function dialog() {
    var title = '';
    var txtinfo = '';
    var width = 300;
    var height = 180;
    var src = "";
    var path = "";
    var sFunc = '<BUTTON id=dialogOk hideFocus style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND: url(../Themes/Images/FileManager/dbtn1.gif) repeat-y; BORDER-LEFT: 0px; WIDTH: 49px; CURSOR: pointer; LINE-HEIGHT: 21px; BORDER-BOTTOM: 0px; HEIGHT: 19px" mode size="3" onclick="new dialog().reset();return false;" onmouseover="this.style.background=\'url(../Themes/Images/FileManager/dbtn2.gif) repeat-y\';" onmouseout="this.style.background=\'url(../Themes/Images/FileManager/dbtn1.gif) repeat-y\';" onMouseDown="this.style.background=\'url(../Themes/Images/FileManager/dbtn3.gif) repeat-y\';">确定</BUTTON><BUTTON id=dlgInput_btNo hideFocus style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND: url(../Themes/Images/FileManager/dbtn1.gif) repeat-y 0px 0px; MARGIN-LEFT: 24px; BORDER-LEFT: 0px; WIDTH: 49px; CURSOR: pointer; LINE-HEIGHT: 21px; BORDER-BOTTOM: 0px; HEIGHT: 19px" mode size="3" onclick="new dialog().reset();return false;" onmouseover="this.style.background=\'url(../Themes/Images/FileManager/dbtn2.gif) repeat-y\';" onmouseout="this.style.background=\'url(../Themes/Images/FileManager/dbtn1.gif) repeat-y\';" onMouseDown="this.style.background=\'url(../Themes/Images/FileManager/dbtn3.gif) repeat-y\';">取消</BUTTON>';
    var sOk = '<BUTTON id=dialogOk hideFocus style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND: url(../Themes/Images/FileManager/dbtn1.gif) repeat-y 0px 0px; BORDER-LEFT: 0px; WIDTH: 49px; CURSOR: pointer; LINE-HEIGHT: 21px; BORDER-BOTTOM: 0px; HEIGHT: 19px" mode size="3" onclick="new dialog().reset();return false;" onmouseover="this.style.background=\'url(../Themes/Images/FileManager/dbtn2.gif) repeat-y\';" onmouseout="this.style.background=\'url(../Themes/Images/FileManager/dbtn1.gif) repeat-y\';" onMouseDown="this.style.background=\'url(../Themes/Images/FileManager/dbtn3.gif) repeat-y\';">确定</BUTTON>';
    var sClose = '<BUTTON id=dialogclose hideFocus style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BACKGROUND: url(../Themes/Images/FileManager/dclose1.gif) repeat-y; BORDER-LEFT: 0px; WIDTH: 15px; CURSOR: pointer; LINE-HEIGHT: 17px; BORDER-BOTTOM: 0px; HEIGHT: 15px" mode size="3" onclick="new dialog().reset();return false;" onmouseover="this.style.background=\'url(../Themes/Images/FileManager/dclose2.gif) repeat-y\';" onmouseout="this.style.background=\'url(../Themes/Images/FileManager/dclose1.gif) repeat-y\';" onMouseDown="this.style.background=\'url(../Themes/Images/FileManager/dclose3.gif) repeat-y\';"></BUTTON>';
    var sBody = '\
		<table id="dialogBodyBox" border="0" align="center" cellpadding="0" cellspacing="0">\
			<tr height="10"><td colspan="4"></td></tr>\
			<tr>\
				<td width="10"></td>\
				<td id="inforow" width="80" align="center" valign="absmiddle"><img id="dialogBoxFace"" /></td>\
				<td id="dialogMsg" style="font-size:12px;" align="center"></td>\
				<td width="10"></td>\
			</tr>\
			<tr height="10"><td colspan="4" align="center"></td></tr>\
			<tr><td id="dialogFunc" colspan="4" align="center"></td></tr>\
			<tr height="10"><td colspan="4" align="center"></td></tr>\
		</table>\
	';
    var sBox = '\
<TABLE id="dialogBox" cellSpacing="0" cellPadding="0" width="' + width + '" height="180" style="filter : progid:DXImageTransform.Microsoft.Shadow(color=#666666,direction=135,strength=3) ; ">\
<TBODY>\
<TR height="30">\
<TD>\
<TABLE id="dialogBoxTitle" onmousedown="drag_start(\'dialogBox\',event)" style="cursor:move;" height="30" cellSpacing="0" cellPadding="0" width="100%">\
<TBODY>\
<TR>\
<TD width="1"><IMG src="../Themes/Images/FileManager/dlghead_l.gif"></TD>\
<TD id="dialogTitle" style="PADDING-LEFT: 6px; BACKGROUND: url(../Themes/Images/FileManager/dlghead_c.gif)">' + title + '</TD>\
<TD id="dialogClose" width="20" style="PADDING-LEFT: 6px; BACKGROUND: url(../Themes/Images/FileManager/dlghead_c.gif)">' + sClose + '</TD>\
<TD width="1"><IMG src="../Themes/Images/FileManager/dlghead_r.gif"></TD></TR></TBODY></TABLE></TD></TR>\
<TR id="dialogHeight">\
<TD id="dialogBody" style="BORDER-RIGHT: #a1b2d0 1px solid; BORDER-TOP: 0px; BACKGROUND: white; BORDER-LEFT: #a1b2d0 1px solid; BORDER-BOTTOM: #a1b2d0 1px solid">\
' + sBody + '</TD></TR>\
<TR>\
<TD style="BORDER-RIGHT: #a1b2d0 1px solid; BORDER-TOP: 0px; BACKGROUND: #dfe7f2; BORDER-LEFT: #a1b2d0 1px solid; BORDER-BOTTOM: #a1b2d0 1px solid; HEIGHT: 35px" align=middle>' + sOk + '</TD></TR></TBODY></TABLE>\
		<div id="dialogBoxShadow" style="display:none;z-index:9;"></div>\
	';
    var sBG = '\
		<div id="dialogBoxBG" style="position:absolute;top:0px;left:0px;width:100%;height:100%;"></div>\
	';
    function $(_sId) { return document.getElementById(_sId) }
    this.show = function() {
        this.middle('dialogBox');
    }
    this.reset = function() { $('dialogBox').style.display = 'none'; $('dialogBoxBG').style.display = 'none'; $('dialogBoxShadow').style.display = "none"; $('dialogBody').innerHTML = sBody; }
    this.html = function(_sHtml) { $("dialogBody").innerHTML = _sHtml; this.show(); }
    this.init = function() {
        $('dialogCase') ? $('dialogCase').parentNode.removeChild($('dialogCase')) : function() { };
        var oDiv = document.createElement('span');
        oDiv.id = "dialogCase";
        oDiv.innerHTML = sBG + sBox;
        document.body.appendChild(oDiv);
        $('dialogBoxBG').style.height = document.body.scrollHeight;
    }
    this.button = function(_sId, _sFuc) {
        if ($(_sId)) {
            $(_sId).style.display = '';
            if ($(_sId).addEventListener) {
                if ($(_sId).act) { $(_sId).removeEventListener('click', function() { eval($(_sId).act) }, false); }
                $(_sId).act = _sFuc;
                $(_sId).addEventListener('click', function() { eval(_sFuc) }, false);
            } else {
                if ($(_sId).act) { $(_sId).detachEvent('onclick', function() { eval($(_sId).act) }); }
                $(_sId).act = _sFuc;
                $(_sId).attachEvent('onclick', function() { eval(_sFuc) });
            }
        }
    }
    this.shadow = function() {
        var oShadow = $('dialogBoxShadow');
        var oDialog = $('dialogBox');
        oShadow['style']['position'] = "absolute";
        oShadow['style']['background'] = "#000";
        oShadow['style']['display'] = "";
        oShadow['style']['opacity'] = "0.2";
        oShadow['style']['filter'] = "alpha(opacity=20)";
        oShadow['style']['top'] = oDialog.offsetTop + 6;
        oShadow['style']['left'] = oDialog.offsetLeft + 6;
        oShadow['style']['width'] = oDialog.offsetWidth;
        oShadow['style']['height'] = oDialog.offsetHeight;
    }
    this.open = function(_sUrl, _sMode) {
        this.show();
        if (!_sMode || _sMode == "no" || _sMode == "yes") {
            $("dialogBody").innerHTML = "<iframe width='100%' height='100%' src='" + _sUrl + "' frameborder='0' scrolling='" + _sMode + "'></iframe>";
        }
    }
    this.event = function(_sMsg, _sOk, _sCancel, _sClose) {
        $('dialogClose').innerHTML = sClose;
        $('dialogBodyBox') == null ? $('dialogBody').innerHTML = sBody : function() { };
        $('dialogMsg') ? $('dialogMsg').innerHTML = _sMsg : function() { };
        _sOk && _sOk != "" ? this.button('dialogOk', _sOk) : $('dialogOk').style.display = 'none';
        txtinfo = _sMsg;
        this.show();
    }
    this.set = function(_oAttr, _sVal) {
        var oShadow = $('dialogBoxShadow');
        var oDialog = $('dialogBox');
        var oHeight = $('dialogHeight');

        if (_sVal != '') {
            switch (_oAttr) {
                case 'title':

                    title = _sVal;
                    $('dialogTitle') ? $('dialogTitle').innerHTML = _sVal : function() { };
                    break;
                case 'width':
                    oDialog['style']['width'] = _sVal;
                    width = _sVal;
                    break;
                case 'height':
                    oHeight['style']['height'] = _sVal;
                    height = _sVal;
                    break;
                case 'src':
                    if (parseInt(_sVal) > 0) {
                        $('dialogBoxFace') ? $('dialogBoxFace').src = path + _sVal + '.gif' : function() { };
                    } else {
                        $('dialogBoxFace') ? $('dialogBoxFace').src = _sVal : function() { };
                    }
                    src = _sVal;
                    break;
            }
        }
        else $('inforow').style.display = 'none';
        this.middle('dialogBox');
        oShadow['style']['top'] = oDialog.offsetTop + 6;
        oShadow['style']['left'] = oDialog.offsetLeft + 6;
        oShadow['style']['width'] = oDialog.offsetWidth;
        oShadow['style']['height'] = oDialog.offsetHeight;
    }
    this.moveStart = function(event, _sId) {
        var oObj = $(_sId);
        oObj.onmousemove = mousemove;
        oObj.onmouseup = mouseup;
        oObj.setCapture ? oObj.setCapture() : function() { };
        oEvent = window.event ? window.event : event;
        var dragData = { x: oEvent.clientX, y: oEvent.clientY };
        var backData = { x: parseInt(oObj.style.top), y: parseInt(oObj.style.left) };
        function mousemove() {
            var oEvent = window.event ? window.event : event;
            var iLeft = oEvent.clientX - dragData["x"] + parseInt(oObj.style.left);
            var iTop = oEvent.clientY - dragData["y"] + parseInt(oObj.style.top);
            oObj.style.left = iLeft;
            oObj.style.top = iTop;
            $('dialogBoxShadow').style.left = iLeft + 6;
            $('dialogBoxShadow').style.top = iTop + 6;
            dragData = { x: oEvent.clientX, y: oEvent.clientY };

        }
        function mouseup() {
            var oEvent = window.event ? window.event : event;
            oObj.onmousemove = null;
            oObj.onmouseup = null;
            if (oEvent.clientX < 1 || oEvent.clientY < 1 || oEvent.clientX > document.body.clientWidth || oEvent.clientY > document.body.clientHeight) {
                oObj.style.left = backData.y;
                oObj.style.top = backData.x;
                $('dialogBoxShadow').style.left = backData.y + 6;
                $('dialogBoxShadow').style.top = backData.x + 6;
            }
            oObj.releaseCapture ? oObj.releaseCapture() : function() { };
        }
    }
    this.hideModule = function(_sType, _sDisplay) {
        var aIframe = parent.document.getElementsByTagName("iframe"); aIframe = 0;
        var aType = document.getElementsByTagName(_sType);
        var iChildObj, iChildLen;
        for (var i = 0; i < aType.length; i++) {
            aType[i].style.display = _sDisplay;
        }
        for (var j = 0; j < aIframe.length; j++) {
            iChildObj = document.frames ? document.frames[j] : aIframe[j].contentWindow;
            iChildLen = iChildObj.document.body.getElementsByTagName(_sType).length;
            for (var k = 0; k < iChildLen; k++) {
                iChildObj.document.body.getElementsByTagName(_sType)[k].style.display = _sDisplay;
            }
        }
    }
    this.middle = function(_sId) {
        var sClientWidth = parent ? parent.document.body.clientWidth : document.body.clientWidth;
        var sClientHeight = parent ? parent.document.body.clientHeight : document.body.clientHeight;
        var sScrollTop = parent ? parent.document.body.scrollTop : document.body.scrollTop;
        document.getElementById(_sId)['style']['display'] = '';
        document.getElementById(_sId)['style']['position'] = "absolute";
        document.getElementById(_sId)['style']['left'] = Math.round((document.body.clientWidth - 100) / 2) - 100;
        var sTop = -80 + (sClientHeight / 2 + sScrollTop) - (document.getElementById(_sId).offsetHeight / 2);
        document.getElementById(_sId)['style']['top'] = Math.round((document.body.clientHeight - 100) / 2) + document.body.scrollTop - 50;
        if (document.all.txt != null) document.all.txt.focus();
    }
}

eini()
function eini() {
    var o, l
    document.write("<style>body{cursor:default;margin:0}body,table,select,input,textarea,button{font-size:12;}textarea{overflow:auto}img{border:0}form,p{margin:0}</style>\
		<head><meta http-equiv=Content-Type content=text/html;charset=gb2312><meta http-equiv=imagetoolbar content=no></head>\
		<body ondragstart=return(false) onmouseup=body_event(event) onmouseover=body_event(event) onmouseout=body_event(event) onmousemove=body_event(event)>\
	")
    String.prototype.trim = function() { return this.replace(/(^[\s]*)|([\s]*$)/g, "") }
    String.prototype.inc = function(k1, k2) { if (k2 == null) { k2 = "," }; return (k2 + this + k2).indexOf(k2 + k1 + k2) > -1 ? true : false }
    String.prototype._slice = "".slice
    String.prototype.slice = function(n1, n2) { var v, b1 = typeof (n1) == "number", b2 = typeof (n2) == "number"; if (!b1 || typeof (n2) == "string") { v = eval("this._slice(" + (b1 ? n1 : this.indexOf(n1) + (n2 == null ? 1 : 0) + (this.indexOf(n1) == -1 ? this.length : 0)) + (n2 == null ? "" : (b2 ? n2 : (this.indexOf(n2) == -1 ? "" : "," + this.indexOf(n2)))) + ")") } else { v = isIE5 && n1 < 0 && n2 == null ? this._slice(this.length - 1) : eval("this._slice(n1" + (n2 == null ? "" : "," + n2) + ")") } return v }
    String.prototype.css = function(key, def) { if (this.inc(key, ";")) return 1; var a = this.match(new RegExp("(^|;)" + key + ":[^;]*")); return a == null || key == "" ? (def == null ? "" : def) : a[0].replace(";", "").slice(key.length + 1) }
    Array.prototype.add = function(key) { this[this.length] = key }

    isIE = navigator.userAgent.indexOf("IE") > 0
    isIE5 = navigator.userAgent.indexOf("IE 5.0") > 0
    ev = {}
    if (!isIE) {
        HTMLElement.prototype.contains = function(node) { if (!node) return false; do if (node == this) { return true } while (node = node.parentNode){ return false } }
        Event.prototype.__defineGetter__("srcElement", function() { var node = this.target; while (node.nodeType != 1) { node = node.parentNode } return node })
        Event.prototype.__defineGetter__("toElement", function() { return this.relatedTarget })
    }
}
function body_event(e) {
    var ee = e.srcElement, ep = ee.parentNode, n, s
    if (e.type == "mouseup") {
        ev.dragObj = null
    }
    if (e.type == "mousemove") {
        if (ev.dragObj != null && (e.button == 1 || !isIE)) {
            ev.dragObj.style.left = ev.dragPx + e.screenX - ev.dragSx
            ev.dragObj.style.top = ev.dragPy + e.screenY - ev.dragSy
            if (isIE) {
                try { drag_move(e) } catch (e) { }
            }
        }
    }
    if (e.type == "mousedown")
        clearMenu()
    if (e.type == "selectstart") {
        if (ee.tagName == "TEXTAREA" || ee.tagName == "INPUT")
            return true
        if (oo("bxCover").style.display == "" || oo("bxMsgBox").style.display == "")
            return false
    }
    if (e.type == "contextmenu" && !"INPUT,TEXTAREA".inc(ee.tagName)) {
        s = isIE ? document.selection.createRange().text : window.getSelection()
        if (ee.tagName == "A" && s == "") {
            if (ee.href.indexOf("javascript:") == 0) {
                eval(ee.href)
                return false
            }
            return true
        }
        if (s != "")
            return true
        if (oo("wEditor") != null)
            if (oo("wEditor").contains(ee))
            return true
        try { body_contextmenu(e) } catch (e) { }
        return false
    }
}
function drag_start(obj, e) {
    ev.dragObj = oo(obj)
    ev.dragPx = ev.dragObj.offsetLeft
    ev.dragPy = ev.dragObj.offsetTop
    ev.dragSx = e.screenX
    ev.dragSy = e.screenY
}
function isNone(str) {
    return str == null || str == "" ? 1 : 0
}
function oo(obj) {
    return typeof (obj) == "string" ? document.getElementById(obj) : obj
}
function ov(obj) {
    return oo(obj) == null ? "" : oo(obj).innerHTML
}
function ow(win) {
    return isIE ? eval(win) : oo(win).contentWindow
}
function insHtm(op, code, pos) {
    op = oo(op)
    if (isIE)
        op.insertAdjacentHTML(pos == null ? "beforeend" : "afterbegin", code)
    else {
        var r = op.ownerDocument.createRange()
        r.setStartBefore(op)
        eval("op." + (pos == null ? "appendChild" : "insertBefore") + "(r.createContextualFragment(code),op.firstChild)")
    }
}


