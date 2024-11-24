using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewFYPGroupDetails : Page
{
    private const string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGroupOptions();  // Load the dropdown with group options on first load
        }
    }

    private void LoadGroupOptions()
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string sqlQuery = "SELECT group_id, project_title FROM Groups";  // Fetch group ID and title
            using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
            {
                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // Add each group to the dropdown list
                        ListItem item = new ListItem(reader["project_title"].ToString(), reader["group_id"].ToString());
                        GroupSelect.Items.Add(item);
                    }
                }
            }
        }
    }

    protected void GroupSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Load the details for the selected group
        int groupId;
        if (int.TryParse(GroupSelect.SelectedValue, out groupId))
        {
            LoadGroupDetails(groupId);  // Pass the group ID to the method
        }
    }

    private void LoadGroupDetails(int groupId)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string sqlQuery = @"
                SELECT 
                    g.project_title,
                    s.username AS supervisor,
                    cs.username AS cosupervisor,
                    p.panel_name,
                    pl.username AS panel_leader
                FROM 
                    Groups g
                LEFT JOIN 
                    Users s ON g.supervisor_id = s.user_id
                LEFT JOIN 
                    Users cs ON g.cosupervisor_id = cs.user_id
                LEFT JOIN 
                    Panels p ON g.panel_id = p.panel_id
                LEFT JOIN 
                    Users pl ON p.panel_leader_id = pl.user_id
                WHERE 
                    g.group_id = @GroupId";

            using (SqlCommand cmd = new SqlCommand(sqlQuery, conn))
            {
                cmd.Parameters.AddWithValue("@GroupId", groupId);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        ProjectTitleLabel.Text = reader["project_title"].ToString();
                        SupervisorLabel.Text = reader["supervisor"].ToString();
                        CoSupervisorLabel.Text = reader["cosupervisor"].ToString();
                        PanelLabel.Text = reader["panel_name"].ToString();
                        PanelLeaderLabel.Text = reader["panel_leader"].ToString();
                    }
                }
            }

            // Fetching group members
            string membersQuery = @"
                SELECT 
                    u.first_name,
                    u.last_name
                FROM 
                    GroupMembers gm
                JOIN 
                    Users u ON gm.student_id = u.user_id
                WHERE 
                    gm.group_id = @GroupId";

            using (SqlCommand cmd = new SqlCommand(membersQuery, conn))
            {
                cmd.Parameters.AddWithValue("@GroupId", groupId);
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    GroupMembersRepeater.DataSource = dt;
                    GroupMembersRepeater.DataBind();
                }
            }
        }
    }
}
