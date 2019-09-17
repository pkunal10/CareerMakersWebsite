using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

public partial class Admin_Inqury : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            GetInquiryData();
        }
    }
    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        if (DateTb.Text != "")
        {
            DateTime sDt = Convert.ToDateTime(DateTb.Text);

            string zk = "select * from inquiry where InquiryDate='" + sDt.ToShortDateString() + "'";
            DataSet ds2 = new DataSet();
            ds2 = dc.getdata(zk);
            DataTable dt = ds2.Tables[0];

            PagedDataSource pgitems = new PagedDataSource();
            pgitems.DataSource = dt.DefaultView;
            pgitems.AllowPaging = true;

            //Control page size from here 
            pgitems.PageSize = 8;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i <= pgitems.PageCount - 1; i++)
                {
                    pages.Add((i + 1).ToString());
                }
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }

            //Finally, set the datasource of the repeater
            InquiryRptr.DataSource = pgitems;
            InquiryRptr.DataBind();
        }

    }
    protected void ClearBtn_Click(object sender, EventArgs e)
    {
        DateTb.Text = "";
        GetInquiryData();
        GetNoOfInq();
    }
    #region RepeaterWithPaging

    private void GetInquiryData()
    {
        string jk = "select * from inquiry ORDER BY InquiryDate DESC";
        DataSet ds = new DataSet();
        ds = dc.getdata(jk);

        DataTable dt = ds.Tables[0];

        PagedDataSource pgitems = new PagedDataSource();
        pgitems.DataSource = dt.DefaultView;
        pgitems.AllowPaging = true;

        //Control page size from here 
        pgitems.PageSize = 8;
        pgitems.CurrentPageIndex = PageNumber;
        if (pgitems.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList pages = new ArrayList();
            for (int i = 0; i <= pgitems.PageCount - 1; i++)
            {
                pages.Add((i + 1).ToString());
            }
            rptPaging.DataSource = pages;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }

        //Finally, set the datasource of the repeater
        InquiryRptr.DataSource = pgitems;
        InquiryRptr.DataBind();

        //GalleryRptr.DataSource = ds;
        //GalleryRptr.DataBind();
    }

    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
            {
                return Convert.ToInt32(ViewState["PageNumber"]);
            }
            else
            {
                return 0;
            }
        }
        set { ViewState["PageNumber"] = value; }
    }
    protected void rptPaging_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        GetInquiryData();
    }

    #endregion
    protected void EmailLb_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        //InqIdLbl.Text = id;
        Response.Redirect("~/Admin/SendEmail.aspx?id=" + id);
        //EmailModal.Visible = true;
        //ClientScript.RegisterStartupScript(this.GetType(), "alert", "openModal();", true);
    }
    protected void DeleteLb_Command(object sender, CommandEventArgs e)
    {
        string jkp = "delete from inquiry where id='" + e.CommandArgument.ToString() + "'";
        dc.setdata(jkp);
        GetInquiryData();
    }
    protected void AnsLb_Command(object sender, CommandEventArgs e)
    {
        string zkp = "update inquiry set IsAnswered=1 where id='" + e.CommandArgument.ToString() + "'";
        dc.setdata(zkp);
        GetInquiryData();
        GetNoOfInq();
    }

    private void GetNoOfInq()
    {
        Label lbl = (Label)Page.Master.FindControl("NoOfInqLbl") as Label;
        lbl.Text = dc.GetNoOfInq();
    }


}