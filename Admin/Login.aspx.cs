using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Login : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SignInBtn_ServerClick(object sender, EventArgs e)
    {
        string zk = "select * from adminlogin where Id='" + UserIdTb.Text + "' and Password='" + PasswordTb.Text + "'";
        DataSet ds = new DataSet();
        ds = dc.getdata(zk);
        if(ds.Tables[0].Rows.Count!=0)
        {
            Session["aId"] = UserIdTb.Text;
            Response.Redirect("~/Admin/AdmissionCategory.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Invalid UserId Or Password.');", true);
            UserIdTb.Text = "";
            PasswordTb.Text = "";
        }
    }
}