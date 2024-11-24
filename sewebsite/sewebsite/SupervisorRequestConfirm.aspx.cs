using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SupervisorRequestConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null)
            {
                string supervisorid = Request.QueryString["ID"];
                string successMessage = $"Your request has been successfully submitted. The panel will get back to you.";
                lblMessage.Text = successMessage;
            }
            else
            {
                lblMessage.Text = "Error:  Supervisor IDs not provided.";
                Response.Redirect("SupervisorError.aspx");
            }
        }
    }
    protected void btnGoToHome_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null)
        {
            string supervisorId = Request.QueryString["ID"];
            Response.Redirect($"SupervisorHome.aspx?ID={supervisorId}");
        }
        else
        {
            lblMessage.Text = "Error: Supervisor IDs not provided.";
            Response.Redirect("SignIn.aspx");
        }
    }
}