using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorFYPMaterials : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Get Supervisor ID and FYP ID from query parameters
            string supervisorId = Request.QueryString["SupervisorID"];
            string fypId = Request.QueryString["FYPID"];
            string fypName = GetFYPName(fypId);

            // Display FYP name as a heading
            lblFYPName.Text = $"<h1>{fypName}</h1>";
            // Display Supervisor ID and FYP ID (for testing purposes)
            lblFinalReport.Text = $"Final Report";
            lblProgressReport.Text = $"Progress Report";
            lblProposals.Text = $"Proposals";

            // Make labels visible
            lblFinalReport.Visible = true;
            lblProgressReport.Visible = true;
            lblProposals.Visible = true;
        }
    }
    private string GetFYPName(string fypId)
    {
        string fypName = "";
        // Replace this with your database connection and query
        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";
        string query = "SELECT fyp_name FROM ActiveFYPs WHERE fyp_id = @FYPID";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@FYPID", fypId);
                connection.Open();
                fypName = command.ExecuteScalar()?.ToString();
            }
        }
        return fypName;
    }
    protected void btnFinalReport_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID and FYP ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect to Final Report page with Supervisor ID and FYP ID as parameters
        Response.Redirect($"SupervisorFinalReport.aspx?SupervisorID={supervisorId}&FYPID={fypId}");
    }

    protected void btnProgressReport_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID and FYP ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect to Progress Report page with Supervisor ID and FYP ID as parameters
        Response.Redirect($"SupervisorProgressReport.aspx?SupervisorID={supervisorId}&FYPID={fypId}");
    }

    protected void btnProposals_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID and FYP ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect to Proposals page with Supervisor ID and FYP ID as parameters
        Response.Redirect($"SupervisorProposals.aspx?SupervisorID={supervisorId}&FYPID={fypId}");
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect to SupervisorActiveFYPMenu page with Supervisor ID as parameter
        Response.Redirect($"SupervisorActiveFYPMenu.aspx?SupervisorID={supervisorId}&FYPID={fypId}");



    }

}