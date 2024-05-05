using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class BookingHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
<<<<<<< HEAD

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString;

            con = new SqlConnection(strCon);
            con.Open();

            string strRetrieve = "Select * from Flight";

            SqlCommand cmdRetrieve;
            cmdRetrieve = new SqlCommand(strRetrieve, con);


            //execute reader
            SqlDataReader drFlight;
            drFlight = cmdRetrieve.ExecuteReader();

            string strMsg = "";
            if (drFlight.HasRows)
            {
                while (drFlight.Read())
                {strMsg += drFlight["Flight"] + "<br/>";

                }
            }
            else
            {
                GridView1.EmptyDataText = "No data found";
            }

        }
=======
>>>>>>> fa69ca7183cc471032e37b450e70ae2134a73994
    }
}