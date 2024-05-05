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
            if (!Page.IsPostBack)
            {
                TimeSpan time = TimeSpan.FromSeconds(Convert.ToInt32(countdownLabel.Text) * 60);
                string str = time.ToString(@"hh\:mm\:ss");
                countdownLabel.Text = str;
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

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

        protected void CountdownTimer_Tick(object sender, EventArgs e)
        {
            TimeSpan result = TimeSpan.FromSeconds(TimeSpan.Parse(countdownLabel.Text).TotalSeconds - 1);
            /*result = result - TimeSpan.FromSeconds(1);*/
            string fromTimeString = result.ToString(@"hh\:mm\:ss");
            countdownLabel.Text = fromTimeString;

            if(result.TotalSeconds == 0) {
                Response.Redirect("~/Homepage.aspx");
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}