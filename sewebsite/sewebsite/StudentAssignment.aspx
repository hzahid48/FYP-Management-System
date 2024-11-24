<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentAssignment.aspx.cs" Inherits="StudentAssignment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   <style type="text/css">
    body { font-family: Arial; font-size: 10pt; }
    .header {
        background-color: #3498db; /* Blue header theme */
        color: white;
        padding: 20px;
        text-align: center;
    }
    .upload-container {
        text-align: center;
        margin-top: 20px; /* Add a gap from the header */
    }
    .upload-container input[type="file"],
    .upload-container input[type="button"] {
        margin: 5px; /* Add space between the buttons */
    }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
    <h1>Upload Assignment</h1>
</div>
        <table style="width: 100%; table-layout: fixed;">
   
            <tr>
                <td colspan="3">
                    <asp:Table ID="Table2" runat="server" align="left" CellSpacing="10">
                        <asp:TableHeaderRow>
                            <asp:TableHeaderCell style="width: 50%; text-align: center;">Assignment Number</asp:TableHeaderCell>
                            <asp:TableHeaderCell style="width: 25%; text-align: center;">Project ID</asp:TableHeaderCell>
                            <asp:TableHeaderCell style="width: 25%; text-align: center;">Due Date</asp:TableHeaderCell>
                        </asp:TableHeaderRow>
                    </asp:Table>
                </td>
            </tr>
             <tr>
                <td colspan="3" style="text-align: center;">
                    <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>