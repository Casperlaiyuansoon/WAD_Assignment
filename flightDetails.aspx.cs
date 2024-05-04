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
                if (Request.QueryString["passegerOption"] != null)
                {
                    string selectedOption = Request.QueryString["passegerOption"];

                    txtPasseger.Text = selectedOption;
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
            string guestOption = Request.QueryString["passegerOption"];
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

    }
}