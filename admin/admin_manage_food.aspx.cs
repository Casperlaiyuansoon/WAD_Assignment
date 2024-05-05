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
    public partial class admin_manage_food : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["adminId"] == null)
            {
                Session["adminAuth"] = true;
                Response.Redirect("admin_login.aspx");
            }

            Session["foodAvailable"] = false;
            string getFlight = "SELECT * FROM Food";

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getFlight, connection))
            {
                connection.Open();

                using (SqlDataAdapter sda = new SqlDataAdapter(command))
                {
                    DataTable food = new DataTable();
                    sda.Fill(food);

                    if (food.Rows.Count > 0) // If at least one record was found
                    {
                        Session["foodAvailable"] = true;
                        food_repeater.DataSource = food;
                        food_repeater.DataBind();
                    }
                }
            }

            if (Request.QueryString["modifying"] != null)
            {
                int foodIdToModify = int.Parse(Request.QueryString["modifying"]);
                string getSpecificFood = "SELECT * FROM Food WHERE food_id = @foodId";

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(getSpecificFood, connection))
                {
                    command.Parameters.AddWithValue("@foodId", foodIdToModify); // Setup parameter

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            string food_id_edit = reader["food_id"].ToString();
                            string food_name_edit = reader["food_name"].ToString();
                            string food_price_edit = reader["price"].ToString();

                            Response.Redirect("admin_manage_food.aspx?fId=" + food_id_edit +
                                "&fName=" + food_name_edit + "&fPrice=" + food_price_edit);
                        }
                    }
                }
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["fId"] != null)
                {
                    food_id_modify.Text = Request.QueryString["fId"].ToString();
                    food_name_modify.Text = Request.QueryString["fName"].ToString();
                    food_price_modify.Text = Request.QueryString["fPrice"].ToString();
                }
            }
        }





        protected void add_food_submit_Click(object sender, EventArgs e)
        {
            string foodName = food_name.Text;
            string foodPrice = food_price.Text;

            string foodExistCheckQuery = "SELECT COUNT(*) FROM Food WHERE food_name = @foodName";
            int count = 0;
            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(foodExistCheckQuery, connection))
            {
                command.Parameters.AddWithValue("@foodName", foodName); // Setup parameter

                Session["foodAdded"] = false;

                connection.Open();
                count = (int)command.ExecuteScalar(); // Store the total record fetched from database into the "count"
            }

            if (count > 0) // If flight already exists
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Food already exist');", true);
            }
            else // If flight does not exist
            {
                string newUserInsertQuery = "INSERT INTO Food (food_name, price) " +
                    "VALUES (@foodname, @foodprice)"; // Insert the new user

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(newUserInsertQuery, connection))
                {
                    command.Parameters.AddWithValue("@foodname", foodName); // Setup parameter
                    command.Parameters.AddWithValue("@foodprice", foodPrice);

                    connection.Open();
                    command.ExecuteNonQuery();
                }

                Session["foodAdded"] = true;
                Response.Redirect("admin_manage_food.aspx");
            }
        }





        // DELETE ICON CLICKED
        protected void food_remove_button_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string foodId = btn.CommandArgument.ToString(); // get flight id from button clicked

            string deleteFoodQuery = "DELETE FROM Food WHERE food_id = @foodId";
            Session["foodDeleted"] = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(deleteFoodQuery, connection))
            {
                command.Parameters.AddWithValue("@foodId", foodId);

                connection.Open();
                int rowsAffected = command.ExecuteNonQuery();

                if (rowsAffected > 0) // If sucessful deleted
                {
                    Session["foodDeleted"] = true;
                    Response.Redirect("admin_manage_food.aspx");
                }
                else // If delete unsuccessful
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something wrong, maybe the record already deleted');", true);
                }
            }
        }
        // END DELETE ICON CLICKED





        protected void save_modify_btn_Click(object sender, EventArgs e)
        {
            string updateFoodQuery = "UPDATE Food SET food_name = @foodName, price = @foodPrice WHERE food_id = @foodId";

            Session["foodModified"] = false;

            string fName = food_name_modify.Text;
            string fPrice = food_price_modify.Text;
            int fId = int.Parse(food_id_modify.Text);

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(updateFoodQuery, connection))
            {
                command.Parameters.AddWithValue("@foodName", fName);
                command.Parameters.AddWithValue("@foodPrice", fPrice);
                command.Parameters.AddWithValue("@foodId", fId);

                connection.Open();
                int modifyRowsAffected = command.ExecuteNonQuery();

                if (modifyRowsAffected > 0) // Update successful
                {
                    Session["foodModified"] = true;
                    Response.Redirect("admin_manage_food.aspx");
                }
                else // Update unsuccessful
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Something wrong, try again later');", true);
                }
            }
        }





        protected void food_modify_button_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Button btn = (Button)sender;
                string foodId = btn.CommandArgument;
                string url = "admin_manage_food.aspx?modifying=" + foodId;
                Response.Redirect(url);
            }
        }





        protected void search_food_btn_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(search_food.Text))
            {

                string search = search_food.Text;
                string searchFoodQuery = "SELECT * FROM Food WHERE food_name LIKE '%' + @foodName + '%'";
                Session["searchFoodAvailable"] = false;

                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
                using (SqlCommand command = new SqlCommand(searchFoodQuery, connection))
                {
                    command.Parameters.AddWithValue("@foodName", search); // Setup parameter

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows) // If record found
                    {
                        search_food_repeater.DataSource = reader;
                        search_food_repeater.DataBind();
                        Session["searchFoodAvailable"] = true;
                    }
                    else // If no record found
                    {
                        search_food_repeater.DataSource = null;
                        search_food_repeater.DataBind();
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
    }
}