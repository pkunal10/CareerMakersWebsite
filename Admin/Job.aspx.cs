using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FreeTextBoxControls;
using System.Data;

public partial class Admin_Admissions : System.Web.UI.Page
{
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet ds1 = new DataSet();
            string j = "select * from joboffercategory";
            ds1 = dc.getdata(j);

            CategoryDD.DataSource = ds1;
            CategoryDD.DataBind();
            CategoryDD.DataTextField = "Category";
            CategoryDD.DataValueField = "Id";
            CategoryDD.DataBind();
            CategoryDD.Items.Insert(0, "--To Select--");

            GetJobData();
            ActionLbl.Text = "Add";

            GridPanel.Visible = false;
            InsertPanel.Visible = true;

        }
    }
    protected void AddUpdateBtn_Click(object sender, EventArgs e)
    {
        if(CategoryDD.SelectedIndex==0)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Category.');", true);
        }
        else
        {
            if(DescriptionTb.Text=="")
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Write Some Content.');", true);
            }
            else
            {
                if(TitleTb.Text=="")
                {
                    ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Enter Title.');", true);
                }
                else
                {
                    if (ActionLbl.Text == "Add")
                    {
                        if (Image.HasFile)
                        {
                            string ext = System.IO.Path.GetExtension(Image.FileName);

                            if (ext.ToLower() == ".png" || ext.ToLower() == ".jpg" || ext.ToLower() == ".jpeg")
                            {
                                Image.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["JobImgPath"]) + Image.FileName);
                                string path = ConfigurationManager.AppSettings["JobImgPath"] + Image.FileName;

                                string zk = "insert into jobs (CreatedOn,Title,Image,Content,CategoryId,IsShow) values('" + current_time.ToShortDateString() + "','" + TitleTb.Text + "','" + path + "','" + DescriptionTb.Text + "','" + CategoryDD.SelectedValue + "'," + IsShowChk.Checked + ")";
                                dc.setdata(zk);
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Data Added.');", true);
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
                                Image.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["JobImgPath"]) + Image.FileName);
                                string path = ConfigurationManager.AppSettings["JobImgPath"] + Image.FileName;

                                string zk = "update jobs set CreatedOn='" + current_time.ToShortDateString() + "',Title='" + TitleTb.Text + "',Image='" + path + "',Content='" + DescriptionTb.Text + "',CategoryId='" + CategoryDD.SelectedValue + "',IsShow=" + IsShowChk.Checked + " where id='" + ImageIdLbl.Text + "'";
                                dc.setdata(zk);
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Data Updated.');", true);
                                ClearFields();
                            }
                            else
                            {
                                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Select Image Only.');", true);
                            }
                        }
                        else
                        {
                            string zk = "update jobs set CreatedOn='" + current_time.ToShortDateString() + "',Title='" + TitleTb.Text + "',Content='" + DescriptionTb.Text + "',CategoryId='" + CategoryDD.SelectedValue + "',IsShow=" + IsShowChk.Checked + " where id='" + ImageIdLbl.Text + "'";
                            dc.setdata(zk);
                            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Data Updated.');", true);
                            ClearFields();
                        }
                    }
                }
            }
        }        
    }

    private void ClearFields()
    {
        CategoryDD.SelectedIndex = 0;
        DescriptionTb.Text = "";
        TitleTb.Text = "";
        IsShowChk.Checked = false;
        ActionLbl.Text = "Add";
        GetJobData();
        ImageIdLbl.Text = "";
        GridPanel.Visible = false;
        InsertPanel.Visible = true;
    }

    protected void ClearBtn_Click(object sender, EventArgs e)
    {
        ClearFields();
    }
    protected void EditJobLb_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        string zkp = "select * from jobs where id='" + id + "'";
        DataSet ds3 = new DataSet();
        ds3 = dc.getdata(zkp);

        if (ds3.Tables[0].Rows.Count != 0)
        {
            CategoryDD.SelectedValue = ds3.Tables[0].Rows[0][5].ToString();
            DescriptionTb.Text = ds3.Tables[0].Rows[0][4].ToString();
            TitleTb.Text = ds3.Tables[0].Rows[0][2].ToString();
            IsShowChk.Checked = Convert.ToBoolean(ds3.Tables[0].Rows[0][6].ToString());
            ImageIdLbl.Text = id;
            ActionLbl.Text = "Update";
            GridPanel.Visible = false;
            InsertPanel.Visible = true;
        }
    }
    protected void DeleteJobLb_Command(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();

        string jkp = "delete from jobs where id='" + id + "'";
        dc.setdata(jkp);
        ClearFields();
    }

    #region RepeaterWithPaging

    private void GetJobData()
    {
        string jk = "select jobs.Id,jobs.Title,jobs.CreatedOn,jobs.Image,jobs.Content,jobs.IsShow,joboffercategory.Category from jobs join joboffercategory on jobs.CategoryId = joboffercategory.Id ORDER BY jobs.CreatedOn DESC";
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
        AdmissionRptr.DataSource = pgitems;
        AdmissionRptr.DataBind();

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
        GetJobData();
    }

    #endregion

    protected void ShoeDataBtn_Click(object sender, EventArgs e)
    {
        GetJobData();
        GridPanel.Visible = true;
        InsertPanel.Visible = false;
    }
    protected void BackBtn_Click(object sender, EventArgs e)
    {
        GridPanel.Visible = false;
        InsertPanel.Visible = true;
    }
}