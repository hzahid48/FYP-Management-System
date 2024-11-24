using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorFinalReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Get Supervisor ID and FYP ID from query parameters
            string supervisorId = Request.QueryString["SupervisorID"];
            string fypId = Request.QueryString["FYPID"];

            // Retrieve FYP report details from the database
            string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";
            string query = @"
    SELECT 
        f.fyp_name, 
        CONVERT(nvarchar(max), r.report_content) AS report_content, 
        r.report_date, 
        STRING_AGG(u.first_name + ' ' + u.last_name, ', ') AS group_members 
    FROM 
        FYPReports r 
    JOIN 
        ActiveFYPs f ON r.fyp_id = f.fyp_id 
    JOIN 
        Groups g ON f.group_id = g.group_id 
    JOIN 
        GroupMembers m ON g.group_id = m.group_id 
    JOIN 
        Users u ON m.student_id = u.user_id 
    WHERE 
        r.fyp_id = @FYPID AND r.report_type = 'Final' 
    GROUP BY 
        f.fyp_name, CONVERT(nvarchar(max), r.report_content), r.report_date;";


            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FYPID", fypId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        // Populate controls with retrieved data
                        lblFYPName.Text = reader["fyp_name"].ToString();
                        lblReportContent.Text = reader["report_content"].ToString();
                        lblReportDate.Text = ((DateTime)reader["report_date"]).ToLongDateString();
                        lblGroupMembers.Text = reader["group_members"].ToString();
                    }
                    reader.Close();
                }
            }
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect back to SupervisorFYPMaterials page with Supervisor ID as parameter
        
        Response.Redirect($"SupervisorFYPMaterials.aspx?SupervisorID={supervisorId}&FYPID={fypId}");
    }

}