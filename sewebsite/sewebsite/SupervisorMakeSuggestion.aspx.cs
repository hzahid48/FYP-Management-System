using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class SupervisorMakeSuggestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Populate the dropdown list with panel members
            PopulatePanelMembersDropDown();
        }
    }

    private void PopulatePanelMembersDropDown()
    {
        // Replace connection string with your actual database connection string
        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

        // SQL query to retrieve panel members
        string query = "SELECT panel_member_id, panel_member_name FROM PanelMembers";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Open the connection
                connection.Open();

                // Execute the command and load the results into a DataTable
                DataTable dt = new DataTable();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    dt.Load(reader);
                }

                // Bind the DataTable to the dropdown list
                ddlPanelMembers.DataSource = dt;
                ddlPanelMembers.DataTextField = "panel_member_name";
                ddlPanelMembers.DataValueField = "panel_member_id";
                ddlPanelMembers.DataBind();
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Retrieve ID parameter from the query string
        string supervisorId = Request.QueryString["ID"];

        // Retrieve panel member ID and suggestion content from the form
        string panelMemberId = ddlPanelMembers.SelectedValue;
        string suggestionContent = txtSuggestion.Text;
        string panelMemberName = ddlPanelMembers.SelectedItem.Text;

        // Save suggestion to the database
        SaveSuggestionToDatabase(supervisorId, panelMemberId, suggestionContent);

        // Optionally, redirect the user to another page after submission
        Response.Redirect("SupervisorSuggestionConfirm.aspx?ID=" + panelMemberName + "&ParameterName=" + supervisorId);

    }

    private void SaveSuggestionToDatabase(string supervisorId, string panelMemberId, string suggestionContent)
    {
        // Replace connection string with your actual database connection string
        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

        // SQL query to insert suggestion into FYPPanelSuggestions table
        string query = "INSERT INTO FYPPanelSuggestions (supervisor_id, panel_member_id, suggestion_content) VALUES (@SupervisorId, @PanelMemberId, @SuggestionContent)";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Add parameters to the SQL command
                command.Parameters.AddWithValue("@SupervisorId", supervisorId);
                command.Parameters.AddWithValue("@PanelMemberId", panelMemberId);
                command.Parameters.AddWithValue("@SuggestionContent", suggestionContent);

                // Open the connection and execute the command
                connection.Open();
                command.ExecuteNonQuery();
            }
        }
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
