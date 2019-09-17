using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_FullDetailsOfAdmissionInquiry : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string id = Request.QueryString["id"].ToString();

            SetData(id);
        }
    }

    private void SetData(string id)
    {
        string zk = "select * from admissionform where id='" + id + "'";
        DataSet ds = new DataSet();
        ds = dc.getdata(zk);

        string jk = "select Category from admissioncategory where id='" + ds.Tables[0].Rows[0][16].ToString() + "'";
        DataSet ds1 = new DataSet();
        ds1 = dc.getdata(jk);

        FNameTb.Text = ds.Tables[0].Rows[0][2].ToString();
        MNameTb.Text = ds.Tables[0].Rows[0][3].ToString();
        LNameTb.Text = ds.Tables[0].Rows[0][4].ToString();
        DOBTb.Text = ds.Tables[0].Rows[0][5].ToString();
        GenderTb.Text = ds.Tables[0].Rows[0][6].ToString();
        AddressTb.Text = ds.Tables[0].Rows[0][7].ToString();
        StateTb.Text = ds.Tables[0].Rows[0][8].ToString();
        PINTb.Text = ds.Tables[0].Rows[0][9].ToString();
        EmailTb.Text = ds.Tables[0].Rows[0][10].ToString();
        FatherNameTb.Text = ds.Tables[0].Rows[0][11].ToString();
        MotherNameTb.Text = ds.Tables[0].Rows[0][12].ToString();
        StuMobTb.Text = ds.Tables[0].Rows[0][13].ToString();
        FaMobileTb.Text = ds.Tables[0].Rows[0][14].ToString();
        StuPhoto.ImageUrl = ds.Tables[0].Rows[0][15].ToString();
        AdmissionTb.Text = ds1.Tables[0].Rows[0][0].ToString();
        TenMarkHl.NavigateUrl = ds.Tables[0].Rows[0][17].ToString();
        TwelveMarkHl.NavigateUrl = ds.Tables[0].Rows[0][18].ToString();

    }
}