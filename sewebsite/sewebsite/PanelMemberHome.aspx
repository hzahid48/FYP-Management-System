<%@ Page Language="C#" MasterPageFile="~/PanelMemberMaster.master" AutoEventWireup="true" CodeFile="PanelMemberHome.aspx.cs" Inherits="PanelMemberHome" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table style="width: 100%; table-layout: fixed;">
        
        <tr>
            <th colspan="4" style="background-color: #3498db; color: white; text-align: left; padding: 5px; margin-bottom: 10px;">University Information</th>
        </tr>
        <tr>
            <td style="padding: 5px; text-align:left;"><strong>Username:</strong>&nbsp;&nbsp; <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label></td>
            <td style="padding: 5px; text-align: right;"><strong>Campus:</strong>&nbsp;&nbsp; <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label></td>
            <%--<td style="padding: 10px;"><strong>Group Number:</strong>&nbsp;&nbsp; <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label></tr>--%>
        <tr height="40"></tr>
        <tr>
            <th colspan="4" style="background-color: #3498db; color: white; text-align: left; padding: 5px; margin-bottom: 10px;">Personal Information</th>
        </tr>
        <tr>
            <td style="padding: 5px; text-align: left;"><strong>First Name:</strong>&nbsp;&nbsp; <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label><br /></td>
            <td style="padding: 5px; text-align: right;"><strong>Last Name:</strong>&nbsp;&nbsp; <asp:Label ID="Label15" runat="server" Text="Label"></asp:Label><br /></td>
        </tr>
        <tr height="40"></tr>
        <tr>
            <th colspan="4" style="background-color: #3498db; color: white; text-align: left; padding: 5px; margin-bottom: 10px;">Contact Details</th>
        </tr>
        <tr>
            <td style="padding: 5px; text-align: left;"><strong>Email:</strong>&nbsp;&nbsp;&nbsp; <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label></td>
            <td style="padding: 5px; text-align: right;"><strong>Phone Number:</strong>&nbsp;&nbsp; <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label></td>
        </tr>
        </table>

</asp:Content>