<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="StudentProgressReport.aspx.cs" Inherits="StudentProgressReport" %>

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
            <h1>Progress Report</h1>
        </div>
        <div class="upload-container">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" />
        </div>
        <br />
        <hr />
        <asp:Label ID="lblMessage" ForeColor="Green" runat="server" />
    </form>
</body>
</html>
