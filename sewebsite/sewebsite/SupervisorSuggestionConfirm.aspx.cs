using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class SupervisorSuggestionConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ID"] != null && Request.QueryString["ParameterName"] != null)
            {
                string panelMemberName = Request.QueryString["ID"];
                string supervisorId = Request.QueryString["ParameterName"];
                string successMessage = $"Your suggestion has been successfully submitted. The panel member, {panelMemberName}, will get back to you.";
                lblMessage.Text = successMessage;
            }
            else if (Request.QueryString["ID"] != null)
            {
                string panelMemberName = Request.QueryString["ID"];
                lblMessage.Text = "Error: Supervisor ID not provided.";
            }
            else if (Request.QueryString["ParameterName"] != null)
            {
                string supervisorId = Request.QueryString["ParameterName"];
                lblMessage.Text = "Error: Panel member ID not provided.";
            }
            else
            {
                lblMessage.Text = "Error: Panel member and Supervisor IDs not provided.";
                Response.Redirect("SupervisorError.aspx");
            }
        }
    }

    protected void btnGoToHome_Click(object sender, EventArgs e)
    {
        if ( Request.QueryString["ParameterName"] != null)
        {
            
            string supervisorId = Request.QueryString["ParameterName"];
            Response.Redirect("SupervisorHome.aspx?ID=" + supervisorId);
        }
       
        else
        {
            
            Response.Redirect("SupervisorError.aspx");
        }
    }
    }


