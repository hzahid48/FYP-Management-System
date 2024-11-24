using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfirmFYP : System.Web.UI.Page
{
    // Initialize the connection string
    private string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                BindAssignments();  // Load assignments for the Repeater
            }
            catch (Exception ex)
            {
                ShowNotification($"Error: {ex.Message}");  // Display error message if there's an issue
            }
        }
    }

    private void BindAssignments()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Join Assignments with Groups to get project title
            string query = @"
            SELECT 
                a.assignment_id, 
                g.project_title, 
                a.status 
            FROM 
                Assignments a
            JOIN 
                Groups g 
            ON 
                a.group_id = g.group_id 
            WHERE 
                a.supervisor_id = @SupervisorId AND 
                a.status = 'Pending'";  // Retrieve pending assignments for the specific supervisor

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@SupervisorId", 69);  // Ensure correct supervisor ID

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (!reader.HasRows)  // Check if there's any data
                {
                    ShowNotification("No pending assignments found.");  // Display notification if no data
                }

                AssignmentsRepeater.DataSource = reader;  // Set the data source for the Repeater
                AssignmentsRepeater.DataBind();  // Bind data to the Repeater
            }
        }
    }


    protected void ConfirmAssignment_Click(object sender, EventArgs e)
    {
        var linkButton = (LinkButton)sender;  // Cast sender to LinkButton
        int assignmentId = Convert.ToInt32(linkButton.CommandArgument);  // Get assignment ID from CommandArgument

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            string updateQuery = "UPDATE Assignments SET status = 'Confirmed', confirmation_date = GETDATE() WHERE assignment_id = @AssignmentId";
            SqlCommand cmd = new SqlCommand(updateQuery, conn);
            cmd.Parameters.AddWithValue("@AssignmentId", assignmentId);

            cmd.ExecuteNonQuery();  // Confirm assignment

            ShowNotification("Assignment confirmed successfully!");  // Provide feedback
            BindAssignments();  // Re-bind the Repeater to update the display
        }
    }

    protected void DeclineAssignment_Click(object sender, EventArgs e)
    {
        var linkButton = (LinkButton)sender;  // Cast sender to LinkButton
        int assignmentId = Convert.ToInt32(linkButton.CommandArgument);  // Get assignment ID from CommandArgument

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            string updateQuery = "UPDATE Assignments SET status = 'Declined', confirmation_date = GETDATE() WHERE assignment_id = @AssignmentId";
            SqlCommand cmd = new SqlCommand(updateQuery, conn);
            cmd.Parameters.AddWithValue("@AssignmentId", assignmentId);

            cmd.ExecuteNonQuery();  // Decline assignment

            ShowNotification("Assignment declined.");  // Provide feedback
            BindAssignments();  // Re-bind the Repeater to update the display
        }
    }

    private void ShowNotification(string message)
    {
        // Display a JavaScript alert with the message
        ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", $"alert('{message}');", true);
    }
}