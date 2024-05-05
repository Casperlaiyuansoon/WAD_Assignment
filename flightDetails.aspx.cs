using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Tarfly.page
{
    public partial class flightDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //Cabin Class
            if (!IsPostBack)
            {

                //From
                txtFlightFrom.Text = Request.QueryString["From"];
                //To
                txtFlightTo.Text = Request.QueryString["To"];
                //DepartureDate
                txtDepart.Text = Request.QueryString["DepartureDate"];
                //DetinationDate
                if (Request.QueryString["tripTypeOption"] == "RoundTrip")
                    txtReturn.Text = Request.QueryString["DestinationDate"];

                if (Request.QueryString["cabinClassOption"] != null)
                {
                    string cabinClassOption = Request.QueryString["cabinClassOption"];
                    ListItem selectedItem = cabinClass.Items.FindByValue(cabinClassOption);

                    if (selectedItem != null)
                    {
                        selectedItem.Selected = true;
                    }
                }

                //Trip Type
                if (Request.QueryString["tripTypeOption"] != null)
                {
                    string selectedOption = Request.QueryString["tripTypeOption"];

                    txtTripType.Text = selectedOption;
                }

                //Passenger Number
                if (Request.QueryString["passengerOption"] != null)
                {
                    string selectedOption = Request.QueryString["passengerOption"];

                    txtPassenger.Text = selectedOption;
                }

            }
        }

        protected string GetSelectedCabinClassText(string cabinClassOption)
        {
            //string cabinClassOption = Request.QueryString["cabinClassOption"];

            // Map the selected value to the corresponding text
            switch (cabinClassOption)
            {
                case "1":
                    return "Economy";
                case "2":
                    return "Premium Economy";
                case "3":
                    return "Business";
                case "4":
                    return "First Class";
                default:
                    return "Unknown";
            }
        }

        protected string CalculatePrice(string cabinClassOption, decimal economyPrice, decimal premiumEconomyPrice, decimal businessPrice, decimal firstClassPrice)
        {
            string guestOption = Request.QueryString["passengerOption"];
            //string cabinClassOption = Request.QueryString["cabinClassOption"];
            int numberOfGuests = int.Parse(guestOption.Split()[0]); // Extract the number of guests from "X Passenger"
            decimal totalPrice;

            switch (cabinClassOption)
            {
                case "1": // Economy
                    totalPrice = numberOfGuests * economyPrice;
                    return totalPrice.ToString("0.00");
                case "2": // Premium Economy
                    totalPrice = numberOfGuests * premiumEconomyPrice;
                    return totalPrice.ToString("0.00");
                case "3": // Business Class
                    totalPrice = numberOfGuests * businessPrice;
                    return totalPrice.ToString("0.00");
                case "4": // First Class
                    totalPrice = numberOfGuests * firstClassPrice;
                    return totalPrice.ToString("0.00");
                default:
                    return "999.99";
            }
        }

        protected void cabinClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            rptFlight.DataBind();
        }


        protected string CalculateArrivalTime(DateTime departureDateTime, string duration)
        {
            // Convert duration to hours and minutes
            int hours = int.Parse(duration.Substring(0, 2)); //from index 0 and the length of 2
            int minutes = int.Parse(duration.Substring(2)); // start from index 2 until the end

            // Add duration to departureDateTime
            DateTime arrivalTime = departureDateTime.AddHours(hours).AddMinutes(minutes);

            // Return formatted arrival time
            return arrivalTime.ToString("hh:mm tt");
        }

        protected string FormatDuration(string duration)
        {
            // Convert duration to hours and minutes
            int hours = int.Parse(duration.Substring(0, 2));
            int minutes = int.Parse(duration.Substring(2));

            // Return formatted duration
            return $"{hours} hours {minutes} minutes";
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            string cabinClassOption = cabinClass.SelectedValue;
            string passengerOption = Request.QueryString["passengerOption"];
            int numberOfGuests = int.Parse(passengerOption.Split()[0]);
            string tripTypeOption = Request.QueryString["tripTypeOption"];

            Button btn = (Button)sender;
            string[] args = btn.CommandArgument.Split('|');

            string flightID = args[0];
            string planeID = args[1];
            string departureDateTime = args[2];
            string departureDate = Request.QueryString["DepartureDate"];
            string returnDate = Request.QueryString["DestinationDate"];
            string departureCity = args[3];
            string destinationCity = args[4];
            string departureDuration = args[5];
            decimal departurePrice;
            decimal economyPrice = Convert.ToDecimal(args[6]);
            decimal premiumEconomyPrice = Convert.ToDecimal(args[7]);
            decimal businessPrice = Convert.ToDecimal(args[8]);
            decimal firstClassPrice = Convert.ToDecimal(args[9]);

            switch (cabinClassOption)
            {
                case "1": // Economy
                    departurePrice = numberOfGuests * economyPrice;
                    departurePrice.ToString("0.00");
                    break;
                case "2": // Premium Economy
                    departurePrice = numberOfGuests * premiumEconomyPrice;
                    departurePrice.ToString("0.00");
                    break;
                case "3": // Business Class
                    departurePrice = numberOfGuests * businessPrice;
                    departurePrice.ToString("0.00");
                    break;
                case "4": // First Class
                    departurePrice = numberOfGuests * firstClassPrice;
                    departurePrice.ToString("0.00");
                    break;
                default:
                    departurePrice = 999.99m;
                    departurePrice.ToString("0.00");
                    break;
            }

            string queryString = $"cabinClassOption={cabinClassOption}&passengerOption={passengerOption}&tripTypeOption={tripTypeOption}&flightID={flightID}&planeID={planeID}&departureDateTime={departureDateTime}&departureDate={departureDate}&returnDate={returnDate}&departureCity={departureCity}&destinationCity={destinationCity}&departureDuration={departureDuration}&departurePrice={departurePrice}";

            switch (tripTypeOption)
            {
                case "OneWay":
                    Response.Redirect($"flightBooking.aspx?{queryString}");
                    break;
                case "RoundTrip":
                    Response.Redirect($"flightDetails2.aspx?{queryString}");
                    break;
            }


        }

    }
}