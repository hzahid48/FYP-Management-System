using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private string idValue;
    protected void Page_Load(object sender, EventArgs e)
    {
        // Get the current page URL
        string currentPageUrl = Request.Url.AbsolutePath;

        // Get the query parameter from the current page URL
        string idParameter = Request.QueryString["SupervisorID"];
        

        if (string.IsNullOrEmpty(idParameter))
        {
            idParameter = Request.QueryString["ID"];
        }
        // Check if the ID parameter exists in the query string
        if (string.IsNullOrEmpty(idParameter))
        {

            Response.Redirect("SupervisorError.aspx");
        }
        // Modify the URLs of the navbar links based on the current page's URL and query parameter
        HtmlAnchor activeFYPLink = (HtmlAnchor)FindControl("ActiveFYPLink");

        if (activeFYPLink != null)
        {
            // Modify the HRef attribute of the control to include the idParameter
            activeFYPLink.HRef = "SupervisorViewActiveFYPs.aspx?ID=" + idParameter;
            
        }
        HtmlAnchor FYPPanelMemberLink = (HtmlAnchor)FindControl("FYPPanelMemberLink");
        if (FYPPanelMemberLink != null)
        {
            FYPPanelMemberLink.HRef = "SupervisorViewFYPPanelMembers.aspx?ID=" + idParameter;

        }
       
    }

    protected void NavigateToActiveFYP(object sender, EventArgs e)
    { // Check if the ID value is not null or empty
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

    // Example method to handle navigation to FYPPanelMember.aspx
    protected void NavigateToFYPPanelMember(object sender, EventArgs e)
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

    // Example method to handle logout
    protected void Logout(object sender, EventArgs e)
    {
        // Clear any session or authentication tokens
        Session.Clear(); // Assuming you're using session-based authentication

        // Redirect to the sign-in page
        Response.Redirect("SignIn.aspx");
    }
}
