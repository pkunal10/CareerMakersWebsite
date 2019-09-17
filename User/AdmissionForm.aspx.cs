using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

public partial class User_AdmissionForm : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DataSet ds1 = new DataSet();
            string j = "select * from  admissioncategory where IsShow=1";
            ds1 = dc.getdata(j);

            AdmissionDD.DataSource = ds1;
            AdmissionDD.DataBind();
            AdmissionDD.DataTextField = "Category";
            AdmissionDD.DataValueField = "Id";
            AdmissionDD.DataBind();
            AdmissionDD.Items.Insert(0, "--To Select--");
        }
    }
    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        string ext = System.IO.Path.GetExtension(Photo.FileName);

        if (ext.ToLower() == ".png" || ext.ToLower() == ".jpg" || ext.ToLower() == ".jpeg")
        {
            Photo.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["StuPhotoPath"]) + Photo.FileName);
            TenMarkSheet.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["10thMarksheetPath"]) + TenMarkSheet.FileName);
            TewlveMarkSheet.SaveAs(Server.MapPath(ConfigurationManager.AppSettings["12thMarksheetPath"]) + TewlveMarkSheet.FileName);
            string stuPath = ConfigurationManager.AppSettings["StuPhotoPath"] + Photo.FileName;
            string tenMarkPath = ConfigurationManager.AppSettings["10thMarksheetPath"] + TenMarkSheet.FileName;
            string twelveMarkPath = ConfigurationManager.AppSettings["12thMarksheetPath"] + TewlveMarkSheet.FileName;

            string zk = "insert into admissionform (RegistarionDate,FName,MName,LName,DOB,Gender,Address,State,PostalCode,EmailId,FatherName,MotherName,StudenMobile,FatherMobile,Photo,AdmissionInId,TenMarkSheet,TwelveMarkSheet,IsAnswered) values('" + current_time.ToShortDateString() + "','" + FNameTb.Text + "','" + MNameTb.Text
                + "','" + LNameTb.Text + "','" + DOBTb.Text + "','" + gender.SelectedItem + "','" + AddressTb.Text + "','" + StateTb.Text + "','" + PINTb.Text + "','" + EmailTb.Text + "','" + FatherNameTb.Text + "','" + MotherNameTb.Text + "','" + StuMobTb.Text + "','" + FaMobTb.Text + "','" + stuPath + "'," + AdmissionDD.SelectedValue + ",'" + tenMarkPath + "','" + twelveMarkPath + "',0)";
            dc.setdata(zk);
            //ClearFields();

            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Form Submitted.');window.location='AdmissionForm.aspx';", true);
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Select Image Only For Photo.');", true);
        }
    }
}