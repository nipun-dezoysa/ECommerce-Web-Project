
<div class="bg-yellow-500 text-black flex flex-col md:flex-row justify-evenly gap-3 items-center font-mono p-5 overflow-hidden">
  <div class="flex flex-col items-center">
    <h1 class="text-4xl font-bold">Flash Sale Ends In</h1>
    <div class="flex gap-5 font-semibold" id="countdown">
      <div class="flex flex-col items-center">
        <div>Days</div>
        <div class="text-3xl" id="days">00</div>
      </div>
      <div class="flex flex-col items-center">
        <div>Hours</div>
        <div class="text-3xl" id="hours">00</div>
      </div>
      <div class="flex flex-col items-center">
        <div>Minutes</div>
        <div class="text-3xl" id="minutes">00</div>
      </div>
      <div class="flex flex-col items-center">
        <div>Seconds</div>
        <div class="text-3xl   animate-ping" id="seconds">00</div>
      </div>
    </div>
  </div>
  <div data-aos="slide-left" class="flex gap-5">
    <div><img src="./img/nikelogo.png" alt="" /></div>
    <div><img src="./img/jordan.png" alt="" /></div>
    <div><img src="./img/adidas.png" alt="" /></div>
    <div><img src="./img/newbalance.png" alt="" /></div>
  </div>
</div>

<script>
  var flashSaleEndTime = new Date("2024-05-01T00:00:00Z").getTime();

  var countdownInterval = setInterval(function () {
    var now = new Date().getTime();

    var timeRemaining = flashSaleEndTime - now;

    var days = Math.floor(timeRemaining / (1000 * 60 * 60 * 24));
    var hours = Math.floor(
      (timeRemaining % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)
    );
    var minutes = Math.floor((timeRemaining % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((timeRemaining % (1000 * 60)) / 1000);

    document.getElementById("days").innerHTML = "" + numformat(days);
    document.getElementById("hours").innerHTML = "" + numformat(hours);
    document.getElementById("minutes").innerHTML = "" + numformat(minutes);
    document.getElementById("seconds").innerHTML = "" + numformat(seconds);

    if (timeRemaining < 0) {
      clearInterval(countdownInterval);
      document.getElementById("countdown").innerHTML = "Flash Sale has ended!";
    }
  }, 1000);

  function numformat(num) {
    return num < 10 ? "0" + num : num;
  }
</script>
