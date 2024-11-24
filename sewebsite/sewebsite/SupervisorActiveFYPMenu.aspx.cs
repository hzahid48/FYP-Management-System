using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorActiveFYPMenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnFYPMaterials_Click(object sender, EventArgs e)
    {
        RedirectToForm("SupervisorFYPMaterials.aspx");
    }

    protected void btnDeadlines_Click(object sender, EventArgs e)
    {
        RedirectToForm("SupervisorDeadlines.aspx");
    }

    protected void btnAlerts_Click(object sender, EventArgs e)
    {
        RedirectToForm("SupervisorAlerts.aspx");
    }

    protected void btnEvaluations_Click(object sender, EventArgs e)
    {
        RedirectToForm("SupervisorEvaluations.aspx");
    }

    protected void btnCommunicateWithGroup_Click(object sender, EventArgs e)
    {
        RedirectToForm("SupervisorCommunicateWithGroup.aspx");
    }

    protected void btnSupplementaryMaterial_Click(object sender, EventArgs e)
    {
        RedirectToForm("SupervisorSupplementaryMaterial.aspx");
    }

    private void RedirectToForm(string formName)
    {
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"]; // Retrieve FYP ID from query string
        Response.Redirect($"{formName}?SupervisorID={supervisorId}&FYPID={fypId}");
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect to SupervisorActiveFYPMenu page with Supervisor ID as parameter
        Response.Redirect($"SupervisorViewActiveFYPs.aspx?ID={supervisorId}");



    }
}