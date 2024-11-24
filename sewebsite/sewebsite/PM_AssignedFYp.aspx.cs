using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;

public partial class PM_AssignedFYp : System.Web.UI.Page
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

        int panelId = 0;

        // Step 1: Get the panel ID of the faculty member
        string queryPanelId = "SELECT panel_id FROM PanelMembers WHERE faculty_id = @Member_ID";
        SqlCommand cmdPanelId = new SqlCommand(queryPanelId, conn);
        cmdPanelId.Parameters.AddWithValue("@Member_ID", ID);
        panelId = (int)cmdPanelId.ExecuteScalar();

        // Step 2: Get the groups assigned to the panel
        string queryGroups = "SELECT group_id FROM Groups WHERE panel_id = @PanelId";
        SqlCommand cmdGroups = new SqlCommand(queryGroups, conn);
        cmdGroups.Parameters.AddWithValue("@PanelId", panelId);

        List<int> groupIds = new List<int>();
        using (SqlDataReader readerGroups = cmdGroups.ExecuteReader())
        {
            while (readerGroups.Read())
            {
                groupIds.Add(readerGroups.GetInt32(0));
            }
        }

        // Step 3: Iterate over each group and retrieve its members
        foreach (int groupId in groupIds)
        {
            TableRow row = new TableRow();
            TableCell cellGroupId = new TableCell();
            TableCell cellGroupMembers = new TableCell();
            TableCell cellGroupDescription = new TableCell();

            cellGroupId.HorizontalAlign = HorizontalAlign.Center;
            cellGroupMembers.HorizontalAlign = HorizontalAlign.Center;
            cellGroupDescription.HorizontalAlign = HorizontalAlign.Center;

            // Retrieve group description
            string queryGroupDescription = "SELECT description FROM Projects WHERE group_id = @GroupId";
            SqlCommand cmdGroupDescription = new SqlCommand(queryGroupDescription, conn);
            cmdGroupDescription.Parameters.AddWithValue("@GroupId", groupId);
            string groupDescription = cmdGroupDescription.ExecuteScalar()?.ToString();

            cellGroupId.Text = groupId.ToString();
            cellGroupDescription.Text = groupDescription;

            // Retrieve group members
            string queryGroupMembers = "SELECT u.first_name + ' ' + u.last_name FROM GroupMembers gm INNER JOIN Users u ON gm.student_id = u.user_id WHERE gm.group_id = @GroupId";
            SqlCommand cmdGroupMembers = new SqlCommand(queryGroupMembers, conn);
            cmdGroupMembers.Parameters.AddWithValue("@GroupId", groupId);

            StringBuilder groupMembers = new StringBuilder();
            using (SqlDataReader readerMembers = cmdGroupMembers.ExecuteReader())
            {
                while (readerMembers.Read())
                {
                    groupMembers.Append(readerMembers.GetString(0));
                    groupMembers.Append("<br />");
                }
            }

            cellGroupMembers.Text = groupMembers.ToString();

            // Add the cells to the row in the desired order
            row.Cells.Add(cellGroupId);
            row.Cells.Add(cellGroupMembers);
            row.Cells.Add(cellGroupDescription);

            Table2.Rows.Add(row);
        }

        conn.Close();
    }
}
