<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #container {
            margin: 20px 0;
            overflow-y: auto !important;
            overflow-x: hidden !important;
            height: auto;
        }

            #container > * {
                margin: 20px 30px;
            }

        /*#container > div:first-child {
                margin-right: 15px;
            }

            #container > div:last-child {
                margin-left: 15px;
            }*/


        #form {
            flex: 2;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            margin: 3vh 10vw;
            background-color: #C6F3F3;
            box-shadow: 0px 0 40px rgb(236, 59, 93);
            transition: 0.3s;
            border-radius: 10px;
            //min-height: 120vh;
            overflow: auto;
        }

            #form:hover {
                background-color: #41FFB8;
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }

        #form-header {
            margin: auto;
            text-align: center;
            font-weight: 1000;
            padding: 40px 0 0;
            color: #3b5998;
            font-size: 2rem;
            text-decoration: underline;
            text-shadow: 2px 2px 7px #007449;
        }

        .label.stud, .label.parent {
            padding: 10px 70px;
            transition: 0.3s;
        }

            .label.stud:hover, .label.parent:hover {
                background-color: #C6F3F3;
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                margin: 5px 20px;
                padding: 5px 50px;
                border: 2px solid #ddd;
                border-radius: 5px;
            }


        legend {
            color: #3b5998;
            padding: 2px;
            text-align: center;
            font-size: 1.5rem;
            font-weight: 500;
            font-weight: bold;
        }

        fieldset {
            margin: 40px 50px;
            border-radius: 5px;
        }


        .details {
            display: flex;
        }

        .label-items {
            margin: auto;
        }

        .dob-box {
            width: 50px;
            margin: 10px 5px;
        }

        .item-box {
            width: 200px;
            margin: 10px 5px;
            border-radius: 0 7px 7px 0;
        }

            .item-box > * {
                margin: auto;
            }

        .RBL {
            display: flex;
        }

        .formatRBL label {
            margin: 2px 10px;
        }

        .label-box {
            width: 100px;
            margin: 10px 5px;
            padding-right: 5px;
            background-color: #41FFB8;
            border-radius: 7px 0 0 7px;
            text-align: right;
            display: inline-block;
        }

        .text-box {
            width: 200px;
            margin: 10px 5px;
            border-radius: 0 7px 7px 0;
        }

        .submit-box {
            margin: auto;
            border-radius: 55px/200px;
            transition: 0.3s;
        }

            .submit-box:hover {
                box-shadow: 0 0 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div id="form">

        <div id="form-header" class="label">
            STUDENT REGISTRATION FORM
        </div>

        <div style="flex: 1;">
            <fieldset>
                <legend>Student Details</legend>
                <div class="label stud">
                    <div class="details stud">
                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                            </div>

                            <asp:TextBox ID="sfname" class="text-box" runat="server" placeholder="Student First Name"></asp:TextBox>

                        </div>

                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                            </div>

                            <asp:TextBox ID="slname" class="text-box" runat="server" placeholder="Student Last Name"></asp:TextBox>

                        </div>
                    </div>

                    <div class="details stud">
                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label3" runat="server" Text="Date of Birth"></asp:Label>
                            </div>

                            <asp:TextBox ID="dob_dd" class="dob-box" runat="server" placeholder="dd" AutoPostBack="True" OnTextChanged="dob_selection"></asp:TextBox>
                            <asp:TextBox ID="dob_mm" class="dob-box" runat="server" placeholder="mm" AutoPostBack="True" OnTextChanged="dob_selection"></asp:TextBox>
                            <asp:TextBox ID="dob_yyyy" class="dob-box" runat="server" placeholder="yyyy" AutoPostBack="True" OnTextChanged="dob_selection"></asp:TextBox>


                        </div>

                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label4" runat="server" Text="Age"></asp:Label>
                            </div>

                            <asp:TextBox ID="age" class="text-box" runat="server" placeholder="Age" ReadOnly="True"></asp:TextBox>

                        </div>
                    </div>

                    <div class="details stud">
                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label13" runat="server" Text="Email"></asp:Label>
                            </div>

                            <asp:TextBox ID="semail" class="text-box" runat="server" placeholder="Student Email Id"></asp:TextBox>

                        </div>

                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label14" runat="server" Text="Mobile"></asp:Label>
                            </div>

                            <asp:TextBox ID="smobile" class="text-box" runat="server" placeholder="Student Mobile"></asp:TextBox>

                        </div>
                    </div>

                    <div class="details stud gender">


                        <div class="label-items RBL">
                            <div class="label-box">
                                <asp:Label ID="Label15" runat="server" Text="Gender"></asp:Label>
                            </div>

                            <div class="item-box">
                                <asp:RadioButtonList ID="GenderList" runat="server" RepeatDirection="Horizontal" class="formatRBL">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

                        </div>
                        <div class="label-items" style="display: flex;">

                            <div class="label-box">
                            </div>

                            <div class="text-box">
                            </div>

                        </div>

                    </div>

                </div>


            </fieldset>

            <fieldset>
                <legend>Course Details</legend>
                <div class="label stud">
                    <div class="details stud">
                        <div class="label-items RBL">

                            <div class="label-box">
                                <asp:Label ID="Label9" runat="server" Text="Degree Type"></asp:Label>
                            </div>

                            <div class="item-box">
                                <asp:RadioButtonList ID="CourseList" runat="server" RepeatDirection="Horizontal" class="formatRBL" AutoPostBack="True" OnSelectedIndexChanged="CourseList_SelectedIndexChanged">
                                    <asp:ListItem>Bachelors</asp:ListItem>
                                    <asp:ListItem>Masters</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>

                        </div>


                    </div>

                    <div class="details stud">
                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label11" runat="server" Text="Course Name"></asp:Label>
                            </div>


                            <asp:DropDownList ID="bcourse" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="bcourse_SelectedIndexChanged">
                                <asp:ListItem Value="default">-----select-----</asp:ListItem>
                                <asp:ListItem Value="B.Tech.">B.Tech.</asp:ListItem>
                                <asp:ListItem Value="BCA">BCA</asp:ListItem>
                                <asp:ListItem Value="BBA">BBA</asp:ListItem>
                                <asp:ListItem Value="BPT">BPT</asp:ListItem>
                            </asp:DropDownList>

                            <asp:DropDownList ID="mcourse" runat="server" Enabled="False" AutoPostBack="True" OnSelectedIndexChanged="mcourse_SelectedIndexChanged">
                                <asp:ListItem Value="default">-----select-----</asp:ListItem>
                                <asp:ListItem Value="M.Tech.">M.Tech.</asp:ListItem>
                                <asp:ListItem Value="MCA">MCA</asp:ListItem>
                                <asp:ListItem Value="MBA">MBA</asp:ListItem>
                                <asp:ListItem Value="MPT">MPT</asp:ListItem>
                            </asp:DropDownList>


                        </div>
                    </div>
                    <div class="details stud">
                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label12" runat="server" Text="Stream"></asp:Label>
                            </div>

                            <asp:DropDownList ID="stream" runat="server" Enabled="False">
                                <asp:ListItem Value="default">----------select----------</asp:ListItem>
                                <asp:ListItem Value="CSE">Computer Science</asp:ListItem>
                                <asp:ListItem Value="ECE">Electronics and Communication</asp:ListItem>
                                <asp:ListItem Value="EE">Electrical</asp:ListItem>
                                <asp:ListItem Value="EEE">Electrical and Electronics</asp:ListItem>
                                <asp:ListItem Value="CE">Civil</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>

                </div>


            </fieldset>

            <fieldset>
                <legend>Parent Details</legend>
                <div class="label parent">
                    <div class="details parent">
                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label5" runat="server" Text="Name"></asp:Label>
                            </div>

                            <asp:TextBox ID="pname" class="text-box" runat="server" placeholder="Parent Full Name"></asp:TextBox>

                        </div>

                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label6" runat="server" Text="Relation"></asp:Label>
                            </div>

                            <asp:DropDownList ID="prelation" class="text-box" runat="server">
                                <asp:ListItem Value="F">Father</asp:ListItem>
                                <asp:ListItem Value="M">Mother</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="details parent">
                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label7" runat="server" Text="Email"></asp:Label>
                            </div>

                            <asp:TextBox ID="pemail" class="text-box" runat="server" placeholder="Parent Email Id"></asp:TextBox>

                        </div>

                        <div class="label-items">

                            <div class="label-box">
                                <asp:Label ID="Label8" runat="server" Text="Mobile"></asp:Label>
                            </div>

                            <asp:TextBox ID="pmobile" class="text-box" runat="server" placeholder="Parent Mobile"></asp:TextBox>

                        </div>
                    </div>


                </div>
            </fieldset>

        </div>

        <div class="submit-box">
            <asp:ImageButton ID="SubmitImgBtn" runat="server" ImageUrl="~/App_Items/Submit.png" Height="100px" Width="250px" OnClick="SubmitImgBtn_Click" />
        </div>



        <div class="row" style="padding-bottom: 20px;">
        </div>
    </div>


</asp:Content>

