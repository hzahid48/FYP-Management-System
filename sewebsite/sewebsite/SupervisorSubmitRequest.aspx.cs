using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class SupervisorSubmitRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // No need to handle anything in Page_Load for now
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        // Retrieve ID parameter from the query string
        string supervisorId = Request.QueryString["ID"];

        // Retrieve request content from the text box
        string requestContent = txtRequestContent.Text;

        // Save request to the database
        SaveRequestToDatabase(supervisorId, requestContent);

        // Optionally, redirect the user to another page after submission
        Response.Redirect("SupervisorRequestConfirm.aspx?ID=" + supervisorId);
    }

    private void SaveRequestToDatabase(string supervisorId, string requestContent)
    {
        // Replace connection string with your actual database connection string
        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

        // SQL query to insert request into SupervisorRequests table
        string query = "INSERT INTO SupervisorRequests (supervisor_id, request_content) VALUES (@SupervisorId, @RequestContent)";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Add parameters to the SQL command
                command.Parameters.AddWithValue("@SupervisorId", supervisorId);
                command.Parameters.AddWithValue("@RequestContent", requestContent);

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
