using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorAlerts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check for missing reviews
            CheckMissingReviews();
        }
    }

    protected void CheckMissingReviews()
    {
        // Get SupervisorID and FYPID from the query string
        int supervisorId = Convert.ToInt32(Request.QueryString["SupervisorID"]);
        int fypId = Convert.ToInt32(Request.QueryString["FYPID"]);
        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

        // Assuming conn is your database connection object
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            // Open the connection
            conn.Open();

            // Construct the SQL query to check for missing reviews
            string query = "SELECT m.*, a.fyp_name " +
                           "FROM MissingReviews m " +
                           "INNER JOIN ActiveFYPs a ON m.fyp_id = a.fyp_id " +
                           "WHERE m.supervisor_id = @SupervisorId AND m.fyp_id = @FypId";

            // Execute the query
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                // Add parameters to the query
                cmd.Parameters.AddWithValue("@SupervisorId", supervisorId);
                cmd.Parameters.AddWithValue("@FypId", fypId);

                // Execute the query and read the results
                SqlDataReader reader = cmd.ExecuteReader();

                // Check if there are any missing reviews
                if (reader.HasRows)
                {
                    // Display the missing review details
                    while (reader.Read())
                    {
                        // Get the missing review details
                        string fypName = reader["fyp_name"].ToString();
                        // You can retrieve other details similarly

                        // Display the missing review details on the page
                        // For example, you can use labels or other controls to display the details
                        lblFYPName.Text = fypName;
                        // You can set other labels similarly
                    }
                }
                else
                {
                    // Display a message indicating that there are no missing reviews
                    lblMessage.Text = "There are no missing reviews for this FYP.";
                }
            }
        }
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