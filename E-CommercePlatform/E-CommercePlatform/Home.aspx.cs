using System;
using System.IO;
using System.Linq;
using System.Web;

namespace E_CommercePlatform
{
    public partial class Home : System.Web.UI.Page
    {
        private readonly string cartPath = HttpContext.Current.Server.MapPath("~/App_Data/cart.txt");

        private void AddToCart(string name, int price)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string username = Session["User"].ToString();

            // Load all lines
            var lines = File.ReadAllLines(cartPath).ToList();

            // Check if this user's product already exists
            var existingLine = lines
                .FirstOrDefault(l => l.StartsWith(username + "|") && l.Contains("|" + name + "|"));

            if (existingLine != null)
            {
                // Update Quantity
                var parts = existingLine.Split('|');
                int qty = int.Parse(parts[3]) + 1;

                string updated = $"{username}|{name}|{price}|{qty}";
                lines[lines.IndexOf(existingLine)] = updated;
            }
            else
            {
                // Add new row
                lines.Add($"{username}|{name}|{price}|1");
            }

            File.WriteAllLines(cartPath, lines);

            Response.Redirect("Cart.aspx");
        }

        protected void btnBuy1_Click(object sender, EventArgs e) => AddToCart("Wireless Headphones", 1999);
        protected void btnBuy2_Click(object sender, EventArgs e) => AddToCart("Smart Watch", 2499);
        protected void btnBuy3_Click(object sender, EventArgs e) => AddToCart("Casual Sneakers", 1299);
        protected void btnBuy4_Click(object sender, EventArgs e) => AddToCart("Travel Backpack", 899);
        protected void btnBuy5_Click(object sender, EventArgs e) => AddToCart("Laptop Sleeve", 749);
        protected void btnBuy6_Click(object sender, EventArgs e) => AddToCart("Winter Hoodie", 1099);
        protected void btnBuy7_Click(object sender, EventArgs e) => AddToCart("Bluetooth Earbuds", 1499);
        protected void btnBuy8_Click(object sender, EventArgs e) => AddToCart("Graphic T-Shirt", 599);
    }
}
