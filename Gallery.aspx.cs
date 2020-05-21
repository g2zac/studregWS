using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Net;

public partial class Gallery : System.Web.UI.Page
{
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        // To display uploaded files in a gridview
        if (!IsPostBack)
        {
            AssignColumns();
            Display_sGridView(dt);

            AssignColumns();
            Display_tGridView(dt);
        }

    }
    private void AssignColumns()
    {
        dt = new DataTable();
        dt.Columns.Add("File", typeof(string));
        dt.Columns.Add("Display", typeof(string));
        dt.Columns.Add("Size", typeof(string));
        dt.Columns.Add("Type", typeof(string));
    }
    private void Display_sGridView(DataTable dt)
    {
        foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Uploads/Student/")))
        {
            FileInfo fi = new FileInfo(strFile);

            dt.Rows.Add(fi.Name, "", fi.Length, GetFileTypeByExtension(fi.Extension));
        }

        sGridView.DataSource = dt;
        sGridView.DataBind();
    }
    private void Display_tGridView(DataTable dt)
    {
        foreach (string strFile in Directory.GetFiles(Server.MapPath("~/Uploads/Teacher/")))
        {
            FileInfo fi = new FileInfo(strFile);

            dt.Rows.Add(fi.Name, "", fi.Length, GetFileTypeByExtension(fi.Extension));
        }

        tGridView.DataSource = dt;
        tGridView.DataBind();
    }
    // Function to get the file type based on the file extension
    private string GetFileTypeByExtension(string extension)
    {
        switch (extension.ToLower())
        {
            case ".doc":
            case ".docx":
                return "Word Document";

            case ".xls":
            case ".xlsx":
                return "Excel Document";

            case ".txt":
                return "Text Document";

            case ".pdf":
                return "PDF Document";

            case ".jpg":
            case ".jpeg":
            case ".png":
            case ".bmp":
                return "Image File";

            default:
                return "Unknown";
        }
    }
    protected void sUploadButton_Click(object sender, EventArgs e)
    {
        // To upload file
        if (sFileUpload.HasFile)
        {
            sFileUpload.PostedFile.SaveAs(Server.MapPath("~/Uploads/Student/") + sFileUpload.FileName);
        }
        sUploadLabel.Text = "Upload Successful!";
        //Response.Write("<script>confirm('Upload Successful!')</script>");

        // To display uploaded files in a gridview

        //Response.Redirect("Gallery.aspx");
        AssignColumns();
        Display_sGridView(dt);

    }

    protected void sGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // To download a file
        if (e.CommandName == "Download")
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/Uploads/Student/") + e.CommandArgument);
            Response.End();
        }

        if (e.CommandName == "ViewFile")
        {
            Response.Clear();

            string s1 = "pdf";
            string s2 = e.CommandArgument.ToString().ToLower();

            int res = isSubstring(s1, s2);

            if (res == -1)
                Response.Redirect("http://localhost:16835//Uploads/Student/" + e.CommandArgument);
            else
            {
                string FilePath = Server.MapPath("~/Uploads/Student/") + e.CommandArgument;

                WebClient User = new WebClient();
                Byte[] FileBuffer = User.DownloadData(FilePath);

                if (FileBuffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    Response.BinaryWrite(FileBuffer);
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }

    static int isSubstring(string s1, string s2)
    {
        int M = s1.Length;
        int N = s2.Length;

        /* A loop to slide pat[] one by one */
        for (int i = 0; i <= N - M; i++)
        {
            int j;

            /* For current index i, check for 
            pattern match */
            for (j = 0; j < M; j++)
                if (s2[i + j] != s1[j])
                    break;

            if (j == M)
                return i;
        }

        return -1;
    }
    protected void tUpladButton_Click(object sender, EventArgs e)
    {
        // To upload file
        if (tFileUpload.HasFile)
        {
            tFileUpload.PostedFile.SaveAs(Server.MapPath("~/Uploads/Teacher/") + tFileUpload.FileName);
        }
        tUploadLabel.Text = "Upload Successful!";
        
        AssignColumns();
        Display_tGridView(dt);
    }
    protected void tGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // To download a file
        if (e.CommandName == "Download")
        {
            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
            Response.TransmitFile(Server.MapPath("~/Uploads/Teacher/") + e.CommandArgument);
            Response.End();
        }

        if (e.CommandName == "ViewFile")
        {
            Response.Clear();

            string s1 = "pdf";
            string s2 = e.CommandArgument.ToString().ToLower();

            int res = isSubstring(s1, s2);

            if (res == -1)
                Response.Redirect("http://localhost:16835//Uploads/Teacher/" + e.CommandArgument);
            else
            {
                string FilePath = Server.MapPath("~/Uploads/Teacher/") + e.CommandArgument;

                WebClient User = new WebClient();
                Byte[] FileBuffer = User.DownloadData(FilePath);

                if (FileBuffer != null)
                {
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-length", FileBuffer.Length.ToString());
                    Response.BinaryWrite(FileBuffer);
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
}