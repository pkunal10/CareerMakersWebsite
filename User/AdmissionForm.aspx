<%@ Page Title="" Language="C#" MasterPageFile="~/User/UserWithOutSlider.master" AutoEventWireup="true" CodeFile="AdmissionForm.aspx.cs" Inherits="User_AdmissionForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <title>Admission Form</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="undermenuarea">
        <div class="boxedshadow">
        </div>
        <div class="grid">
            <div class="row">
                <div class="c8">
                    <h1 class="titlehead">Admission Form</h1>
                </div>
                <div class="c4">
                    <h1 class="titlehead rightareaheader"><i class="icon-map-marker"></i>Call Us Now +91 7006305281</h1>
                </div>
            </div>
        </div>
    </div>

    <div class="grid">
        <div class="row space-top">
            <div class="c12">
                <div class="c3">
                    <label>
                        First Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="FNameTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="FNameTb" runat="server"></asp:TextBox>
                </div>
                <div class="c3">
                    <label>
                        Middle Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="MNameTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="MNameTb" runat="server"></asp:TextBox>
                </div>
                <div class="c3">
                    <label>
                        Last Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="LNameTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="LNameTb" runat="server"></asp:TextBox>
                </div>
                <div class="c3">
                    <label>
                        DOB &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="DOBTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="DOBTb" TextMode="Date" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="c12">
                <div class="c3">
                    <label>
                        Gender                                 
                    </label>
                    <asp:RadioButtonList ID="gender" runat="server" RepeatDirection="Horizontal" >
                        <asp:ListItem Text="Male" Value="Male" Selected="true" />
                        <asp:ListItem Text="Female" Value="FeMale" />
                    </asp:RadioButtonList>
                </div>
                <div class="c3">
                    <label>
                        Address &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="AddressTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="AddressTb" TextMode="MultiLine" Rows="2" runat="server"></asp:TextBox>
                </div>
                <div class="c3">
                    <label>
                        State &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="StateTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="StateTb" runat="server"></asp:TextBox>
                </div>
                <div class="c3">
                    <label>
                        PIN Code &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="PINTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="PINTb" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="c12">
                <div class="c4">
                    <label>
                        Email Id &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="EmailTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="EmailTb" runat="server"></asp:TextBox>
                </div>
                <div class="c4">
                    <label>
                        Father Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="FatherNameTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="FatherNameTb" runat="server"></asp:TextBox>
                </div>
                <div class="c4">
                    <label>
                        Mother Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="MotherNameTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="MotherNameTb" runat="server"></asp:TextBox>
                </div>                
            </div>
            <div class="c12">                
                <div class="c4">
                    <label>
                        Student Mobile &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="StuMobTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="StuMobTb" runat="server"></asp:TextBox>
                </div>
                <div class="c4">
                    <label>
                        Father Mobile &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Fill This Field" Text="Fill This Field" ControlToValidate="FaMobTb" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:TextBox ID="FaMobTb" runat="server"></asp:TextBox>
                </div>
                <div class="c4">   
                   <label>
                        Admission In &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Select AdmissionIn" Text="Select AdmissionIn" InitialValue="--To Select--" ControlToValidate="AdmissionDD" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>                                
                    </label>
                    <asp:DropDownList ID="AdmissionDD" CssClass="form-control" runat="server"></asp:DropDownList>             
                </div>
            </div>
            <div class="c12">                
                <div class="c4">
                    <label>
                        Photo &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Photo Required" Text="Photo Required" ControlToValidate="Photo" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>
                    <asp:FileUpload ID="Photo" runat="server" />
                </div>
                <div class="c4">
                    <label>
                        10th Marksheet &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="10th Marksheet Required" Text="10th Marksheet Required" ControlToValidate="TenMarkSheet" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>                    
                    <asp:FileUpload ID="TenMarkSheet" runat="server" />
                </div>
                <div class="c4"> 
                    <label>
                        12th Marksheet &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="12th Marksheet Required" Text="12th Marksheet Required" ControlToValidate="TewlveMarkSheet" Style="color: red; font-weight: 800;" ValidationGroup="ContForm"></asp:RequiredFieldValidator>
                    </label>                    
                    <asp:FileUpload ID="TewlveMarkSheet" runat="server" />
                </div>
            </div>
            <div class="c12 space-top">
                <div class="c5"></div>
                <div class="c2">
                    <asp:Button ID="SubmitBtn" runat="server" Text="SUBMIT" class="button" ValidationGroup="ContForm" Style="font-size: 12px;" OnClick="SubmitBtn_Click" />
                </div>
                <div class="c5"></div>
            </div>
        </div>
    </div>

</asp:Content>

