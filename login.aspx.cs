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

                string userCredentialCheckQuery = "SELECT * FROM Customer WHERE email = @email"; // Check if the user already exists

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(userCredentialCheckQuery, connection))
                {
                    command.Parameters.AddWithValue("@email", email); // Setup parameter
                    connection.Open();

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read()) // If the record exists
                    {
                        string hashedPasswordFromDB = reader["password"].ToString(); // Retrieve hashed password from the database

                        if (BCrypt.Net.BCrypt.Verify(password, hashedPasswordFromDB)) // Verify the password
                        {
                            Session["userId"] = reader["customer_id"].ToString();
                            Session["username"] = reader["name"].ToString();
                            Session["email"] = reader["email"].ToString();
                            Session["loginStatus"] = true;

                            Response.Redirect("login.aspx");
                        }
                        else // If the password doesn't match
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Credential, please try again');", true);
                        }
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