using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class StudentReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GenerateRows();
    }

    protected void GenerateRows()
{
    int ID = (int)Session["ID"];
    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True");
    conn.Open();

    
   int g = 0;

   string q1 = "SELECT project_id FROM Projects WHERE group_id = (SELECT group_id FROM GroupMembers WHERE student_id = @Student_ID)";

   SqlCommand c1 = new SqlCommand(q1, conn);
   c1.Parameters.AddWithValue("@Student_ID", ID); // Assuming studentID is the correct parameter
   SqlDataReader da1 = c1.ExecuteReader();

   while (da1.Read())  
   {
       if (!da1.IsDBNull(0)) // Check if the value is not null
       {
           g = da1.GetInt32(0); 
       }
   }

    da1.Close();

    string query = "SELECT COUNT(*) from Evaluations where project_id = @GroupNumber";
    SqlCommand command = new SqlCommand(query, conn);
    command.Parameters.AddWithValue("@GroupNumber", g);
    int numValues = (int)command.ExecuteScalar();

    query = "select comments, created_at from Evaluations where project_id = @ProjectNumber";
    command = new SqlCommand(query, conn);
    command.Parameters.AddWithValue("@ProjectNumber", g);
    SqlDataReader da = command.ExecuteReader();

    for (int i = 0; i < numValues; i++)
    {
        TableRow row = new TableRow();
        TableCell cell1 = new TableCell();
        TableCell cell2 = new TableCell();
        
         cell1.HorizontalAlign = HorizontalAlign.Center;
        cell2.HorizontalAlign = HorizontalAlign.Center;

       if (da.Read())
    {
        string comment = da.IsDBNull(0) ? "" : da.GetString(0); // Get the comment or empty string if null
        string createdAt = da.IsDBNull(1) ? "" : da.GetDateTime(1).ToString(); // Get the created date or empty string if null
        if (!string.IsNullOrEmpty(comment)) // Check if the comment is not empty
        {
            cell1.Text = comment;
            cell2.Text = createdAt;
            row.Cells.Add(cell1);
            row.Cells.Add(cell2);
            Table2.Rows.Add(row);
        }
    }
    }

    da.Close();
    conn.Close();
}
}