<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="E_CommercePlatform.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .contact-container {
            max-width: 500px;
            margin: 60px auto;
            background: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            text-align: center;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-top: 20px;
        }

        .label {
            text-align: left;
            font-weight: 600;
        }

        .input-box, .input-area {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .input-area {
            resize: none;
        }

        .submit-btn {
            background: #0078d7;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px;
            cursor: pointer;
            font-weight: bold;
        }

        .submit-btn:hover {
            background: #005fa3;
        }

        .response-label {
            margin-top: 12px;
            font-weight: bold;
        }
    </style>

    <div class="contact-container">
        <h2>📞 Contact Us</h2>
        <p>Have questions, feedback, or issues? We’d love to hear from you!</p>

        <div class="contact-form">

            <asp:Label ID="lblName" runat="server" Text="Your Name:" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtName" runat="server" CssClass="input-box" placeholder="Enter your name"></asp:TextBox>

            <asp:Label ID="lblEmail" runat="server" Text="Your Email:" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-box" placeholder="Enter your email"></asp:TextBox>

            <asp:Label ID="lblMessage" runat="server" Text="Message:" CssClass="label"></asp:Label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="input-area" TextMode="MultiLine" Rows="5" placeholder="Type your message..."></asp:TextBox>

            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="submit-btn" OnClick="btnSubmit_Click" />

            <asp:Label ID="lblResponse" runat="server" CssClass="response-label"></asp:Label>

        </div>
    </div>

</asp:Content>
