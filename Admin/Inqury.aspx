<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Inqury.aspx.cs" Inherits="Admin_Inqury" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Inquiry</title>
    <script type='text/javascript'>
        function openModal() {
            $('#EmailModal').modal('show');
        }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Inquiry
       
                <%--<small>Control panel</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Inquiry</li>
            </ol>
        </section>

        <section class="content">
            <!-- Small boxes (Stat box) -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Date</label>
                            <asp:TextBox ID="DateTb" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-1" style="margin-top: 20px;">
                        <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-block btn-primary" OnClick="SearchBtn_Click" />
                    </div>
                    <div class="col-lg-1" style="margin-top: 20px;">
                        <asp:Button ID="Button2" runat="server" Text="Clear" OnClick="ClearBtn_Click" CssClass="btn btn-block btn-primary" />
                    </div>
                    <div class="col-lg-3"></div>
                </div>
            </div>
            <div class="row" style="height: 5px;">
                <%--<asp:Label ID="ActionLbl" runat="server" Text="" Visible="false"></asp:Label>--%>
                <asp:Label ID="InqIdLbl" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover" id="rptTable">
                            <tr style="background-color: black; color: white;">
                                <th>S.No.</th>
                                <th>Date</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>City / State</th>
                                <th>Message</th>
                                <th>Action</th>
                                <th>Answered</th>
                            </tr>
                            <asp:Repeater ID="InquiryRptr" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#Container.ItemIndex+1 %></td>
                                        <td style="width: 100px; word-break: break-all;"><%#Eval("InquiryDate") %></td>
                                        <td><%#Eval("Name") %></td>
                                        <td style="width: 200px; word-break: break-all;"><%#Eval("EmailId") %></td>
                                        <td><%#Eval("Mobile") %></td>
                                        <td><%#Eval("Location") %></td>
                                        <td style="width: 250px; word-break: break-all;"><%#Eval("Message") %></td>
                                        <td>
                                            <asp:LinkButton ID="EmailLb" OnCommand="EmailLb_Command" Visible='<%# ((Eval("EmailId"))!="")%>' CommandArgument='<%#Eval("id") %>' CssClass="btn-sm btn-success" runat="server"><i class="fa fa-envelope"></i></asp:LinkButton>
                                            <asp:LinkButton ID="AnsLb" OnCommand="AnsLb_Command" Visible='<%# !(bool)Eval("IsAnswered")%>' CommandArgument='<%#Eval("id") %>' CssClass="btn-sm btn-primary" runat="server"><i class="fa fa-check-circle"></i></asp:LinkButton>
                                            <asp:LinkButton ID="DeleteLb" OnCommand="DeleteLb_Command" CommandArgument='<%#Eval("id") %>' CssClass="btn-sm btn-danger" runat="server"><i class="fa fa-trash-o"></i></asp:LinkButton>
                                            
                                            <%--<a runat="server" onserverclick="DeleteGallery_Click" class="btn-danger btn-sm">X</a>--%>
                                        </td>
                                        <td>
                                            <%# (bool)Eval("IsAnswered")? "<i class='fa fa-check-circle text-success text-bold'></i>" : "" %>
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

