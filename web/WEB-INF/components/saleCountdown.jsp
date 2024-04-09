<%-- 
    Document   : saleCountdown
    Created on : Apr 9, 2024, 2:20:10 PM
    Author     : samee
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <style>
/*      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        width: 100%;
      }*/

      .countdown-container {
        background-color: rgb(30, 30, 30);
        padding-top: 20px;
        padding-bottom: 20px;
        padding: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 100%;
        margin-top: 10px;
        margin-bottom: 10px;
      }

      .countdown {
        display: flex;
        justify-content: center;
      }

      .countdown-item {
        font-size: 20px;
        text-align: center;
        background-color: #e8e8e8;
        padding: 20px;
        margin: 0 10px;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }

      h1 {
        color: white;
        text-align: center;
        font-size: 36px;
        margin-bottom: 20px;
      }
    </style>
    </head>
    <body>
         <div class="countdown-container">
      <h1>Flash Sale Ends in</h1>
      <div class="countdown" id="countdown">
        <div class="countdown-item" id="days"></div>
        <div class="countdown-item" id="hours"></div>
        <div class="countdown-item" id="minutes"></div>
        <div class="countdown-item" id="seconds"></div>
      </div>
    </div>

    <script>
      var flashSaleEndTime = new Date("2024-04-10T00:00:00Z").getTime();

      var countdownInterval = setInterval(function () {
        var now = new Date().getTime();

        var timeRemaining = flashSaleEndTime - now;

        var days = Math.floor(timeRemaining / (1000 * 60 * 60 * 24));
        var hours = Math.floor(
          (timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
        );
        var minutes = Math.floor(
          (timeRemaining % (1000 * 60 * 60)) / (1000 * 60)
        );
        var seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);

        document.getElementById("days").innerHTML =
          "<span style='color: blue;'>Days</span><br>" + days;
        document.getElementById("hours").innerHTML =
          "<span style='color: green;'>Hours</span><br>" + hours;
        document.getElementById("minutes").innerHTML =
          "<span style='color: orange;'>Minutes</span><br>" + minutes;
        document.getElementById("seconds").innerHTML =
          "<span style='color: red;'>Seconds</span><br>" + seconds;

        if (timeRemaining < 0) {
          clearInterval(countdownInterval);
          document.getElementById("countdown").innerHTML =
            "Flash Sale has ended!";
        }
      }, 1000);
    </script>
    </body>
</html>
