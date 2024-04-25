<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WAD_Assignment.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <head>
        <meta charset="UTF-8">
        <title>About Us </title>
        <link rel="stylesheet" href="AboutUs.css">
        <link rel="stylesheet" href="AboutUs2.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <body>

        <section class="about">
            <h1>Company history</h1>
            <div class="main">
                <img src="Image/About_Airplane.jpg"
                <div class="about-text">
                    <p>
                        Tarfly established in 2011 under Airpaz Limited. Our journey starts in 2014 with the first flight ticket sold out from our one-stop online booking platform, indicating that we had officially joined into the world of travel industry. Eventually, we expanded our service range from domestic flight to international flight and embarked on accommodation booking to lighten traveler's needs perfectly. As a third party, together with various airlines and accomodation partners, we successfully bring more than 3 million people into their ideal flights until today and the number continues to grow. Our aim is to let people enjoy their trips to the optimum extent right from the scratch.<br>
                        <br>
                        <br>
                        <br>
                        We are highly dedicated in giving the superb booking experience by providing flexible payment in local currency, local languages, effortless manage booking feature, easy booking steps, best fare calendar, and 24/7 customer support. More than 100.000 people has installed our app from Google Play and App Store, encouraging more people to travel the world only from their fingertips. Achieving amazing milestones will not stop us from upgrading our service better. Because, our journey is still a long way ahead. Soon, we will present greater service and fulfill traveling's demands in the global market range.
                    </p>
            </div>
                </div>
        </section>



        <div class="container">   
            <h2 class="ourteamFont">Our Team</h2>
            <div class="main-card">
                <div class="cards">
          
                    <%--Staff 1--%>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="image/AboutUs_staff1.jpg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Casper Lai Yuan Soon</div>
                                <div class="job">Web Designer</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>


                    <%--Staff 2--%>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="image/AboutUs_staff2.jpg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Yong Xian Xian</div>
                                <div class="job">UI Designer</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>


                    <%--Staff 3--%>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="image/AboutUs_staff3.jpg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Justin Chung</div>
                                <div class="job">Web Devloper</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>

                </div>
                <%--Staff 4--%>
                <div class="cards">
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="image/AboutUs_staff4.jpg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Appolo Reef</div>
                                <div class="job">Web Designer</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>

                    <%--Staff 5--%>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="image/AboutUs_staff5.jpg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Adrina Calvo</div>
                                <div class="job">UI Designer</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>

                    <%--Staff 6--%>
                    <div class="card">
                        <div class="content">
                            <div class="img">
                                <img src="image/AboutUs_staff6.jpeg" alt="">
                            </div>
                            <div class="details">
                                <div class="name">Nicole Lewis</div>
                                <div class="job">Web Devloper</div>
                            </div>
                            <div class="media-icons">
                                <a href="#"><i class="fab fa-facebook-f"></i></a>
                                <a href="#"><i class="fab fa-twitter"></i></a>
                                <a href="#"><i class="fab fa-instagram"></i></a>
                                <a href="#"><i class="fab fa-youtube"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           
            <div class="button">
            <asp:Label ID="lblone" for="one" CssClass="active one" runat="server" />
            <asp:Label ID="ltwo" for="two" CssClass="two" runat="server" />
            </div>
        </div>
    </body>
     

  
</asp:Content>

