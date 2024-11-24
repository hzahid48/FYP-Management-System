using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;
public partial class SupervisorViewActiveFYPs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DisplayActiveFYPs();
        }
    }

    private void DisplayActiveFYPs()
    {
        string supervisorId = Request.QueryString["ID"];
       

        if (string.IsNullOrEmpty(supervisorId))
        {
            supervisorId = Request.QueryString["SupervisorID"];
        }
       
        if (!string.IsNullOrEmpty(supervisorId))
        {
            string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";
            string query = "SELECT TOP 5 fyp_id, fyp_name FROM ActiveFYPs WHERE supervisor_id = @SupervisorId";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@SupervisorId", supervisorId);
                    connection.Open();
                    DataTable dt = new DataTable();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        dt.Load(reader);
                    }
                    rptActiveFYPs.DataSource = dt;
                    rptActiveFYPs.DataBind();
                }
            }
        }
        else
        {
            Response.Redirect("SupervisorError.aspx");
        }
    }

    protected void rptActiveFYPs_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "SelectOption")
        {
            int index = e.Item.ItemIndex;
            Label lblFYPId = (Label)e.Item.FindControl("lblFYPId");
            string fypId = lblFYPId.Text;
            string supervisorId = Request.QueryString["ID"];
            Response.Redirect($"SupervisorActiveFYPMenu.aspx?SupervisorID={supervisorId}&FYPID={fypId}");
        }
    }
    protected void btnGoBack_Click(object sender, EventArgs e)
    {
        // Get Supervisor ID from query parameters
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];
        if (string.IsNullOrEmpty(supervisorId))
        {
            supervisorId = Request.QueryString["ID"];
        }
        // Redirect to SupervisorActiveFYPMenu page with Supervisor ID as parameter
        Response.Redirect($"SupervisorHome.aspx?SupervisorID={supervisorId}");



    }
}



