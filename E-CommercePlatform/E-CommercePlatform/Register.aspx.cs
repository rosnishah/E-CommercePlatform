using System;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace E_CommercePlatform
{
    public partial class Register : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Validation
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtUsername.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMsg.Text = "⚠️ Please fill all fields.";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string path = Server.MapPath("~/App_Data/users.txt");

            // Create file if missing
            if (!File.Exists(path))
                File.Create(path).Close();

            // Duplicate username check
            bool exists = File.ReadAllLines(path)
                .Any(line =>
                {
                    string[] data = line.Split('|');
                    return data.Length > 1 && data[1] == txtUsername.Text.Trim();
                });

            if (exists)
            {
                lblMsg.Text = "⚠️ Username already exists!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Save new user
            string userData = $"{txtName.Text}|{txtUsername.Text}|{txtPassword.Text}";
            File.AppendAllLines(path, new[] { userData });

            lblMsg.Text = "✅ Registration successful! Redirecting...";
            lblMsg.ForeColor = System.Drawing.Color.Green;

            Response.AddHeader("REFRESH", "2;URL=Login.aspx");
        }
    }
}
