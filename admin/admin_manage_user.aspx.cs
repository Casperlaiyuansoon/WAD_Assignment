using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.admin
{
    public partial class admin_manage_user : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["adminId"] == null)
            {
                Session["adminAuth"] = true;
                Response.Redirect("admin_login.aspx");
            }

            Session["userAvailable"] = false;
            string getFlight = "SELECT * FROM Customer"; // Check if the user already exist

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getFlight, connection))
            {
                connection.Open();

                using (SqlDataAdapter sda = new SqlDataAdapter(command))
                {
                    DataTable user = new DataTable();
                    sda.Fill(user);

                    if (user.Rows.Count > 0) // If at least one record was found
                    {
                        Session["userAvailable"] = true;
                        user_repeater.DataSource = user;
                        user_repeater.DataBind();
                    }
                }
            }

            if (Request.QueryString["modifying"] != null)
            {
                int userIdToModify = int.Parse(Request.QueryString["modifying"]);
                string getSpecificFlight = "SELECT * FROM Customer WHERE customer_id = @customerId";

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(getSpecificFlight, connection))
                {
                    command.Parameters.AddWithValue("@customerId", userIdToModify); // Setup parameter

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string user_id_edit = reader["customer_id"].ToString();
                            string name_edit = reader["name"].ToString();
                            string email_edit = reader["email"].ToString();
                            string password_edit = reader["password"].ToString();
                            string phone_no_edit = reader["phone_number"].ToString();
                            string address1_edit = reader["address_line_1"].ToString();
                            string address2_edit = reader["address_line_2"].ToString();
                            string city_edit = reader["city"].ToString();
                            string state_edit = reader["state"].ToString();
                            string country_edit = reader["country"].ToString();

                            Response.Redirect("admin_manage_user.aspx?uId=" + user_id_edit +
                                "&name=" + name_edit + "&email=" + email_edit + "&password=" +
                                password_edit + "&phone=" + phone_no_edit + "&address1=" +
                                address1_edit + "&address2=" + address2_edit + "&city=" +
                                city_edit + "&state=" + state_edit + "&country=" + country_edit);
                        }
                    }
                }
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["uId"] != null)
                {
                    customer_id_modify.Text = Request.QueryString["uId"].ToString();
                    customer_name_modify.Text = Request.QueryString["name"].ToString();
                    customer_email_modify.Text = Request.QueryString["email"].ToString();
                    customer_password_modify.Text = Request.QueryString["password"].ToString();
                    customer_phone_modify.Text = Request.QueryString["phone"].ToString();
                    customer_address1_modify.Text = Request.QueryString["address1"].ToString();
                    customer_address2_modify.Text = Request.QueryString["address2"].ToString();
                    customer_city_modify.Text = Request.QueryString["city"].ToString();
                    customer_state_modify.Text = Request.QueryString["state"].ToString();
                    customer_country_modify.Text = Request.QueryString["country"].ToString();
                }
            }
        }






        protected void save_modify_btn_Click(object sender, EventArgs e)
        {
            string updateFlightQuery = "UPDATE Customer SET name = @custName, " +
                "email = @custEmail, password = @custPassword, " +
                "phone_number = @custPhone, address_line_1 = @custAddress1, " +
                "address_line_2 = @custAddress2, city = @custCity, " +
                "state = @custState, country = @custCountry " +
                "WHERE customer_id = @custId";

            Session["userModified"] = false;

            string name = customer_name_modify.Text;
            string email = customer_email_modify.Text;
            string password = customer_password_modify.Text;
            string phone = customer_phone_modify.Text;
            string address1 = customer_address1_modify.Text;
            string address2 = customer_address2_modify.Text;
            string city = customer_city_modify.Text;
            string state = customer_state_modify.Text;
            string country = customer_country_modify.Text;
            int id = int.Parse(customer_id_modify.Text);

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(updateFlightQuery, connection))
            {
                command.Parameters.AddWithValue("@custName", name);
                command.Parameters.AddWithValue("@custEmail", email);
                command.Parameters.AddWithValue("@custPassword", password);
                command.Parameters.AddWithValue("@custPhone", phone);
                command.Parameters.AddWithValue("@custAddress1", address1);
                command.Parameters.AddWithValue("@custAddress2", address2);
                command.Parameters.AddWithValue("@custCity", city);
                command.Parameters.AddWithValue("@custState", state);
                command.Parameters.AddWithValue("@custCountry", country);
                command.Parameters.AddWithValue("@custId", id);

                connection.Open();
                int modifyRowsAffected = command.ExecuteNonQuery();

                if (modifyRowsAffected > 0) // Update successful
                {
                    Session["userModified"] = true;
                    Response.Redirect("admin_manage_user.aspx");
                }
                else // Update unsuccessful
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something wrong, try again later');", true);
                }
            }
        }





        // MODIFY BUTTON CLICKED
        protected void user_modify_button_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Button btn = (Button)sender;
                string userId = btn.CommandArgument;
                string url = "admin_manage_user.aspx?modifying=" + userId;
                Response.Redirect(url);
            }
        }
        // END MODIFY BUTTON CLICKED





        protected void user_remove_button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string custId = btn.CommandArgument.ToString(); // get customer id from button clicked

            string deleteCustomerQuery = "DELETE FROM Customer WHERE customer_id = @customerId";
            Session["userDeleted"] = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(deleteCustomerQuery, connection))
            {
                command.Parameters.AddWithValue("@customerId", custId);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0) // If sucessful deleted
                {
                    Session["userDeleted"] = true;
                    Response.Redirect("admin_manage_user.aspx");
                }
                else // If delete unsuccessful
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something wrong, maybe the record already deleted');", true);
                }
            }
        }

        protected void add_user_submit_Click(object sender, EventArgs e)
        {
            string name = register_name.Text;
            string email = register_email.Text;
            string password = register_password.Text;
            string phone = register_phone.Text;
            string address1 = register_address1.Text;
            string address2 = register_address2.Text;
            string city = register_city.Text;
            string state = register_state.Text;
            string country = register_country.Text;

            //Check if the flight already existed
            string flightExistCheckQuery = "SELECT COUNT(*) FROM Customer WHERE email = @email";

            int count = 0;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(flightExistCheckQuery, connection))
            {
                command.Parameters.AddWithValue("@email", email); // Setup parameter

                Session["userAdded"] = false;

                connection.Open();
                count = (int)command.ExecuteScalar(); // Store the total record fetched from database into the "count"
            }

            if (count > 0) // If user already exists
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('User already exist');", true);
            }
            else // If flight does not exist
            {
                string newUserInsertQuery = "INSERT INTO Customer (name, email, password, phone_number, address_line_1, address_line_2, city, state, country) " +
                    "VALUES (@name, @email, @password, @phone, @address1, @address2, @city, @state, @country)"; // Insert the new user

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(newUserInsertQuery, connection))
                {
                    command.Parameters.AddWithValue("@name", name); // Setup parameter
                    command.Parameters.AddWithValue("@email", email);
                    command.Parameters.AddWithValue("@password", password);
                    command.Parameters.AddWithValue("@phone", phone);
                    command.Parameters.AddWithValue("@address1", address1);
                    command.Parameters.AddWithValue("@address2", address2);
                    command.Parameters.AddWithValue("@city", city);
                    command.Parameters.AddWithValue("@state", state);
                    command.Parameters.AddWithValue("@country", country);

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                Session["userAdded"] = true;
                Response.Redirect("admin_manage_user.aspx");
            }
        }

        protected void search_user_btn_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(search_user.Text))
            {

                string search = search_user.Text;
                string searchFlightQuery = "SELECT * FROM Customer WHERE name LIKE '%' + @custName + '%'";
                Session["searchUserAvailable"] = false;

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(searchFlightQuery, connection))
                {
                    command.Parameters.AddWithValue("@custName", search); // Setup parameter

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows) // If record found
                    {
                        search_user_repeater.DataSource = reader;
                        search_user_repeater.DataBind();
                        Session["searchUserAvailable"] = true;
                    }
                    else // If no record found
                    {
                        search_user_repeater.DataSource = null;
                        search_user_repeater.DataBind();
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Record Found');", true);
                    }
                    reader.Close();
                    connection.Close();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Enter something to search');", true);
            }
        }
    }
}