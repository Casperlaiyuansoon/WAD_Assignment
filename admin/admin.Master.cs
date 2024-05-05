using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WAD_Assignment.admin
{
	public partial class admin : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void admin_logout_btn_Click(object sender, EventArgs e)
		{
            Session["adminId"] = null;
            Session["admin_name"] = null;
			Session["admin_email"] = null;

			Response.Redirect("admin_login.aspx");
        }

    }
}