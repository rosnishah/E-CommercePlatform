<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
    CodeFile="Home.aspx.cs" Inherits="E_CommercePlatform.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* PAGE CONTAINER */
        .home-container {
            text-align: center;
            padding: 2rem;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* HEADINGS */
        .highlight {
            color: #7a2ff8;
            font-weight: bold;
        }

        .subtitle {
            font-size: 1rem;
            color: #444;
            margin-bottom: 2rem;
        }

        /* PRODUCT SECTION */
        .product-section h3 {
            margin: 2rem 0 1rem;
            font-size: 2rem;
            letter-spacing: 1px;
        }

        /* PRODUCT GRID */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 2rem;
            padding: 1rem;
        }

        /* PRODUCT CARD */
        .product-card {
            background: #fff;
            padding: 1.2rem;
            border-radius: 16px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.12);
            transition: all 0.3s ease;
            border: 1px solid transparent;
        }

        .product-card img {
            width: 100%;
            border-radius: 14px;
            height: 240px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-7px);
            border-color: #b98afc;
            box-shadow: 0 10px 26px rgba(0,0,0,0.16);
        }

        .product-card:hover img {
            transform: scale(1.04);
        }

        .product-card h4 {
            margin-top: 12px;
            margin-bottom: 6px;
            font-size: 1.2rem;
            font-weight: 600;
        }

        .product-card p {
            font-size: 1.1rem;
            color: #444;
            margin-bottom: 10px;
        }

        /* BUY BUTTON */
        .buy-btn {
            background: linear-gradient(135deg, #7a2ff8, #4e7bff);
            color: #fff;
            padding: 0.7rem 1.4rem;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            font-size: 0.95rem;
            font-weight: bold;
            transition: 0.3s;
            width: 100%;
        }

        .buy-btn:hover {
            background: linear-gradient(135deg, #621BEE, #3A68FF);
            transform: translateY(-2px);
        }
    </style>

    <div class="home-container">
        <h2>Welcome to <span class="highlight">ShopEase</span> 🛍️</h2>
        <p class="subtitle">Your one-stop shop for gadgets, fashion & cool stuff!</p>

        <div class="product-section">
            <h3>🔥 Featured Products</h3>

            <div class="product-grid">

                <!-- PRODUCT 1 -->
                <div class="product-card">
                    <img src="Images/headphone.jpg" alt="Wireless Headphones" />
                    <h4>Wireless Headphones</h4>
                    <p>₹1,999</p>
                    <asp:Button ID="btnBuy1" runat="server" Text="Add to Cart"
                        CssClass="buy-btn" OnClick="btnBuy1_Click" />
                </div>

                <!-- PRODUCT 2 -->
                <div class="product-card">
                    <img src="Images/smartwatch.jpg" alt="Smart Watch" />
                    <h4>Smart Watch</h4>
                    <p>₹2,499</p>
                    <asp:Button ID="btnBuy2" runat="server" Text="Add to Cart"
                        CssClass="buy-btn" OnClick="btnBuy2_Click" />
                </div>

                <!-- PRODUCT 3 -->
                <div class="product-card">
                    <img src="Images/shoes.jpg" alt="Casual Sneakers" />
                    <h4>Casual Sneakers</h4>
                    <p>₹1,299</p>
                    <asp:Button ID="btnBuy3" runat="server" Text="Add to Cart"
                        CssClass="buy-btn" OnClick="btnBuy3_Click" />
                </div>

                <!-- PRODUCT 4 -->
                <div class="product-card">
                    <img src="Images/bag.jpeg" alt="Backpack" />
                    <h4>Travel Backpack</h4>
                    <p>₹899</p>
                    <asp:Button ID="btnBuy4" runat="server" Text="Add to Cart"
                        CssClass="buy-btn" OnClick="btnBuy4_Click" />
                </div>

                <!-- PRODUCT 5 -->
                <div class="product-card">
                    <img src="Images/sleeve.jpeg" alt="Laptop Sleeve" />
                    <h4>Laptop Sleeve</h4>
                    <p>₹749</p>
                    <asp:Button ID="btnBuy5" runat="server" Text="Add to Cart"
                        CssClass="buy-btn" OnClick="btnBuy5_Click" />
                </div>

                <!-- PRODUCT 6 -->
                <div class="product-card">
                    <img src="Images/hoodie.jpeg" alt="Winter Hoodie" />
                    <h4>Winter Hoodie</h4>
                    <p>₹1,099</p>
                    <asp:Button ID="btnBuy6" runat="server" Text="Add to Cart"
                        CssClass="buy-btn" OnClick="btnBuy6_Click" />
                </div>

                <!-- PRODUCT 7 -->
                <div class="product-card">
                    <img src="Images/earbuds.jpg" alt="Bluetooth Earbuds" />
                    <h4>Bluetooth Earbuds</h4>
                    <p>₹1,499</p>
                    <asp:Button ID="btnBuy7" runat="server" Text="Add to Cart"
                        CssClass="buy-btn" OnClick="btnBuy7_Click" />
                </div>

                <!-- PRODUCT 8 -->
                <div class="product-card">
                    <img src="Images/tshirt.jpeg" alt="Graphic T-Shirt" />
                    <h4>Graphic T-Shirt</h4>
                    <p>₹599</p>
                    <asp:Button ID="btnBuy8" runat="server" Text="Add to Cart"
                        CssClass="buy-btn" OnClick="btnBuy8_Click" />
                </div>

            </div>
        </div>
    </div>

</asp:Content>
