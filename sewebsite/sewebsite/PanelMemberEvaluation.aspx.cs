using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class PanelMemberEvaluation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DropDownList1_SelectedIndexChanged(null, EventArgs.Empty);
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True");
        conn.Open();
        
        int panelMemberID = (int)Session["ID"];
        string query = "SELECT DISTINCT P.project_id " +
               "FROM Projects P " +
               "INNER JOIN Groups G ON G.group_id = P.group_id " +
               "INNER JOIN PanelMembers PM ON PM.panel_id = G.panel_id " +
               "WHERE PM.faculty_id = @PanelMemberID " +
               "AND NOT EXISTS (" +
               "    SELECT 1 " +
               "    FROM Evaluations E " +
               "    WHERE E.project_id = P.project_id " +
               "    AND E.panel_member_id = PM.panel_member_id " +
               ")";


        SqlCommand command = new SqlCommand(query, conn);
        command.Parameters.AddWithValue("@PanelMemberID", panelMemberID);

        // Execute the query
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
        {
            int projectID = reader.GetInt32(0);
            DropDownList1.Items.Add(new ListItem( projectID.ToString(), projectID.ToString()));
        }

        // Close the SqlDataReader and the SqlConnection
        reader.Close();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        int count0 = 0;
    int count1 = 0;
    int count2 = 0;
    int count3 = 0;
    int count4 = 0;
    int count5 = 0;
    int count6 = 0;
    int count7 = 0;
    int count8 = 0;
    int count9 = 0;
    int count10 = 0;

    int ID = (int)Session["ID"];
    int j = 1;

    // Define array to hold table references
    Table[] tables = { Table1, Table2, Table3, Table4, Table5, Table6, Table7, Table8, Table9, Table10,  Table11, Table12, Table13, Table14, Table15}; 

       foreach (Table table in tables)
    {
        // Iterate through each row of the table
        for (int i = 1; i < table.Rows.Count; i++)
        {
            TableRow row = table.Rows[i];

            // Iterate through each cell in the row
            for (int k = 1; k < row.Cells.Count; k++)
            {
                // Get the radio button in the cell
                RadioButton rb = (RadioButton)row.Cells[k].FindControl("RadioButton" + j);

                // Check if the radio button is checked and increment the corresponding count
                if (rb != null && rb.Checked)
                {
                    switch (k)
                    {
                        case 1:
                            count0++;
                            break;
                        case 2:
                            count1++;
                            break;
                        case 3:
                            count2++;
                            break;
                        case 4:
                            count3++;
                            break;
                        case 5:
                            count4++;
                            break;
                        case 6:
                            count5++;
                            break;
                        case 7:
                            count6++;
                            break;
                        case 8:
                            count7++;
                            break;
                        case 9:
                            count8++;
                            break;
                        case 10:
                            count9++;
                            break;
                        case 11:
                            count10++;
                            break;
                    }
                }

                // Increment the counter for the next radio button
                j++;
            }
        }
    }

        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True");
        conn.Open();

        string comment = TextBox3.Text;
         if (comment.Length > 50)
       {
        ErrorMessageLabel.Text = "Comment should not exceed 50 characters.";
        pnlErrorMessage.Visible = true;
        return; // Exit the event handler
       }
       else
        {
            pnlErrorMessage.Visible = false;
        string q2 = "Select panel_member_id FROM PanelMembers where faculty_id = @faculty_id";
        SqlCommand cmd2 = new SqlCommand(q2, conn); 
        int panel_member = 0;
        cmd2.Parameters.AddWithValue("@faculty_id", ID);
         SqlDataReader reader2 = cmd2.ExecuteReader();
         while (reader2.Read())
         {
              panel_member  = reader2.GetInt32(0);
         }

         // Close the SqlDataReader and the SqlConnection
         reader2.Close();

        int maxv = count5 + count6 + count7 + count8 + count9 + count10;
        int minv = count1 + count2 + count3 + count4 + count0;
        int val = maxv - minv;
        int project_id = Convert.ToInt32(DropDownList1.SelectedValue);
        string query = "INSERT INTO Evaluations (project_id, panel_member_id, score, comments, created_at) " +
                   "VALUES (@project_id, @panel_member_id, @score, @comment, @evaluation_date)";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.Parameters.AddWithValue("@project_id", project_id);
        cmd.Parameters.AddWithValue("@panel_member_id", panel_member);
        cmd.Parameters.AddWithValue("@score", val);
        cmd.Parameters.AddWithValue("@comment", comment);
        cmd.Parameters.AddWithValue("@evaluation_date", DateTime.Now); // Add current date

    cmd.ExecuteNonQuery();

       }
        DropDownList1.Items.Clear();
        DropDownList1_SelectedIndexChanged(null, EventArgs.Empty);
        conn.Close();
       InsertAuditTrailEntry("Evaluation submitted", (int)Session["ID"], DateTime.Now);
    
    }

    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {
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