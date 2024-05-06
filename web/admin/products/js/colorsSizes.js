$(document).ready(function () {
  var scount = 0;
  $("#sadd").on("click", function () {
    var size = $("#size").val();
    if (size != "") {
      scount++;
      const cityt = document.createElement("div");
      const citys = document.createTextNode(size);
      cityt.setAttribute("class", "bg-primaryLight p-2 rounded-lg text-white");
      cityt.setAttribute("id", "sid" + scount);
      cityt.appendChild(citys);
      document.getElementById("sblock").appendChild(cityt);
      document.getElementById("size").value = "";
      $("<input>")
        .attr({
          type: "checkbox",
          id: "sc" + scount,
          name: "sizes",
          checked: "true",
          value: size,
          class: "hidden",
        })
        .appendTo("#pform");
    }
  });
  $("#sdelete").on("click", function () {
    if (scount > 0) {
      document.getElementById("sid" + scount).remove();
      document.getElementById("sc" + scount).remove();
      scount--;
    }
  });

  var count = 0;
  $("#cadd").on("click", function () {
    var color = $("#color").val();
    if (color != "") {
      count++;
      const cityt = document.createElement("div");
      const citys = document.createTextNode(color);
      cityt.setAttribute("class", "bg-primaryLight p-2 rounded-lg text-white");
      cityt.setAttribute("id", "cid" + count);
      cityt.appendChild(citys);
      document.getElementById("cblock").appendChild(cityt);
      document.getElementById("color").value = "";
      $("<input>")
        .attr({
          type: "checkbox",
          id: "cc" + count,
          name: "colors",
          checked: "true",
          value: color,
          class: "hidden",
        })
        .appendTo("#pform");
    }
  });
  $("#cdelete").on("click", function () {
    if (count > 0) {
      document.getElementById("cid" + count).remove();
      document.getElementById("cc" + count).remove();
      count--;
    }
  });
});
