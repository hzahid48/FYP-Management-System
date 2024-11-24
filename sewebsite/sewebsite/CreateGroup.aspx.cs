using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateGroup : System.Web.UI.Page
{
    private string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAvailableStudents();  // Load students who aren't in any group
            ErrorAlert.Visible = false;  // Hide the error message on initial load
        }
    }

    private void LoadAvailableStudents()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();
            string query = "SELECT user_id, username, first_name, last_name FROM Users WHERE role = 'Student' AND user_id NOT IN (SELECT student_id FROM GroupMembers)";
            using (SqlCommand cmd = new SqlCommand(query, conn))
            {
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    StudentsGrid.DataSource = reader;
                    StudentsGrid.DataBind();  // Bind data to the GridView
                }
            }
        }
    }
    protected void CreateGroupBtn_Click(object sender, EventArgs e)
    {
        string projectTitle = ProjectTitleTxt.Text;

        // Validate that exactly three students are selected
        var selectedStudentIds = new List<int>();
        foreach (GridViewRow row in StudentsGrid.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("SelectCheckBox");
            if (chk != null && chk.Checked)
            {
                int studentId = Convert.ToInt32(StudentsGrid.DataKeys[row.RowIndex].Value);
                selectedStudentIds.Add(studentId);
            }
        }

        if (selectedStudentIds.Count != 3)  // Need exactly three students for a group
        {
            ErrorAlert.Visible = true;
            ErrorMessage.Text = "You must select exactly three students to form a group.";
            return;  // Exit without further processing
        }

        try
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Insert into Groups, with the project title if available
                string insertGroupQuery = "INSERT INTO Groups (project_title, panel_id) VALUES (@ProjectTitle, NULL); SELECT SCOPE_IDENTITY();";
                int newGroupId;
                using (SqlCommand cmd = new SqlCommand(insertGroupQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@ProjectTitle", projectTitle ?? (object)DBNull.Value);
                    newGroupId = Convert.ToInt32(cmd.ExecuteScalar());
                }

                // Insert students into GroupMembers
                foreach (int studentId in selectedStudentIds)
                {
                    string insertMemberQuery = "INSERT INTO GroupMembers (group_id, student_id) VALUES (@GroupId, @StudentId)";
                    using (SqlCommand memberCmd = new SqlCommand(insertMemberQuery, conn))
                    {
                        memberCmd.Parameters.AddWithValue("@GroupId", newGroupId);
                        memberCmd.Parameters.AddWithValue("@StudentId", studentId);
                        memberCmd.ExecuteNonQuery();
                    }
                }

                // Optionally redirect or show success message
                // Response.Redirect("GroupCreated.aspx");  // Redirect after successful group creation
            }
        }
        catch (Exception ex)
        {
            ErrorAlert.Visible = true;
            ErrorMessage.Text = "An error occurred while creating the group. Please try again.";
            Console.WriteLine("Error: " + ex.Message);  // Log for debugging
        }
    }



}
