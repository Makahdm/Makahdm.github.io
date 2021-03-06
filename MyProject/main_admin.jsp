<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="myPac.FileDAO"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLEncoder"%>
<%

if(session.getAttribute("username")==null){
	
	 out.print("<script language='javascript'>alert('请先登录');window.location.href='log.jsp';</script>");
}

String academy=null;
academy=(String)session.getAttribute("academy");
if(academy==null){
    academy="all";
}

%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    
     <link rel="stylesheet" media="(min-width:390px)" id="templatecss" type="text/css" href="CSS/main_admin_table.css">
      <link rel="stylesheet" media="(max-width: 389px)" id="templatecss" type="text/css" href="CSS/main_admin_table2.css">
    <link rel="stylesheet" href="./CSS/main_student.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
<body>


   <div class="sidebar">
    <div class="logo-details">
      <i class='bx bxl-c-plus-plus icon'></i>
        <div class="logo_name">Welcome</div>
        <i class='bx bx-menu' id="btn" ></i>
    </div>
    <ul class="nav-list">
      
      <li>
       <a href="main_admin.jsp">
         <i class='bx bx-add-to-queue' ></i>
         <span class="links_name">Add Course</span>
       </a>
       <span class="tooltip">Add Course</span>
     </li>
     
     <li>
       <a href="main_admin_delete.jsp">
         <i class='bx bx-spreadsheet' ></i>
         <span class="links_name">Courses</span>
       </a>
       <span class="tooltip">Courses</span>
     </li>
     <li>
       <a href="main_admin_manage.jsp">
         <i class='bx bx-user' ></i>
         <span class="links_name">User Info</span>
       </a>
       <span class="tooltip">UserInfo</span>
     </li>
     <li>
     
     <li>
       <a href="main_admin_class.jsp">
         <i class='bx bx-edit' ></i>
         <span class="links_name">Class Manage</span>
       </a>
       <span class="tooltip">Class Manage</span>
     </li>
     
      <li>
       <a href="main_admin_chart.jsp">
         <i class='bx bx-chart' ></i>
         <span class="links_name">Chart</span>
       </a>
       <span class="tooltip">Chart</span>
     </li>
     <li>
     
       <a href="main_admin_upload.jsp">
         <i class='bx bx-folder' ></i>
         <span class="links_name">File Manager</span>
       </a>
       <span class="tooltip">Files</span>
     </li>
     
     <li class="profile">
         
        <a href="log.jsp">
         <span class="links_name">Exit</span>
         <i class='bx bx-log-out' id="log_out" ></i>
           </a>
           
     </li>
    </ul>
  </div>
  
  
  
  
  <section class="home-section">
  <form action="addClass" method="post" class="dark-matter">
                 <h1>添加课程
                        <span>Please fill all the texts in the fields.</span>
                 </h1>
                 <label>
                          <span >开设学院:</span>
                          <%if(academy.equals("all"))
                        		  {
                          %>
                          <select id="template" name="coursefrom">
 
                                   <option value="国服学院">国服学院</option>
 
                                   <option value="音乐学院">音乐学院</option>
 
                                   <option value="数学学院">数学学院</option>
 
                                   <option value="外国语学院">外国语学院</option>
 
                                   <option value="人学学院">人学学院</option>
 
                                   <option value="体育学院">体育学院</option>
 
                          </select>
                          <%}
                          
                          else{
                        	  session.setAttribute("tempAcademy", academy);
                        	  
                          %>
                          <select id="template" name="coursefrom" aria-label="Disabled select example" disabled>
                              <option value=<%=academy %> selected><%=academy %></option>
                              
                            </select>
                          <%
                          }%>
 
                 </label>
                 
                 <label>
 
                          <span>课程类型:</span>
 
                          <select id="template" name="coursetype">
 
                                   <option value="通识课">通识课</option>
 
                                   <option value="选修课">选修课</option>
 
                                   <option value="必修课">必修课</option>
 
 
                          </select>
 
                 </label>
                 
                   <label>
 
                          <span>开设时间:</span>
 
                          <select id="template" name="startfrom">
 
                                   <option value="2020-1">2020-1</option>
 
                                   <option value="2020-2">2020-2</option>
 
                                   <option value="2021-1">2021-1</option>
                                   
                                   <option value="2021-2">2021-2</option>
 
 
                          </select>
 
                 </label>
                 
                   <label>
 
                          <span>课程时间:</span>
 
                          <select id="template" name="coursetime">
 
                                   <option value="Monday">Monday</option>
 
                                   <option value="Tuesday">Tuesday</option>
 
                                   <option value="Wednesday">Wednesday</option>
                                   
                                   <option value="Thursday">Thursday</option>
                                   
                                   <option value="Friday">Friday</option>
 
 
                          </select>
 
                 </label>
                 
                  <label>

                          <span>课程节次:</span>
 
                          <input id="name" type="text" name="coursetime2" placeholder="please input number" />
 
                 </label>
                 
                 
 
                 <label>

                          <span>课程名称:</span>
 
                          <input id="name" type="text" name="coursename" placeholder="Full Class Name" />
 
                 </label>
 
                 <label>
 
                          <span>教师名称 :</span>
 
                          <input  type="text" name="teachername" placeholder="Full teacher Name" />
 
                 </label>
 
                  <label>
 
                          <span>学分 :</span>
                          
                          <input type="text" name="credit" placeholder="please input number 1-6" />
 
                 </label>
                 
                  <label>

                          <span>前置课程:</span>
 
                          <input id="name" type="text" name="limitcourse" placeholder="please input coursename" />
 
                 </label>
                 
                  <label>

                          <span>适用专业:</span>
 
                          <input id="name" type="text" name="limitmajor" placeholder="please input major" />
 
                 </label>
 
                <label>
 
                          <span>容量:</span>
                          
                          <input type="text" name="capacity" placeholder="please input number 20-150" />
 
                 </label>
                 
                 
                   <label>
 
                          <span>课程介绍:</span>
                          
                          <input type="text" name="info" placeholder="please input the info" />
 
                 </label>
                 
                 
 
                 <label>
 
                          <span>&nbsp;</span>
 
                          <button class="button">Add Class</button>
 
                 </label>
 
         </form>

  </section>
  <script>
  
  const sidebar = document.querySelector(".sidebar");
  const closeBtn = document.querySelector("#btn");
  const searchBtn = document.querySelector(".bx-search");
  
 

  closeBtn.addEventListener("click", () =>{
    sidebar.classList.toggle("open");
    menuBtnChange();//calling the function(optional)
  });

  searchBtn.addEventListener("click", ()=>{ // Sidebar open when you click on the search iocn
    sidebar.classList.toggle("open");
    menuBtnChange(); //calling the function(optional)
  });

  // following are the code to change sidebar button(optional)
  function menuBtnChange() {
   if(sidebar.classList.contains("open")){
     closeBtn.classList.replace("bx-menu", "bx-menu-alt-right");//replacing the iocns class
   }else {
     closeBtn.classList.replace("bx-menu-alt-right","bx-menu");//replacing the iocns class
   }
  }
  </script>

</body>
</html>
