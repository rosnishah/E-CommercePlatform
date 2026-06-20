using System;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace E_CommercePlatform
{
    public partial class Cart : Page
    {
        private string cartPath => Server.MapPath("~/App_Data/cart.txt");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
                BindCart();
        }

        private void BindCart()
        {
            string username = Session["User"].ToString();

            if (!File.Exists(cartPath))
            {
                pnlEmpty.Visible = true;
                pnlCart.Visible = false;
                return;
            }

            var lines = File.ReadAllLines(cartPath)
                .Where(l => l.StartsWith(username + "|"))
                .ToList();

            if (lines.Count == 0)
            {
                pnlEmpty.Visible = true;
                pnlCart.Visible = false;
                return;
            }

            pnlEmpty.Visible = false;
            pnlCart.Visible = true;

            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("Price");
            dt.Columns.Add("Quantity");

            foreach (var line in lines)
            {
                string[] p = line.Split('|');
                dt.Rows.Add(p[1], p[2], p[3]);
            }

            gvCart.DataSource = dt;
            gvCart.DataBind();

            lblGrand.Text = lines.Sum(l =>
            {
                var p = l.Split('|');
                return int.Parse(p[2]) * int.Parse(p[3]);
            }).ToString();
        }

        protected void gvCart_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            string username = Session["User"].ToString();
            string productName = e.CommandArgument.ToString();

            var lines = File.Exists(cartPath) ? File.ReadAllLines(cartPath).ToList() : new System.Collections.Generic.List<string>();
            var item = lines.FirstOrDefault(l => l.StartsWith(username + "|") && l.Contains("|" + productName + "|"));

            if (item != null)
            {
                var p = item.Split('|');
                int qty = int.Parse(p[3]);

                if (e.CommandName == "Increase") qty++;
                if (e.CommandName == "Decrease" && qty > 1) qty--;
                if (e.CommandName == "Remove") { lines.Remove(item); }
                else
                {
                    string updated = $"{username}|{productName}|{p[2]}|{qty}";
                    lines[lines.IndexOf(item)] = updated;
                }
            }

            File.WriteAllLines(cartPath, lines);
            BindCart();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}
