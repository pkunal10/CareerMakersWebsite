<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Gallery.aspx.cs" Inherits="Admin_Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Gallery</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Gallery
       
                <%--<small>Control panel</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Gallery</li>
            </ol>
        </section>

        <section class="content">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Title</label>
                            <asp:TextBox ID="TitileTb" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Description</label>
                            <asp:TextBox ID="DescriptionTb" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
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
                <div class="col-lg-5"></div>
                <div class="col-lg-1">
                    <asp:Button ID="AddBtn" runat="server" Text="Save" CssClass="btn btn-block btn-primary" OnClick="AddBtn_Click" />
                </div>
                <div class="col-lg-1">
                    <asp:Button ID="ClearBtn" runat="server" Text="Clear" OnClick="ClearBtn_Click" CssClass="btn btn-block btn-primary" />
                </div>
                <div class="col-lg-5"></div>
            </div>
            <div class="row" style="height: 5px;">
                <asp:Label ID="ActionLbl" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="ImageIdLbl" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="row">                
                <div class="col-lg-12">
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover" id="rptTable">
                            <tr style="background-color: black; color: white;">
                                <th>S.No.</th>
                                <th>Title</th>
                                <th style="width:300px;word-break:break-all;">Description</th>
                                <th>Show</th>
                                <th>Image</th>
                                <th>Action</th>
                            </tr>
                            <asp:Repeater ID="GalleryRptr" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Container.ItemIndex+1 %></td>
                                        <td><%#Eval("Title") %></td>
                                        <td><%#Eval("Description") %></td>
                                        <td><%#Eval("IsShow") %></td>
                                        <td>
                                            <asp:Image ID="Image1" runat="server" Height="70px" Width="70px" ImageUrl='<%#Eval("Image") %>' />
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="EditFalleryLb" OnCommand="EditGallery_Click" CommandArgument='<%#Eval("id") %>' CssClass="btn-sm btn-success" runat="server"><i class="fa fa-pencil"></i></asp:LinkButton>
                                            <asp:LinkButton ID="DeleteGalleryLb" OnCommand="DeleteGallery_Click" CommandArgument='<%#Eval("id") %>' CssClass="btn-sm btn-danger" runat="server"><i class="fa fa-trash"></i></asp:LinkButton>
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
        </section>
    </div>


<%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="Script/quicksearch.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('.search_textbox').each(function (i) {
            $(this).quicksearch("[id*=rptTable] tr:not(:has(th))", {
                'testQuery': function (query, txt, row) {
                    return $(row).children(":eq(" + i + ")").text().toLowerCase().indexOf(query[0].toLowerCase()) != -1;
                }
            });
        });
    });
</script>--%>

</asp:Content>

