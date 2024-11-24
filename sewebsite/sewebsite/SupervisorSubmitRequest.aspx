<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorSubmitRequest.aspx.cs" Inherits="SupervisorSubmitRequest"MasterPageFile="MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body>
        <form id="form1" runat="server" class="container">
            <div>
                <h1>Supervisor Submit Request</h1>
                <div class="form-group">
                    <asp:TextBox ID="txtRequestContent" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" placeholder="Enter your request content"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                </div>
            </div>
          <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="btn btn-primary" />

        </form>
    </body>
</asp:Content>
