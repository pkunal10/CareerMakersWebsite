<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="FullDetailsOfAdmissionInquiry.aspx.cs" Inherits="Admin_FullDetailsOfAdmissionInquiry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Full Details Of Admission Inquiry</title>
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
                            <label for="exampleInputEmail1">First Name</label>
                            <asp:TextBox ID="FNameTb" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Middle Name</label>
                            <asp:TextBox ID="MNameTb" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group"> 
                            <label for="exampleInputEmail1">Last Name</label>
                            <asp:TextBox ID="LNameTb" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">DOB</label>
                            <asp:TextBox ID="DOBTb" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Gender</label>
                            <asp:TextBox ID="GenderTb" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Middle Name</label>
                            <asp:TextBox ID="AddressTb" CssClass="form-control" TextMode="MultiLine" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">State</label>
                            <asp:TextBox ID="StateTb" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="form-group">
                            <label for="exampleInputEmail1">PIN Code</label>
                            <asp:TextBox ID="PINTb" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email Id</label>
                            <asp:TextBox ID="EmailTb" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Father Name</label>
                            <asp:TextBox ID="FatherNameTb" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Mother Name</label>
                            <asp:TextBox ID="MotherNameTb" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Student Mobile</label>
                            <asp:TextBox ID="StuMobTb" CssClass="form-control" ReadOnly="true" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Father Mobile</label>
                            <asp:TextBox ID="FaMobileTb" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Admission For</label>
                            <asp:TextBox ID="AdmissionTb" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Student Image</label>
                            <asp:Image ID="StuPhoto" CssClass="form-control" Height="150px" Width="150px" runat="server" />
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">10th Marksheet</label>                            
                            <asp:HyperLink ID="TenMarkHl" runat="server" CssClass="form-control" Target="_blank">View</asp:HyperLink>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="form-group">
                            <label for="exampleInputEmail1">12th Marksheet</label>
                            <asp:HyperLink ID="TwelveMarkHl" CssClass="form-control" Target="_blank" runat="server">View</asp:HyperLink>
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

