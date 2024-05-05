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
    public partial class Online_Banking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkConfirm_Click(object sender, EventArgs e)
        {
            string cabinClassOption = Request.QueryString["cabinClassOption"];
            string passengerOption = Request.QueryString["passengerOption"];
            string tripTypeOption = Request.QueryString["tripTypeOption"];
            string flightID = Request.QueryString["flightID"];
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
            string loginID = txtLoginID.Text.Trim();
            string Password = txtPassword.Text.Trim();
            /* string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=TarFly_Database;Integrated Security=True";*/
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString;
            con = new SqlConnection(strCon);
            string query = "SELECT COUNT(*) FROM Customer WHERE name = @name AND password = @password";

            using (SqlCommand command = new SqlCommand(query, con))
            {
                command.Parameters.AddWithValue("@name", loginID);
                command.Parameters.AddWithValue("@password", Password);
                con.Open();
                int a = (int)command.ExecuteScalar();


                if (a > 0)
                {
                    lblError.Text = "";
                    string queryString = $"?cabinClassOption={cabinClassOption}&passengerOption={passengerOption}&tripTypeOption={tripTypeOption}&flightID={flightID}&planeID={planeID}&departureDateTime={departureDateTime}&departureDate={departureDate}&returnDate={returnDate}&departureCity={departureCity}&destinationCity={destinationCity}&departureDuration={departureDuration}&returnCabinClassOption={returnCabinClassOption}&returnFlightID={returnFlightID}&returnPlaneID={returnPlaneID}&returnDepartureDateTime={returnDepartureDateTime}&returnDuration={returnDuration}&baseFare={baseFare}&taxes={taxes}&addOn={addOn}&total={total}";
                    Response.Redirect("~/PaymentSuccess.aspx" + queryString);
                }
                else
                {
                    lblError.Text = "Unable to find this RECORD! Please Use Your Customer ID and Password!  ";

                }
            }
        }
    }
}