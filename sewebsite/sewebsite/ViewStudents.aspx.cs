using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class ViewStudents : System.Web.UI.Page
{
    private string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadStudents();  // Load student data into the GridView
        }
    }

    private void LoadStudents()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Get distinct student information, allow NULL for group_id
            string query = @"
                SELECT DISTINCT 
                    u.user_id, 
                    u.username, 
                    u.first_name, 
                    u.last_name,
                    gm.group_id  -- Allow NULL for group_id
                FROM 
                    Users u 
                LEFT JOIN 
                    GroupMembers gm 
                ON 
                    u.user_id = gm.student_id
                WHERE 
                    u.role = 'Student'";

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader = cmd.ExecuteReader();

            // Bind data to the GridView
            StudentsGrid.DataSource = reader;
            StudentsGrid.DataBind();

            reader.Close();
        }
    }
}
