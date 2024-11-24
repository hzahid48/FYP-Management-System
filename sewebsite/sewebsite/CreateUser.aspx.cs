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

public partial class CreateUser : System.Web.UI.Page
{

    // Define controls referenced in the code
   
    protected void Page_Load(object sender, EventArgs e)
    {
        // Perform initialization tasks, if needed
    }

    protected void CreateUserBtn_Click(object sender, EventArgs e)
    {
        string username = UsernameTxt.Text;
        string password = PasswordTxt.Text;
        string firstName = FirstNameTxt.Text;
        string lastName = LastNameTxt.Text;
        string role = RoleDdl.SelectedValue;

        // Validate the input
        if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(firstName) || string.IsNullOrEmpty(lastName))
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "ShowError",
                "alert('Please fill in all fields.');",
                true
            );
            return;
        }

        // Hash the password
        string hashedPassword = HashPassword(password);

        using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True"))
        {
            con.Open();  // Open the connection

            // Check for existing user with the same username
            string query = "SELECT COUNT(*) FROM Users WHERE username = @Username";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Username", username);

                int userCount = (int)cmd.ExecuteScalar();  // Check for duplicate usernames

                if (userCount > 0)
                {
                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "ShowError",
                        "alert('Username already exists.');",
                        true
                    );
                    return;  // Avoid duplicates
                }
            }

            // Insert the new user
            query = "INSERT INTO Users (username, password_hash, role, first_name, last_name) VALUES (@Username, @PasswordHash, @Role, @FirstName, @LastName)";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@PasswordHash", hashedPassword);
                cmd.Parameters.AddWithValue("@Role", role);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);

                cmd.ExecuteNonQuery();  // Insert the new user
            }
        }
        //success
        ClientScript.RegisterStartupScript(
                this.GetType(),
                "ShowSuccessModal",
                $"$('#successModal').modal('show'); $('#assignedRole').text('{role}');",
                true
            );
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
}
