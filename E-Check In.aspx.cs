using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace Assignment
{
    public partial class E_ChechIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkSearch_Click(object sender, EventArgs e)
        {
            string fname = txtfName.Text.Trim();
            string lname = txtlName.Text.Trim();
            string flightNo = txtBookingNo.Text.Trim();
            /* string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=TarFly_Database;Integrated Security=True";*/
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString;
            con = new SqlConnection(strCon);
            string query = "SELECT COUNT(*) FROM Passenger WHERE first_name = @first_name AND surname = @surname AND booking_id = @booking_id";

            using (SqlCommand command = new SqlCommand(query, con))
            {
                command.Parameters.AddWithValue("@first_name", fname);
                command.Parameters.AddWithValue("@surname", lname);
                command.Parameters.AddWithValue("@booking_id", flightNo);
                con.Open();
                int a = (int)command.ExecuteScalar();
                


                if (a > 0)
                {   
                    lblError.Visible = false;
                    string redirectURL = String.Format("~/E-CheckIn VAL.aspx?txtFlightNo={0}&txtFName={1}&txtLName={2}",flightNo, fname,lname);
                    Response.Redirect(redirectURL);
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "Unable to find this RECORD!";
                    
                }
            }


        }
    }
}