using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Payment_Sucess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lnkHomepage_Click(object sender, EventArgs e)
        {
            string cabinClassOption = Request.QueryString["cabinClassOption"];
            string passengerOption = Request.QueryString["passengerOption"];
            string tripTypeOption = Request.QueryString["tripTypeOption"];
            string Flight = Request.QueryString["flightID"];
            string planeID = Request.QueryString["planeID"];
            string departureDateTime = Request.QueryString["departureDateTime"];
            string departureDate = Request.QueryString["departureDate"];
            string returnDate = Request.QueryString["returnDate"];
            string departureCity = Request.QueryString["departureCity"];
            string destinationCity = Request.QueryString["destinationCity"];
            string departureDuration = Request.QueryString["departureDuration"];
            string returnCabinClassOption = Request.QueryString["returnCabinClassOption"];
            string returnFlightID = Request.QueryString["returnFlightID"];
            string returnPlaneID = Request.QueryString["returnPlaneID"];
            string returnDepartureDateTime = Request.QueryString["returnDepartureDateTime"];
            string returnDuration = Request.QueryString["returnDuration"];
            string baseFare = Request.QueryString["baseFare"];
            string taxes = Request.QueryString["taxes"];
            string addOn = Request.QueryString["addOn"];
            string total = Request.QueryString["total"];
            int flightID = int.Parse(Flight.Split(':')[1].Trim());

            string userid = Session["userId"] as String;
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string insertQuery = "INSERT INTO Booking (customer_id, departure_flight, return_flight, departure_cabin_class, return_cabin_class) " +
                                         "VALUES (@customer_id, @flightID, @flightID, @cabinClassOption, @returnCabinClassOption)";

                    using (SqlCommand insertCommand = new SqlCommand(insertQuery, connection))
                    {
                        insertCommand.Parameters.AddWithValue("@customer_id", userid);
                        insertCommand.Parameters.AddWithValue("@flightID", flightID);
                        insertCommand.Parameters.AddWithValue("@returnFlightID", flightID);
                        insertCommand.Parameters.AddWithValue("@cabinClassOption", cabinClassOption);
                        insertCommand.Parameters.AddWithValue("@returnCabinClassOption", returnCabinClassOption);

                        insertCommand.ExecuteNonQuery();
                    }

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }

            Response.Redirect("Homepage.aspx");
        }
    }
}