using System;

namespace E_CommercePlatform
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear user session
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();

            // End authentication cookie (if any)
            Response.Cookies.Clear();

            // Redirect to Home page
            Response.Redirect("Home.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
