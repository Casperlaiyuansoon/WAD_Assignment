using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace tarfly
{
    public partial class register : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void register_submit_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                string name = register_name.Text;
                string email = register_email.Text;
                string phone = register_phone.Text;
                string password = register_password.Text;
                string address1 = register_address1.Text;
                string address2 = register_address2.Text;
                string city = register_city.Text;
                string state = register_state.Text;
                string country = register_country.Text;

                // Check if the user already exists
                int count = 0;
                string userExistenceCheckQuery = "SELECT COUNT(*) FROM Customer WHERE email = @email";

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConMember"].ConnectionString))
                using (SqlCommand command = new SqlCommand(userExistenceCheckQuery, connection))
                {
                    command.Parameters.AddWithValue("@email", email);
                    connection.Open();
                    count = (int)command.ExecuteScalar();
                }

                if (count > 0) // If user already exists
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User already exists. Please use a different email address.');", true);
                }
                else // If user does not exist
                {
                    // Insert the new user
                    string newUserInsertQuery = "INSERT INTO Customer (name, email, password, phone_number, address_line_1, address_line_2, city, state, country) " +
                        "VALUES (@name, @email, @password, @phone_number, @address_line_1, @address_line_2, @city, @state, @country)";

                    using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConMember"].ConnectionString))
                    using (SqlCommand command = new SqlCommand(newUserInsertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@name", name);
                        command.Parameters.AddWithValue("@email", email);
                        command.Parameters.AddWithValue("@password", password);
                        command.Parameters.AddWithValue("@phone_number", phone);
                        command.Parameters.AddWithValue("@address_line_1", address1);
                        command.Parameters.AddWithValue("@address_line_2", address2);
                        command.Parameters.AddWithValue("@city", city);
                        command.Parameters.AddWithValue("@state", state);
                        command.Parameters.AddWithValue("@country", country);

                        connection.Open();
                        command.ExecuteNonQuery();
                    }

                    // Redirect to login page or display success message
                    Response.Redirect("login.aspx");
                }
            }
        }
    }
}