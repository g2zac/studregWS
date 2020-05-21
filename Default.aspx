<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #container > * {
            margin: 0 50px;
        }

        #container > div:first-child {
            margin-right: 25px;
        }

        #container > div:last-child {
            margin-left: 25px;
        }

        .text_heading {
            color: #3b5998;
            font-size: 2rem;
            text-shadow: 2px 2px 10px #007449;
        }

        div {
            border-radius: 5px;
        }

        #home {
            text-align: center;
            background-color: rgb(226, 252, 247);
            box-shadow: 0px 0px 20px rgb(236, 59, 93);
            transition: 0.4s;
            flex: 2;
            display: flex;
            flex-direction: column;
        }

            #home:hover {
                color: black;
                background-color: white;
                box-shadow: 0px 0px 50px 0 rgba(234, 36, 74, 0.5);
            }

        #welcome {
            margin: auto 50px;
            overflow: auto;
        }

        h2 {
            padding: 20px 30px;
            text-align: center;
        }

        h3 {
            margin-bottom: 20px;
            padding: 10px 30px;
            text-align: justify;
            text-justify: inter-word;
        }

        #panel {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

            #panel .register {
                text-align: center;
                background-color: rgb(226, 252, 247);
                box-shadow: 0px 5px 40px rgb(236, 59, 93);
                transition: 0.3s;
                height: 25vh;
                margin-bottom: 50px;
            }

                #panel .register:hover {
                    color: black;
                    background-color: white;
                    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                }

            #panel .notice {
                text-align: center;
                background-color: rgb(226, 252, 247);
                box-shadow: 0px 5px 40px rgb(236, 59, 93);
                transition: 0.3s;
                flex: 3;
                overflow: hidden;
            }

                #panel .notice:hover {
                    color: black;
                    background-color: white;
                    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                }

            #panel > .notice > .scroller {
                padding: 10px 30px;
            }

        li {
            text-align: justify;
            text-justify: inter-word;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div id="home">

        <div style="margin-top: 50px;"><strong class="text_heading">Welcome to Home Page!</strong></div>
        <div id="welcome">
            <h2>About the Educational Group</h2>

            <h3>University of Engineering & Management (UEM) aims to provide an international ambience and exposure with innovative teaching techniques and courses which are tailor made (technical & soft skills) for the job market giving the students the winning edge and competitive advantage during placements.</h3>

            <h2>Recognition</h2>

            <h3>Established by Govt. of Rajasthan, Act 5 of 2012
Recognized by UGC, Ministry of HRD, Govt of India
The School of Engineering and Management under UEM Jaipur is called Institute of Engineering & Management (IEM), Jaipur. IEM Jaipur is approved by AICTE.
Member of Association of Indian Universities (AIU)
Member of Association Commonwealth Universities, London, UK
Accredited by ICRA
            </h3>

        </div>
    </div>

    <div id="panel">

        <div class="register">
            <div style="margin-top: 20px;"><strong><span class="text_heading">New Students</span></strong></div>

            <asp:ImageButton ID="RegImgBtn" runat="server" ImageAlign="AbsMiddle" ImageUrl="~/App_Items/register.png" Height="120px" Width="300px" OnClick="ImageButton1_Click" />

        </div>


        <div class="notice">
            <div style="margin-top: 20px;"><strong><span class="text_heading">Achievements</span></strong></div>
            <br />

            <div class="scroller">
                <marquee behavior="scroll" direction="up" scrollamount="3"
                    onmouseover="this.stop();"
                    onmouseout="this.start(); this.setAttribute('scrollamount', 3, 0);">
                        <li>UEM Jaipur won the International “Best Engineering Institute Award” under the “Education Leadership Program” of “Golden give Tigers Award”, 2017</li>
                        <br /><li>UEM Jaipur won the “Education Excellence Award” from “Competition Success Review” in 2017</li>
                        <br /><li>UEM Jaipur won the “Best Private University in Rajasthan” Award from “Prime Time”, NDTV in 2017</li>
                        <br /><li>UEM Jaipur students won the 12th position out of 300 participant colleges all over the world in the prestigious international “Mega ATV Championship”</li>
                        <br /><li>The educational group has one of the strongest Placement Cells in the country. Right from its inception both IEM and UEM have provided for 1 to 2 jobs on an average for all its students. The same story has been repeated even in the year 2016 with all students of both IEM and UEM getting 1 to 2 job offers on average.</li>
                </marquee>
            </div>

        </div>


    </div>


</asp:Content>



