using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class AssignFYP : System.Web.UI.Page
{
    private const string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateDropdowns();  // Load groups, supervisors, co-supervisors, and panels
        }
    }

    private void PopulateDropdowns()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Load groups into the dropdown list
            using (SqlCommand groupCommand = new SqlCommand("SELECT group_id, project_title FROM Groups", conn))
            {
                using (SqlDataReader groupReader = groupCommand.ExecuteReader())
                {
                    GroupDdl.DataSource = groupReader;
                    GroupDdl.DataTextField = "project_title";
                    GroupDdl.DataValueField = "group_id";
                    GroupDdl.DataBind();
                }
            }

            // Load supervisors into the supervisor and co-supervisor dropdowns
            using (SqlCommand supervisorCommand = new SqlCommand("SELECT user_id, CONCAT(first_name, ' ', last_name) AS full_name FROM Users WHERE role = 'Supervisor'", conn))
            {
                using (SqlDataReader supervisorReader = supervisorCommand.ExecuteReader())
                {
                    SupervisorDdl.DataSource = supervisorReader;
                    SupervisorDdl.DataTextField = "full_name";
                    SupervisorDdl.DataValueField = "user_id";
                    SupervisorDdl.DataBind();
                }

                // Reload the reader for the co-supervisor dropdown
                using (SqlDataReader coSupervisorReader = supervisorCommand.ExecuteReader())
                {
                    CoSupervisorDdl.DataSource = coSupervisorReader;
                    CoSupervisorDdl.DataTextField = "full_name";
                    CoSupervisorDdl.DataValueField = "user_id";
                    CoSupervisorDdl.DataBind();
                }
            }

            // Load panels into the panel dropdown
            using (SqlCommand panelCommand = new SqlCommand("SELECT panel_id, panel_name FROM Panels", conn))
            {
                using (SqlDataReader panelReader = panelCommand.ExecuteReader())
                {
                    PanelDdl.DataSource = panelReader;
                    PanelDdl.DataTextField = "panel_name";
                    PanelDdl.DataValueField = "panel_id";
                    PanelDdl.DataBind();
                }
            }
        }
    }

    protected void AssignFYPBtn_Click(object sender, EventArgs e)
    {
        int selectedSupervisorId = Convert.ToInt32(SupervisorDdl.SelectedValue);
        int selectedGroupId = Convert.ToInt32(GroupDdl.SelectedValue);
        int? selectedCoSupervisorId = null;
        int selectedPanelId = Convert.ToInt32(PanelDdl.SelectedValue);

        if (int.TryParse(CoSupervisorDdl.SelectedValue, out int coSupervisorId))
        {
            selectedCoSupervisorId = coSupervisorId;  // Co-supervisor ID
        }

        if (selectedSupervisorId == selectedCoSupervisorId)
        {
            ShowPopup("Error: Supervisor and co-supervisor cannot be the same person.");
            return;
        }

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Get the project title from the selected group
            string projectTitleQuery = "SELECT project_title FROM Groups WHERE group_id = @GroupId";
            using (SqlCommand projectTitleCommand = new SqlCommand(projectTitleQuery, conn))
            {
                projectTitleCommand.Parameters.AddWithValue("@GroupId", selectedGroupId);

                string projectTitle = projectTitleCommand.ExecuteScalar()?.ToString();  // Retrieve the project title

                if (string.IsNullOrWhiteSpace(projectTitle))
                {
                    ShowPopup("Error: Project title not found.");
                    return;  // Exit if project title is invalid
                }

                // Insert into ActiveFYPs using the retrieved project title
                string insertQuery = "INSERT INTO ActiveFYPs (fyp_name, start_date, end_date, supervisor_id, group_id, status) VALUES (@FypName, @StartDate, @EndDate, @SupervisorId, @GroupId, 'Active')";
                using (SqlCommand insertCommand = new SqlCommand(insertQuery, conn))
                {
                    insertCommand.Parameters.AddWithValue("@FypName", projectTitle);  // Use project title
                    insertCommand.Parameters.AddWithValue("@StartDate", DateTime.Now);
                    insertCommand.Parameters.AddWithValue("@EndDate", DateTime.Now.AddMonths(6));  // 6-month duration
                    insertCommand.Parameters.AddWithValue("@SupervisorId", selectedSupervisorId);
                    insertCommand.Parameters.AddWithValue("@GroupId", selectedGroupId);

                    insertCommand.ExecuteNonQuery();  // Execute the insertion
                }

                // Update the group with supervisor, co-supervisor, and panel
                string updateGroupsQuery = "UPDATE Groups SET supervisor_id = @SupervisorId, cosupervisor_id = @CoSupervisorId, panel_id = @PanelId WHERE group_id = @GroupId";
                using (SqlCommand updateGroupsCommand = new SqlCommand(updateGroupsQuery, conn))
                {
                    updateGroupsCommand.Parameters.AddWithValue("@SupervisorId", selectedSupervisorId);
                    updateGroupsCommand.Parameters.AddWithValue("@GroupId", selectedGroupId);
                    updateGroupsCommand.Parameters.AddWithValue("@CoSupervisorId", selectedCoSupervisorId.HasValue ? (object)selectedCoSupervisorId.Value : DBNull.Value);
                    updateGroupsCommand.Parameters.AddWithValue("@PanelId", selectedPanelId);

                    updateGroupsCommand.ExecuteNonQuery();  // Update the Groups table
                }
            }

            ShowPopup("FYP assigned successfully.");
        }
    }

    private void ShowPopup(string message)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", $"alert('{message}');", true);
    }
}
