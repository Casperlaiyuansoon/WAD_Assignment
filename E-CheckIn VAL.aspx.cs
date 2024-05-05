using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

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
/*                RegularExpressionValidator MyValidator = new RegularExpressionValidator()
                MyValidator.ID = "MyValidator1";
                MyValidator.ControlToValidate = "txtIdentification";
                MyValidator.ValidationExpression = @"\d{6}-\d{2}-\d{4}";
                MyValidator.ErrorMessage = "Invalid IC Number format!";
                form1.Controls.Add(MyValidator);*/
                txtIdentification.Enabled = true;
                txtIdentification.Text = null;
                txtIdentification.Attributes.Add("placeholder", "xxxxxx-xx-xxxx");
                txtIdentification.Attributes.Add("maxlength", "14");
                ReValidator.ValidationExpression = @"\d{6}-\d{2}-\d{4}";
                ReValidator.ErrorMessage = "Invalid IC Format! [e.g 111111-12-1111]";



            }
            else if(DropDownList1.SelectedItem.Text == "Passport No.")
            {
                txtIdentification.Enabled = true;
                txtIdentification.Text = null;
                txtIdentification.Attributes.Add("placeholder", "xxxxxxxxx");
                txtIdentification.Attributes.Add("maxlength", "9");
                ReValidator.ValidationExpression = @"[A-Z]{1}[0-9]{7,8}$";
                ReValidator.ErrorMessage = "Invalid Passport Format! [e.g A12345678]";

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
            if (txtIdentification.Text == null)
            {
                string redirectURL = String.Format("~/E-CheckIn VAL.aspx?txtFlightNo={0}&txtFName={1}&txtLName={2}", txtFlightNo.Text, txtFName.Text, txtLName.Text);
                Response.Redirect(redirectURL);
            }
            if(!fileIdentification.HasFile)
            {
/*                string redirectURL = String.Format("~/E-CheckIn VAL.aspx?txtFlightNo={0}&txtFName={1}&txtLName={2}", txtFlightNo.Text, txtFName.Text, txtLName.Text);
                Response.Redirect(redirectURL);*/
                lblErrorID.Text = "Please Upload Your IC/Passport Photo!";
            }
            if (!filePhoto.HasFile)
            {
/*                string redirectURL = String.Format("~/E-CheckIn VAL.aspx?txtFlightNo={0}&txtFName={1}&txtLName={2}", txtFlightNo.Text, txtFName.Text, txtLName.Text);
                Response.Redirect(redirectURL);*/
                lblErrorPhoto.Text = "Please Upload Your Personal Photo!";
            }
            else
            {
                Response.Redirect("~/CheckIn Success.aspx");
            }
        }
    }
}