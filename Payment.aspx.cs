using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WAD_Assignment.admin;

namespace Assignment
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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


            lblError.Text = "";
            if (!Page.IsPostBack)
            {
                TimeSpan time = TimeSpan.FromSeconds(Convert.ToInt32(countdownLabel.Text) * 60);
                string str = time.ToString(@"hh\:mm\:ss");
                countdownLabel.Text = str;
            }

            if (!IsPostBack)
            {
                lblDepart.Text = departureCity + " - " + destinationCity;
                lblDepartDate.Text = departureDate + " | " + departureDateTime + " | " + flightID;

                if (tripTypeOption == "RoundTrip")
                {
                    lblArrive.Text = destinationCity + " - " + departureCity;
                    lblArriveDate.Text = returnDate+ " | " + returnDepartureDateTime + " | " + returnFlightID;
                }

                Label16.Text = baseFare;
                Label17.Text = taxes;
                Label18.Text = addOn;
                Label19.Text =  total;
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
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
            if (RadioButtonList1.SelectedItem.Text == "💳Credit/Debit Card")
            {  
                if (!CheckBox1.Checked)
                {
                    lblError.Text = "Please Tick The CheckBox!";
                }
                else {
                    string queryString = $"?cabinClassOption={cabinClassOption}&passengerOption={passengerOption}&tripTypeOption={tripTypeOption}&flightID={flightID}&planeID={planeID}&departureDateTime={departureDateTime}&departureDate={departureDate}&returnDate={returnDate}&departureCity={departureCity}&destinationCity={destinationCity}&departureDuration={departureDuration}&returnCabinClassOption={returnCabinClassOption}&returnFlightID={returnFlightID}&returnPlaneID={returnPlaneID}&returnDepartureDateTime={returnDepartureDateTime}&returnDuration={returnDuration}&baseFare={baseFare}&taxes={taxes}&addOn={addOn}&total={total}";
                    Response.Redirect("~/CreditCard.aspx" + queryString);
                }
            }

            else if (RadioButtonList1.SelectedItem.Text == "🏦Online Banking")
            {
                if (!CheckBox1.Checked)
                {
                    lblError.Text = "Please Tick The CheckBox!";
                }
                else
                {
                    string queryString = $"?cabinClassOption={cabinClassOption}&passengerOption={passengerOption}&tripTypeOption={tripTypeOption}&flightID={flightID}&planeID={planeID}&departureDateTime={departureDateTime}&departureDate={departureDate}&returnDate={returnDate}&departureCity={departureCity}&destinationCity={destinationCity}&departureDuration={departureDuration}&returnCabinClassOption={returnCabinClassOption}&returnFlightID={returnFlightID}&returnPlaneID={returnPlaneID}&returnDepartureDateTime={returnDepartureDateTime}&returnDuration={returnDuration}&baseFare={baseFare}&taxes={taxes}&addOn={addOn}&total={total}";
                    Response.Redirect("~/Online Banking.aspx" + queryString);
                }
            }
        }

        protected void CountdownTimer_Tick(object sender, EventArgs e)
        {
            TimeSpan result = TimeSpan.FromSeconds(TimeSpan.Parse(countdownLabel.Text).TotalSeconds - 1);
            /*result = result - TimeSpan.FromSeconds(1);*/
            string fromTimeString = result.ToString(@"hh\:mm\:ss");
            countdownLabel.Text = fromTimeString;

            if(result.TotalSeconds == 0) {
                Response.Redirect("~/flightBooking.aspx");
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}