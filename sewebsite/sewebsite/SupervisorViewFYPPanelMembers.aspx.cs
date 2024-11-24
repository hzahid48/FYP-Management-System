using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class SupervisorViewFYPPanelMembers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string idValue = Request.QueryString["ID"];

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

    protected void btnSubmitRequest_Click(object sender, EventArgs e)
    {
        // Redirect to page for submitting requests with parameter "ID"
        Response.Redirect("SupervisorSubmitRequest.aspx?ID=" + Request.QueryString["ID"]);
    }

    protected void btnMakeSuggestion_Click(object sender, EventArgs e)
    {
        // Redirect to page for making suggestions with parameter "ID"
        Response.Redirect("SupervisorMakeSuggestion.aspx?ID=" + Request.QueryString["ID"]);
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];
        if (string.IsNullOrEmpty(supervisorId))
        {
            supervisorId = Request.QueryString["ID"];
        }
        // Redirect to SupervisorActiveFYPMenu page with Supervisor ID as parameter
        Response.Redirect($"SupervisorHome.aspx?SupervisorID={supervisorId}");



    }
}
