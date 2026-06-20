<%@ Page Title="Products" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Products.aspx.cs" Inherits="E_CommercePlatform.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .products-container {
            text-align: center;
            padding: 2rem;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        h2 {
            font-size: 2.2rem;
            margin-bottom: 10px;
            color: #7a2ff8;
            font-weight: 700;
        }

        p {
            font-size: 1.1rem;
            color: #555;
            margin-bottom: 2rem;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 2rem;
            padding: 1rem;
        }

        .product-card {
            background: #fff;
            border-radius: 16px;
            padding: 1.2rem;
            box-shadow: 0 4px 16px rgba(0,0,0,0.12);
            transition: 0.3s ease;
            border: 1px solid transparent;
        }

        .product-card:hover {
            transform: translateY(-7px);
            border-color: #b98afc;
            box-shadow: 0 10px 26px rgba(0,0,0,0.16);
        }

        .product-card img {
            width: 100%;
            height: 240px;
            object-fit: cover;
            border-radius: 14px;
        }

        .product-card h4 {
            margin-top: 12px;
            margin-bottom: 6px;
            font-size: 1.2rem;
            font-weight: 600;
        }

        .product-card p {
            font-size: 1.1rem;
            margin-bottom: 10px;
            color: #333;
        }

        .buy-btn {
            background: linear-gradient(135deg, #7a2ff8, #4e7bff);
            color: #fff;
            padding: 0.7rem 1.4rem;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            font-size: 0.95rem;
            font-weight: bold;
            transition: 0.2s ease;
            width: 100%;
        }

        .buy-btn:hover {
            background: linear-gradient(135deg, #621BEE, #3A68FF);
            transform: translateY(-2px);
        }

        .alert-box {
            padding: 14px 18px;
            border-radius: 10px;
            margin: 20px auto;
            background: #d7ffd9;
            border-left: 6px solid #4CAF50;
            color: #1b5e20;
            font-weight: 600;
            width: 60%;
            text-align: center;
            font-size: 1.05rem;
            transition: opacity 1s ease-out;
        }
        .fade-out { opacity: 0; }
    </style>

    <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert-box">
        <asp:Label ID="lblSuccess" runat="server"></asp:Label>
    </asp:Panel>

    <div class="products-container">
        <h2>Our Products 🛍️</h2>
        <p>Browse trending tech, fashion & lifestyle picks!</p>

        <div class="product-grid">
            <asp:PlaceHolder ID="phProducts" runat="server"></asp:PlaceHolder>
        </div>
    </div>

    <script>
        setTimeout(() => {
            const box = document.getElementById("<%= pnlSuccess.ClientID %>");
            if (box) box.classList.add("fade-out");
        }, 1800);
    </script>

</asp:Content>
