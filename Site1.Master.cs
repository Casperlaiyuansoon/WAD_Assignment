using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void btnregister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/register.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["userId"] = null; // Clear all the session value for login
            Session["username"] = null;
            Session["email"] = null;

            Response.Redirect("~/login.aspx");
        }
    }
}