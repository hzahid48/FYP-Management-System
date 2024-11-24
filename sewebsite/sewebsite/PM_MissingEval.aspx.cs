using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class PM_MissingEval : System.Web.UI.Page
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

    // Count the number of missing evaluations
    string queryCount = "SELECT COUNT(*) " +
                        "FROM (" +
                        "    SELECT DISTINCT P.project_id " +
                        "    FROM Projects P " +
                        "    INNER JOIN Groups G ON G.group_id = P.group_id " +
                        "    INNER JOIN PanelMembers PM ON PM.panel_id = G.panel_id " +
                        "    WHERE PM.faculty_id = @PanelMemberID " +
                        "    AND NOT EXISTS (" +
                        "        SELECT 1 " +
                        "        FROM Evaluations E " +
                        "        WHERE E.project_id = P.project_id " +
                        "        AND E.panel_member_id = PM.panel_member_id" +
                        "    )" +
                        ") AS CountProjects";

    SqlCommand commandCount = new SqlCommand(queryCount, conn);
    commandCount.Parameters.AddWithValue("@PanelMemberID", ID);
    int numValues = (int)commandCount.ExecuteScalar();
    Console.WriteLine(numValues);

    // Retrieve project IDs with missing evaluations
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
    command.Parameters.AddWithValue("@PanelMemberID", ID);
    SqlDataReader reader = command.ExecuteReader();

    // Populate the table with project IDs and "Missing" status
    while (reader.Read())
    {
        TableRow row = new TableRow();
        TableCell cell1 = new TableCell();
        TableCell cell2 = new TableCell();

        cell1.HorizontalAlign = HorizontalAlign.Center;
        cell2.HorizontalAlign = HorizontalAlign.Center;

        cell1.Text = reader.GetValue(0).ToString();
        cell2.Text = "Missing";

        row.Cells.Add(cell1);
        row.Cells.Add(cell2);
        Table2.Rows.Add(row);
    }

    reader.Close();
    conn.Close();
}

}