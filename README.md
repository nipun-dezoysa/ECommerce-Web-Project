# ECommerce-Web-Project
Our final project for the course "Development of Enterprise Applications (DEA)" involved the development of an e-commerce website. This website enables users to buy footwear online, leveraging technologies such as JavaServer Pages (JSP) and Java Servlets. The complete source code, including all backend and frontend components, has been made available in this GitHub repository for reference and review purposes. Interested parties can access the repository to explore the implementation details and structure of our project.


# Shoetopia
Shoetopia offers a feature-rich e-commerce platform tailored to the needs of shoe enthusiasts. With its user-friendly interface, extensive product catalog, and robust administrative capabilities, Shoetopia aims to deliver a seamless shopping experience for users while empowering administrators to effectively manage the website's operations. Through continuous improvement and innovation, Shoetopia strives to remain a leading destination for online shoe shopping.
 <div align="center">
<img src="https://github.com/nipun-dezoysa/ECommerce-Web-Project/assets/127383230/03676aed-2a59-4a9b-b1a5-7fdb77abf99f"/>
</div>


## Installation

**Step 1:** Download and Install the follownig applications in your computer.
+ Git: https://git-scm.com
+ JDK 8u111: https://www.oracle.com/java/technologies/javase/javase8-archive-downloads.html
+ Netbeans 8.1: https://www.npackd.org/p/netbeans/8.1
+ Xampp: https://www.apachefriends.org/download.html
***

**Step 2:** Open Git bash and clone the repository or use [github desktop](https://desktop.github.com/) to clone the repository.
```bash
gh repo clone nipun-dezoysa/ECommerce-Web-Project
```
***

**Step 3:** Start Apache and MySQL services from xampp.

![Screenshot 2024-05-01 202755](https://github.com/nipun-dezoysa/ECommerce-Web-Project/assets/127383230/556e1b39-c3f3-4d1b-be55-a5b3c09712f5)
***

**Step 4:** Setup database with phpMyAdmin method to import content to the database and load to the website
+ Go to phpMyAdmin: http://localhost/phpmyadmin.
+ Create a database called **shoetopia**.
+ Select the Import tab, input the shoetopia.sql file that in project Database folder and then click Import.

![Screenshot 2024-05-01 203421](https://github.com/nipun-dezoysa/ECommerce-Web-Project/assets/127383230/001537ed-74a7-47f8-abed-2c2c52b44222)

+ After importing, there should be 3 Tables in the database as abook, activity, admin, colors, items, orders, products, sizes, users, viewcount, and wishlist.
***

**Step 5:** Open the project using Neatbeans 8.1 and then run index.jsp file. 

![Screenshot 2024-05-01 204632](https://github.com/nipun-dezoysa/ECommerce-Web-Project/assets/127383230/d69d7fa3-c0dd-46a8-8f35-6a39ba1eea37)
***

**Step 6:** Now the website should launch in the web browser.
***

## File structures

### Main JSP pages
 
```html
<html>
 <head>
  <title>Sample</title>
  <jsp:include page="./WEB-INF/components/Imports.jsp" />
 </head>
 <body>
  <jsp:include page="./WEB-INF/components/nav.jsp" />

  <!-- content -->

  <jsp:include page="./WEB-INF/components/footer.jsp" />
 </body>
</html>
```


### Admin Dashboard JSP pages

```html
<html>
 <head>
  <title>Admin</title>
  <jsp:include page="../WEB-INF/components/adminImports.jsp">
   <jsp:param name="path" value="" />
  </jsp:include>
 </head>
 <body>
  <jsp:include page="../WEB-INF/components/adminHead.jsp">
   <jsp:param name="path" value="" />
   <jsp:param name="no" value="1" />
  </jsp:include>

  <!-- content -->

  <jsp:include page="../WEB-INF/components/adminBottom.jsp" />
 </body>
</html>
```
***

## Frameworks and Open-source projects that used in this project.
+ [Tailwind](https://tailwindcss.com/)
+ [JQuery](https://jquery.com/)
+ [Sweet Alert](https://sweetalert2.github.io/)
+ [Flowbite](https://flowbite.com/)
+ [Font Awesome](https://fontawesome.com/)
