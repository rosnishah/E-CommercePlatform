<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" 
    CodeFile="Register.aspx.cs" Inherits="E_CommercePlatform.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<style>

    .register-container {
        max-width: 460px;
        margin: 50px auto;
        padding: 25px;
        animation: fadeIn 0.7s ease-in-out;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(8px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* GLASS CARD */
    .register-box {
        background: rgba(255,255,255,0.7);
        backdrop-filter: blur(10px);
        padding: 35px 28px;
        border-radius: 22px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        text-align: center;
    }

    .register-box h2 {
        color: #6a2ffb;
        font-size: 1.9rem;
        font-weight: 800;
        margin-bottom: 6px;
    }

    .register-box p {
        color: #555;
        font-size: 0.95rem;
        margin-bottom: 22px;
    }

    /* Labels */
    .label {
        text-align: left;
        font-weight: 600;
        margin-top: 12px;
        margin-bottom: 3px;
        color: #333;
        display: block;
    }

    /* Textbox */
    .input-box {
        width: 100%;
        padding: 12px;
        border-radius: 12px;
        border: 1px solid #ccc;
        font-size: 0.95rem;
        outline: none;
        transition: 0.25s;
        background: #ffffffcc;
    }

    .input-box:focus {
        border-color: #7a2ff8;
        box-shadow: 0 0 6px rgba(122,47,248,.25);
    }

    /* BUTTON */
    .submit-btn {
        width: 100%;
        padding: 12px;
        background: linear-gradient(135deg, #7a2ff8, #4e7bff);
        border: none;
        color: #fff;
        font-size: 1rem;
        font-weight: 700;
        border-radius: 12px;
        cursor: pointer;
        margin-top: 15px;
        transition: 0.3s ease;
    }

    .submit-btn:hover {
        transform: translateY(-3px);
        background: linear-gradient(135deg, #6a1ce6, #395ffe);
    }

    /* Success / Error */
    .response-label {
        margin-top: 12px;
        display: block;
        font-weight: bold;
        font-size: 0.95rem;
    }

    /* Login Link */
    .login-link {
        margin-top: 18px;
        font-size: 0.9rem;
        color: #444;
    }

    .login-btn {
        color: #7a2ff8;
        font-weight: bold;
        text-decoration: none;
        margin-left: 4px;
    }

    .login-btn:hover {
        text-decoration: underline;
    }

</style>


<div class="register-container">

    <div class="register-box">

        <h2>📝 Create Account</h2>
        <p>Fill in your details to get started.</p>

        <!-- FULL FORM -->
        <asp:Label ID="lblName" runat="server" Text="Full Name:" CssClass="label"></asp:Label>
        <asp:TextBox ID="txtName" runat="server" CssClass="input-box" placeholder="Enter your name"></asp:TextBox>

        <asp:Label ID="lblUser" runat="server" Text="Username:" CssClass="label"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server" CssClass="input-box" placeholder="Choose a username"></asp:TextBox>

        <asp:Label ID="lblPass" runat="server" Text="Password:" CssClass="label"></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="input-box" TextMode="Password" placeholder="Enter password"></asp:TextBox>

        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="submit-btn" OnClick="btnRegister_Click" />

        <asp:Label ID="lblMsg" runat="server" CssClass="response-label"></asp:Label>

        <!-- LOGIN LINK -->
        <div class="login-link">
            Already have an account?
            <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/Login.aspx" CssClass="login-btn">Login here</asp:HyperLink>
        </div>

    </div>

</div>

</asp:Content>
