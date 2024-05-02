using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class E_CheckIn_VAL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtFlightNo.Text = Request.QueryString["txtFlightNo"];
            txtFName.Text = Request.QueryString["txtFName"];
            txtLName.Text = Request.QueryString["txtLName"];


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            if (DropDownList1.SelectedItem.Text == "Identification No.") {
                RegularExpressionValidator MyValidator = new RegularExpressionValidator();

                MyValidator.ID = "MyValidator1";
                MyValidator.ControlToValidate = "txtIdentification";
                MyValidator.ValidationExpression = @"\d{6}-\d{2}-\d{4}";
                MyValidator.ErrorMessage = "Invalid IC Number format!";
                form1.Controls.Add(MyValidator);
                txtIdentification.Enabled = true;
                txtIdentification.Text = null;
                txtIdentification.Attributes.Add("placeholder", "xxxxxx-xx-xxxx");
                txtIdentification.Attributes.Add("maxlength", "14");
  

            }
            else if(DropDownList1.SelectedItem.Text == "Passport No.")
            {
                txtIdentification.Enabled = true;
                txtIdentification.Text = null;
                txtIdentification.Attributes.Add("placeholder", "xxxxxxxx");
                txtIdentification.Attributes.Add("maxlength", "8");
                
            }
            else
            {
                txtIdentification.Enabled = false;
                txtIdentification.Text = null;
                txtIdentification.Attributes.Add("placeholder", "");
            }


        }

        protected void btncheckin_Click(object sender, EventArgs e)
        {
                if (txtIdentification.Text == "")
            {
                Response.Redirect("~/E-Check In.aspx");
            }
        }
    }
}