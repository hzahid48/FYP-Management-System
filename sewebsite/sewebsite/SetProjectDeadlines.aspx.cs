using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SetProjectDeadlines : System.Web.UI.Page
{
    private string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadFYPs();  // Load the FYPs into the dropdown
            BindActiveFYPs();  // Bind the GridView with active FYPs
        }
    }

    private void LoadFYPs()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            string query = "SELECT fyp_id, fyp_name FROM ActiveFYPs";  // Retrieve FYPs
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader reader = cmd.ExecuteReader();

            FypDdl.DataSource = reader;  // Set data source for dropdown
            FypDdl.DataTextField = "fyp_name";  // Display FYP name
            FypDdl.DataValueField = "fyp_id";  // Use FYP ID as value
            FypDdl.DataBind();  // Bind data to the dropdown
        }
    }

    private void BindActiveFYPs()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            string query = @"
                SELECT 
                    af.fyp_name,
                    g.project_title,
                    af.start_date,
                    af.submission_deadline,
                    af.evaluation_deadline
                FROM 
                    ActiveFYPs af
                JOIN 
                    Groups g 
                ON 
                    af.group_id = g.group_id";  // Retrieve active FYPs with details

            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader reader = cmd.ExecuteReader();

            ActiveFYPsGridView.DataSource = reader;  // Set data source for GridView
            ActiveFYPsGridView.DataBind();  // Bind data to the GridView
        }
    }

    protected void SaveDeadlinesBtn_Click(object sender, EventArgs e)
    {
        int selectedFypId = Convert.ToInt32(FypDdl.SelectedValue);  // Get selected FYP ID
        DateTime? submissionDeadline = null;
        DateTime? evaluationDeadline = null;

        // Check if date inputs are valid
        if (DateTime.TryParse(SubmissionDeadlineTxt.Text, out DateTime submissionDate))
        {
            submissionDeadline = submissionDate;  // Convert string to DateTime
        }

        if (DateTime.TryParse(EvaluationDeadlineTxt.Text, out DateTime evaluationDate))
        {
            evaluationDeadline = evaluationDate;  // Convert string to DateTime
        }

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Update deadlines for the selected FYP
            string updateQuery = @"
                UPDATE ActiveFYPs
                SET 
                    submission_deadline = @SubmissionDeadline,
                    evaluation_deadline = @EvaluationDeadline
                WHERE 
                    fyp_id = @FypId";  // Update by FYP ID

            SqlCommand cmd = new SqlCommand(updateQuery, conn);

            cmd.Parameters.AddWithValue("@FypId", selectedFypId);
            cmd.Parameters.AddWithValue("@SubmissionDeadline", submissionDeadline.HasValue ? (object)submissionDeadline.Value : DBNull.Value);
            cmd.Parameters.AddWithValue("@EvaluationDeadline", evaluationDeadline.HasValue ? (object)evaluationDeadline.Value : DBNull.Value);

            cmd.ExecuteNonQuery();  // Execute the update

            BindActiveFYPs();  // Refresh the GridView to reflect changes

            StatusLabel.Text = "Deadlines saved successfully!";  // Display success message
        }
    }

    private void ShowNotification(string message)
    {
        // Display a JavaScript alert with the message
        ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", $"alert('{message}');", true);
    }
}
