using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {

            string cabinClassOption = cabinClass.SelectedValue;
            string tripTypeOption = tripType.SelectedValue;
            string from = txtLocation.Text;
            string to = txtDestination.Text;
            string departureDate = txtstartdate.Text;
            string detinationDate = txtReturnDate.Text;

            
            string queryString = $"cabinClassOption={cabinClassOption}&tripTypeOption={tripTypeOption}&From={from}&To={to}&DepartureDate={departureDate}&DetinationDate={detinationDate}";


            Response.Redirect($"flightDetails.aspx?{queryString}");
        }  

    }
}