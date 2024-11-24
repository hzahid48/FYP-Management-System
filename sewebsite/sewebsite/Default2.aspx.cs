using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Microsoft.SqlServer.Server;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)  // If it's the first time loading the page
        {
            
        }
    }




    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
       if (UsernameTxt.Text.Length < 3) {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "ShowErrorModal",
                "$('#errorModal').modal('show'); $('#errorMessage').text('Invalid username or password.');",
                true
            );

        }

    }

    protected void PasswordTxt_TextChanged(object sender, EventArgs e)
    {
        if (PasswordTxt.Text.Length < 2)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "ShowErrorModal",
                "$('#errorModal').modal('show'); $('#errorMessage').text('Invalid username or password.');",
                true
            );
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {

        string username = UsernameTxt.Text;
        string password= PasswordTxt.Text;

        bool isAuthenticated = AuthenticateUser(username, password, "CommitteeMember");  // Authenticate the user for a specific role

        if (isAuthenticated)  // If the login is successful
        {
            // Trigger the success modal
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "ShowSuccessModal",
                "$('#successModal').modal('show'); $('#successMessage').text('Login successful. Redirecting...');",
                true
            );

            
            // Optional: Redirect after a delay (e.g., 2 seconds)
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "RedirectAfterDelay",
                "setTimeout(function() { window.location = 'CreateUser.aspx'; }, 2000);",
                true
            );

            Session["User"] = username;  // Store user information in the session


        }
        else
        {
            // Show the error modal with a specific message
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "ShowErrorModal",
                "$('#errorModal').modal('show'); $('#errorMessage').text('Invalid username or password.');",
                true
            );
        }




    }

    private bool AuthenticateUser(string username, string password, string role)
    {
        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True"))
        {
            con.Open();  // Open the SQL connection

            // SQL query to check if the username, password, and role match
            string query = "SELECT COUNT(*) FROM Users WHERE username = @username AND password_hash = @password AND role = @role";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@username", username);  // Parameterize the username
                cmd.Parameters.AddWithValue("@password", password);  // Parameterize the password
                cmd.Parameters.AddWithValue("@role", role);  // Parameterize the role

                int userCount = (int)cmd.ExecuteScalar();  // Get the count of matching records

                return userCount > 0;  // If there's at least one match, authentication is successful
            }
        }
    }



}