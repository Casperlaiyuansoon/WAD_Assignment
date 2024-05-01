<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="WAD_Assignment.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css" rel="stylesheet" />
        <link rel="stylesheet" href="homepage.css" />
        <title>TarFlight</title>
    </head>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <header class="section__container header__container">
        <h1 class="section__header">Find And Book<br />A Great Experience</h1>
        <img src="Image/header.jpg" alt="header" />
    </header>

    <section class="section__container booking__container">
        <div class="booking__nav">
            <asp:Button ID="btneEconomy" CssClass="booking__nav" runat="server" text="Economy" />
            <asp:Button ID="btnPremiumEconomy" runat="server" text="Premium Economy" />
            <asp:Button ID="btnBusinessClass" runat="server" text="Business Class" />
            <asp:Button ID="btnFirstClass" runat="server" text="First Class" />
        </div>

         <%--Destination Location--%>
        <form>
            <div class="form__group">
                <span><i class="ri-map-pin-line"></i></span>
                <div class="input__content">
                    <div class="input__group">
                         <p>From</p>
                        <asp:TextBox ID="txtLocation" runat="server" placeholder="Frying from"></asp:TextBox>
                        <asp:Label ID="lbLocation" runat="server"></asp:Label>
                    </div>
                </div>
            </div>

             <%--Daparture Date--%>
            <div class="form__group">
                <span><i class="ri-map-pin-line"></i></span>
                <div class="input__content">
                    <div class="input__group">
                        <p>To</p>
                        <asp:TextBox ID="txtDestination" runat="server" placeholder="Frying to"></asp:TextBox>
                        <asp:Label ID="lbdestination" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
            
            <%--Return Date--%>
            <div class="form__group">
                <span><i class="ri-calendar-line"></i></span>
                <div class="input__content">
                    <div class="input__group">
                        <p>Departure</p>
                        <asp:TextBox ID="txtstartdate" runat="server"  TextMode="Date"></asp:TextBox>
                        <asp:Label ID="lbstartdate" runat="server"></asp:Label>
                    </div>
                </div>
            </div>

            <%--Search button --%>
            <div class="form__group">
                <span><i class="ri-calendar-line"></i></span>
                <div class="input__content">
                    <div class="input__group">
                        <p>Detination</p>
                        <asp:TextBox ID="txtReturnDate" runat="server" TextMode="Date"></asp:TextBox>
                        <asp:Label ID="lbReturnDate" runat="server"></asp:Label>
                    </div>
                </div>
            </div>

            <%--Search button --%>
            <asp:Button ID="btnSearch" CssClass="btn" runat="server" Text="Search" OnClick="btnSearch_Click"></asp:Button>
               
        </form>


    </section>
    
     <section class="section__container plan__container">
      <p class="subheader">TRAVEL SUPPORT</p>
      <h2 class="section__header">Plan your travel with confidence</h2>
      <p class="description">
        Find help with your bookings and travel plans, and seee what to expect
        along your journey.
      </p>
      <div class="plan__grid">
        <div class="plan__content">
          <span class="number">01</span>
          <h4>Travel Requirements for Dubai</h4>
          <p>
            Stay informed and prepared for your trip to Dubai with essential
            travel requirements, ensuring a smooth and hassle-free experience in
            this vibrant and captivating city.
          </p>
          <span class="number">02</span>
          <h4>Multi-risk travel insurance</h4>
          <p>
            Comprehensive protection for your peace of mind, covering a range of
            potential travel risks and unexpected situations.
          </p>
          <span class="number">03</span>
          <h4>Travel Requirements by destinations</h4>
          <p>
            Stay informed and plan your trip with ease, as we provide up-to-date
            information on travel requirements specific to your desired
            destinations.
          </p>
        </div>
        <div class="plan__image">
          <img src="Image/plan-1.jpg" alt="plan" />
          <img src="Image/plan-2.jpg" alt="plan" />
          <img src="Image/plan-3.jpg" alt="plan" />
        </div>
      </div>
    </section>

    <section class="memories">
      <div class="section__container memories__container">
        <div class="memories__header">
          <h2 class="section__header">
            Travel to make memories all around the world
          </h2>
          <button class="view__all">View All</button>
        </div>
        <div class="memories__grid">
          <div class="memories__card">
            <span><i class="ri-calendar-2-line"></i></span>
            <h4>Book & relax</h4>
            <p>
              With "Book and Relax," you can sit back, unwind, and enjoy the
              journey while we take care of everything else.
            </p>
          </div>
          <div class="memories__card">
            <span><i class="ri-shield-check-line"></i></span>
            <h4>Smart Checklist</h4>
            <p>
              Introducing Smart Checklist with us, the innovative solution
              revolutionizing the way you travel with our airline.
            </p>
          </div>
          <div class="memories__card">
            <span><i class="ri-bookmark-2-line"></i></span>
            <h4>Save More</h4>
            <p>
              From discounted ticket prices to exclusive promotions and deals,
              we prioritize affordability without compromising on quality.
            </p>
          </div>
        </div>
      </div>
    </section>

    <section class="section__container lounge__container">
      <div class="lounge__image">
        <img src="image/lounge-1.jpg" alt="lounge" />
        <img src="image/lounge-2.jpg" alt="lounge" />
      </div>
      <div class="lounge__content">
        <h2 class="section__header">Unaccompanied Minor Lounge</h2>
        <div class="lounge__grid">
          <div class="lounge__details">
            <h4>Experience Tranquility</h4>
            <p>
              Serenity Haven offers a tranquil escape, featuring comfortable
              seating, calming ambiance, and attentive service.
            </p>
          </div>
          <div class="lounge__details">
            <h4>Elevate Your Experience</h4>
            <p>
              Designed for discerning travelers, this exclusive lounge offers
              premium amenities, assistance, and private workspaces.
            </p>
          </div>
          <div class="lounge__details">
            <h4>A Welcoming Space</h4>
            <p>
              Creating a family-friendly atmosphere, The Family Zone is the
              perfect haven for parents and children.
            </p>
          </div>
          <div class="lounge__details">
            <h4>A Culinary Delight</h4>
            <p>
              Immerse yourself in a world of flavors, offering international
              cuisines, gourmet dishes, and carefully curated beverages.
            </p>
          </div>
        </div>
      </div>
    </section>

    <section class="section__container travellers__container">
      <h2 class="section__header">Best travellers of the month</h2>
      <div class="travellers__grid">
        <div class="travellers__card">
          <img src="Image/traveller-1.jpg" alt="traveller" />
          <div class="travellers__card__content">
            <img src="image/client-1.jpg" alt="client" />
            <h4>Emily Johnson</h4>
            <p>Dubai</p>
          </div>
        </div>
        <div class="travellers__card">
          <img src="Image/traveller-2.jpg" alt="traveller" />
          <div class="travellers__card__content">
            <img src="image/client-2.jpg" alt="client" />
            <h4>David Smith</h4>
            <p>Paris</p>
          </div>
        </div>
        <div class="travellers__card">
          <img src="Image/traveller-3.jpg" alt="traveller" />
          <div class="travellers__card__content">
            <img src="image/client-3.jpg" alt="client" />
            <h4>Olivia Brown</h4>
            <p>Singapore</p>
          </div>
        </div>
        <div class="travellers__card">
          <img src="Image/traveller-4.jpg" alt="traveller" />
          <div class="travellers__card__content">
            <img src="image/client-4.jpg" alt="client" />
            <h4>Daniel Taylor</h4>
            <p>Malaysia</p>
          </div>
        </div>
      </div>
    </section>

    <section class="subscribe">
      <div class="section__container subscribe__container">
        <h2 class="section__header">Subscribe newsletter & get latest news</h2>
          <form class="subscribe__form">
              <asp:TextBox ID="txtemail" runat="server" placeholder="Enter your email here" ></asp:TextBox> 
              <asp:Button ID="btnSubcribe"  CssClass="btn" runat="server" Text="Subscribe"  />
          </form>
      </div>
    </section>
    
</asp:Content>

