<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="JobOfferCategory.aspx.cs" Inherits="Admin_JobOfferCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>JobOffer Category</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>JobOffer Category
       
                <%--<small>Control panel</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">JobOffer Category</li>
            </ol>
        </section>

        <section class="content">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Name</label>
                            <asp:TextBox ID="NameTb" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>                    
                    <div class="col-lg-2">
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
                    <div class="col-lg-3"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-5"></div>
                <div class="col-lg-1">
                    <asp:Button ID="AddUpdateBtn" runat="server" Text="Save" CssClass="btn btn-block btn-primary" OnClick="AddUpdate_Click" />
                </div>
                <div class="col-lg-1">
                    <asp:Button ID="ClearBtn" runat="server" Text="Clear" OnClick="ClearBtn_Click" CssClass="btn btn-block btn-primary" />
                </div>
                <div class="col-lg-5"></div>
            </div>
            <div class="row" style="height: 5px;">
                <asp:Label ID="ActionLbl" runat="server" Text="" Visible="false"></asp:Label>
                <asp:Label ID="CatIdLbl" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="row">                
                <div class="col-lg-12">
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover" id="rptTable">
                            <tr style="background-color: black; color: white;">
                                <th>S.No.</th>
                                <th>Name</th>                                
                                <th>Show</th>                                
                                <th>Action</th>
                            </tr>
                            <asp:Repeater ID="GalleryRptr" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Container.ItemIndex+1 %></td>
                                        <td><%#Eval("Category") %></td>                                        
                                        <td><%#Eval("IsShow") %></td>                                        
                                        <td>
                                            <asp:LinkButton ID="EditCategoryLb" OnCommand="EditCategory_Click" CommandArgument='<%#Eval("id") %>' CssClass="btn-sm btn-success" runat="server"><i class="fa fa-pencil"></i></asp:LinkButton>
                                            <asp:LinkButton ID="DeleteCategoryLb" OnCommand="DeleteCategory_Click" CommandArgument='<%#Eval("id") %>' CssClass="btn-sm btn-danger" runat="server"><i class="fa fa-trash"></i></asp:LinkButton>
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

</asp:Content>

