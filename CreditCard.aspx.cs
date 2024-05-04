using System;
using System.Collections.Generic;
using System.Diagnostics.SymbolStore;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreditCardSubmit_Click(object sender, EventArgs e)
        {
            String selectedOption = hdnSelectedOption.Value;
            String SelectedMonthOption = hdnSelectedOption1.Value;
            int selectedYear = int.Parse(selectedOption);
            int selectedMonth = int.Parse(SelectedMonthOption);

            if (selectedYear == DateTime.Now.Year)
            {
                if(selectedMonth < DateTime.Now.Month)
                {
                    lblError.Text = "Error Month Selected! Please Select The Correct Month!";
                }
                else
                {
                    Response.Redirect("~/PaymentSuccess.aspx");
                    lblError.Text = "";
                }
            }
            else
            {
                Response.Redirect("~/PaymentSuccess.aspx");
                lblError.Text = "";
            }
/*            int selectedOption = Convert.ToInt32(hdnSelectedOption.Value);
            if (selectedOption < DateTime.Now.Year)
            {
                Label1.Text = "Please Select The Correct Year!";
            }*/

            /*Response.Redirect("~/PaymentSuccess.aspx");*/
        }
    }
}