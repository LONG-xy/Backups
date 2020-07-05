var pageCount = 0;//一共多少条数据
var pageTopNum = 0;//一共多少页
var pageNum = 1;//当前第几页
var RowCount = 10;//每页分多少个
var ShowPageCount = 10;//显示多少个分页
var minPage = 0;//显示的最小分页
var maxPage = 0;//显示的最大分页
//获取分页基础信息
function GetPage(pd, url) {
    var userName = $('#serachUserName').val();
    var serachPhone = $('#serachPhone').val();
    var serachEmaill = $('#serachEmaill').val();
    var serachStatus = $('#serachStatus').val();
    $.ajax({
        type: "post",
        url: url,
        data: pd,
        dataType: "json",
        success: function (data) {
            pageCount = parseInt(data.status);//一共多少条数据
            if (pageCount == 0) {
                $('#pageList').hide();
                $('#pageUp').hide();
                $('#orderPageUp').hide();
                $('#CenterPage').hide();
                $('#orderPageDown').hide();
                $('#pageDown').hide();
                $('#PageText').html('当前页数:第 1 页 （共0条）');
            }
            else {
                pageTopNum = pageCount % ShowPageCount > 0 ? parseInt(pageCount / ShowPageCount) + 1 : pageCount / ShowPageCount;//一共多少页
                minPage = 1;
                if (pageTopNum > ShowPageCount) {
                    maxPage = ShowPageCount;
                }
                else {
                    maxPage = pageTopNum;
                }

                SetPage();
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    });
}
//设置分页
function SetPage() {
    $('#pageList').show();
    $('#pageUp').show();
    $('#orderPageUp').show();
    $('#CenterPage').show();
    $('#orderPageDown').show();
    $('#pageDown').show();
    $('#PageText').html('当前页数:第 ' + pageNum + ' 页 （共' + pageCount + '条）');

    if (minPage > 1) {
        $('#orderPageUp').show();
    }
    if (minPage == 1) {
        $('#orderPageUp').hide();
    }
    if (maxPage < pageTopNum) {
        $('#orderPageDown').show();
    }
    if (maxPage == pageTopNum) {
        $('#orderPageDown').hide();
    }


    //显示分页
    $('#CenterPage').empty();
    for (var i = minPage; i <= maxPage; i++) {
        if (i == pageNum) {
            $('#CenterPage').append('<font class="fenye" style="color:red;" onclick="SetPageNum(' + i + ')">第 ' + i + ' 页</font>');
        }
        else {
            $('#CenterPage').append('<font class="fenye" onclick="SetPageNum(' + i + ')">第 ' + i + ' 页</font>');
        }
    }
}
//上一页，下一页
function SetPageDounOrUp(a) {
    //a==true 上一页 false 下一页
    if (a) {
        //点击上一页
        if (pageNum == 1) {
            return;
        }
        if (pageNum > 1) {
            pageNum--;
        }
    }
    if (!a) {
        if (pageNum == pageTopNum) {
            return;
        }
        if (pageNum < pageTopNum) {
            pageNum++;
        }
    }
    GetUserList();
    SetPage();
}
//点击页数
function SetPageNum(a) {
    //a为第几页
    pageNum = a;
    GetUserList();
    SetPage();
}
//点击扩展页数
function OrderPage(a) {
    //a==true 向小扩展 false 向大扩展
    if (a) {
        //向小扩展
        if (minPage == 1) {
            return;
        }
        else {
            maxPage = minPage - 1;//设置最大分页
            minPage = minPage - ShowPageCount;//设置最小分页
            if (maxPage > pageTopNum) {
                maxPage = pageTopNum;
            }
        }
    }
    if (!a) {
        //向大扩展
        if (maxPage == pageTopNum) {
            return;
        }
        else {
            if (maxPage + ShowPageCount < pageTopNum) {
                minPage = maxPage + 1;
                maxPage = maxPage + ShowPageCount;
            }
            else {
                minPage = maxPage + 1;
                maxPage = pageTopNum;
            }
        }
    }
    SetPage();
}