using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class BackGround_LeaguerInfoDelete : System.Web.UI.Page
{
    Operation operation = new Operation();
    static int CheckType = -1;　　　　　　 //3种类别：全部显示(-1代表全部显示)，显示过期信息（0），显示未过期信息(1)
    protected DataRowCollection drs = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        string opearID = null, opearState = null;
        if ((opearID = Request.Form["opearID"]) != null && opearID != "")
        {
            opearState = Request.Form["opearState"];
            if (opearState == "200")
            {
                DeleteInfo(int.Parse(opearID));
            }
            else if (opearState == "100")
            {
                Response.Redirect("DetailLeaguerInfo.aspx?id=" + opearID);
            }
            else
            {
                ChangeState(opearID, opearState);
            }
        }
        if (!IsPostBack)
        {
            DataBind(1, 0);
        }
    }
    /// <summary>
    /// 绑定供求信息到GridViev控件
    /// </summary>
    /// <param name="type">供求信息类别</param>
    private void DataBind(int PageIndex, int ShowDayType)
    {
        int PageSize = 10;
        DataSet ds = operation.SelectLeaguerInfo(PageIndex, PageSize, ShowDayType);
        if (ds != null && ds.Tables.Count > 0)
        {
            int Count = 0;
            int.TryParse(ds.Tables[0].Rows[0][0].ToString(), out Count);
            drs = ds.Tables[1].Rows;
            int GetTotalPageIndex = (Count / PageSize) + ((Count % PageSize) > 0 ? 1 : 0);
            this.TotalPageIndex.Text = GetTotalPageIndex.ToString();
            this.CurPageIndex.Text = PageIndex.ToString();
            if (PageIndex == 1 && PageIndex == GetTotalPageIndex)
            {
                SetPageState(0);
            }
            else if (PageIndex == 1)
            {
                SetPageState(1);
            }
            else if (PageIndex == GetTotalPageIndex)
            {
                SetPageState(2);
            }
            else
            {
                SetPageState(3);
            }
        }
    }
    protected void UpPage_Click(object sender, EventArgs e)
    {
        int CurIndex = Convert.ToInt32(this.CurPageIndex.Text);
        CurIndex--;
        DataBind(CurIndex, 0);
    }

    protected void DownPage_Click(object sender, EventArgs e)
    {
        int CurIndex = Convert.ToInt32(this.CurPageIndex.Text);
        CurIndex++;
        DataBind(CurIndex, 0);
    }
    public void SetPageState(int SetIndex)
    {
        if (SetIndex == 0)
        {
            this.UpPage.Enabled = false;
            this.DownPage.Enabled = false;
            this.UpPage.Style["color"] = "#808080";
            this.DownPage.Style["color"] = "#808080";
        }
        else if (SetIndex == 1)
        {
            this.UpPage.Enabled = false;
            this.DownPage.Enabled = true;
            this.UpPage.Style["color"] = "#808080";
            this.DownPage.Style["color"] = "#23527c";
        }
        else if (SetIndex == 2)
        {
            this.UpPage.Enabled = true;
            this.DownPage.Enabled = false;
            this.UpPage.Style["color"] = "#23527c";
            this.DownPage.Style["color"] = "#808080";
        }
        else
        {
            this.UpPage.Enabled = true;
            this.DownPage.Enabled = true;
            this.UpPage.Style["color"] = "#23527c";
            this.DownPage.Style["color"] = "#23527c";
        }
    }
    protected void DeleteInfo(int delID)
    {
        operation.DeleteLeaguerInfo(delID.ToString());
        DataBind(Convert.ToInt32(this.CurPageIndex.Text), GetRdoState());
    }
    protected void ChangeState(string ChangeID, string CurState)
    {
        bool IsCheckState = false;
        if (bool.TryParse(CurState.ToLower(), out IsCheckState))
        {
            operation.UpdateLeaguerInfo(ChangeID, IsCheckState);
        }
        DataBind(Convert.ToInt32(this.CurPageIndex.Text), GetRdoState());
    }

    public int GetRdoState()
    {
        return Convert.ToInt32(this.RadioButtonList1.SelectedValue);
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataBind(1, GetRdoState());
    }
}

