<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="E_CommercePlatform.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .login-container {
            max-width: 420px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 20px;
            background: #ffffff;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            animation: fadeIn 0.6s ease-in-out;
            text-align: center;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-container h2 {
            font-size: 28px;
            font-weight: 700;
            color: #7A2FF8;
            margin-bottom: 5px;
        }

        .login-container p {
            font-size: 14px;
            color: #666;
            margin-bottom: 20px;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 14px;
            margin-top: 10px;
        }

        .label {
            text-align: left;
            font-weight: 600;
            color: #444;
            font-size: 14px;
        }

        .input-box {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            border-radius: 12px;
            border: 1px solid #ccc;
            outline: none;
            transition: all 0.25s ease;
        }

        .input-box:focus {
            border-color: #7A2FF8;
            box-shadow: 0 0 8px rgba(122,47,248,0.2);
        }

        .submit-btn {
            background: linear-gradient(135deg, #7A2FF8, #4E7BFF);
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            padding: 12px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            transition: 0.25s;
            margin-top: 10px;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            background: linear-gradient(135deg, #621BEE, #3A68FF);
        }

        .response-label {
            font-size: 14px;
            margin-top: 10px;
            display: block;
            font-weight: 600;
        }

        .register-link {
            margin-top: 18px;
            font-size: 14px;
            color: #555;
        }

        .register-btn {
            color: #7A2FF8;
            font-weight: 600;
            text-decoration: none;
            margin-left: 4px;
        }

        .register-btn:hover {
            text-decoration: underline;
        }
    </style>

    <div class="login-container">
        <h2>👤 Login</h2>
        <p>Welcome back! Let’s get you inside ✨</p>

        <div class="login-form">

            <asp:Label ID="lblUser" runat="server" Text="Username" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="input-box" placeholder="Enter username"></asp:TextBox>

            <asp:Label ID="lblPass" runat="server" Text="Password" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Enter password"></asp:TextBox>

            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="submit-btn" OnClick="btnLogin_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="response-label"></asp:Label>

            <div class="register-link">
                Don’t have an account?
                <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/Register.aspx" CssClass="register-btn">
                    Register here
                </asp:HyperLink>
            </div>

        </div>
    </div>

</asp:Content>
