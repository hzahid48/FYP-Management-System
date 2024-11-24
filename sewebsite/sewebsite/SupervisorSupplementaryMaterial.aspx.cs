using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorSupplementaryMaterial : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void UploadFile(object sender, EventArgs e)
    {
        string desktopFolderPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
        string folderPath = Path.Combine(desktopFolderPath, "upload");

        // Check whether Directory (Folder) exists.
        if (!Directory.Exists(folderPath))
        {
            // If Directory (Folder) does not exist, create it.
            Directory.CreateDirectory(folderPath);
        }

        try
        {
            // Save the File to the Directory (Folder).
            FileUpload1.SaveAs(Path.Combine(folderPath, Path.GetFileName(FileUpload1.FileName)));
            string message = "File uploaded successfully!";
            ClientScript.RegisterStartupScript(this.GetType(), "showMessage", $"showMessageModal('{message}');", true);
            // Display the success message.
            lblMessage.Text = Path.GetFileName(FileUpload1.FileName) + " has been uploaded.";

            // Insert record into the Reports table
            InsertIntoReports("Supplementary Material", (int)Session["ID"], DateTime.Now);
        }
        catch (Exception ex)
        {
            // Handle the exception and display error message
            lblMessage.Text = "Error occurred while uploading: " + ex.Message;
        }
    }

    private void InsertIntoReports(string reportType, int generatedBy, DateTime createdAt)
    {
        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Supp (report_type, generated_by, created_at) VALUES (@ReportType, @GeneratedBy, @CreatedAt)";

            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@ReportType", reportType);
            command.Parameters.AddWithValue("@GeneratedBy", generatedBy);
            command.Parameters.AddWithValue("@CreatedAt", createdAt);

            try
            {
                connection.Open();
                command.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                // Handle SQL exception
                throw new Exception("SQL Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        string supervisorId = Request.QueryString["SupervisorID"];
        string fypId = Request.QueryString["FYPID"];

        // Redirect to SupervisorActiveFYPMenu page with Supervisor ID as parameter
        Response.Redirect($"SupervisorActiveFYPMenu.aspx?SupervisorID={supervisorId}&FYPID={fypId}");


    }
}