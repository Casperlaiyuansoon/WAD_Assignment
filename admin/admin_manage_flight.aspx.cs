using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.admin
{
    public partial class admin_manage_flight : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["flightAvailable"] = false;
            string getFlight = "SELECT * FROM Flight"; // Check if the user already exist

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getFlight, connection))
            {
                connection.Open();

                using (SqlDataAdapter sda = new SqlDataAdapter(command))
                {
                    DataTable flight = new DataTable();
                    sda.Fill(flight);

                    if (flight.Rows.Count > 0) // If at least one record was found
                    {
                        Session["flightAvailable"] = true;
                        flight_repeater.DataSource = flight;
                        flight_repeater.DataBind();
                    }
                    
                }

                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid Credential, please try again');", true);
            }
        }

        protected void add_flight_submit_Click(object sender, EventArgs e)
        {

        }
    }
}