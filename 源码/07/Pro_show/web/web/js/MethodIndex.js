/*
    首页专用js
*/
//轮播图片
var ctx = null;
var winWidth = 0;//画板宽度
var winheight = 0;//画板高度
var imgArr = new Array(4);//广告轮播图片
var srcArr = new Array(4);//轮播图片链接
var imgLinx = -100;//水平位移速度 负值为反方向
var imgDefaultLinx = -100;//水平位移默认速度 负值为反方向
var Intertime = 10;//循环时间
var imgIndex = 0;//当前图片
var xlength = 0;//x轴位移长度
var OutTime = 3000;//暂停时间（毫秒）
var OutDefauleTime = 3000;//默认暂停时间
var isOut = false;//是否暂停
var OutInt = OutTime / Intertime;//暂停循环计算出来的次数
//设置画图初始
function init() {
    winWidth = document.body.clientWidth;//设置画板宽度
    if (winWidth < 1000) {
        winWidth = 1000;//如果宽度大于1000px那么就设置成1000px
    }
    winheight = 300 * winWidth / 1024;//根据宽度设置高度
    $('#advDiv').css("height", winheight + "px");//设置包裹画板的div高度
    $('#canvas').attr("height", winheight);//设置画板高度
    $('#canvas').attr('width', winWidth);//设置画板宽度
    winheight = $('#canvas').height();//设置画板高度
    var canvas = document.getElementById('canvas');
    ctx = canvas.getContext('2d');
    //设置图片路径
    imgArr[0] = 'sysOrderImg/1.png';
    imgArr[1] = 'sysOrderImg/2.png';
    imgArr[2] = 'sysOrderImg/3.png';
    imgArr[3] = 'sysOrderImg/2.png';
    //设置链接
    srcArr[0] = '#';
    srcArr[1] = '#';
    srcArr[2] = '#';
    srcArr[3] = '#';

    window.setInterval(draw, Intertime);
}
//画图
function draw() {
     //图片是否移出可视区域
    if (isOut) {
        //如果移出来了
        if (OutInt > 0) {
            //计数就减一
            OutInt--;
            return;
        }
        else {
            //如果没有移出
            OutInt = OutTime / Intertime;
            isOut = false;
        }
    }
    ctx.clearRect(0, 0, winWidth, winheight);//清空画布
    //第一张图片
    var img1 = new Image();
    img1.src = imgArr[imgIndex];
    //清除点的效果
    clearDian();
    //设置当前点的效果
    $('#imgd' + imgIndex).css('background-color', 'rgba(0,0,0,.5)');
    //第二张图片
    var img2 = new Image();
    img2.src = imgArr[imgIndex == imgArr.length - 1 ? 0 : imgIndex + 1];
    ctx.drawImage(img2, 0, 0, winWidth, winheight);//下面的图片
    ctx.drawImage(img1, xlength, 0, winWidth, winheight);//上面的图片
    xlength = xlength + imgLinx;//计算滚动长度
    //如果图片已经滚动出去了
    if (xlength > Math.abs(winWidth) + imgLinx || xlength < -(Math.abs(winWidth) - imgLinx)) {
        imgIndex++;
        xlength = 0;
        //imgLinx=0-imgDefaultLinx;
        //imgDefaultLinx=0-imgDefaultLinx;
        //如果是最后一张图片
        if (imgIndex >= imgArr.length) {
            imgIndex = 0;
        }
        isOut = true;
    }
}
//鼠标点击左右按钮
function ClickLine(t) {
    isOut = false;
    OutInt = 100;
    //向右
    if (t == 0) {
        imgLinx = imgLinx + 100;
    }
    else {
        imgLinx = imgLinx - 100;
    }
}
//浏览器改变大小
function winUpdate() {
    window.onresize = function () {
        winWidth = document.body.clientWidth;//设置画板宽度
        if (winWidth < 1000) {
            winWidth = 1000;
        }
        $('#canvas').attr('width', winWidth);//设置画板宽度
        winheight = 300 * winWidth / 1024;
        $('#advDiv').css("height", winheight + "px");
        $('#canvas').attr("height", winheight);
        isOut = false;
        OutInt = OutTime / Intertime;

        DrowDian();
    };
}
//模板鼠标移入
function tempMouseOver(DivThis) {
    $(DivThis).children('div').show();
}
//模板鼠标移出
function tempMouseOut(DivThis) {
    $(DivThis).children('div').hide();
}
//加上点
function DrowDian() {
    $('#dian').empty();
    var dint = imgArr.length;
    var jg = 30;//间隔
    //var html = ' <div class="dian" style="left:100px; top:100px;" onclick=""></div>';
    var width = ((jg + 10) * dint) / 2;//需要向左偏移多少
    var kaishi = winWidth / 2 - width;//开始点
    var top = 300;
    var html = '';
    for (var i = 0; i < dint; i++) {
        html += '<div id="imgd' + i + '" class="dian" style="left:' + (kaishi + (i * jg)) + 'px; bottom:20px;" onclick="changeimg(' + i + ')"></div>';
    }
    $('#dian').html(html);
}
//点击点
function changeimg(a) {
    imgIndex = a;//获取当前点击的图拍案
    isOut = false;//设置当前标识
    OutInt = 100;//位置量
    clearDian();//清除点
    draw();//画图
}
//清楚其他点的效果
function clearDian() {
    var dint = imgArr.length;
    for (var i = 0; i < dint; i++) {
        $('#imgd' + i).css('background-color', '#fff');
    }
}