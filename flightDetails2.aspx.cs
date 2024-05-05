using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class flightDetails2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string cabinClassOption = Request.QueryString["cabinClassOption"];
            //string passengerOption = Request.QueryString["passegerOption"];
            //int numberOfGuests = int.Parse(passengerOption.Split()[0]);
            //string tripTypeOption = Request.QueryString["tripTypeOption"];

            //string flightID = Request.QueryString["flightID"];
            //string planeID = Request.QueryString["planeID"];
            //string departureDateTime = Request.QueryString["departureDateTime"];
            //string departureCity = Request.QueryString["departureCity"];
            //string destinationCity = Request.QueryString["destinationCity"];
            //string departureDuration = Request.QueryString["departureDuration"];
            //string departurePrice = Request.QueryString["departurePrice"];

            //Cabin Class
            if (!IsPostBack)
            {

                //From
                txtFlightFrom.Text = Request.QueryString["destinationCity"];
                //To
                txtFlightTo.Text = Request.QueryString["departureCity"];
                //DepartureDate
                txtDepart.Text = Request.QueryString["DepartureDate"];
                //DetinationDate
                txtReturn.Text = Request.QueryString["returnDate"];

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

                    txtPasseger.Text = selectedOption;
                }
            }
        }

        protected string DisplayDepartureTime()
        {
            string departureDateTimeString = Request.QueryString["departureDateTime"];
            DateTime departureDateTime = DateTime.Parse(departureDateTimeString);
            string formattedTime = departureDateTime.ToString("hh:mm tt");
            return formattedTime;
        }

        protected string DisplayArrivalTime() {
            string departureDateTimeString = Request.QueryString["departureDateTime"];
            DateTime departureDateTime = DateTime.Parse(departureDateTimeString);
            string departureDuration = Request.QueryString["departureDuration"];
            return CalculateArrivalTime(departureDateTime, departureDuration);
        }
        protected string DisplayDuration()
        {
            string departureDuration = Request.QueryString["departureDuration"];
            return FormatDuration(departureDuration);
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
            string cabinClassOption = Request.QueryString["cabinClassOption"];
            string passengerOption = Request.QueryString["passengerOption"];
            int numberOfGuests = int.Parse(passengerOption.Split()[0]);
            string tripTypeOption = Request.QueryString["tripTypeOption"];


            // departure flight
            string flightID = Request.QueryString["flightID"];
            string planeID = Request.QueryString["planeID"];
            string departureDateTime = Request.QueryString["departureDateTime"];
            string departureDate = Request.QueryString["departureDate"];
            string returnDate = Request.QueryString["returnDate"];
            string departureCity = Request.QueryString["departureCity"];
            string destinationCity = Request.QueryString["destinationCity"];
            string departureDuration = Request.QueryString["departureDuration"];
            string departurePrice = Request.QueryString["departurePrice"];

            Button btn = (Button)sender;
            string[] args = btn.CommandArgument.Split('|');

            // return flight
            string returnCabinClassOption = cabinClass.SelectedValue;
            string returnFlightID = args[0];
            string returnPlaneID = args[1];
            string returnDepartureDateTime = args[2];
            string returnDuration = args[3];
            decimal returnDeparturePrice;
            decimal returnEconomyPrice = Convert.ToDecimal(args[4]);
            decimal returnPremiumEconomyPrice = Convert.ToDecimal(args[5]);
            decimal returnBusinessPrice = Convert.ToDecimal(args[6]);
            decimal returnFirstClassPrice = Convert.ToDecimal(args[7]);
            decimal totalPrice;

            switch (cabinClassOption)
            {
                case "1": // Economy
                    returnDeparturePrice = numberOfGuests * returnEconomyPrice;
                    totalPrice = Convert.ToDecimal(departurePrice) + returnDeparturePrice;
                    totalPrice.ToString("0.00");
                    break;
                case "2": // Premium Economy
                    returnDeparturePrice = numberOfGuests * returnPremiumEconomyPrice;
                    totalPrice = Convert.ToDecimal(departurePrice) + returnDeparturePrice;
                    totalPrice.ToString("0.00");
                    break;
                case "3": // Business Class
                    returnDeparturePrice = numberOfGuests * returnBusinessPrice;
                    totalPrice = Convert.ToDecimal(departurePrice) + returnDeparturePrice;
                    totalPrice.ToString("0.00");
                    break;
                case "4": // First Class
                    returnDeparturePrice = numberOfGuests * returnFirstClassPrice;
                    totalPrice = Convert.ToDecimal(departurePrice) + returnDeparturePrice;
                    totalPrice.ToString("0.00");
                    break;
                default:
                    returnDeparturePrice = 999.99m;
                    totalPrice = Convert.ToDecimal(departurePrice) + returnDeparturePrice;
                    totalPrice.ToString("0.00");
                    break;
            }

            string queryString = $"cabinClassOption={cabinClassOption}&passengerOption={passengerOption}&tripTypeOption={tripTypeOption}&flightID={flightID}&planeID={planeID}&departureDateTime={departureDateTime}&departureDate={departureDate}&returnDate={returnDate}&departureCity={departureCity}&destinationCity={destinationCity}&departureDuration={departureDuration}&returnCabinClassOption={returnCabinClassOption}&returnFlightID={returnFlightID}&returnPlaneID={returnPlaneID}&returnDepartureDateTime={returnDepartureDateTime}&returnDuration={returnDuration}&totalPrice={totalPrice}";

            
            Response.Redirect($"flightBooking.aspx?{queryString}");

        }
    }
}