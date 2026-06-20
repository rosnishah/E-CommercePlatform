<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="E_CommercePlatform.Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>
    /* OUTER WRAPPER */
    .checkout-container {
        max-width: 850px;
        margin: 40px auto;
        background: rgba(255, 255, 255, 0.75);
        padding: 35px 40px;
        border-radius: 18px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        backdrop-filter: blur(10px);
        animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(12px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2, h3 {
        color: #6a2ffb;
        font-weight: 700;
    }

    /* GRIDVIEW */
    .checkout-table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 14px rgba(0,0,0,0.08);
    }

    .checkout-table th {
        background: linear-gradient(135deg, #7a2ff8, #4e7bff);
        color: #fff;
        padding: 12px;
        text-align: center;
    }

    .checkout-table td {
        padding: 14px;
        text-align: center;
        background: #fff;
        font-size: 1rem;
        border-bottom: 1px solid #eee;
    }

    /* INPUTS */
    .form-control {
        width: 100%;
        padding: 12px;
        border-radius: 10px;
        border: 1px solid #ccc;
        font-size: 1rem;
        margin-bottom: 16px;
        transition: 0.3s;
    }

    .form-control:focus {
        border-color: #7a2ff8;
        box-shadow: 0 0 6px rgba(122,47,248,0.35);
        outline: none;
        background: #faf7ff;
    }

    /* BUTTON */
    .place-btn {
        width: 100%;
        background: linear-gradient(135deg, #7a2ff8, #4e7bff);
        border: none;
        padding: 14px;
        color: white;
        font-size: 1.1rem;
        border-radius: 12px;
        cursor: pointer;
        font-weight: bold;
        transition: 0.3s;
        margin-top: 10px;
    }

    .place-btn:hover {
        transform: translateY(-3px);
    }

    /* SUCCESS + ERROR BOX */
    .success-box,
    .error-box {
        padding: 14px;
        border-radius: 10px;
        margin-top: 20px;
        font-size: 1rem;
        font-weight: bold;
        animation: fadeIn 0.5s ease-in-out;
    }

    .success-box {
        background: #d3ffd7;
        border-left: 6px solid #2da34f;
        color: #145a24;
    }

    .error-box {
        background: #ffe1e1;
        border-left: 6px solid #e33f3f;
        color: #a00000;
    }
</style>


<div class="checkout-container">
    
    <h2>Checkout 🧾</h2>
    <br />

    <!-- CART REVIEW -->
    <asp:GridView ID="gvCheckout" runat="server" AutoGenerateColumns="False" CssClass="checkout-table">
        <Columns>
            <asp:BoundField DataField="Product" HeaderText="Product" />
            <asp:BoundField DataField="Price" HeaderText="Price (₹)" />
            <asp:BoundField DataField="Quantity" HeaderText="Qty" />
            <asp:BoundField DataField="Total" HeaderText="Total (₹)" />
        </Columns>
    </asp:GridView>

    <h3>Total Amount: ₹<asp:Label ID="lblGrandTotal" runat="server" /></h3>
    <br />

    <!-- BILLING SECTION -->
    <h3>Billing Details</h3>

    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Full Name"></asp:TextBox>
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Email"></asp:TextBox>
    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Phone"></asp:TextBox>
    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Address"></asp:TextBox>

    <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order"
        CssClass="place-btn" OnClick="btnPlaceOrder_Click" />

    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>

</div>

</asp:Content>
