using System;
using System.Web.UI;

namespace E_CommercePlatform
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Basic validation
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                lblResponse.Text = "⚠️ Please fill out all fields.";
                lblResponse.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Email format check
            try
            {
                var mail = new System.Net.Mail.MailAddress(txtEmail.Text);
            }
            catch
            {
                lblResponse.Text = "⚠️ Please enter a valid email address.";
                lblResponse.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Success message
            lblResponse.Text = $"✅ Thank you, {txtName.Text}! Your message has been sent successfully.";
            lblResponse.ForeColor = System.Drawing.Color.Green;

            // Clear the form
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = "";
        }
    }
}
