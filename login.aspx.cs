using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tarfly
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_submit_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                string email = login_email.Text;
                string password = login_password.Text;

                Session["loginStatus"] = false;

                string userCredentialCheckQuery = "SELECT * FROM Customer WHERE email = @email AND password = @password"; // Check if the user already exist

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(userCredentialCheckQuery, connection))
                {
                    command.Parameters.AddWithValue("@email", email); // Setup parameter
                    command.Parameters.AddWithValue("@password", password);
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read()) // If the record exist
                    {
                        Session["userId"] = reader["customer_id"].ToString();
                        Session["username"] = reader["name"].ToString();
                        Session["email"] = reader["email"].ToString();
                        Session["loginStatus"] = true;

                        Response.Redirect("login.aspx");
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