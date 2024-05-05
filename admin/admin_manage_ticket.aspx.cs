using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.admin
{
    public partial class admin_manage_ticket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["adminId"] == null)
            {
                Session["adminAuth"] = true;
                Response.Redirect("admin_login.aspx");
            }

            Session["ticketAvailable"] = false;
            string getTicket = "SELECT * FROM Booking";

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getTicket, connection))
            {
                connection.Open();

                using (SqlDataAdapter sda = new SqlDataAdapter(command))
                {
                    DataTable ticket = new DataTable();
                    sda.Fill(ticket);

                    if (ticket.Rows.Count > 0) // If at least one record was found
                    {
                        Session["ticketAvailable"] = true;
                        ticket_repeater.DataSource = ticket;
                        ticket_repeater.DataBind();
                    }
                }
            }
        }




        protected void search_ticket_btn_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(search_ticket.Text))
            {

                int search = int.Parse(search_ticket.Text);
                string searchTicketQuery = "SELECT * FROM Booking WHERE booking_id = @bookingId";
                Session["searchTicketAvailable"] = false;

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(searchTicketQuery, connection))
                {
                    command.Parameters.AddWithValue("@bookingId", search); // Setup parameter

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows) // If record found
                    {
                        search_ticket_repeater.DataSource = reader;
                        search_ticket_repeater.DataBind();
                        Session["searchTicketAvailable"] = true;
                    }
                    else // If no record found
                    {
                        search_ticket_repeater.DataSource = null;
                        search_ticket_repeater.DataBind();
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('No Record Found');", true);
                    }
                    reader.Close();
                    connection.Close();
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Enter something to search');", true);
            }
        }



        protected void ticket_remove_button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string ticketId = btn.CommandArgument.ToString(); // get flight id from button clicked

            string deleteTicketQuery = "DELETE FROM Booking WHERE booking_id = @bookingId";
            Session["ticketDeleted"] = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(deleteTicketQuery, connection))
            {
                command.Parameters.AddWithValue("@bookingId", ticketId);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0) // If sucessful deleted
                {
                    Session["ticketDeleted"] = true;
                    Response.Redirect("admin_manage_ticket.aspx");
                }
                else // If delete unsuccessful
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something wrong, maybe the record already deleted');", true);
                }
            }
        }
    }
}