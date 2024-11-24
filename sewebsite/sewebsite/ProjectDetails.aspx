<%@ Page Language="C#" MasterPageFile="~/StudentMaster.master" AutoEventWireup="true" CodeFile="ProjectDetails.aspx.cs" Inherits="ProjectDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width: 100%; table-layout: fixed;">
    <tr>
        <th colspan="4" style="background-color: #3498db; color: white; text-align: left; padding: 5px; margin-bottom: 10px;">Group Members</th>
    </tr>
    <tr>
        <td colspan="4">
            <asp:Table ID="Table2" runat="server" align="left" CellSpacing="10">
                <asp:TableHeaderRow>
                    <asp:TableHeaderCell HorizontalAlign="Left">Index</asp:TableHeaderCell>
                    <asp:TableHeaderCell HorizontalAlign="Left">Group Member</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
        </td>
    </tr>
    <tr height="40"></tr>
    <tr>
        <th colspan="4" style="background-color: #3498db; color: white; text-align: left; padding: 5px; margin-bottom: 10px;">Project Details</th>
    </tr>
    <tr>
        <td style="padding: 5px; text-align: left;"><strong>Description: </strong>&nbsp;&nbsp; <asp:Label ID="Label14" runat="server" Text="Label"></asp:Label><br /></td>
         <td style="padding: 5px; text-align: left;"><strong>Supervisor: </strong>&nbsp;&nbsp; <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><br /></td>
         <td style="padding: 5px; text-align: left;"><strong>Co-Supervisor: </strong>&nbsp;&nbsp; <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label><br /></td>
      
    </tr>
    <tr height="40"></tr>
    <tr>
        <th colspan="4" style="background-color: #3498db; color: white; text-align: left; padding: 5px; margin-bottom: 10px;">Assigned Panel</th>
    </tr>
    <tr>
        <td style="padding: 5px; text-align: left;"><strong>Panel Number:</strong>&nbsp;&nbsp;&nbsp; <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label></td>
        <td style="padding: 5px; text-align: left;"><strong>Panel Name:</strong>&nbsp;&nbsp;&nbsp; <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
        <td  style="padding: 5px; text-align: left;"><strong>Panel Leader:</strong>&nbsp;&nbsp;&nbsp; <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr height="40"></tr>
   
</table>


           
    
</asp:Content>