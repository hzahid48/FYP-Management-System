<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorError.aspx.cs" Inherits="SupervisorError"MasterPageFile="MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <body>
        <form id="form1" runat="server">
            <div>
                <h1>Error: Invalid Supervisor ID</h1>
                <p>The supervisor ID provided is not valid. Please sign in again.</p>
                <asp:Button ID="btnSignIn" runat="server" Text="Go to Sign In page" OnClick="btnSignIn_Click" CssClass="small-button-style" />
            </div>
        </form>
    </body>
</asp:Content>