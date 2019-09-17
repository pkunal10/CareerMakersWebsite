using System;
using System.Collections.Generic;
using System.Linq;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_JobOfferCategory : System.Web.UI.Page
{
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DataCon dc = new DataCon();
    //string Action;
    //string ImageId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack == true)
        {
            GetCategoryData();
            ActionLbl.Text = "Add";
        }

    }

    protected void AddUpdate_Click(object sender, EventArgs e)
    {
        if (ActionLbl.Text == "Add")
        {

            if (NameTb.Text != "")
            {
                string zk = "insert into joboffercategory (Category,IsShow) values('" + NameTb.Text + "'," + IsShowChk.Checked + ")";
                dc.setdata(zk);
                ClearFields();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Enter Name.');", true);
            }
        }
        else
        {
            if (NameTb.Text != "")
            {
                string zk = "update joboffercategory set Category='" + NameTb.Text + "',IsShow=" + IsShowChk.Checked + " where id='" + CatIdLbl.Text + "'";
                dc.setdata(zk);
                ClearFields();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Enter Name.');", true);
            }

        }

    }

    private void ClearFields()
    {
        NameTb.Text = "";
        IsShowChk.Checked = false;
        ActionLbl.Text = "Add";
        GetCategoryData();
        CatIdLbl.Text = "";
    }

    protected void EditCategory_Click(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        string zkp = "select * from joboffercategory where id='" + id + "'";
        DataSet ds3 = new DataSet();
        ds3 = dc.getdata(zkp);

        if (ds3.Tables[0].Rows.Count != 0)
        {
            NameTb.Text = ds3.Tables[0].Rows[0][1].ToString();
            IsShowChk.Checked = Convert.ToBoolean(ds3.Tables[0].Rows[0][2].ToString());
            CatIdLbl.Text = id;
            ActionLbl.Text = "Update";
        }
    }

    protected void DeleteCategory_Click(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        string jkp = "delete from joboffercategory where id='" + id + "'";
        dc.setdata(jkp);
        ClearFields();
    }


    #region RepeaterWithPaging

    private void GetCategoryData()
    {
        string jk = "select * from joboffercategory";
        DataSet ds = new DataSet();
        ds = dc.getdata(jk);

        DataTable dt = ds.Tables[0];

        PagedDataSource pgitems = new PagedDataSource();
        pgitems.DataSource = dt.DefaultView;
        pgitems.AllowPaging = true;

        //Control page size from here 
        pgitems.PageSize = 10;
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
        GalleryRptr.DataSource = pgitems;
        GalleryRptr.DataBind();

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
        GetCategoryData();
    }

    #endregion
    protected void ClearBtn_Click(object sender, EventArgs e)
    {
        ClearFields();
    }
}