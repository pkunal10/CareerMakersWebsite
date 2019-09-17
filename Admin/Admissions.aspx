<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="Admissions.aspx.cs" Inherits="Admin_Admissions" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Admissions</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Admission       
                <%--<small>Control panel</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Admission</li>
            </ol>
        </section>
        <section class="content">
            <asp:Panel ID="InsertPanel" runat="server">
                <!-- Small boxes (Stat box) -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Category</label>
                                <asp:DropDownList ID="CategoryDD" CssClass="form-control" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Title</label>
                                <asp:TextBox ID="TitleTb" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Image</label>
                                <asp:FileUpload ID="Image" runat="server" />
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label for="exampleInputEmail1"></label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <asp:CheckBox ID="IsShowChk" runat="server" />
                                    <b>Is Show</b>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Content</label>
                            <%--<asp:TextBox ID="DescriptionTb" ClientIDMode="Static" TextMode="MultiLine" runat="server"></asp:TextBox>--%>
                            <FTB:FreeTextBox ID="DescriptionTb" Width="1000px" Height="300px" DropDownListCssClass="form-control" DesignModeBodyTagCssClass="form-control" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-1">
                        <asp:Button ID="AddUpdateBtn" OnClick="AddUpdateBtn_Click" runat="server" Text="Save" CssClass="btn btn-block btn-primary" />
                    </div>
                    <div class="col-lg-1">
                        <asp:Button ID="ClearBtn" runat="server" Text="Clear" OnClick="ClearBtn_Click" CssClass="btn btn-block btn-primary" />
                    </div>
                    <div class="col-lg-1">
                        <asp:Button ID="ShoeDataBtn" runat="server" Text="Show Data" OnClick="ShoeDataBtn_Click" CssClass="btn btn-block btn-primary" Width="100px" />
                    </div>
                    <div class="col-lg-4"></div>
                </div>
            </asp:Panel>
            <div class="row" style="height: 5px;">
                <asp:Label ID="ActionLbl" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="ImageIdLbl" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <asp:Panel ID="GridPanel" runat="server">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover" id="rptTable">
                                <tr style="background-color: black; color: white;">
                                    <th>S.No.</th>
                                    <th>Category</th>
                                    <th>Title</th>
                                    <th style="width: 300px; word-break: break-all;">Content</th>
                                    <th>Image</th>
                                    <th>Date</th>
                                    <th>Is Show</th>
                                    <th>Action</th>
                                </tr>
                                <asp:Repeater ID="AdmissionRptr" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%#Container.ItemIndex+1 %></td>
                                            <td><%#Eval("Category") %></td>
                                            <td><%#Eval("Title") %></td>
                                            <td><%#Eval("Content") %></td>
                                            <td>
                                                <asp:Image ID="Image1" runat="server" Height="70px" Width="70px" ImageUrl='<%#Eval("Image") %>' />
                                            </td>
                                            <td><%#Eval("CreatedOn") %></td>
                                            <td><%#Eval("IsShow") %></td>
                                            <td>
                                                <asp:LinkButton ID="EditAdmissionLb" OnCommand="EditAdmissionLb_Command" CommandArgument='<%#Eval("id") %>' CssClass="btn-sm btn-success" runat="server"><i class="fa fa-pencil"></i></asp:LinkButton>
                                                <asp:LinkButton ID="DeleteAdmissionLb" OnCommand="DeleteAdmissionLb_Command" CommandArgument='<%#Eval("id") %>' CssClass="btn-sm btn-danger" runat="server"><i class="fa fa-trash"></i></asp:LinkButton>
                                                <%--<a runat="server" onserverclick="DeleteGallery_Click" class="btn-danger btn-sm">X</a>--%>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                            <div style="overflow: hidden;">
                                <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnPage"
                                            Style="padding: 8px; margin: 2px; background: #ffa100; border: solid 1px #666; font: 8pt tahoma;"
                                            CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                            runat="server" ForeColor="White" Font-Bold="True"><%# Container.DataItem %>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>                                                      
                        </div>
                    </div>
                </div>
                <div class="row">
                                <div class="col-lg-12 text-center">
                                    <asp:Button ID="BackBtn" runat="server" Text="Back" OnClick="BackBtn_Click" CssClass="btn btn-primary" />
                                </div>
                            </div>  
            </asp:Panel>
        </section>
    </div>

    <script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
    <%--<!-- Bootstrap WYSIHTML5 -->
<script src="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script>
    $(function () {
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
        CKEDITOR.replace('editor1');
        //bootstrap WYSIHTML5 - text editor
        $("#DescriptionTb").wysihtml5();
    });
</script>--%>
</asp:Content>

