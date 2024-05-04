using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
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
            }

            if (Request.QueryString["modifying"] != null)
            {
                int flightIdToModify = int.Parse(Request.QueryString["modifying"]);
                //Response.Redirect("admin_login.aspx");
                string getSpecificFlight = "SELECT * FROM Flight WHERE flight_id = @flightId";

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(getSpecificFlight, connection))
                {
                    command.Parameters.AddWithValue("@flightId", flightIdToModify); // Setup parameter

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string flight_id_edit = reader["flight_id"].ToString();
                            string plane_id_edit = reader["plane_id"].ToString();
                            string departure_time_edit = reader["departure_date_time"].ToString();
                            string departure_city_edit = reader["departure_city"].ToString();
                            string destination_city_edit = reader["destination_city"].ToString();
                            string duration_edit = reader["duration"].ToString();
                            string eco_price_edit = reader["economy_price"].ToString();
                            string prem_eco_price_edit = reader["premium_economy_price"].ToString();
                            string business_price_edit = reader["business_price"].ToString();
                            string fclass_price_edit = reader["first_class_price"].ToString();

                            Response.Redirect("admin_manage_flight.aspx?fId=" + flight_id_edit +
                                "&pId=" + plane_id_edit + "&dTime=" + departure_time_edit +
                                "&depCity=" + departure_city_edit + "&desCity=" + destination_city_edit +
                                "&duration=" + duration_edit + "&ecoP=" + eco_price_edit + 
                                "&premEcoP=" + prem_eco_price_edit + "&busP=" + business_price_edit +
                                "&fclassP=" + fclass_price_edit);
                        }
                    }
                }
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["fId"] != null)
                {
                    flight_id_modify.Text = Request.QueryString["fId"].ToString();
                    plane_id_modify.Text = Request.QueryString["pId"].ToString();
                    departure_time_modify.Text = Request.QueryString["dTime"].ToString();
                    departure_city_modify.Text = Request.QueryString["depCity"].ToString();
                    destination_city_modify.Text = Request.QueryString["desCity"].ToString();
                    duration_modify.Text = Request.QueryString["duration"].ToString();
                    economy_price_modify.Text = Request.QueryString["ecoP"].ToString();
                    premium_economy_price_modify.Text = Request.QueryString["premEcoP"].ToString();
                    business_price_modify.Text = Request.QueryString["busP"].ToString();
                    fclass_price_modify.Text = Request.QueryString["fclassP"].ToString();
                }
            }
        }




        // ADD NEW FLIGHT
        protected void add_flight_submit_Click(object sender, EventArgs e)
        {
            int planeId = int.Parse(airplane_id.Text);

            DateTime flightDateTime = DateTime.Parse(departure_date.Text);

            string departureCity = departure_city.Text;
            string destinationCity = destination_city.Text;
            string duration = flight_duration.Text;
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
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + flightDateTime + "');", true);

                Session["flightAdded"] = true;
                Response.Redirect("admin_manage_flight.aspx");
            }
        }
        // END ADD NEW FLIGHT





        // DELETE ICON CLICKED
        protected void flight_remove_button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string flightId = btn.CommandArgument.ToString(); // get flight id from button clicked

            string deleteFlightQuery = "DELETE FROM Flight WHERE flight_id = @flightId";
            Session["flightDeleted"] = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(deleteFlightQuery, connection))
            {
                command.Parameters.AddWithValue("@flightId", flightId);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0) // If sucessful deleted
                {
                    Session["flightDeleted"] = true;
                    Response.Redirect("admin_manage_flight.aspx");
                }
                else // If delete unsuccessful
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something wrong, maybe the record already deleted');", true);
                }
            }
        }
        // END DELETE ICON CLICKED
        




        // UPDATE FLIGHT PROCESS
        protected void save_modify_btn_Click(object sender, EventArgs e)
        {
            string updateFlightQuery = "UPDATE Flight SET plane_id = @planeId, departure_date_time = @departureDateTime, departure_city = @departureCity, destination_city = @destinationCity, duration = @duration, economy_price = @economyPrice, premium_economy_price = @premiumEconomyPrice, business_price = @businessPrice, first_class_price = @firstClassPrice WHERE flight_id = @flightId";

            Session["flightModified"] = false;

            int pId = int.Parse(plane_id_modify.Text);
            DateTime ddt = DateTime.Parse(departure_time_modify.Text);
            string depCity = departure_city_modify.Text;
            string desCity = destination_city_modify.Text;
            string duration = duration_modify.Text;
            int ecoPrice = int.Parse(economy_price_modify.Text);
            int premEcoPrice = int.Parse(premium_economy_price_modify.Text);
            int busPrice = int.Parse(business_price_modify.Text);
            int fclassPrice = int.Parse(fclass_price_modify.Text);
            int fId = int.Parse(flight_id_modify.Text);

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(updateFlightQuery, connection))
            {
                command.Parameters.AddWithValue("@planeId", pId);
                command.Parameters.AddWithValue("@departureDateTime", ddt);
                command.Parameters.AddWithValue("@departureCity", depCity);
                command.Parameters.AddWithValue("@destinationCity", desCity);
                command.Parameters.AddWithValue("@duration", duration);
                command.Parameters.AddWithValue("@economyPrice", ecoPrice);
                command.Parameters.AddWithValue("@premiumEconomyPrice", premEcoPrice);
                command.Parameters.AddWithValue("@businessPrice", busPrice);
                command.Parameters.AddWithValue("@firstClassPrice", fclassPrice);
                command.Parameters.AddWithValue("@flightId", fId);

                connection.Open();
                int modifyRowsAffected = command.ExecuteNonQuery();

                if (modifyRowsAffected > 0) // Update successful
                {
                    Session["flightModified"] = true;
                    Response.Redirect("admin_manage_flight.aspx");
                }
                else // Update unsuccessful
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something wrong, try again later');", true);
                }
            }
        }
        // END UPDATE FLIGHT PROCESS





        // MODIFY BUTTON CLICKED
        protected void flight_modify_button_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Button btn = (Button)sender;
                string flightId = btn.CommandArgument;
                string url = "admin_manage_flight.aspx?modifying=" + flightId;
                Response.Redirect(url);
            }
        }
        // END MODIFY BUTTON CLICKED





        // SEARCH BUTTON CLICKED
        protected void search_flight_btn_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(search_flight.Text))
            {

                int search = int.Parse(search_flight.Text);
                string searchFlightQuery = "SELECT * FROM Flight WHERE flight_id = @flightId";
                Session["searchFlightAvailable"] = false;

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(searchFlightQuery, connection))
                {
                    command.Parameters.AddWithValue("@flightId", search); // Setup parameter

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows) // If record found
                    {
                        search_flight_repeater.DataSource = reader;
                        search_flight_repeater.DataBind();
                        Session["searchFlightAvailable"] = true;
                    }
                    else // If no record found
                    {
                        search_flight_repeater.DataSource = null;
                        search_flight_repeater.DataBind();
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
        // END SEARCH BUTTON CLICKED
    }
}