 using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCrypt.Net;

namespace tarfly
{
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void admin_login_submit_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                string email = admin_login_email.Text;
                string password = admin_login_password.Text;

                Session["adminLoginStatus"] = false;

                string adminCredentialCheckQuery = "SELECT * FROM Admin WHERE email = @email AND password = @password"; // Check if the user already exist

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(adminCredentialCheckQuery, connection))
                {
                    command.Parameters.AddWithValue("@email", email); // Setup parameter
                    command.Parameters.AddWithValue("@password", password);
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read()) // If the record exist
                    {
                        Session["adminId"] = reader["admin_id"].ToString();
                        Session["admin_name"] = reader["name"].ToString();
                        Session["admin_email"] = reader["email"].ToString();
                        Session["adminLoginStatus"] = true;

                        Response.Redirect("admin_login.aspx");
                    }
                    else // If the record doesn't exist
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Credential, please try again');", true);
                    }
                }
            }
        }



    }
}