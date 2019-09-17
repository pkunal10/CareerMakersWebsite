using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Drawing;
using System.Text;
using System.IO;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    DataCon dc = new DataCon();
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    [WebMethod]
    public List<AdmissionCategory> GetAdminssionCtegory()
    {
        List<AdmissionCategory> List = new List<AdmissionCategory>();

        string jk = "select * from AdmissionCategory where IsShow=1";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);

        if (dsjk.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsjk.Tables[0].Rows.Count; i++)
            {
                AdmissionCategory admissionCategory = new AdmissionCategory();
                admissionCategory.Id = dsjk.Tables[0].Rows[i][0].ToString();
                admissionCategory.CategoryName = dsjk.Tables[0].Rows[i][1].ToString();
                admissionCategory.Image = "/User/images/appPhoto/a" + dsjk.Tables[0].Rows[i][0].ToString() + ".jpg";
                admissionCategory.Status = "Success";
                List.Add(admissionCategory);
            }
        }
        else
        {
            AdmissionCategory admissionCategory = new AdmissionCategory();
            admissionCategory.Status = "NoData";
            List.Add(admissionCategory);
        }
        return List;
    }
    [WebMethod]
    public List<ShowData> GetShowData(string Id, string Type)
    {
        List<ShowData> list = new List<ShowData>();

        if (Type == "Admission")
        {
            string jk = "select * from Admissions where CategoryId='" + Id + "' and IsShow=1";
            DataSet dsjk = new DataSet();
            dsjk = dc.getdata(jk);
            if (dsjk.Tables[0].Rows.Count != 0)
            {
                for (int i = 0; i < dsjk.Tables[0].Rows.Count; i++)
                {
                    ShowData showData = new ShowData();
                    showData.Id = dsjk.Tables[0].Rows[i][0].ToString();
                    showData.CreatedOn = dsjk.Tables[0].Rows[i][1].ToString();
                    showData.Title = dsjk.Tables[0].Rows[i][2].ToString();
                    showData.Image = dsjk.Tables[0].Rows[i][3].ToString();
                    showData.Content = dsjk.Tables[0].Rows[i][4].ToString();
                    showData.CategoryId = dsjk.Tables[0].Rows[i][5].ToString();
                    showData.Status = "Success";

                    list.Add(showData);
                }
            }
            else
            {
                ShowData showData = new ShowData();
                showData.Status = "NoData";
                list.Add(showData);
            }
        }
        else if (Type == "Job")
        {
            string jk = "select * from Jobs where CategoryId='" + Id + "' and IsShow=1";
            DataSet dsjk = new DataSet();
            dsjk = dc.getdata(jk);
            if (dsjk.Tables[0].Rows.Count != 0)
            {
                for (int i = 0; i < dsjk.Tables[0].Rows.Count; i++)
                {
                    ShowData showData = new ShowData();
                    showData.Id = dsjk.Tables[0].Rows[i][0].ToString();
                    showData.CreatedOn = dsjk.Tables[0].Rows[i][1].ToString();
                    showData.Title = dsjk.Tables[0].Rows[i][2].ToString();
                    showData.Image = dsjk.Tables[0].Rows[i][3].ToString();
                    showData.Content = dsjk.Tables[0].Rows[i][4].ToString();
                    showData.CategoryId = dsjk.Tables[0].Rows[i][5].ToString();
                    showData.Status = "Success";

                    list.Add(showData);
                }
            }
            else
            {
                ShowData showData = new ShowData();
                showData.Status = "NoData";
                list.Add(showData);
            }
        }
        return list;
    }
    [WebMethod]
    public List<AdmissionCategory> GetJobCategory()
    {
        List<AdmissionCategory> List = new List<AdmissionCategory>();

        string jk = "select * from joboffercategory where IsShow=1";
        DataSet dsjk = new DataSet();
        dsjk = dc.getdata(jk);

        if (dsjk.Tables[0].Rows.Count != 0)
        {
            for (int i = 0; i < dsjk.Tables[0].Rows.Count; i++)
            {
                AdmissionCategory admissionCategory = new AdmissionCategory();
                admissionCategory.Id = dsjk.Tables[0].Rows[i][0].ToString();
                admissionCategory.CategoryName = dsjk.Tables[0].Rows[i][1].ToString();
                admissionCategory.Image = "/User/images/appPhoto/j" + dsjk.Tables[0].Rows[i][0].ToString() + ".jpg";
                admissionCategory.Status = "Success";
                List.Add(admissionCategory);
            }
        }
        else
        {
            AdmissionCategory admissionCategory = new AdmissionCategory();
            admissionCategory.Status = "NoData";
            List.Add(admissionCategory);
        }
        return List;
    }
    //[WebMethod]
    //public string SaveData(byte[] i)
    //{
    //    Image image = (Bitmap)((new ImageConverter()).ConvertFrom(i));
    //    image.Save(Server.MapPath("~/Admin/10thMarksheet" + image.ToString()));       
    //    return "Success";
    //}

    public Image ConvertToImage(string imagestr)
    {
        byte[] imageBytes = Convert.FromBase64String(imagestr);
        using (var ms = new MemoryStream(imageBytes, 0,
                                         imageBytes.Length))
        {
            // Convert byte[] to Image
            ms.Write(imageBytes, 0, imageBytes.Length);
            Image image = Image.FromStream(ms, true);
            return image;
        }
    }

    //[WebMethod]
    //public String SaveData(String image)
    //{
    //    // byte[] image_byte = Encoding.Unicode.GetBytes(image);
    //    Image convertedImage = ConvertToImage(image);
    //    try
    //    {
    //        convertedImage.Save(Server.MapPath("~/Admin/10thMarksheet/generated_image.png"), System.Drawing.Imaging.ImageFormat.Png);
    //    }
    //    catch (Exception e)
    //    {
    //        return e.Message;
    //    }
    //    return "Success";
    //}

    //[WebMethod]
    //public String SaveData(String image, String image2, string image3)
    //{
    //    // byte[] image_byte = Encoding.Unicode.GetBytes(image);
    //    Image convertedImage = ConvertToImage(image);
    //    Image convertedImage2 = ConvertToImage(image2);
    //    Image convertedImage3 = ConvertToImage(image3);
    //    try
    //    {
    //        convertedImage.Save(Server.MapPath("~/Admin/10thMarksheet/generated_image.png"), System.Drawing.Imaging.ImageFormat.Png);
    //        convertedImage2.Save(Server.MapPath("~/Admin/10thMarksheet/generated_image2.png"), System.Drawing.Imaging.ImageFormat.Png);
    //        convertedImage3.Save(Server.MapPath("~/Admin/10thMarksheet/generated_image3.png"), System.Drawing.Imaging.ImageFormat.Png);
    //    }
    //    catch (Exception e)
    //    {
    //        return e.Message;
    //    }
    //    return "Success";
    //}

    [WebMethod]
    public String SaveAdmData(String Fname, String Mname, String Lname, String DOB, String Gender, String Address, String State, String PIN, String Email, String FAname, String MOname, String StuMob, String FAMob, String Course, String StuImg, String TenMSImg, String TwelveMSImg)
    {
        // byte[] image_byte = Encoding.Unicode.GetBytes(image);
        Image convertedStuImg = ConvertToImage(StuImg);
        Image convertedTenMSImg = ConvertToImage(TenMSImg);
        Image convertedTwelveMSImg = ConvertToImage(TwelveMSImg);
        //String stuPath = ConfigurationManager.AppSettings["StuPhotoPath"] + Email;
        //String tenPath = ConfigurationManager.AppSettings["10thMarksheetPath"] + Email;
        //String twelvePath = ConfigurationManager.AppSettings["12thMarksheetPath"] + Email;
        String stuPath = "~//Admin//StudentPhotos//" + Email + ".png";
        String tenPath = "~//Admin//10thMarksheet//" + Email + ".png";
        String twelvePath = "~//Admin//12thMarksheet//" + Email + ".png";
        try
        {
            convertedStuImg.Save(Server.MapPath(stuPath), System.Drawing.Imaging.ImageFormat.Png);
            convertedTenMSImg.Save(Server.MapPath(tenPath), System.Drawing.Imaging.ImageFormat.Png);
            convertedTwelveMSImg.Save(Server.MapPath(twelvePath), System.Drawing.Imaging.ImageFormat.Png);

            string zk = "insert into admissionform (RegistarionDate,FName,MName,LName,DOB,Gender,Address,State,PostalCode,EmailId,FatherName,MotherName,StudenMobile,FatherMobile,Photo,AdmissionInId,TenMarkSheet,TwelveMarkSheet,IsAnswered) values('" + current_time.ToShortDateString() + "','" + Fname + "','" + Mname
                + "','" + Lname + "','" + DOB + "','" + Gender + "','" + Address + "','" + State + "','" + PIN + "','" + Email + "','" + FAname + "','" + MOname + "','" + StuMob + "','" + FAMob + "','" + stuPath + "'," + Course + ",'" + tenPath + "','" + twelvePath + "',0)";
            dc.setdata(zk);
        }
        catch (Exception e)
        {
            return e.Message;
        }
        return "Success";
    }

}
