using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PanelMemberReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
            GenerateRows();
        //}
    }

   protected void GenerateRows()
{
    int ID = (int)Session["ID"];
    SqlConnection conn = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True");
    conn.Open();

    // Retrieve distinct group IDs associated with the faculty ID
    string queryGroupIDs = "SELECT DISTINCT G.group_id " +
                           "FROM Groups G " +
                           "INNER JOIN PanelMembers PM ON G.panel_id = PM.panel_id " +
                           "WHERE PM.faculty_id = @FacultyID;";
    SqlCommand cmdGroupIDs = new SqlCommand(queryGroupIDs, conn);
    cmdGroupIDs.Parameters.AddWithValue("@FacultyID", ID);
    SqlDataReader readerGroupIDs = cmdGroupIDs.ExecuteReader();

    // Create a list to store the group IDs
    List<int> groupIDs = new List<int>();

    while (readerGroupIDs.Read())
    {
        int groupID = readerGroupIDs.GetInt32(0);
        groupIDs.Add(groupID); // Add the group ID to the list
    }

    readerGroupIDs.Close(); // Close the SqlDataReader

    // Iterate over the group IDs and create table rows
    foreach (int groupID in groupIDs)
    {
        TableRow row = new TableRow();
        TableCell cell1 = new TableCell();
        TableCell cell2 = new TableCell();

        cell1.HorizontalAlign = HorizontalAlign.Center;
        cell2.HorizontalAlign = HorizontalAlign.Center;

        cell1.Text = groupID.ToString();

        // Create a TextBox control for the second cell
        TextBox textBox = new TextBox();
        cell2.Controls.Add(textBox);

        // Add the cells to the row and the row to the table
        row.Cells.Add(cell1);
        row.Cells.Add(cell2);
        Table2.Rows.Add(row);
    }

    conn.Close();
}

    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        int ID = (int)Session["ID"];
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True");
        conn.Open();

        // Iterate over the group IDs and submit the reviews
        foreach (TableRow row in Table2.Rows)
        {
            // Check if there are any controls in the cell
            if (row.Cells[1].Controls.Count > 0 && row.Cells[1].Controls[0] is TextBox)
            {
                TextBox textBox = (TextBox)row.Cells[1].Controls[0]; // Assuming the TextBox is the first control in the cell
                string reviewText = textBox.Text.Trim(); // Get the text from the TextBox

                // Check if the review text is not empty before inserting
                if (!string.IsNullOrEmpty(reviewText))
                {
                    int groupID = Convert.ToInt32(row.Cells[0].Text); // Get the group ID from the first cell
                    // Insert the review into the Reviews table
                    string queryInsertReview = "INSERT INTO Reviews (group_id, review, generated_by, created_at) " +
                                               "VALUES (@GroupID, @ReviewText, @GeneratedBy, @CreatedAt);";
                    SqlCommand cmdInsertReview = new SqlCommand(queryInsertReview, conn);
                    cmdInsertReview.Parameters.AddWithValue("@GroupID", groupID);
                    cmdInsertReview.Parameters.AddWithValue("@ReviewText", reviewText);
                    cmdInsertReview.Parameters.AddWithValue("@GeneratedBy", ID); // Assuming the current user ID
                    cmdInsertReview.Parameters.AddWithValue("@CreatedAt", DateTime.Now);
                    cmdInsertReview.ExecuteNonQuery(); // Execute the insert query
                }
            }
        }

        conn.Close();
    }

}

