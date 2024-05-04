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