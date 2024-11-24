using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorDeadlines : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Get Supervisor ID and FYP ID from query parameters
            string supervisorId = Request.QueryString["SupervisorID"];
            string fypId = Request.QueryString["FYPID"];

            // Fetch and display deadlines
            List<DeadlineItem> deadlines = FetchDeadlines(supervisorId, fypId);
            rptDeadlines.DataSource = deadlines;
            rptDeadlines.DataBind();
        }
    }

    public class DeadlineItem
    {
        public int Id { get; set; }
        public int AssignmentNumber { get; set; }
        public DateTime Deadline { get; set; }
        public bool Status { get; set; }
        public string FypName { get; set; }
        public string GroupMemberNames { get; set; }
    }

    private List<DeadlineItem> FetchDeadlines(string supervisorId, string fypId)
    {
        List<DeadlineItem> deadlines = new List<DeadlineItem>();

        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";
        string query = @"
        SELECT 
            a.id, 
            a.Assignment_Number, 
            a.Deadline, 
            a.status, 
            p.fyp_name, 
            STRING_AGG(CONVERT(NVARCHAR(MAX), u.first_name) + ' ' + CONVERT(NVARCHAR(MAX), u.last_name), ', ') AS group_member_names 
        FROM 
            Assignment a 
        INNER JOIN 
            ActiveFYPs p ON a.fyp_id = p.fyp_id 
        INNER JOIN 
            Groups g ON p.group_id = g.group_id 
        INNER JOIN 
            GroupMembers gm ON g.group_id = gm.group_id 
        INNER JOIN 
            Users u ON gm.student_id = u.user_id 
        WHERE 
            g.supervisor_id = @SupervisorId AND 
            p.fyp_id = @FYPID 
        GROUP BY 
            a.id, 
            a.Assignment_Number, 
            a.Deadline, 
            a.status, 
            p.fyp_name";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@SupervisorId", supervisorId);
                command.Parameters.AddWithValue("@FYPID", fypId);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    DeadlineItem deadline = new DeadlineItem
                    {
                        Id = Convert.ToInt32(reader["id"]),
                        AssignmentNumber = Convert.ToInt32(reader["Assignment_Number"]),
                        Deadline = Convert.ToDateTime(reader["Deadline"]),
                        Status = Convert.ToBoolean(reader["status"]),
                        FypName = reader["fyp_name"].ToString(),
                        GroupMemberNames = reader["group_member_names"].ToString()
                    };
                    deadlines.Add(deadline);
                }
            }
        }
        return deadlines;
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect to SupervisorActiveFYPMenu page with Supervisor ID as parameter
        Response.Redirect($"SupervisorActiveFYPMenu.aspx?SupervisorID={supervisorId}&FYPID={fypId}");



    }


}