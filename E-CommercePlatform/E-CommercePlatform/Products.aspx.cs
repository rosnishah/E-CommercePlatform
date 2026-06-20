using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E_CommercePlatform
{
    public partial class Products : Page
    {
        private string cartPath => Server.MapPath("~/App_Data/cart.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            // FIXED: Always show products (even after PostBack)
            GenerateProducts();
        }

        private void GenerateProducts()
        {
            phProducts.Controls.Clear();

            string[,] products =
            {
                { "HP Laptop", "54999", "laptop.jpg" },
                { "Samsung Galaxy A15", "18499", "phone.jpg" },
                { "Nike Air Zoom", "5499", "Nike.jpg" },
                { "Boat Earbuds", "1999", "earbuds.jpg" },
                { "Sony Headphones", "2299", "headphone.jpg" },
                { "LG LED TV 43\"", "32999", "tv.jpeg" },
                { "Apple Watch Series 7", "29999", "watch.jpeg" },
                { "Cotton Shirt", "799", "shirt.jpeg" },
                { "Graphic T-Shirt", "499", "tshirt.jpeg" },
                { "Travel Backpack", "899", "bag.jpeg" },
                { "Winter Hoodie", "1199", "hoodie.jpeg" },
                { "Men’s Leather Jacket", "3499", "jacket.jpeg" },
                { "Makeup Kit", "1299", "makeup.jpeg" },
                { "Face Cream", "349", "cream.jpeg" },
                { "Luxury Perfume", "1599", "perfume.jpeg" },
                { "Logitech Mouse", "799", "mouse.jpeg" },
                { "Mechanical Keyboard", "2499", "keyboard.jpeg" },
                { "Steel Water Bottle", "499", "bottle.jpeg" },
                { "Study Books Pack", "1099", "books.jpeg" },
                { "Kids Toy Set", "699", "toy.jpeg" }
            };

            for (int i = 0; i < products.GetLength(0); i++)
            {
                string name = products[i, 0];
                int price = int.Parse(products[i, 1]);
                string img = products[i, 2];

                phProducts.Controls.Add(new LiteralControl("<div class='product-card'>"));

                phProducts.Controls.Add(new LiteralControl($@"
                    <img src='Images/{img}' />
                    <h4>{name}</h4>
                    <p>₹{price}</p>
                "));

                Button btn = new Button
                {
                    ID = "btnAdd_" + i,
                    Text = "Add to Cart",
                    CssClass = "buy-btn",
                    CommandArgument = $"{name}|{price}"
                };
                btn.Click += AddToCart;

                phProducts.Controls.Add(btn);
                phProducts.Controls.Add(new LiteralControl("</div>"));
            }
        }

        private void AddToCart(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            string username = Session["User"].ToString();

            Button btn = (Button)sender;
            string[] data = btn.CommandArgument.Split('|');

            string name = data[0];
            int price = int.Parse(data[1]);

            var lines = File.Exists(cartPath) ? File.ReadAllLines(cartPath) : Array.Empty<string>();
            var list = new System.Collections.Generic.List<string>(lines);

            string existing = list.Find(
                l => l.StartsWith(username + "|") && l.Contains("|" + name + "|")
            );

            if (existing != null)
            {
                var p = existing.Split('|');
                int qty = int.Parse(p[3]) + 1;

                list[list.IndexOf(existing)] = $"{username}|{name}|{price}|{qty}";
            }
            else
            {
                list.Add($"{username}|{name}|{price}|1");
            }

            File.WriteAllLines(cartPath, list);

            pnlSuccess.Visible = true;
            lblSuccess.Text = $"{name} added to cart!";
        }
    }
}
