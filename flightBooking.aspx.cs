using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tarfly.page
{
    public partial class flightCheckout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void continueCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
    }
}