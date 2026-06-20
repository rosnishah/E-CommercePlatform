using System;
using System.Web;
using System.Web.UI;

namespace E_CommercePlatform
{
    public partial class Site : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateNavbar();
            }
        }

        private void UpdateNavbar()
        {
            object user = Session["User"];

            if (user != null && !string.IsNullOrWhiteSpace(user.ToString()))
            {
                phCart.Visible = true;
                phUser.Visible = true;
                phLogin.Visible = false;

                lblUser.Text = HttpUtility.HtmlEncode(user.ToString());
            }
            else
            {
                phCart.Visible = false;
                phUser.Visible = false;
                phLogin.Visible = true;

                lblUser.Text = string.Empty;
            }
        }
    }
}
