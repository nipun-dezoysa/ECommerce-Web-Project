<!DOCTYPE html>
<html>
<head>
  <title>Contact Us</title>
  <jsp:include page="./WEB-INF/components/Imports.jsp" />
  <style>
      .container {
  padding-top: 70px;
  max-width: 1200px;
  width: 96% !important;
  margin: 0 auto;
  
}
    .left-section, .right-section {
      flex: 1;
    }
      .contact-info {
  margin-top: 20px;
}

.contact-item {
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.contact-item .icon {
  margin-right: 15px;
}

.contact-item img {
  width: 30px;
  height: auto;
}

.contact-item h4 {
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 5px;
}

.contact-item p {
  font-size: 14px;
}

.form-group {
  margin-bottom: 20px;
}

.formtext {
  display: block;
  margin-bottom: 5px;
}

.forminput {
  width: 100%;
  padding: 10px;
  border-radius: 5px;
  border: 1px solid #ccc;
}

button {
  background-color: #1B2330;
  color: #ffffff;
  border-radius: 5px;
  padding: 10px 20px;
  border: none;
  cursor: pointer;
}

button:hover {
  background-color: #405270;
}

  </style>
</head>
<body>
  <jsp:include page="./WEB-INF/components/nav.jsp" />
  <div class="container flex">
      
<div class="left-section">
  <div class="fst">
    <!-- Content for left section -->
    <h1 class="mb-2 text-2xl md:text-4xl font-bold" style="font-size: 35px; font-weight: bold; margin-left: -5px;">Contact Us</h1>
    <div class="" style="margin-top: -27px;">
      <hr style="background-color: #405270; height: 5px !important; text-align: left!important; margin: 5px!important; width: 8% !important; margin-top: 15px!important;">
    </div>
    <div class="feelfree" style="margin-top: 30px;">
      <p style="font-size: 18px !important;">Feel free to reach us using the below methods...</p>
    </div>
    
<div class="contact-info" style="margin-top: 20px; flex-wrap: wrap;">
    <div style="display: flex;">
  <div class="contact-item" style="flex: 1;">
    <div class="icon">
      <img src="img/phone.png" alt="Phone Icon" />
    </div>
    <div class="icon-text">
      <h4>Call Us</h4>
      <p>0112345678<br />0112456789</p>
    </div>
  </div>
  <div class="contact-item" style="flex: 1; margin-right: 20px;">
    <div class="icon">
      <img src="img/clock.png" alt="Clock Icon" />
    </div>
    <div class="icon-text">
      <h4>Open Hours</h4>
      <p>Monday - Sunday<br />9.00AM - 9.00PM</p>
    </div>
  </div>
        </div>
    <div style="display: flex;">
  <div class="contact-item" style="flex: 1; margin-top: 20px;">
    <div class="icon">
      <img src="img/Location.png" alt="Location Icon" />
    </div>
    <div class="icon-text">
      <h4>Address</h4>
      <p>173 High Level Rd,<br />Maharagama 10280</p>
    </div>
  </div>
  <div class="contact-item" style="flex: 1;">
    <div class="icon">
      <img src="img/mail.png" alt="Mail Icon" />
    </div>
    <div class="icon-text">
      <h4>Email Us</h4>
      <p>shoetopia@gmail.com</p>
    </div>
  </div>
</div>
</div>

    
    
  </div>
</div>

    <!-- Content for right section -->
    <div class="right-section">
      <form action="ContactFormServlet" method="post" style="padding: 4px 12px; background-color: #c6cbd4; border-radius: 15px;">
          
<div class="form-group" style="display: flex;">
  <div style="flex: 1; margin-right: 20px;">
    <label class="formtext" for="name">Name <span style="color: red">*</span></label>
    <input type="text" name="name" class="forminput" style="width: 100%;" required placeholder="Name" />
  </div>
  <div style="flex: 1;">
    <label class="formtext" for="phone">Phone Number <span style="color: red">*</span></label>
    <input type="tel" name="phone" class="forminput" style="width: 100%" required placeholder="Phone Number" />
  </div>
</div>

          
        <div class="form-group">
          <label class="formtext" for="email">Email <span style="color: red">*</span></label>
          <input type="email" name="email" class="forminput" style="width: 100%" required placeholder="Email Address" />
        </div>
        <div class="form-group">
          <label class="formtext" for="message">Your Message <span style="color: red">*</span></label>
          <textarea name="message" class="forminput" rows="5" style="width: 100%" required placeholder="Your Message..."></textarea>
        </div>
        <button style="background-color: #1B2330 !important; color: #ffffff !important; border-radius: 5px !important; padding: 10px 20px 10px 20px !important;" onmouseover="this.style.backgroundColor='#405270'" onmouseout="this.style.backgroundColor='#1B2330'">Submit</button>
      </form>
    </div>
  </div>
  <br />
  <section>
    <div class="container">
      <iframe
        width="100%"
        height="250px"
        frameborder="0"
        title="map"
        marginheight="0"
        marginwidth="0"
        scrolling="no"
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31691.02888402245!2d79.98561827313075!3d6.8451341218721025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2518e99e2ee8d%3A0xc3eebfdbc86273ee!2sHomagama!5e0!3m2!1sen!2slk!4v1711874071369!5m2!1sen!2slk"
        width="300"
        height="250"
        style="border: 0"
        allowfullscreen=""
        loading="lazy"
        referrerpolicy="no-referrer-when-downgrade"
      ></iframe>
    </div>
  </section>
  <br />
  <jsp:include page="./WEB-INF/components/footer.jsp" />
</body>
</html>
