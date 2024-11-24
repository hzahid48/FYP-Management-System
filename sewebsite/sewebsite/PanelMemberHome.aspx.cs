using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PanelMemberHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox2_TextChanged(sender, e);
    }

    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=DESKTOP-IO1J1GI\\SQLEXPRESS;Initial Catalog=tryproj;Integrated Security=True");
        conn.Open();

        int ID = (int)Session["ID"];
        SqlCommand cmd = new SqlCommand("Select * from Users where user_id = @ID", conn);
        cmd.Parameters.AddWithValue("@ID", ID);
        SqlDataReader da = cmd.ExecuteReader();
        while (da.Read())
        {
            // Label11.Text = ID.ToString();
            Label11.Text = da.GetValue(1).ToString();
            Label12.Text = "Islamabad";
            //Label13.Text = da.GetValue(1).ToString();
            Label14.Text = da.GetValue(4).ToString();
           Label15.Text = da.GetValue(5).ToString();
            //Label16.Text = da.GetValue(1).ToString();
            Label16.Text = "random@gmail.com";
            Label17.Text = "+92 1234567890";

        }
        da.Close();
     
   
        conn.Close();
    }
}