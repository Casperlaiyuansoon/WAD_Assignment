using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace tarfly
{
    public partial class admin_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void admin_login_submit_Click(object sender, EventArgs e)
        {
            Response.Redirect("admin_manage_user.aspx");
        }
    }
}