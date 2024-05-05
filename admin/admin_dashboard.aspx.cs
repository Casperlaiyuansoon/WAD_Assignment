using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.admin
{
    public partial class admin_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // GET TOTAL USER
            string getTotalUserQuery = "SELECT COUNT(*) FROM Customer";
            int customerCount = 0;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getTotalUserQuery, connection))
            {
                connection.Open();
                customerCount = (int)command.ExecuteScalar(); // Store the total record fetched from database into the "count"
            }

            user_number.Text = customerCount.ToString();
            // END GET TOTAL USER





            // GET TOTAL ADMIN
            string getTotalAdminQuery = "SELECT COUNT(*) FROM Admin";
            int adminCount = 0;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getTotalAdminQuery, connection))
            {
                connection.Open();
                adminCount = (int)command.ExecuteScalar(); // Store the total record fetched from database into the "adminCount"
            }

            admin_number.Text = adminCount.ToString();
            // END GET TOTAL ADMIN





            // TOTAL BOOKING
            string getTotalBookingQuery = "SELECT COUNT(*) FROM Booking";
            int bookingCount = 0;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getTotalBookingQuery, connection))
            {
                connection.Open();
                bookingCount = (int)command.ExecuteScalar(); // Store the total record fetched from database into the "planeCount"
            }

            total_booking.Text = bookingCount.ToString();
            // END TOTAL BOOKING





            // TOTAL EARNING
            string getTotalPaymentQuery = "SELECT * FROM Payment";
            decimal totalEarning = 0;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getTotalPaymentQuery, connection))
            {
                connection.Open();

                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        totalEarning += decimal.Parse(reader["total_amount"].ToString());
                    }
                }

                string trimmedString = " " + totalEarning.ToString();
                total_earning.Text = trimmedString;
            }
            // END TOTAL EARNING





            // TOTAL PLANE
            string getTotalPlaneQuery = "SELECT COUNT(*) FROM Plane";
            int planeCount = 0;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getTotalPlaneQuery, connection))
            {
                connection.Open();
                planeCount = (int)command.ExecuteScalar(); // Store the total record fetched from database into the "planeCount"
            }

            total_plane.Text = planeCount.ToString();
            // END TOTAL PLANE





            // TOTAL IDLE PLANE
            List<int> planeOnDuty = new List<int>();
            string getTotalIdlePlaneQuery = "SELECT * FROM Flight";
            bool similarPlane = false;

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getTotalIdlePlaneQuery, connection))
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        int onDutyPlaneId = int.Parse(reader["plane_id"].ToString());

                        if (planeOnDuty.Count == 0) // first loop
                        {
                            planeOnDuty.Add(onDutyPlaneId);
                        }
                        else // second loop
                        {
                            for (int planeLoop = 0; planeLoop < planeOnDuty.Count; planeLoop++) // loop thru whole List to see if there are similar plane
                            {
                                if (planeOnDuty[planeLoop] == onDutyPlaneId)
                                {
                                    similarPlane = true;
                                }
                            }

                            if (!similarPlane) // if no similar plane inside the List, then add it inside
                            {
                                planeOnDuty.Add(onDutyPlaneId);
                            }
                        }
                    }
                }

                int idlePlane = planeCount - planeOnDuty.Count; // total plane - plane on duty = plane one idle
                total_idle_plane.Text = idlePlane.ToString();
            }
            // END TOTAL PLANE





            // GET MOST ORDERED FOOD
            List<int> foodIdArr = new List<int>(); // array to store food id
            List<int> foodQtyArr = new List<int>(); // array to store food quantity
            int trueLargestQtyFoodId = -1;

            string getFoodOrderedQuery = "SELECT * FROM Food_Order";

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["TarFly_Database"].ConnectionString))
            using (SqlCommand command = new SqlCommand(getFoodOrderedQuery, connection))
            {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    // departure food info
                    int depFoodId = int.Parse(reader["departure_food_id"].ToString());
                    int depFoodQty = int.Parse(reader["departure_food_quantity"].ToString());

                    int returnFoodId = 0;
                    int returnFoodQty = 0;

                    if (reader["return_food_id"] != DBNull.Value && reader["return_food_quantity"] != DBNull.Value)
                    {
                        // return food info
                        returnFoodId = int.Parse(reader["return_food_id"].ToString());
                        returnFoodQty = int.Parse(reader["return_food_quantity"].ToString());
                    }

                    bool similarDepFood = false;
                    bool similarReturnFood = false;
                    int getFoodIdIndex = -1;

                    // Check for similar departure food
                    for (int foodIdLoop = 0; foodIdLoop < foodIdArr.Count; foodIdLoop++)
                    {
                        if (foodIdArr[foodIdLoop] == depFoodId)
                        {
                            similarDepFood = true;
                            getFoodIdIndex = foodIdLoop;
                            break; // Exit loop once similar food found
                        }
                    }

                    // If departure food is similar
                    if (similarDepFood)
                    {
                        foodQtyArr[getFoodIdIndex] += depFoodQty; // Update quantity
                    }
                    else // If departure food is not similar
                    {
                        foodIdArr.Add(depFoodId); // Add new food ID
                        foodQtyArr.Add(depFoodQty); // Add corresponding quantity
                    }

                    // Check for similar return food
                    for (int foodIdLoop = 0; foodIdLoop < foodIdArr.Count; foodIdLoop++)
                    {
                        if (foodIdArr[foodIdLoop] == returnFoodId)
                        {
                            similarReturnFood = true;
                            getFoodIdIndex = foodIdLoop;
                            break; // Exit loop once similar food found
                        }
                    }

                    // If return food is similar
                    if (similarReturnFood)
                    {
                        foodQtyArr[getFoodIdIndex] += returnFoodQty; // Update quantity
                    }
                    else // If return food is not similar
                    {
                        foodIdArr.Add(returnFoodId); // Add new food ID
                        foodQtyArr.Add(returnFoodQty); // Add corresponding quantity
                    }
                }

                // Find the largest quantity
                int largestQty = -1;
                int largestQtyIndex = -1;

                for (int largestCount = 0; largestCount < foodQtyArr.Count; largestCount++)
                {
                    if (foodQtyArr[largestCount] > largestQty)
                    {
                        largestQty = foodQtyArr[largestCount];
                        largestQtyIndex = largestCount;
                    }
                }

                // Find the corresponding food ID
                for (int findIdIndex = 0; findIdIndex < foodIdArr.Count; findIdIndex++)
                {
                    if (findIdIndex == largestQtyIndex)
                    {
                        trueLargestQtyFoodId = foodIdArr[findIdIndex];
                        break; // Exit loop once found
                    }
                }
                connection.Close();

                // Get the name of the most ordered food
                string largestFoodName = "";
                string findLargestQtyFoodIdQuery = "SELECT food_name from Food WHERE food_id = @foodId";

                using (SqlCommand newCommand = new SqlCommand(findLargestQtyFoodIdQuery, connection))
                {
                    newCommand.Parameters.AddWithValue("@foodId", trueLargestQtyFoodId);

                    connection.Open();
                    SqlDataReader newReader = newCommand.ExecuteReader();
                    while (newReader.Read())
                    {
                        largestFoodName = newReader["food_name"].ToString();
                    }

                    total_food_order.Text = largestFoodName;
                }
            }
            // END GET MOST ORDERED FOOD
        }
    }
}