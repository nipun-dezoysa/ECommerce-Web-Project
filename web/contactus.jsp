<%-- 
    Document   : contactus
    Created on : Mar 30, 2024, 2:24:44 PM
    Author     : chith
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/contactus.css">
        <title>JSP Page</title>
        <jsp:include page="nav.jsp" />
    </head>
<body>
    <div class="container">
        <div class="left-section">
          <!-- Content for left section -->
          <h2>Feel free to reach us using the below methods...</h3>
          <div class="">
            <hr>
          </div>
          <p>This is the left section content.</p>


          <div class="container2">
                  <table border="0">
        <tr>
          <td><div class="icon"><img src="img/phone.png" alt="Phone Icon"></div></td>
          <td>
            <div class="icon-text">
            <h6>Call Us</h6>
            <p>0112345678<br>0112456789</p>
            </div>
          </td>
          <td></td>
          <td><div class="icon"><img src="img/phone.png" alt="Phone Icon"></div></td>
          <td>
            <div class="icon-text">
            <h6>Open Hours</h6>
            <p>12 pm<br>12 am</p>
            </div>
          </td>
        </tr>
        <tr>
          <td><div class="icon"><img src="img/phone.png" alt="Phone Icon"></div></td>
          <td>
            <div class="icon-text">
            <h6>Address</h6>
            <p>weerapokum<br>weerapokum</p>
            </div>
          </td>
          <td></td>
          <td><div class="icon"><img src="img/phone.png" alt="Phone Icon"></div></td>
          <td>
            <div class="icon-text">
            <h6>Email Us</h6>
            <p>shoetopia@gmail.com</p>
            </div>
          </td>
        </tr>
      </table>
          </div>


        </div>

<!-- Content for right section -->
        <div class="right-section">
          
          <form>
            <table border="0">
              <tr>
                <td>Name <span style="color: red;">*</span></td>
                <td>Phone Number <span style="color: red;">*</span></td>
              </tr>
              <tr>
                <td><input type="text" style="width: 100%;" required></td>
                <td><input type="tel" style="width: 100%;" required></td>
              </tr>
              <tr>
                <td colspan="2">Email <span style="color: red;">*</span></td>
              </tr>
              <tr>
                <td colspan="2"><input type="email" style="width: 100%;" required></td>
              </tr>
              <tr>
                <td colspan="2">Your Message <span style="color: red;">*</span></td>
              </tr>
              <tr>
                <td colspan="2"><textarea  rows="5" style="width: 100%;" required></textarea></td>
              </tr>
              <tr>
                <td colspan="2"><button>Submit</button></td>
              </tr>
      
            </table>
          </form>


        </div>
        
        
      </div>

      <br><br><br>
      <section><div class="container">
            <iframe width="100%" height="250px" frameborder="0" title="map" marginheight="0" marginwidth="0" scrolling="no" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31691.02888402245!2d79.98561827313075!3d6.8451341218721025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2518e99e2ee8d%3A0xc3eebfdbc86273ee!2sHomagama!5e0!3m2!1sen!2slk!4v1711874071369!5m2!1sen!2slk"
             width="300" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div></section><br>


        <jsp:include page="footer.jsp" />
</body>

</html>
