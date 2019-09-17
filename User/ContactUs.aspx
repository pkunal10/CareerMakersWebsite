<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserWithOutSlider.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="User_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <title>Contact Us</title>


    <style>
        #map {
            height: 100%;
        }

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="undermenuarea">
        <div class="boxedshadow">
        </div>
        <div class="grid">
            <div class="row">
                <div class="c8">
                    <h1 class="titlehead">Contact</h1>
                </div>
                <div class="c4">
                    <h1 class="titlehead rightareaheader"><i class="icon-map-marker"></i>Call Us Now +91 7006305281</h1>
                </div>
            </div>
        </div>
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="grid">
                <div class="shadowundertop"></div>
                <div class="row space-bot">
                    <%--<div class="c12">
                        <iframe class="gmap" src="https://www.google.com/maps/place/Kupwara+193222/@34.3886106,73.8947653,10z/data=!4m13!1m7!3m6!1s0x38e0e0f6021bf57d:0x4a8438304e9750c5!2sKupwara!3b1!8m2!3d34.4319232!4d74.123996!3m4!1s0x38e11f8498ccf25f:0xf6df300b89f6292!8m2!3d34.5260757!4d74.2545319"></iframe>

                    </div>--%>

                    <div id="map"></div>
                    <script>
                        var map;
                        function initMap() {
                            map = new google.maps.Map(document.getElementById('map'), {
                                center: { lat: 34.431923, lng: 74.123996 },
                                zoom: 8
                            });
                        }
                    </script>


                    <script async defer
                        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCnd1Nlim_Z_1JCj-kAIgUHNYXRg0YJFNw&callback=initMap">
                    </script>
                </div>
                <div class="row space-top">
                    <!-- CONTACT FORM -->
                    <div class="c8 space-top">
                        <h1 class="maintitle">
                            <span><i class="icon-envelope-alt"></i>Get in Touch</span>
                        </h1>
                        <div class="wrapcontact">
                            <div class="done">
                                <div class="alert-box success ctextarea">
                                    Your message has been sent. Thank you! <a href="" class="close">x</a>
                                </div>
                            </div>
                            <div class="form">
                                <div class="c6 noleftmargin">
                                    <label>
                                        Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Name" Text="Enter Your Name" ControlToValidate="NameTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                                    </label>
                                    <asp:TextBox ID="NameTb" runat="server"></asp:TextBox>
                                </div>
                                <div class="c6 noleftmargin">
                                    <label>E-mail address</label>
                                    <asp:TextBox ID="EmailTb" runat="server"></asp:TextBox>
                                </div>
                                <div class="c6 noleftmargin">
                                    <label>
                                        Mobile  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Your Mobile" Text="Enter Your Mobile" ControlToValidate="MobileTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Font-Bold="true" CssClass="text-warning" runat="server" SetFocusOnError="true" ErrorMessage="Numbers Only"
                                            Text="Enter 10 Digit" ValidationExpression="^[0-9]{10}$" Style="color: red; font-weight: 800;" ValidationGroup="ContForm" ControlToValidate="MobileTb"></asp:RegularExpressionValidator></label>
                                    <asp:TextBox ID="MobileTb" runat="server"></asp:TextBox>
                                </div>
                                <div class="c6 noleftmargin">
                                    <label>City/State</label>
                                    <asp:TextBox ID="LocationTb" runat="server"></asp:TextBox>
                                </div>
                                <label>
                                    Message  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Your Message" Text="Enter Your Message" ControlToValidate="MsgTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator></label>
                                <asp:TextBox ID="MsgTb" Rows="9" TextMode="MultiLine" runat="server"></asp:TextBox>
                                <%--<input type="submit" runat="server" onserverclick="SubmitBtn_ServerClick" id="SubmitBtn" class="button" validationgroup="ContForm" style="font-size:12px;" value="SUBMIT">--%>
                                <asp:Button ID="SubmitBtn" runat="server" OnClick="SubmitBtn_ServerClick" class="button" ValidationGroup="ContForm" Style="font-size: 12px;" Text="SUBMIT" />
                            </div>
                        </div>
                    </div>
                    <div class="c4 space-top">
                        <h1 class="maintitle">
                            <span><i class="icon-map-marker"></i>Locations</span>
                        </h1>
                        <p>
                            <a class="link-2" href="#">Carrier Makers Consultancy </a>
                        </p>
                        <dl>
                            <dt>Kupwara kashmir,Pin:- 193222.</dt>
                            <dd><span>Mobile:</span>+91 7006305281</dd>
                            <dd><span>Mobile:</span>+91 7051890834</dd>
                            <dd>E-mail:	info@carriermakers.com</dd>
                        </dl>
                        <br />
                        <%--<dl>
                            <dt>9863 - 9867 Mill Road, Cambridge, MG09 99HT</dt>
                            <dt>Zamora Road, Missisipi, 74C</dt>
                            <dd><span>Telephone:</span>+1 348 271 9483</dd>
                            <dd><span>FAX:</span>+1 243 794 5734</dd>
                            <dd>E-mail: <a href="more.html">mail@yourweb.com</a></dd>
                        </dl>--%>
                    </div>
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" class="loading" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="0" DynamicLayout="true">
                <ProgressTemplate>
                    <center>
                    <font style="color:White;font-size:18px;">Please Wait....</font><br /><br />
                    <img id="Img1" src="~/User/images/loader.gif" runat="server" />
                </center>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>


