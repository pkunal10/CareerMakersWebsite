using System;
using System.Collections.Generic;
using System.Linq;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Gallery : System.Web.UI.Page
{
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DataCon dc = new DataCon();
    //string Action;
    //string ImageId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack==true)
        {
            GetGalleryData();
            ActionLbl.Text = "Add";
        }
        
    }
    
    protected void AddBtn_Click(object sender, EventArgs e)
    {
        if(ActionLbl.Text=="Add")
        {
            if (Image.HasFile)
            {
                string ext = System.IO.Path.GetExtension(Image.FileName);

                if (ext.ToLower() == ".png" || ext.ToLower() == ".jpg" || ext.ToLower() == ".jpeg")
                {
                    Image.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["GalleryImgPath"]) + Image.FileName);
                    string path = ConfigurationManager.AppSettings["GalleryImgPath"] + Image.FileName;

                    string zk = "insert into gallery (Title,Description,Image,CreatedOn,IsShow) values('" + TitileTb.Text + "','" + DescriptionTb.Text + "','" + path + "','" + current_time + "'," + IsShowChk.Checked + ")";
                    dc.setdata(zk);
                    ClearFields();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Image Only.');", true);
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please select Image.');", true);
            }
        }
        else
        {
            if (Image.HasFile)
            {
                string ext = System.IO.Path.GetExtension(Image.FileName);

                if (ext.ToLower() == ".png" || ext.ToLower() == ".jpg" || ext.ToLower() == ".jpeg")
                {
                    Image.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["GalleryImgPath"]) + Image.FileName);
                    string path = ConfigurationManager.AppSettings["GalleryImgPath"] + Image.FileName;

                    string zk = "update gallery set Title='" + TitileTb.Text + "',Description='" + DescriptionTb.Text + "',Image='" + path + "',CreatedOn='" + current_time + "',IsShow=" + IsShowChk.Checked + " where id='" + ImageIdLbl.Text + "'";
                    dc.setdata(zk);
                    ClearFields();
                }
                else
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Image Only.');", true);
                }
            }
            else
            {
                string zk = "update gallery set Title='" + TitileTb.Text + "',Description='" + DescriptionTb.Text + "',CreatedOn='" + current_time + "',IsShow=" + IsShowChk.Checked + " where id='" + ImageIdLbl.Text + "'";
                dc.setdata(zk);
                ClearFields();
            }
        }
        
    }

    private void ClearFields()
    {
        TitileTb.Text = "";
        DescriptionTb.Text = "";
        IsShowChk.Checked = false;        
        ActionLbl.Text = "Add";
        GetGalleryData();
        ImageIdLbl.Text = "";
    }

    protected void EditGallery_Click(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        string zkp = "select * from gallery where id='" + id + "'";
        DataSet ds3 = new DataSet();
        ds3 = dc.getdata(zkp);

        if(ds3.Tables[0].Rows.Count!=0)
        {
            TitileTb.Text = ds3.Tables[0].Rows[0][1].ToString();
            DescriptionTb.Text = ds3.Tables[0].Rows[0][2].ToString();
            IsShowChk.Checked = Convert.ToBoolean(ds3.Tables[0].Rows[0][5].ToString());
            ImageIdLbl.Text = id;
            ActionLbl.Text = "Update";
        }
    }

    protected void DeleteGallery_Click(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        string jkp = "delete from gallery where id='" + id + "'";
        dc.setdata(jkp);
        ClearFields();
    }


    #region RepeaterWithPaging

    private void GetGalleryData()
    {
        string jk = "select * from gallery ORDER BY CreatedOn DESC";
        DataSet ds = new DataSet();
        ds = dc.getdata(jk);

        DataTable dt = ds.Tables[0];

        PagedDataSource pgitems = new PagedDataSource();
        pgitems.DataSource = dt.DefaultView;
        pgitems.AllowPaging = true;

        //Control page size from here 
        pgitems.PageSize = 4;
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
        GetGalleryData();
    }

    #endregion
    protected void ClearBtn_Click(object sender, EventArgs e)
    {
        ClearFields();
    }
}