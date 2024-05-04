using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Online_Banking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkConfirm_Click(object sender, EventArgs e)
        {
            string loginID = txtLoginID.Text.Trim();
            string Password = txtPassword.Text.Trim();
            /* string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;Initial Catalog=TarFly_Database;Integrated Security=True";*/
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString;
            con = new SqlConnection(strCon);
            string query = "SELECT COUNT(*) FROM Customer WHERE name = @name AND password = @password";

            using (SqlCommand command = new SqlCommand(query, con))
            {
                command.Parameters.AddWithValue("@name", loginID);
                command.Parameters.AddWithValue("@password", Password);
                con.Open();
                int a = (int)command.ExecuteScalar();


                if (a > 0)
                {
                    lblError.Text = "";
                    Response.Redirect("~/PaymentSuccess.aspx");
                }
                else
                {
                    lblError.Text = "Unable to find this RECORD! Please Use Your Customer ID and Password!  ";

                }
            }
        }
    }
}