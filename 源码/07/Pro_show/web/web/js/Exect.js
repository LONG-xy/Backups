//弹出页面方法集合 htmlSrc 为html页面路径 向父窗体
function Eject(htmlSrc, title, width, height) {
    //获取浏览器高度
    var winHeight = $(window.parent).height();
    //获取浏览器宽度
    var winWidth = $(window.parent).width();
    //计算上部分高度
    var top = ((winHeight - height) / 2) + $(document).scrollTop();
    //计算左部分宽度
    var left = (winWidth - width) / 2;
    //添加遮盖层
    var CoverHtml = '<div id="coverDiv" style="background-color:rgba(0,0,0,.9); width:' + (window.parent.document.body.scrollWidth + 10) + 'px; height:' + (window.parent.document.body.scrollHeight + 10) + 'px; position:absolute; top:0px; left:0px; z-index:200;"></div>';
    //添加内容
    var ContentHtml = '<div id="tdiv" class="tdiv" style="position:absolute; top:-' + (height + top) + 'px; left:' + left + 'px; background-color:white; border:solid 1PX #C4C4C4; box-shadow:1px 1px 10px; border-radius:10px; onverflow:hidden; text-overflow:clip; overflow:hidden; width:' + width + 'px; height:' + height + 'px; z-index:200;">';
    ContentHtml += '<div style="width:100%; height:0px; border-radius:2PX 2PX 0PX 0PX; position:relative;  ">';
    ContentHtml += '<div id="CloseCover" style=" cursor:pointer; position:absolute;  width:30px; height:30px; text-align:center; line-height:30px; top:5px; right:30px; border-radius:5px 5px 0px 0px; color:rgb(200,200,200);" onclick="Cover(this)" title="点击我就关闭了！">X</div>';
    ContentHtml += '</div>';
    ContentHtml += '<iframe scrolling="no" src="' + htmlSrc + '" width="' + width + '" height="' + height + '" style="border:none;"></iframe>';
    ContentHtml += '</div>';
    //添加到父窗体的body节点中的最后
    $(window.parent.document.body).append(CoverHtml + ContentHtml);
    //隐藏父窗体的滚动条
    $(window.parent.document.body).css('overflow', 'hidden');
    //执行动画
    anim('#tdiv', winHeight - $(document).scrollTop(), top);
}
//弹出页面方法集合 htmlSrc 为html页面路径 本窗体
function EjectIdent(htmlSrc, title, width, height) {
    //获取浏览器高度
    var winHeight = $(window).height();
    //获取浏览器宽度
    var winWidth = $(window).width();
    //计算上部分高度
    var top = ((winHeight - height) / 2) + $(document).scrollTop();
    //计算左部分宽度
    var left = (winWidth - width) / 2;
    //添加遮盖层
    var CoverHtml = '<div id="coverDiv" style="background-color:rgba(0,0,0,.9); width:' + (window.document.body.scrollWidth + 10) + 'px; height:' + (window.document.body.scrollHeight + 10) + 'px; position:absolute; top:0px; left:0px; z-index:200;"></div>';
    //添加内容
    var ContentHtml = '<div id="tdiv" class="tdiv" style="position:absolute; top:-' + (height + top) + 'px; left:' + left + 'px; background-color:white; border:solid 1PX #C4C4C4; box-shadow:1px 1px 10px; border-radius:10px; onverflow:hidden; text-overflow:clip; overflow:hidden; width:' + width + 'px; height:' + height + 'px; z-index:200;">';
    ContentHtml += '<div style="width:100%; height:0px; border-radius:2PX 2PX 0PX 0PX; position:relative;  ">';
    ContentHtml += '<div id="CloseCover" style=" cursor:pointer; position:absolute;  width:30px; height:0px; text-align:center; line-height:30px; top:5px; right:30px; border-radius:5px 5px 0px 0px; color:rgb(200,200,200);" onclick="Cover(this)" title="点击我就关闭了！">X</div>';
    ContentHtml += '</div>';
    ContentHtml += '<iframe scrolling="no" src="' + htmlSrc + '"  width="' + width + '" height="' + height + '" style="border:none;"></iframe>';
    ContentHtml += '</div>';
    //添加到窗体的body节点中的最后
    $(window.document.body).append(CoverHtml + ContentHtml);
    //隐藏窗体的滚动条
    $(window.document.body).css('overflow', 'hidden');
    //执行动画
    animIdent('#tdiv', winHeight - $(document).scrollTop(), top);
}
//关闭窗体
function Cover(coverThis) {
    //关闭窗体
    $(coverThis).parent().parent().remove();
    $('#coverDiv').remove();
    $(window.document.body).css('overflow', '');
}
//窗体动画
function animIdent(id, height, top) {
    //把窗体移动到可视窗口以外
    var defaulttop = -height;
    //每1毫秒执行一次
    var aniva = window.setInterval(function () {
        //如果当前的位置是设置的位置
        if (defaulttop >= top) {
            //就设置新的位置
            $(id).css('top', top);
            //关闭每一段时间执行一次的
            window.clearInterval(aniva);
        }
        //设置当前位置
        $(id).css('top', defaulttop);
        //每次移动50px
        defaulttop=defaulttop + 50;
    }, 1);
}
//窗体动画
function anim(id, height, top) {
    //把窗体移动到可视窗口以外
    var defaulttop = -height;
    //每1毫秒执行一次
    var aniva = window.parent.window.setInterval(function () {
        //如果当前的位置是设置的位置
        if (defaulttop >= top) {
            //就设置新的位置
            $(id).css('top', top);
            //关闭每一段时间执行一次的
            window.parent.window.clearInterval(aniva);
        }
        //设置当前位置
        $(id, parent.document).css('top', defaulttop);
        //每次移动50px
        defaulttop = defaulttop + 50;
    }, 1);
}
