using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ClearData(Control p1)
    {

        foreach (Control ctrl in p1.Controls)
        {
            if (ctrl is TextBox || ctrl is DropDownList)
            {
                TextBox t = ctrl as TextBox;
                if (t != null)
                {
                    t.Text = String.Empty;
                }

                DropDownList ddl = ctrl as DropDownList;
                if (ddl != null)
                {
                    ddl.ClearSelection();
                }
            }
            else
            {
                if (ctrl.Controls.Count > 0)
                {
                    ClearData(ctrl);
                }
            }
        }

    }

    protected void SubmitImgBtn_Click(object sender, ImageClickEventArgs e)
    {
        String dob = dob_dd.Text + "-" + dob_mm.Text + "-" + dob_yyyy.Text;
        int year = Convert.ToInt32(DateTime.Now.Year.ToString());
        int month = Convert.ToInt32(DateTime.Now.Month.ToString());
        int yy = year, mm = month;

        try
        {
            yy = Convert.ToInt32(dob_yyyy.Text);
            mm = Convert.ToInt32(dob_mm.Text);
        }
        catch (FormatException)
        {

        }

        year = year - yy;
        month = month - mm;
        year = month < 0 ? year - 1 : year;
        month = month < 0 ? 12 + month : month;


        String gen;
        if (GenderList.Text.Equals("Male") == true)
            gen = "M";
        else
            gen = "F";


        string insert_course_qry = "insert into studDetails values('" + sfname.Text + "')";


        String course;
        if (CourseList.Text.Equals("Bachelors") == true)
            course = bcourse.Text;
        else
            course = mcourse.Text;


        string select_qry;
        if (stream.Text.Equals("default") == true)
            select_qry = "select courseID from CDetails where degree='" + CourseList.Text + "' and courseName='" + course + "'";
        else
            select_qry = "select courseID from CDetails where degree='" + CourseList.Text + "' and courseName='" + course + "' and stream='" + stream.Text + "'";

        DataSet ds = DbAccess.FetchData(select_qry);
        String cID = "0";
        if (ds.Tables[0].Rows.Count == 1)
        {
            cID = ds.Tables[0].Rows[0]["courseID"].ToString();
        }
        int numCid = Convert.ToInt32(cID);

        Int64 mob = Int64.Parse(smobile.Text);

        string insert_qry = "insert into studDetails values('" + sfname.Text + "','" + slname.Text + "','" + dob + "','" + year + "','" + semail.Text + "','" + mob + "','" + gen + "','" + numCid + "')";

        bool response = DbAccess.SaveData(insert_qry);

        if (response == true)
        {
            select_qry = "select regdID from studDetails order by regdID";
            ds = new DataSet();
            ds = DbAccess.FetchData(select_qry);
            cID = "";
            if (ds.Tables[0].Rows.Count >= 1)
            {
                cID = ds.Tables[0].Rows[ds.Tables[0].Rows.Count - 1]["regdID"].ToString();
            }
            String rID = cID;
            string ps_qry = "declare @MyCounter as int; declare @Limit as int; set @MyCounter = 1; set @Limit = (select COUNT(regdID) from studDetails) - (select COUNT(regdID) from studPs); while @MyCounter <= @Limit begin insert into studPs values(" + cID + ", left(cast(rand()*1000000000+999999 as int),6)); set @MyCounter = @MyCounter + 1; end";
            bool resp = DbAccess.SaveData(ps_qry);

            if (resp == true)
            {
                select_qry = "select spassword from studPs";
                ds = new DataSet();
                ds = DbAccess.FetchData(select_qry);
                if (ds.Tables[0].Rows.Count >= 1)
                {
                    cID = ds.Tables[0].Rows[ds.Tables[0].Rows.Count - 1]["spassword"].ToString();
                }
                string message = "Your Password is - " + cID + ". Please keep in mind!";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }

            String str = pname.Text;
            char[] spearator = { ' ' };

            String[] pnamelist = str.Split(spearator, StringSplitOptions.RemoveEmptyEntries);

            mob = Int64.Parse(pmobile.Text);
            ps_qry = "insert into parentDetails values('" + rID + "','" + pnamelist[0] + "','" + pnamelist[1] + "','" + prelation.Text + "','" + pemail.Text + "','" + mob + "')";
            resp = DbAccess.SaveData(ps_qry);


            Response.Write("<script>confirm('Registration Successful! Welcome New Student! Proceed to Home.')</script>");
            ClearData(Page);

        }

        else
        {
            Response.Write("<script>confirm('Some errors encountered! Please try again...')</script>");
            ClearData(Page);
        }
    }
    protected void dob_selection(object sender, EventArgs e)
    {
        int year = Convert.ToInt32(DateTime.Now.Year.ToString());
        int month = Convert.ToInt32(DateTime.Now.Month.ToString());
        int yy = year, mm = month;

        try
        {
            yy = Convert.ToInt32(dob_yyyy.Text);
            mm = Convert.ToInt32(dob_mm.Text);
        }
        catch (FormatException)
        {

        }

        year = year - yy;
        month = month - mm;
        year = month < 0 ? year - 1 : year;
        month = month < 0 ? 12 + month : month;

        age.Text = year.ToString() + " year(s) and " + month.ToString() + " month(s) ";

    }
    protected void CourseList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CourseList.Text.Equals("Bachelors") == true)
        {
            bcourse.Enabled = true;
            mcourse.Enabled = false;
            stream.Enabled = false;
            bcourse.ClearSelection();
            mcourse.ClearSelection();
            stream.ClearSelection();
        }
        else
        {
            bcourse.Enabled = false;
            mcourse.Enabled = true;
            stream.Enabled = false;
            bcourse.ClearSelection();
            mcourse.ClearSelection();
            stream.ClearSelection();
        }
    }
    protected void bcourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (bcourse.Text.Equals("B.Tech.") == true)
        {
            stream.Enabled = true;
        }
        else
        {
            stream.Enabled = false;
            stream.ClearSelection();
        }
    }
    protected void mcourse_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (mcourse.Text.Equals("M.Tech.") == true)
        {
            stream.Enabled = true;
        }
        else
        {
            stream.Enabled = false;
            stream.ClearSelection();
        }
    }
}