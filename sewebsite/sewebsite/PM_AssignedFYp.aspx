<%@ Page Language="C#" MasterPageFile="~/PanelMemberMaster.master" AutoEventWireup="true" CodeFile="PM_AssignedFYp.aspx.cs" Inherits="PM_AssignedFYp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width: 100%; table-layout: fixed;">
        <tr>
            <th colspan="4" style="background-color: #3498db; color: white; text-align: left; padding: 5px; margin-bottom: 10px;">Assigned FYPs</th>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Table ID="Table2" runat="server" align="left" CellSpacing="10">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell style="width: 10%; text-align: center;">Project Number</asp:TableHeaderCell>
                        <asp:TableHeaderCell style="width: 20%; text-align: center;">Group Members</asp:TableHeaderCell>
                        <asp:TableHeaderCell style="width: 20%; text-align: center;">Project Description</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
            </td>
        </tr>
    </table>
    
</asp:Content>
