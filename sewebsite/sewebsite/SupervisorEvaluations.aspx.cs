using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorEvaluations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Check if evaluation_id is provided in the query string
            if (Request.QueryString["evaluation_id"] != null)
            {
                // Retrieve evaluation_id from the query string
                int evaluationId = Convert.ToInt32(Request.QueryString["evaluation_id"]);

                // Retrieve evaluation details and FYP description from the database
                string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = @"
                        SELECT e.*, p.description AS fyp_description
                        FROM Evaluations e
                        INNER JOIN Projects p ON e.project_id = p.project_id
                        WHERE e.evaluation_id = @EvaluationId";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@EvaluationId", evaluationId);
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            // Display evaluation details
                            lblEvaluationId.Text = reader["evaluation_id"].ToString();
                            lblProjectId.Text = reader["project_id"].ToString();
                            lblPanelMemberId.Text = reader["panel_member_id"].ToString();
                            lblScore.Text = reader["score"].ToString();
                            lblComments.Text = reader["comments"].ToString();
                            // Display FYP description
                            lblFYPDescription.Text = reader["fyp_desc"].ToString();
                        }
                        else
                        {
                            // Evaluation not found, display an error message or handle accordingly
                            lblMessage.Text = "Evaluation not found.";
                        }
                    }
                }
            }
            else
            {
                lblEvaluationId.Visible = false;
                lblProjectId.Visible = false;
                lblPanelMemberId.Visible = false;
                lblScore.Visible = false;
                lblComments.Visible = false;
                lblFYPDescription.Visible = false;
                // evaluation_id not provided in the query string, handle accordingly
                lblMessage.Text = "No evaluations yet for this project. Send a request to the panel to process evaluations.";
            }
        }
    }

    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect back to SupervisorFYPMaterials page with Supervisor ID as parameter

        Response.Redirect($"SupervisorActiveFYPMenu.aspx?SupervisorID={supervisorId}&FYPID={fypId}");
    }
}