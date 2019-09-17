using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Configuration;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for DataCon
/// </summary>
public class DataCon
{
    MySqlCommand cmd;
    MySqlConnection con;
    MySqlDataAdapter da;
    DateTime current_time = TimeZoneInfo.ConvertTime(DateTime.Now, TimeZoneInfo.Local, TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
    

    //public DataCon()
    //{
    //    string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    //    con = new MySqlConnection(constr);
    //    con.Open();
    //}
    public void setdata(string s)
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        con = new MySqlConnection(constr);
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }
        //try
        // {
        cmd = new MySqlCommand(s, con);
        cmd.ExecuteNonQuery();
        con.Close();
        //}
        //catch (Exception ex)
        //{
        //    throw ex;
        //}
    }
    public DataSet getdata(string s)
    {
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        con = new MySqlConnection(constr);
        if (con.State.ToString() == "Closed")
        {
            con.Open();
        }
        da = new MySqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        con.Close();
        return ds;
    }

    public string GetNoOfInq ()
    {
        DataCon dc = new DataCon();
        string zk = "select * from inquiry where InquiryDate='" + current_time.ToShortDateString() + "' and IsAnswered=0";
        DataSet ds = new DataSet();
        ds = dc.getdata(zk);
        return ds.Tables[0].Rows.Count.ToString();
    }

    public string GetNoOfAdmInq()
    {
        DataCon dc = new DataCon();
        string zk = "select * from admissionform where RegistarionDate='" + current_time.ToShortDateString() + "' and IsAnswered=0";
        DataSet ds = new DataSet();
        ds = dc.getdata(zk);
        return ds.Tables[0].Rows.Count.ToString();
    }
}