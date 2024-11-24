<%@ Page Language="C#" MasterPageFile="~/PanelMemberMaster.master" AutoEventWireup="true" CodeFile="PanelMemberReview.aspx.cs" Inherits="PanelMemberReview" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table style="width: 100%; table-layout: fixed;">
        <tr>
            <th colspan="4" style="background-color: #1C1CA2; color: white; text-align: left; padding: 5px; margin-bottom: 10px;">Reviews & Suggestions</th>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Table ID="Table2" runat="server" align="left" CellSpacing="10">
                    <asp:TableHeaderRow>
                        <asp:TableHeaderCell style="width: 50%; text-align: center;">Project ID</asp:TableHeaderCell>
                        <asp:TableHeaderCell style="width: 25%; text-align: center;">Review/Suggestion</asp:TableHeaderCell>
                    </asp:TableHeaderRow>
                </asp:Table>
            </td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: center;">
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
            </td>
        </tr>
    </table>
    
</asp:Content>
