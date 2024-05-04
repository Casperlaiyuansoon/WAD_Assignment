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
            //From
            txtFlightFrom.Text = Request.QueryString["From"];
            //To
            txtFlightTo.Text = Request.QueryString["To"];
            //DepartureDate
            txtDepart.Text = Request.QueryString["DepartureDate"];
            //DetinationDate
            txtReturn.Text = Request.QueryString["DetinationDate"];


            //Cabin Class
            if (!IsPostBack)
            {
                if (Request.QueryString["cabinClassOption"] != null)
                {
                    string selectedOption = Request.QueryString["cabinClassOption"];
                    ListItem selectedItem = cabinClass.Items.FindByValue(selectedOption);

                    if (selectedItem != null)
                    {
                        selectedItem.Selected = true;
                    }
                }
            }

            //Trip Type
            if (!IsPostBack)
            {
                if (Request.QueryString["tripTypeOption"] != null)
                {
                    string selectedOption = Request.QueryString["tripTypeOption"];

                    txtTripType.Text = selectedOption;
                }
            }


            //Passeger Number
            if (!IsPostBack)
            {
                if (Request.QueryString["passegerOption"] != null)
                {
                    string selectedOption = Request.QueryString["passegerOption"];

                    txtPasseger.Text = selectedOption;
                }
            }
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