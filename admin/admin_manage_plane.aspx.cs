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
    public partial class admin_manage_plane : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["planeAvailable"] = false;
            string getFlight = "SELECT * FROM Plane"; // Check if the user already exist

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getFlight, connection))
            {
                connection.Open();

                using (SqlDataAdapter sda = new SqlDataAdapter(command))
                {
                    DataTable plane = new DataTable();
                    sda.Fill(plane);

                    if (plane.Rows.Count > 0) // If at least one record was found
                    {
                        Session["planeAvailable"] = true;
                        plane_repeater.DataSource = plane;
                        plane_repeater.DataBind();
                    }
                }
            }

            if (Request.QueryString["modifying"] != null)
            {
                int planeIdToModify = int.Parse(Request.QueryString["modifying"]);
                string getSpecificFlight = "SELECT * FROM Plane WHERE plane_id = @planeId";

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(getSpecificFlight, connection))
                {
                    command.Parameters.AddWithValue("@planeId", planeIdToModify); // Setup parameter

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string plane_id_edit = reader["plane_id"].ToString();
                            string eco_seat_qty_edit = reader["economy_seat_capacity"].ToString();
                            string prem_seat_qty_edit = reader["premium_economy_seat_capacity"].ToString();
                            string bus_seat_qty_edit = reader["business_seat_capacity"].ToString();
                            string fclass_seat_qty_edit = reader["first_class_seat_capacity"].ToString();

                            Response.Redirect("admin_manage_plane.aspx?pId=" + plane_id_edit +
                                "&ecoSeatQty=" + eco_seat_qty_edit + "&premSeatQty=" +
                                prem_seat_qty_edit + "&busSeatQty=" + bus_seat_qty_edit +
                                "&fclassSeatQty=" + fclass_seat_qty_edit);
                        }
                    }
                }
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["pId"] != null)
                {
                    plane_id_modify.Text = Request.QueryString["pId"].ToString();
                    eco_seat_qty_modify.Text = Request.QueryString["ecoSeatQty"].ToString();
                    prem_eco_seat_qty_modify.Text = Request.QueryString["premSeatQty"].ToString();
                    bus_seat_qty_modify.Text = Request.QueryString["busSeatQty"].ToString();
                    fclass_seat_qty_modify.Text = Request.QueryString["fclassSeatQty"].ToString();
                }
            }
        }





        // MODIFY BUTTON CLICKED
        protected void plane_modify_button_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Button btn = (Button)sender;
                string planeId = btn.CommandArgument;
                string url = "admin_manage_plane.aspx?modifying=" + planeId;
                Response.Redirect(url);
            }
        }
        // END MODIFY BUTTON CLICKED





        // DELETE ICON CLICKED
        protected void plane_remove_button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string planeId = btn.CommandArgument.ToString(); // get plane id from button clicked

            string deleteFlightQuery = "DELETE FROM Plane WHERE plane_id = @planeId";
            Session["planeDeleted"] = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(deleteFlightQuery, connection))
            {
                command.Parameters.AddWithValue("@planeId", planeId);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0) // If sucessful deleted
                {
                    Session["planeDeleted"] = true;
                    Response.Redirect("admin_manage_plane.aspx");
                }
                else // If delete unsuccessful
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something wrong, maybe the record already deleted');", true);
                }
            }
        }
        // END DELETE ICON CLICKED





        // UPDATE PLANE PROCESS
        protected void save_modify_btn_Click(object sender, EventArgs e)
        {
            string updatePlaneQuery = "UPDATE Plane SET economy_seat_capacity = @ecoSeatQty, " +
                "premium_economy_seat_capacity = @premEcoSeatQty, business_seat_capacity = @busSeatQty, " +
                "first_class_seat_capacity = @fclassSeatQty WHERE plane_id = @planeId";

            Session["planeModified"] = false;

            int ecoSeatQty = int.Parse(eco_seat_qty_modify.Text);
            int premEcoSeatQty = int.Parse(prem_eco_seat_qty_modify.Text);
            int busSeatQty = int.Parse(bus_seat_qty_modify.Text);
            int fclassSeatQty = int.Parse(fclass_seat_qty_modify.Text);
            int pId = int.Parse(plane_id_modify.Text);

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(updatePlaneQuery, connection))
            {
                
                command.Parameters.AddWithValue("@ecoSeatQty", ecoSeatQty);
                command.Parameters.AddWithValue("@premEcoSeatQty", premEcoSeatQty);
                command.Parameters.AddWithValue("@busSeatQty", busSeatQty);
                command.Parameters.AddWithValue("@fclassSeatQty", fclassSeatQty);
                command.Parameters.AddWithValue("@planeId", pId);

                connection.Open();
                int modifyRowsAffected = command.ExecuteNonQuery();

                if (modifyRowsAffected > 0) // Update successful
                {
                    Session["planeModified"] = true;
                    Response.Redirect("admin_manage_plane.aspx");
                }
                else // Update unsuccessful
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something wrong, try again later');", true);
                }
            }
        }
        // END UPDATE PLANE PROCESS





        // ADD NEW PLANE
        protected void add_plane_submit_Click(object sender, EventArgs e)
        {
            int economy_seat_qty = int.Parse(eco_seat_qty.Text);
            int premium_economy_seat_qty = int.Parse(pre_eco_seat_qty.Text);
            int business_seat_qty = int.Parse(bus_seat_qty.Text);
            int first_class_seat_qty = int.Parse(fclass_seat_qty.Text);

            // !!!!
            // NO NEED TO DO EXSITING CHECKING CUZ ALL THE PLANE CAN HAVE SAME SEAT CAPACITY
            // !!!!

            string newUserInsertQuery = "INSERT INTO Plane (economy_seat_capacity, premium_economy_seat_capacity, business_seat_capacity, first_class_seat_capacity) " +
                "VALUES (@ecoSeatQty, @premEcoSeatQty, @busSeatQty, @fclassSeatQty)"; // Insert the new plane

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(newUserInsertQuery, connection))
            {
                command.Parameters.AddWithValue("@ecoSeatQty", economy_seat_qty);
                command.Parameters.AddWithValue("@premEcoSeatQty", premium_economy_seat_qty);
                command.Parameters.AddWithValue("@busSeatQty", business_seat_qty);
                command.Parameters.AddWithValue("@fclassSeatQty", first_class_seat_qty);

                connection.Open();
                command.ExecuteNonQuery();
            }

            Session["planeAdded"] = true;
            Response.Redirect("admin_manage_plane.aspx");
        }
        // END ADD NEW PLANE




        // SEARCH PLANE
        protected void search_plane_btn_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(search_plane.Text))
            {

                int search = int.Parse(search_plane.Text);
                string searchPlaneQuery = "SELECT * FROM Plane WHERE plane_id = @planeId";
                Session["searchPlaneAvailable"] = false;

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(searchPlaneQuery, connection))
                {
                    command.Parameters.AddWithValue("@planeId", search); // Setup parameter

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows) // If record found
                    {
                        search_plane_repeater.DataSource = reader;
                        search_plane_repeater.DataBind();
                        Session["searchPlaneAvailable"] = true;
                    }
                    else // If no record found
                    {
                        search_plane_repeater.DataSource = null;
                        search_plane_repeater.DataBind();
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
        // EMD SEARCH PLANE
    }
}