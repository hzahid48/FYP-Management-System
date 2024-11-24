using System;
using System.IO;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class StudentAssignment : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        GenerateRows();
    }

    protected void UploadFile(object sender, EventArgs e)
    {
        // Get the Assignment_Number from the command argument of the upload button
        Button uploadButton = (Button)sender;
        string[] args = uploadButton.CommandArgument.Split('_');
        string Assignment_Number = args[0];
        string project_id2 = args[1];

        // Get the file from the corresponding row
        FileUpload fileUpload = (FileUpload)Table2.FindControl("FileUpload_" + Assignment_Number + "_" + project_id2);

        // Check if a file was uploaded
        if (fileUpload.HasFile)
        {
            string desktopFolderPath = Environment.GetFolderPath(Environment.SpecialFolder.Desktop);
            string folderPath = Path.Combine(desktopFolderPath, "upload");

            // Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                // If Directory (Folder) does not exist, create it.
                Directory.CreateDirectory(folderPath);
            }

            // Save the File to the Directory (Folder).
            fileUpload.SaveAs(Path.Combine(folderPath, Path.GetFileName(fileUpload.FileName)));

            // Display the success message.
            lblMessage.Text = Path.GetFileName(fileUpload.FileName) + " has been uploaded.";

            // Update the status in the Assignment table
            int assignmentID = int.Parse(Assignment_Number);
            int project_id = int.Parse(project_id2);
            UpdateAssignmentStatus(assignmentID, project_id);
        }
        else
        {
            lblMessage.Text = "No file selected.";
        }
    }

    protected void UpdateAssignmentStatus(int assignmentID, int project_id)
    {
        // Update the status in the Assignment table to 1 (indicating successful upload)
        string connectionString = "Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True";
        string updateQuery = "UPDATE Assignment SET status = 1 WHERE Assignment_Number = @AssignmentID AND project_id = @project_id";
        string insertAuditQuery = "INSERT INTO AuditTrail (user_id, operation, timestamp) VALUES (@UserID, @Operation, @Timestamp)";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();

            // Update Assignment status
            using (SqlCommand updateCommand = new SqlCommand(updateQuery, connection))
            {
                updateCommand.Parameters.AddWithValue("@AssignmentID", assignmentID);
                updateCommand.Parameters.AddWithValue("@project_id", project_id);
                updateCommand.ExecuteNonQuery();
            }

            // Insert into AuditTrail
            int userID = (int)Session["ID"]; // Assuming you have a session variable for UserID
            string operation = "Assignment upload"; // You can customize this message
            DateTime timestamp = DateTime.Now;

            using (SqlCommand insertAuditCommand = new SqlCommand(insertAuditQuery, connection))
            {
                insertAuditCommand.Parameters.AddWithValue("@UserID", userID);
                insertAuditCommand.Parameters.AddWithValue("@Operation", operation);
                insertAuditCommand.Parameters.AddWithValue("@Timestamp", timestamp);
                insertAuditCommand.ExecuteNonQuery();
            }
        }
    }


    protected void GenerateRows()
    {
        int ID = (int)Session["ID"];
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True");
        conn.Open();

        string query = " SELECT fyp_id, Assignment_Number, Deadline FROM Assignment WHERE fyp_id " + 
                " = ( SELECT Projects.project_id FROM Projects" + 
                " JOIN GroupMembers ON Projects.group_id = GroupMembers.group_id " +
                " WHERE GroupMembers.student_id = @Student_ID ) AND status = 0;";
        SqlCommand command = new SqlCommand(query, conn);
        command.Parameters.AddWithValue("@Student_ID", ID);
        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
            int project_id = reader.GetInt32(0);
            int assignmentNumber = reader.GetInt32(1);
            DateTime deadline = reader.GetDateTime(2);

            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            TableCell cell2 = new TableCell();
            TableCell cell3 = new TableCell();
            TableCell cell4 = new TableCell();
            TableCell cell5 = new TableCell();

            cell1.HorizontalAlign = HorizontalAlign.Center;
            cell2.HorizontalAlign = HorizontalAlign.Center;
            cell3.HorizontalAlign = HorizontalAlign.Center;
            cell4.HorizontalAlign = HorizontalAlign.Center;
            cell5.HorizontalAlign = HorizontalAlign.Center;

            cell1.Text = assignmentNumber.ToString();
            cell2.Text = project_id.ToString();
            cell3.Text = deadline.ToShortDateString();

            // Create FileUpload control for each row
            FileUpload fileUpload = new FileUpload();
            fileUpload.ID = "FileUpload_" + assignmentNumber + "_" + project_id;
            cell4.Controls.Add(fileUpload);

            // Create Upload button for each row
            Button uploadButton = new Button();
            uploadButton.Text = "Upload";
            uploadButton.CommandArgument = assignmentNumber + "_" + project_id;
            uploadButton.Click += UploadFile;
            cell5.Controls.Add(uploadButton);

            row.Cells.Add(cell1);
            row.Cells.Add(cell2);
            row.Cells.Add(cell3);
            row.Cells.Add(cell4);
            row.Cells.Add(cell5);
            Table2.Rows.Add(row);
        }

        reader.Close();
        conn.Close();
    }
}
