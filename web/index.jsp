<!DOCTYPE html>
<html>
  <head>
    <title>TODO supply a title</title>

    <jsp:include page="./WEB-INF/components/nav.jsp" />

    <!-- updated-->

    <jsp:include page="./WEB-INF/components/hero.jsp" />

    <div
      class="lg:px-[100px] md:px-[50px] px-5 w-full py-5 overflow-hidden flex flex-col gap-2"
    >
      <div class="font-bold text-2xl w-full">New Arrivals</div>
      <div class="flex flex-wrap gap-2 justify-between">
        <% for(int i=0;i<6;i++){ %>
        <jsp:include page="./WEB-INF/components/productCard.jsp">
          <jsp:param name="name" value="Nike Air 2 Jordan" />
          <jsp:param name="src" value="./img/demo.jpg" />
        </jsp:include>
        <% } %>
      </div>
    </div>

    <div
      class="lg:px-[100px] md:px-[50px] px-5 w-full py-5 overflow-hidden flex flex-col gap-2"
    >
      <div class="font-bold text-2xl w-full">New Arrivals</div>
      <div class="flex flex-wrap gap-2 justify-between">
        <% for(int i=0;i<6;i++){ %>
        <jsp:include page="./WEB-INF/components/productCard.jsp">
          <jsp:param name="name" value="Nike Air 2 Jordan" />
          <jsp:param name="src" value="./img/demo.jpg" />
        </jsp:include>
        <% } %>
      </div>
    </div>
    <!-- contents end here -->

    <jsp:include page="./WEB-INF/components/footer.jsp" />