<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="SendEmail.aspx.cs" Inherits="Admin_SendEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Email</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Send Email
       
                <%--<small>Control panel</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
                <li class="active">Send Email</li>
            </ol>
        </section>

        <section class="content">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Name</label>
                            <asp:TextBox ID="NameTb" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">To</label>
                            <asp:TextBox ID="ToTb" ReadOnly="true" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Subject</label>
                            <asp:TextBox ID="SubjectTb" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Message</label>
                            <asp:TextBox ID="MsgTb" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-2 text-center">
                        <asp:Button ID="SendMailBtn" CssClass="btn btn-primary" OnClick="SendMailBtn_Click" runat="server" Text="Send" />
                    </div>
                    <div class="col-lg-2 text-center">
                        <a href="Inqury.aspx" class="btn btn-primary">Back</a>
                    </div>
                    <div class="col-lg-4"></div>
                </div>
            </div>
        </section>

    </div>

</asp:Content>

