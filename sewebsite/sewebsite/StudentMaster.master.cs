using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Request.QueryString["ID"] != null)
        {
            // try to parse the ID value from the query string
            int ID = (int)Session["ID"];
        }
    }

 protected void LinkButton1_Click1(object sender, EventArgs e)
 {
     Response.Redirect("StudentHome.aspx");
 }

 protected void LinkButton2_Click(object sender, EventArgs e)
 {
     Response.Redirect("ProjectDetails.aspx");
 }

 protected void LinkButton3_Click(object sender, EventArgs e)
 {
     Response.Redirect("StudentReview.aspx");
 }

 protected void LinkButton4_Click(object sender, EventArgs e)
 {
     Response.Redirect("StudentProgressReport.aspx");
 }

 protected void LinkButton5_Click(object sender, EventArgs e)
 {
     Response.Redirect("StudentAssignment.aspx");
 }

 protected void LinkButton6_Click(object sender, EventArgs e)
 {
     Response.Redirect("StudentTranscript.aspx");
 }

 protected void LinkButton7_Click(object sender, EventArgs e)
 {
     Response.Redirect("SignIn.aspx");
 }

}
