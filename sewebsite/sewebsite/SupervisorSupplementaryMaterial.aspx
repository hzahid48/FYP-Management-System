<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorSupplementaryMaterial.aspx.cs" Inherits="SupervisorSupplementaryMaterial" MasterPageFile="MasterPage.master"%>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <body >
        <form id="form1" runat="server" class="container">
            <h1>Supervisor Supplementary Material Page</h1>
            
            <!-- File upload control -->
            <div class="custom-file mb-3">
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="custom-file-input" onchange="updateFileName(this)" />
                <label class="custom-file-label" for="FileUpload1" id="lblFileName">Choose file</label>
            </div>

            <script>
                function updateFileName(input) {
                    // Check if a file is selected
                    if (input.files.length > 0) {
                        // Get the filename and display it
                        var fileName = input.files[0].name;
                        document.getElementById('lblFileName').innerText = fileName;
                    } else {
                        // No file selected, display default text
                        document.getElementById('lblFileName').innerText = 'Choose file';
                    }
                }
            </script>

            <!-- Upload button -->
            <asp:Button ID="btnUpload" Text="Upload" runat="server" OnClick="UploadFile" CssClass="btn btn-primary" />

            <!-- Message label -->
            <!-- Modal for displaying message -->
            <div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-labelledby="messageModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="messageModalLabel">Message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Include Bootstrap JavaScript (optional) -->
            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

            <script>
                // Show message modal function
                function showMessageModal(message) {
                    $('#lblMessage').text(message);
                    $('#messageModal').modal('show');
                }
            </script>
            <br />
            <br />
            <!-- Back button -->
            <asp:Button ID="btnBack" runat="server" Text="Back to FYP Materials" OnClick="btnBack_Click" CssClass="btn btn-secondary" />
        </form>
    </body>
</asp:Content>