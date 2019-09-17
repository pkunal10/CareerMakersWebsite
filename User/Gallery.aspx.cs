using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;

public partial class User_Gallery : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string zk = "select * from gallery where IsShow=1";
            DataSet ds = new DataSet();

            ds = dc.getdata(zk);

            GalleryRptr.DataSource = ds;
            GalleryRptr.DataBind();


            DataSet ds3 = new DataSet();
            string zkp = "select * from admissioncategory where IsShow=1";
            ds3 = dc.getdata(zkp);
            AdmissionCategoryRptr.DataSource = ds3;
            AdmissionCategoryRptr.DataBind();

            DataSet ds1 = new DataSet();
            string jk = "select * from joboffercategory where IsShow=1";
            ds1 = dc.getdata(jk);
            JobOfferCategoryRptr.DataSource = ds1;
            JobOfferCategoryRptr.DataBind();

        }
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