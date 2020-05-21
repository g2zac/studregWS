using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ContentViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ImageFile.ImageUrl = "~/Uploads/Student/dylan-choonhachat-17s.jpg";
        Response.Write(Request.QueryString["FileUrl"]);

    }
}