<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorViewActiveFYPs.aspx.cs" Inherits="SupervisorViewActiveFYPs"MasterPageFile="MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Custom CSS styles */
        .fyp-container {
            margin-bottom: 20px; /* Add spacing between different FYPs */
            font-family: Arial, sans-serif; /* Change the font */
            font-size: 16px; /* Adjust the font size */
        }

        .fyp-name {
            font-weight: bold; /* Make the FYP name bold */
            margin-right: 10px; /* Add spacing between FYP ID and name */
        }

        .fyp-id {
            color: #666; /* Change the color of FYP ID */
            font-size: 14px; /* Adjust the font size of FYP ID */
        }

        .select-button {
            margin-top: 10px; /* Add spacing between FYP details and Select button */
        }
    </style>

    <body>
        <form id="form1" runat="server">
            <h1>Here Are Your Active FYPs</h1>
            <div>
                <asp:Repeater ID="rptActiveFYPs" runat="server" OnItemCommand="rptActiveFYPs_ItemCommand">
                    <ItemTemplate>
                        <div class="fyp-container">
                            <asp:Label ID="lblFYPId" runat="server" Text='<%# Eval("fyp_id") %>' Visible="false" CssClass="fyp-id"></asp:Label>
                            <span class="fyp-name"><%# Eval("fyp_id") %></span>
                            <span class="fyp-name"><%# Eval("fyp_name") %></span>
                            <asp:Button runat="server" Text="Select" CommandName="SelectOption" CommandArgument='<%# Container.ItemIndex %>' CssClass="btn btn-primary select-button" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <asp:Button ID="btnGoBack" runat="server" Text="Go Back" OnClick="btnGoBack_Click" CssClass="small-button-style" />
        </form>
    </body>
</asp:Content>
