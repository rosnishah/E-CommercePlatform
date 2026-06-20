<%@ Page Title="Cart" Language="C#" MasterPageFile="~/Site.master"
    AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="E_CommercePlatform.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .cart-container {
            padding: 2rem;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 1rem;
            font-weight: 700;
            color: #7a2ff8;
        }

        .cart-table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 16px rgba(0,0,0,0.1);
        }

        .cart-table th {
            background: #7a2ff8;
            color: white;
            padding: 12px;
            text-align: center;
        }

        .cart-table td {
            padding: 14px;
            text-align: center;
            font-size: 1rem;
        }

        .qty-btn {
            background: #f0e8ff;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.2s;
            font-weight: bold;
        }

        .qty-btn:hover {
            background: #d6c4ff;
        }

        .remove-btn {
            background: #ff4b4b;
            color: white;
            padding: 6px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.2s;
        }

        .remove-btn:hover {
            background: #d63838;
        }

        .checkout-btn {
            margin-top: 20px;
            padding: 12px 30px;
            background: linear-gradient(135deg, #7a2ff8, #4e7bff);
            border: none;
            color: white;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1rem;
            font-weight: bold;
            transition: 0.3s ease;
        }

        .checkout-btn:hover { transform: translateY(-3px); }

        .empty-message {
            margin-top: 20px;
            font-size: 1.2rem;
            color: #555;
        }

        .total-box {
            font-size: 1.4rem;
            margin-top: 10px;
            font-weight: bold;
            color: #4e3abf;
        }
    </style>

    <div class="cart-container">
        <h2>Your Cart 🛒</h2>

        <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
            <p class="empty-message">Your cart is empty 😭  
                <br /><a href="Products.aspx" style="color:#7a2ff8;font-weight:bold;">Browse products</a>
            </p>
        </asp:Panel>

        <asp:Panel ID="pnlCart" runat="server" Visible="false">

            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False"
                CssClass="cart-table" OnRowCommand="gvCart_RowCommand">

                <Columns>

                    <asp:BoundField DataField="Name" HeaderText="Product" />
                    <asp:BoundField DataField="Price" HeaderText="Price (₹)" />

                    <asp:TemplateField HeaderText="Qty">
                        <ItemTemplate>
                            <asp:Button Text="-" runat="server" CssClass="qty-btn"
                                CommandName="Decrease" CommandArgument='<%# Eval("Name") %>' />

                            <asp:Label runat="server" Text='<%# Eval("Quantity") %>' Style="margin:0 10px;" />

                            <asp:Button Text="+" runat="server" CssClass="qty-btn"
                                CommandName="Increase" CommandArgument='<%# Eval("Name") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total (₹)">
                        <ItemTemplate>
                            <%# (Convert.ToInt32(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))) %>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button Text="Remove" runat="server" CssClass="remove-btn"
                                CommandName="Remove" CommandArgument='<%# Eval("Name") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

            <div class="total-box">
                Total Amount: ₹<asp:Label ID="lblGrand" runat="server"></asp:Label>
            </div>

            <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout"
                CssClass="checkout-btn" OnClick="btnCheckout_Click" />

        </asp:Panel>
    </div>

</asp:Content>
