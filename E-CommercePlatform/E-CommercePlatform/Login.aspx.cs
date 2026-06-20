using System;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace E_CommercePlatform
{
    public partial class Login : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(password))
            {
                lblMessage.Text = "⚠ Please enter both fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string path = Server.MapPath("~/App_Data/users.txt");

            if (!File.Exists(path))
            {
                lblMessage.Text = "❌ No users found.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            bool isValid = File.ReadAllLines(path).Any(line =>
            {
                var p = line.Split('|');
                return p[1] == username && p[2] == password;
            });

            if (isValid)
            {
                Session["User"] = username;
                Response.Redirect("Home.aspx");
                return;
            }

            lblMessage.Text = "❌ Wrong username or password.";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
