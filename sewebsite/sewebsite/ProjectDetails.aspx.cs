using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProjectDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GenerateRows();

        TextBox2_TextChanged(null, EventArgs.Empty);
    }

 protected void GenerateRows()
 {
     int ID = (int)Session["ID"];
     SqlConnection conn = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True");
     conn.Open();

     
    int g = 0;

    string q1 = "SELECT group_id FROM GroupMembers WHERE student_id = @Student_ID";
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

     string query = "SELECT COUNT(*) from GroupMembers where group_id = @GroupNumber";
     SqlCommand command = new SqlCommand(query, conn);
     command.Parameters.AddWithValue("@GroupNumber", g);
     int numValues = (int)command.ExecuteScalar();

     query = "select first_name, last_name from Users U inner join GroupMembers S on U.user_id = S.student_id where U.user_id IN (select student_id from GroupMembers where group_id = @GroupNumber)";
     command = new SqlCommand(query, conn);
     command.Parameters.AddWithValue("@GroupNumber", g);
     SqlDataReader da = command.ExecuteReader();

     for (int i = 0; i < numValues; i++)
     {
         TableRow row = new TableRow();
         TableCell cell1 = new TableCell();
         TableCell cell2 = new TableCell();
         //TableCell cell3 = new TableCell();

         cell2.HorizontalAlign = HorizontalAlign.Center;

         if (da.Read())
         {
             cell1.Text = da.GetValue(0).ToString();
             cell2.Text = da.GetValue(1).ToString();
         }

         System.Web.UI.WebControls.Label label = new System.Web.UI.WebControls.Label();
         label.Text = cell2.Text;
         cell2.Controls.Add(label);

         //cell3.Text = name;

         row.Cells.Add(cell1);
         row.Cells.Add(cell2);
         //row.Cells.Add(cell3);
         Table2.Rows.Add(row);
     }

     da.Close();
     conn.Close();
 }


protected void TextBox2_TextChanged(object sender, EventArgs e)
{
    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True");
    conn.Open();

    int ID = (int)Session["ID"];

 
        int g = 0;

        string q1 = "SELECT group_id FROM GroupMembers WHERE student_id = @Student_ID";
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

    SqlCommand cmd = new SqlCommand("Select description from Projects where group_id = @ID", conn);
    cmd.Parameters.AddWithValue("@ID", g);
    SqlDataReader da = cmd.ExecuteReader();
    while (da.Read())
    {
       
        Label14.Text = da.GetValue(0).ToString();
    
    }
    da.Close();
    
    int p = 0;
    int s = 0;
    int cs = 0;

    SqlCommand cmd2 = new SqlCommand("Select panel_id,supervisor_id, cosupervisor_id from Groups where group_id = @ID", conn);
    cmd2.Parameters.AddWithValue("@ID", g);
    SqlDataReader da2 = cmd2.ExecuteReader();

    if (da2.Read())
    {
            p = da2.GetInt32(0);
            s =  da2.GetInt32(1);
            // Retrieve cosupervisor_id
        if (!da2.IsDBNull(2))
        {
            cs = da2.GetInt32(2);
        }
        
         Label16.Text  = da2.GetValue(0).ToString();
        //TextBox6.Text = da.GetValue(3).ToString();
        da2.Close(); // close the second data reader
    }
    
    SqlCommand cmd5 = new SqlCommand("Select concat(first_name,' ',last_name)  from users where user_id = @ID", conn);
    cmd5.Parameters.AddWithValue("@ID", s);
    //cmd5.Parameters.AddWithValue("@ID", cs);
    SqlDataReader da5 = cmd5.ExecuteReader();

    if (da5.Read())
    {
        Label3.Text  = da5.GetValue(0).ToString();
       // Label4.Text  = da5.GetValue(1).ToString();
        da5.Close(); // close the second data reader
    }

    if(cs != 0)
{
     SqlCommand cmd6 = new SqlCommand("Select concat(first_name,' ',last_name)  from users where user_id = @ID", conn);
     cmd6.Parameters.AddWithValue("@ID", cs);
     SqlDataReader da6 = cmd6.ExecuteReader();

     if (da6.Read())
     {
         Label4.Text  = da6.GetValue(0).ToString();
         da6.Close(); // close the second data reader
     }
}
else
{
    Label4.Text  = "No co-supervisor";
}
    int leader = 0; 
    SqlCommand cmd3 = new SqlCommand("Select panel_name,panel_leader_id  from Panels where panel_id = @ID", conn);
    cmd3.Parameters.AddWithValue("@ID", p);
    SqlDataReader da3 = cmd3.ExecuteReader();

    if (da3.Read())
    {
        Label1.Text  = da3.GetValue(0).ToString();
        leader = da3.GetInt32(1);
        //TextBox6.Text = da.GetValue(3).ToString();
        da3.Close(); // close the second data reader
    }

    SqlCommand cmd4 = new SqlCommand("Select concat(first_name,' ',last_name) from Users where user_id = @ID", conn);
    cmd4.Parameters.AddWithValue("@ID", leader);
    SqlDataReader da4 = cmd4.ExecuteReader();

    if (da4.Read())
    {
       
        Label2.Text  = da4.GetValue(0).ToString();
        //leader = da4.GetInt32(1);
        //TextBox6.Text = da.GetValue(3).ToString();
        da4.Close(); // close the second data reader
    }
        conn.Close();
}
}