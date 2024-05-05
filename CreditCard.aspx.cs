using System;
using System.Collections.Generic;
using System.Diagnostics.SymbolStore;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreditCardSubmit_Click(object sender, EventArgs e)
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
            String selectedOption = hdnSelectedOption.Value;
            String SelectedMonthOption = hdnSelectedOption1.Value;
            int selectedYear = int.Parse(selectedOption);
            int selectedMonth = int.Parse(SelectedMonthOption);
            string queryString = $"?cabinClassOption={cabinClassOption}&passengerOption={passengerOption}&tripTypeOption={tripTypeOption}&flightID={flightID}&planeID={planeID}&departureDateTime={departureDateTime}&departureDate={departureDate}&returnDate={returnDate}&departureCity={departureCity}&destinationCity={destinationCity}&departureDuration={departureDuration}&returnCabinClassOption={returnCabinClassOption}&returnFlightID={returnFlightID}&returnPlaneID={returnPlaneID}&returnDepartureDateTime={returnDepartureDateTime}&returnDuration={returnDuration}&baseFare={baseFare}&taxes={taxes}&addOn={addOn}&total={total}";
            if (selectedYear == DateTime.Now.Year)
            {
                if(selectedMonth < DateTime.Now.Month)
                {
                    lblError.Text = "Error Month Selected! Please Select The Correct Month!";
                }
                else
                {
                    Response.Redirect("~/PaymentSuccess.aspx" + queryString);
                    lblError.Text = "";
                }
            }
            else
            {
                Response.Redirect("~/PaymentSuccess.aspx" + queryString);
                lblError.Text = "";
            }
/*            int selectedOption = Convert.ToInt32(hdnSelectedOption.Value);
            if (selectedOption < DateTime.Now.Year)
            {
                Label1.Text = "Please Select The Correct Year!";
            }*/

            /*Response.Redirect("~/PaymentSuccess.aspx");*/
        }
    }
}