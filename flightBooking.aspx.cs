using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Tarfly.page
{
    public partial class flightCheckout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cabinClassOption = Request.QueryString["cabinClassOption"];
                string passengerOption = Request.QueryString["passengerOption"];
                int numberOfGuests = int.Parse(passengerOption.Split()[0]);
                string tripTypeOption = Request.QueryString["tripTypeOption"];
                string flightID = Request.QueryString["flightID"];
                string planeID = Request.QueryString["planeID"];
                string departureDateTime = Request.QueryString["departureDateTime"];
                string departureDate = Request.QueryString["departureDate"];
                string returnDate = Request.QueryString["returnDate"];
                string departureCity = Request.QueryString["departureCity"];
                string destinationCity = Request.QueryString["destinationCity"];
                string departureDuration = Request.QueryString["departureDuration"];
                string departurePrice = Request.QueryString["departurePrice"];
                string returnCabinClassOption = Request.QueryString["returnCabinClassOption"];
                string returnFlightID = Request.QueryString["returnFlightID"];
                string returnPlaneID = Request.QueryString["returnPlaneID"];
                string returnDepartureDateTime = Request.QueryString["returnDepartureDateTime"];
                string returnDuration = Request.QueryString["returnDuration"];
                string totalPrice = Request.QueryString["totalPrice"];

                // Display departure details
                DateTime date = DateTime.Parse(departureDate);
                string formattedDate = date.ToString("dd MMM yyyy");
                Label1.Text = formattedDate;
                Label2.Text = departureCity;
                Label3.Text = destinationCity;
                Label4.Text = "Flight ID : " + flightID;
                DateTime departureTime = DateTime.Parse(departureDateTime);
                int hours = int.Parse(departureDuration.Substring(0, 2));
                int minutes = int.Parse(departureDuration.Substring(2));
                DateTime arrivalTime = departureTime.AddHours(hours).AddMinutes(minutes);
                string formattedDepartureTime = departureTime.ToString("hh:mm tt");
                string formattedArrivalTime = arrivalTime.ToString("hh:mm tt");
                Label5.Text = $"{formattedDepartureTime} - {formattedArrivalTime}";
                Label6.Text = $"{hours} hours {minutes} minutes";

                // Display return details
                if (tripTypeOption == "RoundTrip")
                {
                    returnDiv.Visible = true;
                    DateTime ReturnDate = DateTime.Parse(returnDate);
                    string formattedReturnDate = ReturnDate.ToString("dd MMM yyyy");
                    Label10.Text = formattedReturnDate;
                    Label11.Text = destinationCity;
                    Label12.Text = departureCity;
                    Label13.Text = "Flight ID : " + returnFlightID;
                    DateTime returnDepartureTime = DateTime.Parse(returnDepartureDateTime);
                    int returnHours = int.Parse(returnDuration.Substring(0, 2));
                    int returnMinutes = int.Parse(returnDuration.Substring(2));
                    DateTime returnArrivalTime = returnDepartureTime.AddHours(returnHours).AddMinutes(returnMinutes);
                    string formattedReturnDepartureTime = returnDepartureTime.ToString("hh:mm tt");
                    string formattedReturnArrivalTime = returnArrivalTime.ToString("hh:mm tt");
                    Label14.Text = $"{formattedReturnDepartureTime} - {formattedReturnArrivalTime}";
                    Label15.Text = $"{returnHours} hours {returnMinutes} minutes";
                }

                DataTable dt = new DataTable();
                dt.Columns.Add("FirstName");
                dt.Columns.Add("LastName");
                dt.Columns.Add("DateOfBirth", typeof(DateTime));
                dt.Columns.Add("PassportID");
                dt.Columns.Add("PassportExpiryDate", typeof(DateTime));
                dt.Columns.Add("Gender");

                for (int i = 1; i < numberOfGuests; i++)
                {
                    DataRow dr = dt.NewRow();
                    // Set default values or fetch from your data source
                    dr["FirstName"] = "";
                    dr["LastName"] = "";
                    dr["DateOfBirth"] = DateTime.Now;
                    dr["PassportID"] = "";
                    dr["PassportExpiryDate"] = DateTime.Now;
                    dr["Gender"] = "male"; // Default gender

                    dt.Rows.Add(dr);
                }

                GuestRepeater.DataSource = dt;
                GuestRepeater.DataBind();

                Session["GuestData"] = dt;

                if (tripTypeOption == "RoundTrip")
                {
                    Label16.Text = "RM " + totalPrice;
                    Label17.Text = "RM " + (decimal.Parse(totalPrice) * 0.1m).ToString("0.00");
                    Label19.Text = "RM " + (decimal.Parse(totalPrice) * 1.1m).ToString("0.00");
                }
                else
                {
                    Label16.Text = "RM " + departurePrice;
                    Label17.Text = "RM " + (decimal.Parse(departurePrice) * 0.1m).ToString("0.00");
                    Label19.Text = "RM " + (decimal.Parse(departurePrice) * 1.1m).ToString("0.00");
                }

                Label18.Text = "RM 0.00";
                HiddenAddon.Value = Label18.Text;
                HiddenTotal.Value = Label19.Text;
            }

        }



        protected void continueCheckout_Click(object sender, EventArgs e)
        {
            string cabinClassOption = Request.QueryString["cabinClassOption"];
            string passengerOption = Request.QueryString["passengerOption"];
            string tripTypeOption = Request.QueryString["tripTypeOption"];
            string flightID = Label4.Text;
            string planeID = Request.QueryString["planeID"];
            string departureDateTime = Label5.Text;
            string departureDate = Label1.Text;
            string returnDate = Label10.Text;
            string departureCity = Label2.Text;
            string destinationCity = Label3.Text;
            string departureDuration = Label6.Text;
            string returnCabinClassOption = Request.QueryString["returnCabinClassOption"];
            string returnFlightID = Label13.Text;
            string returnPlaneID = Request.QueryString["returnPlaneID"];
            string returnDepartureDateTime = Label14.Text;
            string returnDuration = Label15.Text;
            string baseFare = Label16.Text;
            string taxes = Label17.Text;
            string addOn = "RM " + HiddenAddon.Value;
            string total = "RM " + HiddenTotal.Value;

            string queryString = $"?cabinClassOption={cabinClassOption}&passengerOption={passengerOption}&tripTypeOption={tripTypeOption}&flightID={flightID}&planeID={planeID}&departureDateTime={departureDateTime}&departureDate={departureDate}&returnDate={returnDate}&departureCity={departureCity}&destinationCity={destinationCity}&departureDuration={departureDuration}&returnCabinClassOption={returnCabinClassOption}&returnFlightID={returnFlightID}&returnPlaneID={returnPlaneID}&returnDepartureDateTime={returnDepartureDateTime}&returnDuration={returnDuration}&baseFare={baseFare}&taxes={taxes}&addOn={addOn}&total={total}";

            Response.Redirect("Payment.aspx" + queryString);
        }
    }
}