using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_UserWithSlider : System.Web.UI.MasterPage
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        string zkp = "select * from admissioncategory where IsShow=1";
        ds = dc.getdata(zkp);
        AdmissionCategoryRptr.DataSource = ds;
        AdmissionCategoryRptr.DataBind();

        DataSet ds1 = new DataSet();
        string zk = "select * from joboffercategory where IsShow=1";
        ds1 = dc.getdata(zk);
        JobOfferCategoryRptr.DataSource = ds1;
        JobOfferCategoryRptr.DataBind();
    }
    protected void admissionCatLb_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/User/Admissions.aspx?id=" + e.CommandArgument.ToString());
    }
    protected void jobOfferCatLb_Command(object sender, CommandEventArgs e)
    {
        Response.Redirect("~/User/Jobs.aspx?id=" + e.CommandArgument.ToString());
    }
}
