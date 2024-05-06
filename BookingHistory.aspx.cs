using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WAD_Assignment
{
    public partial class BookingHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.RowStyle.HorizontalAlign = HorizontalAlign.Center;
        }


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

    }
}