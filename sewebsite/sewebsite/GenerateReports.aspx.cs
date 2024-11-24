using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

public partial class GenerateReports : System.Web.UI.Page
{
    private string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

    protected void GenerateReportBtn_Click(object sender, EventArgs e)
    {
        try
        {
            string reportType = ReportTypeDdl.SelectedValue;  // Get selected report type

            switch (reportType)
            {
                case "missing_evaluations":
                    GenerateMissingEvaluationsReport();  // Generate missing evaluations report
                    break;

                case "fyp_by_faculty":
                    GenerateFYPsSupervisedByFacultyReport();  // Generate FYPs supervised by faculty report
                    break;

                case "grades_report":
                    GenerateGradesReport();  // Generate grades report
                    break;
            }

            ReportStatusLabel.Text = "Report generated successfully!";
        }
        catch (Exception ex)
        {
            ReportStatusLabel.Text = $"Error: {ex.Message}";  // Display error message if there's an issue
        }
    }

    private void GenerateMissingEvaluationsReport()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Query for missing evaluations (join with Projects to get additional context)
            string query = @"
                SELECT 
                    e.evaluation_id, 
                    p.project_id, 
                    p.description AS project_description, 
                    g.project_title, 
                    pm.panel_member_name,
                    e.comments 
                FROM 
                    Evaluations e
                JOIN 
                    Projects p 
                ON 
                    e.project_id = p.project_id 
                JOIN 
                    Groups g 
                ON 
                    p.group_id = g.group_id 
                JOIN 
                    PanelMembers pm 
                ON 
                    e.panel_member_id = pm.panel_member_id 
                WHERE 
                    e.score IS NULL";  // Only missing evaluations
            SqlCommand cmd = new SqlCommand(query, conn);  // Initialize SqlCommand with the query and connection
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                if (!reader.HasRows)
                {
                    ShowNotification("No missing evaluations found.");  // Inform the user
                    return;  // If no data, return without generating a report
                }

                GenerateAndDownloadCSV("MissingEvaluationsReport.csv", reader);  // Generate CSV report
            }
        }
    }

    private void GenerateFYPsSupervisedByFacultyReport()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Query for FYPs supervised by a faculty member
            string query = @"
            SELECT 
                af.fyp_id, 
                af.fyp_name, 
                af.start_date,
                g.project_title
            FROM 
                ActiveFYPs af
            JOIN 
                Groups g 
            ON 
                af.group_id = g.group_id 
            WHERE 
                af.supervisor_id = @SupervisorId";  // Correct supervisor ID

            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@SupervisorId", 69);  // Use appropriate supervisor ID

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                var csvBuilder = new System.Text.StringBuilder();

                // Add header row
                csvBuilder.AppendLine("FYP ID,FYP Name,Start Date,End Date,Project Title");

                // Add data rows
                while (reader.Read())
                {
                    int fypId = (int)reader["fyp_id"];
                    string fypName = reader["fyp_name"].ToString();
                    DateTime startDate = (DateTime)reader["start_date"];
                    string projectTitle = reader["project_title"].ToString();

                    // Calculate the end date by adding 6 months to the start date
                    DateTime endDate = startDate.AddMonths(6);

                    // Build the CSV row
                    csvBuilder.AppendLine($"{fypId},\"{fypName}\",\"{startDate:yyyy-MM-dd}\",\"{endDate:yyyy-MM-dd}\",\"{projectTitle}\"");
                }

                // Serve the CSV content as a downloadable file
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.ContentType = "text/csv";
                HttpContext.Current.Response.AddHeader("Content-Disposition", $"attachment;filename=FYPsSupervisedByFacultyReport.csv");
                HttpContext.Current.Response.Write(csvBuilder.ToString());
                HttpContext.Current.Response.End();
            }
        }
    }


    private void GenerateGradesReport()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Query for grades from the Transcript table
            string query = "SELECT * FROM Transcript";  // Adjust query based on your needs

            SqlCommand cmd = new SqlCommand(query, conn);

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                GenerateAndDownloadCSV("GradesReport.csv", reader);  // Generate CSV report
            }
        }
    }
    private void GenerateAndDownloadCSV(string fileName, SqlDataReader reader)
    {
        var csvBuilder = new System.Text.StringBuilder();

        // Add header row
        for (int i = 0; i < reader.FieldCount; i++)
        {
            csvBuilder.Append($"\"{reader.GetName(i)}\"");  // Wrap headers in double quotes
            if (i < reader.FieldCount - 1) csvBuilder.Append(",");  // Comma-separated values
        }
        csvBuilder.AppendLine();  // New line after header row

        // Add data rows
        while (reader.Read())
        {
            for (int i = 0; i < reader.FieldCount; i++)
            {
                var value = reader.GetValue(i);

                // Explicit handling of dates
                if (value is DateTime dt)  // If the value is a DateTime
                {
                    csvBuilder.Append($"\"{dt:yyyy-MM-dd}\"");  // Format date
                }
                else if (value == DBNull.Value)  // Check for NULL values
                {
                    csvBuilder.Append("\"\"");  // Empty string for NULL values
                }
                else
                {
                    csvBuilder.Append($"\"{value}\"");  // Wrap other fields in double quotes
                }

                if (i < reader.FieldCount - 1) csvBuilder.Append(",");  // Comma-separated values
            }
            csvBuilder.AppendLine();  // New line after each row
        }

        // Serve the CSV content as a downloadable file
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.ContentType = "text/csv";
        HttpContext.Current.Response.AddHeader("Content-Disposition", $"attachment;filename={fileName}");
        HttpContext.Current.Response.Write(csvBuilder.ToString());
        HttpContext.Current.Response.End();
    }


    private void ShowNotification(string message)
    {
        // Display a JavaScript alert with the message
        ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", $"alert('{message}');", true);
    }
}
