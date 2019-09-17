using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class User_Admissions : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string id = Request.QueryString["id"].ToString();

            string zk = "select * from  joboffercategory where id=" + id;
            DataSet ds = new DataSet();
            ds = dc.getdata(zk);
            JobCatLbl.Text = ds.Tables[0].Rows[0][1].ToString();

            GetDataItem(id);

        }
    }

    private void GetDataItem(string catId)
    {
        string zk = "select * from jobs where CategoryId='" + catId + "' and IsShow=1";
        DataSet ds2 = new DataSet();
        ds2 = dc.getdata(zk);

        if(ds2.Tables[0].Rows.Count!=0)
        {
            AdmRptr.DataSource = ds2;
            AdmRptr.DataBind();
        }        
        else
        {
            NoDataLbl.Text = "No Data Available For " + JobCatLbl.Text + " Category";
        }

    }
}