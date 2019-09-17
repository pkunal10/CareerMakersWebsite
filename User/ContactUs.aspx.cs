using System;
using System.Collections.Generic;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Threading;

public partial class User_ContactUs : System.Web.UI.Page
{
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    DataCon dc = new DataCon();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    public void SubmitBtn_ServerClick(object sender,EventArgs e)
    {
        string zk = "insert into inquiry (InquiryDate,Name,EmailId,Mobile,Location,Message,IsAnswered) values('" + current_time.ToShortDateString() + "','" + NameTb.Text + "','" + EmailTb.Text + "','" + MobileTb.Text + "','" + LocationTb.Text + "','" + MsgTb.Text + "',false)";
        dc.setdata(zk);

        Thread email = new Thread(delegate()
        {
            sendmail();            
        });
        email.IsBackground = true;
        email.Start();

        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "alert('Inqiury Submitted.');window.location='ContactUs.aspx';", true);
        
    }

    private void sendmail()
    {
        try
        {
            string fromEmail = ConfigurationManager.AppSettings["FromEmail"].ToString();
            string adminEmail = ConfigurationManager.AppSettings["AdminEmail"].ToString();
            string password = ConfigurationManager.AppSettings["Password"].ToString();
            string title = ConfigurationManager.AppSettings["Title"].ToString();

            MailMessage mm = new MailMessage();
            mm.From = new MailAddress(fromEmail, title);
            mm.To.Add(adminEmail);
            mm.Subject = "New Inquiry";

            mm.Body = "Hello Admin New Inquiry Is Submitted As Given Details Below <br> Name:- " + NameTb.Text + "<br> Mobile No:- " + MobileTb.Text + " <br>Message:- " + MsgTb.Text;

            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential(fromEmail, password);

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