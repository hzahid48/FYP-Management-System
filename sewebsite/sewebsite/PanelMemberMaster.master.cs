using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PanelMemberMaster : System.Web.UI.MasterPage
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
         Response.Redirect("PanelMemberHome.aspx");
     }

     protected void LinkButton2_Click(object sender, EventArgs e)
     {
         Response.Redirect("PM_AssignedFYP.aspx");
     }

  //   protected void LinkButton3_Click(object sender, EventArgs e)
     //{
       //  Response.Redirect("PanelMemberReview.aspx");
     //}

     protected void LinkButton4_Click(object sender, EventArgs e)
     {
         Response.Redirect("PanelMemberEvaluation.aspx");
     }

     protected void LinkButton5_Click(object sender, EventArgs e)
     {
         Response.Redirect("PM_MissingEval.aspx");
     }


     protected void LinkButton7_Click(object sender, EventArgs e)
     {
         Response.Redirect("SignIn.aspx");
     }

}
