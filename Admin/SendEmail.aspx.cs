using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Threading;

public partial class Admin_SendEmail : System.Web.UI.Page
{
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string id = Request.QueryString["id"];

            string zk = "select * from inquiry where id='" + id + "'";
            DataSet ds = new DataSet();
            ds = dc.getdata(zk);

            if(ds.Tables[0].Rows.Count!=0)
            {
                NameTb.Text = ds.Tables[0].Rows[0][2].ToString();
                ToTb.Text = ds.Tables[0].Rows[0][3].ToString();
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('No Entry Found.');", true);
            }
        }
    }
    protected void SendMailBtn_Click(object sender, EventArgs e)
    {
        if (SubjectTb.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Enter Subject.');", true);
        }
        if (MsgTb.Text == "")
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Please Enter Message.');", true);
        }

        Thread email = new Thread(delegate()
        {
            sendmail();           
        });
        email.IsBackground = true;
        email.Start();

        string zkp = "update inquiry set IsAnswered=1 where id='" + Request.QueryString["id"].ToString() + "'";
        dc.setdata(zkp);

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Email Is Sent.');window.location='Inqury.aspx';", true);
    }

    private void sendmail()
    {
        try
        {            
            string fromEmail = ConfigurationManager.AppSettings["FromEmail"].ToString();
            string password = ConfigurationManager.AppSettings["Password"].ToString();
            string title = ConfigurationManager.AppSettings["Title"].ToString();

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress(fromEmail,title);//TIFFIN DABBA represent title in sent email.
            mm.To.Add(ToTb.Text);
            mm.Subject = SubjectTb.Text;

            mm.Body = MsgTb.Text;
            
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential(fromEmail,password);

            smtp.Send(mm);
        }
        catch (Exception ex)
        {
            string Mail_msg = "Mail can't be sent because of server problem: ";
            Mail_msg += ex.Message;
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('" + Mail_msg + "');", true);
        }
    }
}