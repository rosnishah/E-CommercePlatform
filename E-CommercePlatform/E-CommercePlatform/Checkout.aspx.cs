using System;
using System.Data;
using System.IO;
using System.Linq;

namespace E_CommercePlatform
{
    public partial class Checkout : System.Web.UI.Page
    {
        string cartFile;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            cartFile = Server.MapPath("~/App_Data/cart.txt");

            if (!IsPostBack)
            {
                LoadCheckout();
            }
        }

        private void LoadCheckout()
        {
            string user = Session["User"].ToString();

            DataTable dt = new DataTable();
            dt.Columns.Add("Product");
            dt.Columns.Add("Price");
            dt.Columns.Add("Quantity");
            dt.Columns.Add("Total");

            if (File.Exists(cartFile))
            {
                var lines = File.ReadAllLines(cartFile);

                foreach (var line in lines)
                {
                    var p = line.Split('|');
                    if (p[0] == user)
                    {
                        int price = int.Parse(p[2]);
                        int qty = int.Parse(p[3]);
                        dt.Rows.Add(p[1], price, qty, price * qty);
                    }
                }
            }

            gvCheckout.DataSource = dt;
            gvCheckout.DataBind();

            lblGrandTotal.Text = dt.AsEnumerable()
                .Sum(r => Convert.ToInt32(r["Total"]))
                .ToString();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Trim() == "" || txtEmail.Text.Trim() == "" ||
                txtPhone.Text.Trim() == "" || txtAddress.Text.Trim() == "")
            {
                lblMsg.Visible = true;
                lblMsg.Text = "<div class='success-box' style='background:#ffdede;border-color:red;color:#a30000;'>Please fill all details.</div>";
                return;
            }

            string user = Session["User"].ToString();

            // SAVE ORDER (optional: you can store in App_Data/orders.txt)
            string orderFile = Server.MapPath("~/App_Data/orders.txt");

            using (StreamWriter sw = new StreamWriter(orderFile, true))
            {
                sw.WriteLine($"Order by {txtName.Text} | {txtEmail.Text} | {txtPhone.Text} | {txtAddress.Text} | Rs. {lblGrandTotal.Text} | {DateTime.Now}");
            }

            // CLEAR CART
            var lines = File.ReadAllLines(cartFile).ToList();
            lines = lines.Where(l => !l.StartsWith(user + "|")).ToList();
            File.WriteAllLines(cartFile, lines);

            lblMsg.Visible = true;
            lblMsg.Text = "<div class='success-box'>Order Placed Successfully! 🎉</div>";

            // Clear fields
            txtName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";

            // reload empty cart
            LoadCheckout();
        }
    }
}
