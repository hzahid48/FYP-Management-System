using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;
using System.Security.Cryptography;
using System.Text;

public partial class SignIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Initialization code, if needed
    }

   protected void LoginBtn_Click(object sender, EventArgs e)
{
    string username = UsernameTxt.Text;
    string password = PasswordTxt.Text;
    string role = RoleDdl.SelectedValue;  // Get the selected role

    // Hash the entered password
    //string hashedPassword = HashPassword(password);

    bool isAuthenticated = false;
    int userID = -1;

    using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True"))
    {
        con.Open();  // Open the connection

        // Retrieve the stored hashed password and user ID for the given username and role
        string query = "SELECT user_id, password_hash FROM Users WHERE username = @Username AND role = @Role";

        using (SqlCommand cmd = new SqlCommand(query, con))
        {
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Role", role);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    string storedHash = reader["password_hash"].ToString();  // Get the stored hash
                    //userID = Convert.ToInt32(reader["user_id"]);
                    userID = reader.GetInt32(0);
                    Session["ID"] = userID;
                    // Compare the stored hash with the hash of the entered password
                    if (storedHash == password)
                    {
                        isAuthenticated = true;  // Password and role match
                    }
                }
            }
        }
    }

    if (isAuthenticated)
    {
        // Insert entry into audit trail
        InsertAuditTrailEntry("User logged in", userID, DateTime.Now);

        // Redirect the user to the appropriate page based on the selected role
        switch (role)
        {
            case "Student":
                Response.Redirect("StudentHome.aspx?ID=");
                break;
            case "Panel Member":
                Response.Redirect("PanelMemberHome.aspx?ID=");
                break;
            case "Supervisor":
                Response.Redirect("SupervisorHome.aspx?ID=" + userID);
                break;
            case "Committee Member":
                Response.Redirect("FYPManagerHome.aspx?ID=");
                break;
            default:
                // Handle invalid role
                break;
        }
    }
    else
    {
        // Handle login failure
        ClientScript.RegisterStartupScript(
            this.GetType(),
            "LoginFailed",
            "alert('Invalid username, password, or role.');",
            true
        );
    }
}


    // Function to hash a password with SHA-256
    private string HashPassword(string password)
    {
        using (var sha256 = SHA256.Create())
        {
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            return Convert.ToBase64String(bytes);  // Return hashed password
        }
    }

   private void InsertAuditTrailEntry(string operation, int userID, DateTime timestamp)
    {
        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO AuditTrail (user_id, operation, timestamp) VALUES (@UserID, @Operation, @Timestamp)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@UserID", userID);
            command.Parameters.AddWithValue("@Operation", operation);
            command.Parameters.AddWithValue("@Timestamp", timestamp);

            try
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                // Handle SQL exception
                throw new Exception("SQL Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
