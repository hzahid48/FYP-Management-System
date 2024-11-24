using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorCommunicateWithGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Load supervisorId and fypId from query string
            int supervisorId = Convert.ToInt32(Request.QueryString["SupervisorID"]);
            int fypId = Convert.ToInt32(Request.QueryString["FYPID"]);
            ViewState["SupervisorID"] = supervisorId;
            ViewState["FYPID"] = fypId;
        }
    }

    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        // Get supervisorId and fypId from ViewState
        int supervisorId = Convert.ToInt32(ViewState["SupervisorID"]);
        int fypId = Convert.ToInt32(ViewState["FYPID"]);

        // Get message content from TextBox
        string messageContent = txtMessageContent.Text;

        // Insert message into the database
        InsertMessage(supervisorId, fypId, messageContent);

        // Show success message
        lblMessage.Visible = true;

        // Clear message content textbox
        txtMessageContent.Text = "";
    }

    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect to SupervisorActiveFYPMenu page with Supervisor ID as parameter
        Response.Redirect($"SupervisorActiveFYPMenu.aspx?SupervisorID={supervisorId}&FYPID={fypId}");
    }

    private void InsertMessage(int supervisorId, int fypId, string messageContent)
    {
        // Connection string to your database
        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

        // SQL query to insert message into Communication table
        string query = @"INSERT INTO Communication (supervisor_id, group_id, message_content, message_date)
                         SELECT @supervisorId, group_id, @messageContent, GETDATE()
                         FROM ActiveFYPs
                         WHERE fyp_id = @fypId";

        // Execute the SQL query using ADO.NET
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@supervisorId", supervisorId);
                command.Parameters.AddWithValue("@fypId", fypId);
                command.Parameters.AddWithValue("@messageContent", messageContent);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}