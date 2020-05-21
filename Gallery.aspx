<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        :root {
            --card-background-color: rgb(226, 252, 247);
        }

        div {
            border-radius: 5px;
        }

        .gallery {
            margin: auto;
            display: flex;
            height: 80vh;
            width: 90vw;
        }

        .text_heading {
            color: #3b5998;
            font-size: 2rem;
            padding-top: 20px;
            text-align: center;
            text-shadow: 2px 2px 10px #007449;
        }

        .gallery-items {
            background-color: var(--card-background-color);
            box-shadow: 0px 0px 20px rgb(236, 59, 93);
            margin: auto;
            display: flex;
            flex-direction: column;
            height: 100%;
            width: 46%;
            overflow: hidden;
        }

        .items {
            padding: 20px;
            box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.2);
            margin: auto;
            overflow: auto;
        }

        .insert-item {
            text-align: center;
            padding: 20px;
            box-shadow: 0px 0px 8px rgba(0, 0, 0, 0.2);
            margin: 20px 40px 10px;
        }

        .uploadH {
            color: #3b5998;
            font-size: 1.5rem;
            padding-top: 0px;
            padding-bottom: 10px;
            text-align: center;
            text-shadow: 2px 2px 10px #007449;
        }

        h5 {
            padding-bottom: 5px;
        }

        .UploadLabel {
            margin-top: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="gallery">

        <div class="gallery-items student-gallery">
            <strong class="text_heading">Student Gallery</strong>

            <div class="items">
                <asp:GridView ID="sGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="sGridView_RowCommand" Width="500px">
                    <Columns>
                        <asp:TemplateField HeaderText="File">

                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Display">

                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="ViewFile" Text='<%# "View" %>'></asp:Button>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:BoundField DataField="Size" HeaderText="Size in Bytes" />
                        <asp:BoundField DataField="Type" HeaderText="File Type" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="insert-item">
                <div class="uploadH">
                    <strong class="text_heading uploadH">New Student Upload</strong>
                </div>
                <h5>[Upload Limit: 20MB]</h5>
                <div>
                    <asp:FileUpload ID="sFileUpload" runat="server" />
                    <asp:Button ID="sUploadButton" runat="server" Text="Upload" Width="80px" OnClick="sUploadButton_Click" />
                </div>

                <div class="UploadLabel">
                    <asp:Label ID="sUploadLabel" runat="server"></asp:Label>
                </div>

            </div>
        </div>

        <div class="gallery-items teacher-gallery">
            <strong class="text_heading">Teacher Gallery</strong>
            <div class="items">
                <asp:GridView ID="tGridView" runat="server" AutoGenerateColumns="False" OnRowCommand="tGridView_RowCommand" Width="500px">
                    <Columns>
                        <asp:TemplateField HeaderText="File">

                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="Download" Text='<%# Eval("File") %>'></asp:LinkButton>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Display">

                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("File") %>' CommandName="ViewFile" Text='<%# "View" %>'></asp:Button>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:BoundField DataField="Size" HeaderText="Size in Bytes" />
                        <asp:BoundField DataField="Type" HeaderText="File Type" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="insert-item">
                <div class="uploadH">
                    <strong class="text_heading uploadH">New Teacher Upload</strong>
                </div>
                <h5>[Upload Limit: 20MB]</h5>
                <div>
                    <asp:FileUpload ID="tFileUpload" runat="server" />
                    <asp:Button ID="tUpladButton" runat="server" Text="Upload" Width="80px" OnClick="tUpladButton_Click" />
                </div>
                
                <div class="UploadLabel">
                    <asp:Label ID="tUploadLabel" runat="server"></asp:Label>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

