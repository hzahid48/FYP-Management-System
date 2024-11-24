using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Initialization code, if needed
    }

    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        string username = UsernameTxt.Text;
        string password = PasswordTxt.Text;
        string role = RoleDdl.SelectedValue;

        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True"))
        {
            con.Open();  // Open the connection

            // Query to retrieve password and UserId
            string query = "SELECT user_id, password_hash FROM Users WHERE username = @Username AND role = @Role";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Role", role);

            bool isAuthenticated = false;
            int userId = 0;

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    string storedHash = reader["password_hash"].ToString();
                    userId = Convert.ToInt32(reader["user_id"]);

                    string hashedInputPassword = role == "Committee Member" ? password : HashPassword(password);

                    if (storedHash == hashedInputPassword)
                    {
                        isAuthenticated = true;  // Successful login
                        Session["UserId"] = userId;  // Store UserId in session
                    }
                }
            }

            if (isAuthenticated)
            {
                // Log the successful login
                var auditLogger = new AuditLogger();
                auditLogger.LogAudit(userId, "User logged in");

                // Redirect to the appropriate homepage
                if (role == "Committee Member")
                {
                    Response.Redirect("FYPManagerHome.aspx");
                }
                // Handle other roles if needed
            }
            else
            {
                // Handle login failure
                ShowPopup("Invalid username, password, or role.");
            }
        }
    }

    private void ShowPopup(string message)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "alertMessage", $"alert('{message}');", true);
    }

    private string HashPassword(string password)
    {
        using (var sha256 = SHA256.Create())
        {
            byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
            return Convert.ToBase64String(bytes);
        }
    }
}

public class AuditLogger
{
    private string connectionString = "\"Data Source=DESKTOP-IO1J1GI\\\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True\"";

    public void LogAudit(int userId, string operation)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            string insertQuery = "INSERT INTO AuditTrail (user_id, operation, timestamp) VALUES (@UserId, @Operation, GETDATE())";

            using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
            {
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@Operation", operation);

                cmd.ExecuteNonQuery();
            }
        }
    }
}
