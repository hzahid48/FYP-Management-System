using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorProposals : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string fypId = Request.QueryString["FYPID"];
            string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

            string query = @"
    SELECT 
        f.fyp_name, 
        CONVERT(nvarchar(max), p.proposal_content) AS proposal_content, 
        p.proposal_date,
        STRING_AGG(u.first_name + ' ' + u.last_name, ', ') AS group_members
    FROM 
        FYPProposals p
    JOIN 
        ActiveFYPs f ON p.fyp_id = f.fyp_id 
    JOIN 
        Groups g ON f.group_id = g.group_id 
    JOIN 
        GroupMembers m ON g.group_id = m.group_id 
    JOIN 
        Users u ON m.student_id = u.user_id 
    WHERE 
        p.fyp_id = @FYPID
    GROUP BY 
        f.fyp_name, CONVERT(nvarchar(max), p.proposal_content), p.proposal_date;";



            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FYPID", fypId);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        lblFYPName.Text = reader["fyp_name"].ToString();
                        lblProposalContent.Text = reader["proposal_content"].ToString();
                        lblProposalDate.Text = ((DateTime)reader["proposal_date"]).ToLongDateString();
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