<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserWithOutSlider.master" AutoEventWireup="true" CodeFile="Admissions.aspx.cs" Inherits="User_Admissions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <title>Admissions</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="undermenuarea">
        <div class="boxedshadow">
        </div>
        <div class="grid">
            <div class="row">
                <div class="c8">
                    <h1 class="titlehead">Admission /
                        <asp:Label ID="AdmissionCatLbl" runat="server" Text=""></asp:Label></h1>
                </div>
                <div class="c4">
                    <h1 class="titlehead rightareaheader"><i class="icon-map-marker"></i>Call Us Now +91 7006305281</h1>
                </div>
            </div>
        </div>
    </div>
    <!-- CONTENT
================================================== -->
    <div class="grid">
        <h1 class="text-center">
            <asp:Label ID="NoDataLbl" runat="server" Text=""></asp:Label>
        </h1>
        <div class="shadowundertop">
        </div>
        <asp:Repeater ID="AdmRptr" runat="server">
            <ItemTemplate>
                <div class="row">
                    <div class="c12">
                        <h1 class="maintitle ">
                            <span><%#Eval("Title") %></span>
                        </h1>
                    </div>
                </div>
                <div class="row">

                    <!-- begin description area -->
                    <div class="c6">
                        <p>
                            <%#Eval("Content") %>			
                        </p>                       		
                    </div>
                    <!-- end description area -->
                    <!-- begin slider area -->
                    <div class="c6">
                        <asp:Image ID="Image1" Height="380px" Width="350px" runat="server" ImageUrl='<%#Eval("Image") %>' />
                    </div>
                    <!-- end slider area -->

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <!-- end grid -->



</asp:Content>

