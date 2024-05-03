using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.admin
{
    public partial class admin_manage_flight : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["flightAvailable"] = false;
            string getFlight = "SELECT * FROM Flight"; // Check if the user already exist

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getFlight, connection))
            {
                connection.Open();

                using (SqlDataAdapter sda = new SqlDataAdapter(command))
                {
                    DataTable flight = new DataTable();
                    sda.Fill(flight);

                    if (flight.Rows.Count > 0) // If at least one record was found
                    {
                        Session["flightAvailable"] = true;
                        flight_repeater.DataSource = flight;
                        flight_repeater.DataBind();
                    }
                    
                }

                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Credential, please try again');", true);
            }
        }

        protected void add_flight_submit_Click(object sender, EventArgs e)
        {
            int planeId = int.Parse(airplane_id.Text);
            DateTime flightDateTime = DateTime.Parse(departure_date.Text);
            string departureCity = departure_city.Text;
            string destinationCity = destination_city.Text;
            int duration = int.Parse(flight_duration.Text);
            int economy_price = int.Parse(eco_price.Text);
            int premium_economy_price = int.Parse(prem_eco_price.Text);
            int business_price = int.Parse(bus_price.Text);
            int first_class_price = int.Parse(fclass_price.Text);

            //Check if the flight already existed
            string flightExistCheckQuery = "SELECT COUNT(*) FROM Flight WHERE " +
                "plane_id = @plane_id AND " +
                "departure_date_time = @departure_date_time AND " +
                "departure_city = @departure_city AND " +
                "destination_city = @destination_city";

            int count = 0;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(flightExistCheckQuery, connection))
            {
                command.Parameters.AddWithValue("@plane_id", planeId); // Setup parameter
                command.Parameters.AddWithValue("@departure_date_time", flightDateTime);
                command.Parameters.AddWithValue("@departure_city", departureCity);
                command.Parameters.AddWithValue("@destination_city", destinationCity);

                Session["flightAdded"] = false;

                connection.Open();
                count = (int)command.ExecuteScalar(); // Store the total record fetched from database into the "count"
            }

            if (count > 0) // If flight already exists
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Flight already exist');", true);
            }
            else // If flight does not exist
            {
                string newUserInsertQuery = "INSERT INTO Flight (plane_id, departure_date_time, departure_city, destination_city, duration, economy_price, premium_economy_price, business_price, first_class_price) " +
                    "VALUES (@plane_id, @departure_date_time, @departure_city, " +
                    "@destination_city, @duration, @economy_price, @premium_economy_price, " +
                    "@business_price, @first_class_price)"; // Insert the new user

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(newUserInsertQuery, connection))
                {
                    command.Parameters.AddWithValue("@plane_id", planeId); // Setup parameter
                    command.Parameters.AddWithValue("@departure_date_time", flightDateTime);
                    command.Parameters.AddWithValue("@departure_city", departureCity);
                    command.Parameters.AddWithValue("@destination_city", destinationCity);
                    command.Parameters.AddWithValue("@duration", duration);
                    command.Parameters.AddWithValue("@economy_price", economy_price);
                    command.Parameters.AddWithValue("@premium_economy_price", premium_economy_price);
                    command.Parameters.AddWithValue("@business_price", business_price);
                    command.Parameters.AddWithValue("@first_class_price", first_class_price);

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                Session["flightAdded"] = true;
            }
        }
    }
}