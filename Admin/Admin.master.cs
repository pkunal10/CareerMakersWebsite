using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Convert.ToString(Session["aId"])!="")
        {
            string zk = "select * from inquiry where InquiryDate='" + current_time.ToShortDateString() + "' and IsAnswered=0";
            DataSet ds = new DataSet();
            ds = dc.getdata(zk);
            NoOfInqLbl.Text = ds.Tables[0].Rows.Count.ToString();

            NoOfAdmInqLbl.Text = dc.GetNoOfAdmInq();
        }
        else
        {
            Response.Redirect("~/Admin/Login.aspx");
        }
        
    }
    protected void LogOutBtn_ServerClick(object sender, EventArgs e)
    {
        Session["aId"] = "";
        Response.Redirect("~/Admin/Login.aspx");
    }
}
