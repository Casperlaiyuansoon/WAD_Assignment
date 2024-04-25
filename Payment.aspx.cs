using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = "";
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if(RadioButtonList1 == null)
            {
                lblError.Text = "Please Select A Payment Type!";
                return;
            }

            if(RadioButtonList1.SelectedItem.Text == "💳Credit/Debit Card")
            {  
                if (!CheckBox1.Checked)
                {
                    lblError.Text = "Please Tick The CheckBox!";
                }
                else {
                Response.Redirect("~/CreditCard.aspx");
                }
            }

            else if (RadioButtonList1.SelectedItem.Text == "🏦Online Banking")
            {
                if (!CheckBox1.Checked)
                {
                    lblError.Text = "Please Tick The CheckBox!";
                }
                else
                {
                    Response.Redirect("~/Online Banking.aspx");
                }
            }
        }
    }
}