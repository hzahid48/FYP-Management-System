using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class SupervisorHome : System.Web.UI.Page
{
    private string idValue;
    protected void Page_Load(object sender, EventArgs e)
    {
         idValue = Request.QueryString["ID"];

        if (string.IsNullOrEmpty(idValue))
        {
            idValue = Request.QueryString["SupervisorID"];
        }
        // Check if the ID parameter exists in the query string
        if (string.IsNullOrEmpty(idValue))
        {

            Response.Redirect("SupervisorError.aspx");
        }
    }

    protected void btnActiveFYPs_Click(object sender, EventArgs e)
    {
        // Check if the ID value is not null or empty
        if (!string.IsNullOrEmpty(idValue))
        {
            // Redirect to page for viewing active FYPs with parameter "ID"
            Response.Redirect("SupervisorViewActiveFYPs.aspx?ID=" + idValue);
        }
        else
        {
            
            Response.Redirect("SupervisorError.aspx");
        }
    }


    protected void btnFYPPanelMembers_Click(object sender, EventArgs e)
    {
        // Check if the ID value is not null or empty
        if (!string.IsNullOrEmpty(idValue))
        {
            // Redirect to page for viewing FYP panel members with parameter "ID"
            Response.Redirect("SupervisorViewFYPPanelMembers.aspx?ID=" + idValue);
        }
        else
        {
            Response.Redirect("SupervisorError.aspx");
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Clear any session or authentication tokens
        Session.Clear(); // Assuming you're using session-based authentication

        // Redirect to the sign-in page
        Response.Redirect("SignIn.aspx");
    }


}

