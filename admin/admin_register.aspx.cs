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
    public partial class admin_register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void admin_register_submit_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                string name = admin_register_name.Text;
                string email = admin_register_email.Text;
                string password = admin_register_password.Text;

                //Hasdhed the password before storing in the database
                string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);

                int count = 0;
                Session["adminRegisterStatus"] = false;

                string adminExistenceCheckQuery = "SELECT COUNT(*) FROM Admin WHERE email = @email"; // Check if the user already exist

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(adminExistenceCheckQuery, connection))
                {
                    command.Parameters.AddWithValue("@email", email); // Setup parameter
                    connection.Open();
                    count = (int)command.ExecuteScalar(); // Store the total record fetched from database into the "count"
                }

                if (count > 0) // If user already exists
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Admin already exists. Please use a different email address.');", true);
                }
                else // If user does not exist
                {
                    string newAdminInsertQuery = "INSERT INTO Admin (name, email, password) VALUES (@name, @email, @password)"; // Insert the new user

                    using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                    using (SqlCommand command = new SqlCommand(newAdminInsertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@name", name); // Setup parameter
                        command.Parameters.AddWithValue("@email", email);
                        command.Parameters.AddWithValue("@password", hashedPassword);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }

                    // Display success message and redirect to login page
                    Session["adminRegisterStatus"] = true;
                    Response.Redirect("admin_register.aspx");
                }
            }
        }
    }
}