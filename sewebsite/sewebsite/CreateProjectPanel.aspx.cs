using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateProjectPanel : System.Web.UI.Page
{
    private string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadFacultyMembers();  // Load faculty members into CheckBoxList and DropDownList
        }
    }

    private void LoadFacultyMembers()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Query to get faculty members (supervisors or panel members)
            string query = "SELECT user_id, CONCAT(first_name, ' ', last_name) AS full_name FROM Users WHERE role = 'Supervisor' OR role = 'Panel Member'";
            SqlCommand cmd = new SqlCommand(query, conn);

            SqlDataReader reader = cmd.ExecuteReader();

            FacultyMembersCbl.DataSource = reader;  // Populate CheckBoxList
            FacultyMembersCbl.DataTextField = "full_name";  // Display full name
            FacultyMembersCbl.DataValueField = "user_id";  // ID for backend logic
            FacultyMembersCbl.DataBind();

            reader.Close();  // Ensure reader is closed before reusing it

            // Re-execute query for DropDownList
            reader = cmd.ExecuteReader();  // Re-execute query
            PanelLeaderDdl.DataSource = reader;
            PanelLeaderDdl.DataTextField = "full_name";  // Display full name
            PanelLeaderDdl.DataValueField = "user_id";  // Use user ID for value
            PanelLeaderDdl.DataBind();
        }
    }

    protected void CreatePanelBtn_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            conn.Open();

            // Get panel name and panel leader
            string panelName = PanelNameTxt.Text;
            int? panelLeaderId = null;

            if (int.TryParse(PanelLeaderDdl.SelectedValue, out int leaderId))
            {
                panelLeaderId = leaderId;  // Get panel leader ID
            }

            // Validate panel leader is among selected panel members
            bool isLeaderInSelectedMembers = false;

            foreach (ListItem item in FacultyMembersCbl.Items)
            {
                if (item.Selected && Convert.ToInt32(item.Value) == panelLeaderId)
                {
                    isLeaderInSelectedMembers = true;  // Panel leader is among selected members
                    break;
                }
            }

            if (!isLeaderInSelectedMembers)
            {
                // If panel leader is not among selected members, show error
                ShowPopup("Error: Panel leader must be among selected panel members.");
                return;  // Stop processing
            }

            // Insert the new panel and get the panel ID
            string insertPanelQuery = "INSERT INTO Panels (panel_name, panel_leader_id) OUTPUT INSERTED.panel_id VALUES (@PanelName, @PanelLeaderId)";
            SqlCommand cmd = new SqlCommand(insertPanelQuery, conn);
            cmd.Parameters.AddWithValue("@PanelName", panelName);
            cmd.Parameters.AddWithValue("@PanelLeaderId", panelLeaderId.HasValue ? (object)panelLeaderId.Value : DBNull.Value);

            int newPanelId = (int)cmd.ExecuteScalar();  // Get new panel ID

            // Insert selected panel members into the PanelMembers table
            foreach (ListItem item in FacultyMembersCbl.Items)
            {
                if (item.Selected)
                {
                    // Corrected SQL query for inserting panel members
                    string insertMemberQuery = @"
    INSERT INTO PanelMembers (panel_id, faculty_id, panel_member_name)
    SELECT @PanelId, user_id, CONCAT(first_name, ' ', last_name)  -- Retrieve full name from Users
    FROM Users
    WHERE user_id = @FacultyId";  // Ensure the WHERE clause is complete

                    // Create and execute the command
                    SqlCommand memberCmd = new SqlCommand(insertMemberQuery, conn);
                    memberCmd.Parameters.AddWithValue("@PanelId", newPanelId);
                    memberCmd.Parameters.AddWithValue("@FacultyId", Convert.ToInt32(item.Value));  // Ensure FacultyId is a valid integer
                    memberCmd.ExecuteNonQuery();  // Execute the query
                }
            }

            ShowPopup("Success: Panel created successfully!");
        }
    }

    private void ShowPopup(string message)
    {
        // Use JavaScript to display a popup alert
        ScriptManager.RegisterStartupScript(this, GetType(), "popupMessage", $"alert('{message}');", true);
    }
}
