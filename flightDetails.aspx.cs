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
            txtFlightFrom.Text = Request.QueryString["From"];
            txtFlightTo.Text = Request.QueryString["To"];
            txtDepart.Text = Request.QueryString["DepartureDate"];
            txtReturn.Text = Request.QueryString["DetinationDate"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {

        }
    }
}