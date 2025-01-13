<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String username = null;
    String emailid = null;
    Cookie[] cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("username")) {
                username = cookie.getValue();
            }
            if (cookie.getName().equals("email")) {
                emailid = cookie.getValue();
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<style>

 @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }
</style>
<body>
<nav class="w-screen flex justify-between items-center px-[20px] h-[10vh] bg-[#433878] text-white relative top-0 z-50">
    <div class="flex items-center gap-4">
    <img class="h-[4rem] stroke-black stroke-2 relative bottom-[7px]" src="Assets/logo1.png" />
          <a href="/Login_Registration" class="text-4xl font-bold">Eduler</a>
    </div>

      <ul class="flex w-[30%] justify-evenly items-center font-semibold uppercase">
        <li class="relative">
          <div class="group">
          <div class="flex justify-center gap-x-1.5 px-3 py-2 border border-white  cursor-pointer" id="exploreBtn">
                      <a class="cursor-pointer">EXPLORE</a>
          
           <svg class="-mr-1 h-5 w-5 text-white " viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" data-slot="icon">
        <path fill-rule="evenodd" d="M5.22 8.22a.75.75 0 0 1 1.06 0L10 11.94l3.72-3.72a.75.75 0 1 1 1.06 1.06l-4.25 4.25a.75.75 0 0 1-1.06 0L5.22 9.28a.75.75 0 0 1 0-1.06Z" clip-rule="evenodd" />
      </svg>
          </div>
          </div>
          <div class="absolute  z-10 mt-2 w-56  rounded-md bg-white shadow-lg ">
    <div class=" cursor-pointer  max-h-0 overflow-hidden transition-all duration-500 ease-in-out" id="exploreContainer">
      <!-- Active: "bg-gray-100 text-gray-900 outline-none", Not Active: "text-gray-700" -->
      <a href="main.jsp" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] rounded-t-md transition-all duration-300">Task</a>
      <a href="/Task/files.jsp?username=<%=username%>&email=<%=emailid%>" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] transition-all duration-300" >Files</a>
      <a href="/Task/paint.jsp?username=<%=username%>&email=<%=emailid%>" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] transition-all duration-300">Whiteboard</a>
       <a href="/Task/editor.jsp?username=<%=username%>&email=<%=emailid%>" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] transition-all duration-300" >Notes</a>
        <a href="/Task/schedule.jsp?username=<%=username%>&email=<%=emailid%>" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] transition-all duration-300" >Schedule</a>
    </div></div>
        </li>

        <li class="relative">
          <div class="group">
            <a href="/Login_Registration/about.jsp" class="cursor-pointer">about</a>
            <div class="absolute left-0 right-0 bottom-0 h-[2px] bg-white transform scale-x-0 transition-transform duration-300 group-hover:scale-x-100"></div>
          </div>
        </li>
        <li class="relative">
          <div class="group">
            <a href="/Login_Registration/contact.jsp" class="block">contact</a>
            <div class="absolute left-0 right-0 bottom-0 h-[2px] bg-white transform scale-x-0 transition-transform duration-300 group-hover:scale-x-100"></div>
          </div>
        </li>
        <li class="relative">
          <div class="group">
            <a href="login.jsp" id="login-container" style="display: none" class="block">login</a>
            <div class="absolute left-0 right-0 bottom-0 h-[2px] bg-white transform scale-x-0 transition-transform duration-300 group-hover:scale-x-100"></div>
          </div>
           <div id="logout-container" class="group" style="display: none">
        <form action="logout" method="post">
            <input type="submit"  class="block cursor-pointer" value="LOGOUT">
             <div class="absolute left-0 right-0 bottom-0 h-[2px] bg-white transform scale-x-0 transition-transform duration-300 group-hover:scale-x-100"></div>
        </form>
    </div>
        </li>
      </ul>
    </nav>
 <section>
      <div class=" min-h-[80vh] w-screen bg-[#D4BEE4]">
        <div class="flex justify-center items-center gap-[10rem]">
          <div class="flex items-center lg:mb-0 mb-10">
            <div id="contact">
              <h4 class="text-indigo-600 text-base font-medium leading-6 mb-4 lg:text-left text-center">Contact Us</h4>
              <h2 class="text-gray-900 font-manrope text-4xl font-semibold leading-10 mb-9 lg:text-left text-center">
                Reach Out To Us</h2>
              <form action="contact_customer" method="post">
                <input type="text" name="Name"
                  class="bg-white w-full h-14 shadow-sm text-gray-600 placeholder-text-400 text-lg font-normal leading-7 rounded-full border border-gray-200 focus:outline-none py-2 px-4 mb-8"
                  placeholder="Name">
                <input type="email" name="Email"
                  class="bg-white w-full h-14 shadow-sm text-gray-600 placeholder-text-400 text-lg font-normal leading-7 rounded-full border border-gray-200 focus:outline-none py-2 px-4 mb-8"
                  placeholder="Email">
                <textarea name="Comment" id="text"
                  class="bg-white w-full h-48 shadow-sm resize-none text-gray-600 placeholder-text-400 text-lg font-normal leading-7 rounded-2xl border border-gray-200 focus:outline-none px-4 py-4 mb-8"
                  placeholder="Comment"></textarea>
                <button
                  type="submit" class="w-full h-12 text-center text-white text-base font-semibold leading-6 rounded-full bg-indigo-600 shadow transition-all duration-700 hover:bg-indigo-800">Submit</button>
              </form>
              <% 
    String msg = request.getParameter("msg"); 
    if (msg != null) { 
        if (msg.equals("invalid")) { 
%>
<div class="toast flex p-4 bg-[#eee] rounded-lg mt-4">
    <div class="shrink-0">
        <svg class="shrink-0 size-4 text-red-500 mt-0.5" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0-.708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"></path>
        </svg>
    </div>
    <div class="ms-3">
        <p class="text-sm text-gray-700 font-semibold">
            Please fill out the form
        </p>
    </div>
</div>
<% 
        } else if (msg.equals("success")) { 
%>
<div class="toast flex p-4 bg-[#e6ffed] rounded-lg mt-4">
    <div class="shrink-0">
        <svg class="shrink-0 size-4 text-green-500 mt-0.5" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.707 11.707a1 1 0 0 1-1.414 0L3.343 9.757a1 1 0 1 1 1.414-1.414L6 9.586l4.243-4.243a1 1 0 0 1 1.414 1.414l-5 5z"></path>
        </svg>
    </div>
    <div class="ms-3">
        <p class="text-sm text-gray-700 font-semibold">
            Thank you! Your message has been sent successfully.
        </p>
    </div>
</div>
<% 
        } else if (msg.equals("error")) { 
%>
<div class="toast flex p-4 bg-[#ffeded] rounded-lg mt-4">
    <div class="shrink-0">
        <svg class="shrink-0 size-4 text-red-500 mt-0.5" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0-.708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"></path>
        </svg>
    </div>
    <div class="ms-3">
        <p class="text-sm text-gray-700 font-semibold">
            Oops! Something went wrong. Please try again.
        </p>
    </div>
</div>
<% 
        } 
    } 
%>
              
            </div>
          </div>
          <div
            class="lg:max-w-xl w-full h-[600px] flex items-center justify-center  bg-cover bg-no-repeat bg-[url('https://pagedone.io/asset/uploads/1696245837.png')] ">
            <div class="">
              <div class="lg:w-96 w-auto h-auto bg-white shadow-xl lg:p-6 p-4">

                <a href="javascript:;" class="flex items-center mb-6">
                  <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M22.3092 18.3098C22.0157 18.198 21.8689 18.1421 21.7145 18.1287C21.56 18.1154 21.4058 18.1453 21.0975 18.205L17.8126 18.8416C17.4392 18.9139 17.2525 18.9501 17.0616 18.9206C16.8707 18.891 16.7141 18.8058 16.4008 18.6353C13.8644 17.2551 12.1853 15.6617 11.1192 13.3695C10.9964 13.1055 10.935 12.9735 10.9133 12.8017C10.8917 12.6298 10.9218 12.4684 10.982 12.1456L11.6196 8.72559C11.6759 8.42342 11.7041 8.27233 11.6908 8.12115C11.6775 7.96998 11.6234 7.82612 11.5153 7.5384L10.6314 5.18758C10.37 4.49217 10.2392 4.14447 9.95437 3.94723C9.6695 3.75 9.29804 3.75 8.5551 3.75H5.85778C4.58478 3.75 3.58264 4.8018 3.77336 6.06012C4.24735 9.20085 5.64674 14.8966 9.73544 18.9853C14.0295 23.2794 20.2151 25.1426 23.6187 25.884C24.9335 26.1696 26.0993 25.1448 26.0993 23.7985V21.2824C26.0993 20.5428 26.0993 20.173 25.9034 19.8888C25.7076 19.6046 25.362 19.4729 24.6708 19.2096L22.3092 18.3098Z"
                      stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>
                  <h5 class="text-black text-base font-normal leading-6 ml-5">9874651084</h5>
                </a>
                <a href="javascript:;" class="flex items-center mb-6">
                  <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M2.81501 8.75L10.1985 13.6191C12.8358 15.2015 14.1544 15.9927 15.6032 15.9582C17.0519 15.9237 18.3315 15.0707 20.8905 13.3647L27.185 8.75M12.5 25H17.5C22.214 25 24.5711 25 26.0355 23.5355C27.5 22.0711 27.5 19.714 27.5 15C27.5 10.286 27.5 7.92893 26.0355 6.46447C24.5711 5 22.214 5 17.5 5H12.5C7.78595 5 5.42893 5 3.96447 6.46447C2.5 7.92893 2.5 10.286 2.5 15C2.5 19.714 2.5 22.0711 3.96447 23.5355C5.42893 25 7.78595 25 12.5 25Z"
                      stroke="#000000" stroke-width="2" stroke-linecap="round"></path>
                  </svg>
                  <h5 class="text-black text-base font-normal leading-6 ml-5">eduler.notes@gmail.com</h5>
                </a>
                <a href="javascript:;" class="flex items-center mb-6">
                  <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M25 12.9169C25 17.716 21.1939 21.5832 18.2779 24.9828C16.8385 26.6609 16.1188 27.5 15 27.5C13.8812 27.5 13.1615 26.6609 11.7221 24.9828C8.80612 21.5832 5 17.716 5 12.9169C5 10.1542 6.05357 7.5046 7.92893 5.55105C9.8043 3.59749 12.3478 2.5 15 2.5C17.6522 2.5 20.1957 3.59749 22.0711 5.55105C23.9464 7.5046 25 10.1542 25 12.9169Z"
                      stroke="#000000" stroke-width="2"></path>
                    <path
                      d="M17.5 11.6148C17.5 13.0531 16.3807 14.219 15 14.219C13.6193 14.219 12.5 13.0531 12.5 11.6148C12.5 10.1765 13.6193 9.01058 15 9.01058C16.3807 9.01058 17.5 10.1765 17.5 11.6148Z"
                      stroke="#000000" stroke-width="2"></path>
                  </svg>
                  <h5 class="text-black text-base font-normal leading-6 ml-5">EM 4/1 , Bidhannagar ,Sector - V </h5>
                </a>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
 <footer class="bg-[#7E60BF] w-screen absolute bottom-0">
      <div class="w-full space-y-8 px-4 py-4 sm:px-6 lg:space-y-16 lg:px-8">
        <div class="sm:flex sm:items-center sm:justify-between">
         <div class="flex items-center gap-4 text-white">
    <img class="h-[4rem] stroke-black stroke-2 relative bottom-[7px]" src="Assets/logo1.png" />
      
    </div>

          <ul class="mt-8 flex justify-start gap-6 sm:mt-0 sm:justify-end">
            <li>
              <a href="#" rel="noreferrer" target="_blank" class="text-white transition hover:opacity-75">
                <span class="sr-only">Facebook</span>

                <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                  <path fill-rule="evenodd"
                    d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"
                    clip-rule="evenodd" />
                </svg>
              </a>
            </li>

            <li>
              <a href="#" rel="noreferrer" target="_blank" class="text-white transition hover:opacity-75">
                <span class="sr-only">Instagram</span>

                <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                  <path fill-rule="evenodd"
                    d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                    clip-rule="evenodd" />
                </svg>
              </a>
            </li>

            <li>
              <a href="#" rel="noreferrer" target="_blank" class="text-white transition hover:opacity-75">
                <span class="sr-only">Twitter</span>

                <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                  <path
                    d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" />
                </svg>
              </a>
            </li>

            <li>
              <a href="#" rel="noreferrer" target="_blank" class="text-white transition hover:opacity-75">
                <span class="sr-only">GitHub</span>

                <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                  <path fill-rule="evenodd"
                    d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                    clip-rule="evenodd" />
                </svg>
              </a>
            </li>

            <li>
              <a href="#" rel="noreferrer" target="_blank" class="text-white transition hover:opacity-75">
                <span class="sr-only">Dribble</span>

                <svg class="size-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                  <path fill-rule="evenodd"
                    d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10c5.51 0 10-4.48 10-10S17.51 2 12 2zm6.605 4.61a8.502 8.502 0 011.93 5.314c-.281-.054-3.101-.629-5.943-.271-.065-.141-.12-.293-.184-.445a25.416 25.416 0 00-.564-1.236c3.145-1.28 4.577-3.124 4.761-3.362zM12 3.475c2.17 0 4.154.813 5.662 2.148-.152.216-1.443 1.941-4.48 3.08-1.399-2.57-2.95-4.675-3.189-5A8.687 8.687 0 0112 3.475zm-3.633.803a53.896 53.896 0 013.167 4.935c-3.992 1.063-7.517 1.04-7.896 1.04a8.581 8.581 0 014.729-5.975zM3.453 12.01v-.26c.37.01 4.512.065 8.775-1.215.25.477.477.965.694 1.453-.109.033-.228.065-.336.098-4.404 1.42-6.747 5.303-6.942 5.629a8.522 8.522 0 01-2.19-5.705zM12 20.547a8.482 8.482 0 01-5.239-1.8c.152-.315 1.888-3.656 6.703-5.337.022-.01.033-.01.054-.022a35.318 35.318 0 011.823 6.475 8.4 8.4 0 01-3.341.684zm4.761-1.465c-.086-.52-.542-3.015-1.659-6.084 2.679-.423 5.022.271 5.314.369a8.468 8.468 0 01-3.655 5.715z"
                    clip-rule="evenodd" />
                </svg>
              </a>
            </li>
          </ul>
        </div>


        <p class="text-xs text-white">
          &copy; 2022. Company Name. All rights reserved.
        </p>
      </div>
    </footer>
    <script>
    document.getElementById("exploreBtn").addEventListener("click", () => {
        const exploreContainer = document.getElementById('exploreContainer');
        
        if (exploreContainer.classList.contains('max-h-0')) {
            exploreContainer.classList.remove('max-h-0');
            exploreContainer.classList.add('max-h-screen'); // Arbitrary large height for full expansion
        } else {
            exploreContainer.classList.remove('max-h-screen');
            exploreContainer.classList.add('max-h-0');
        }
    });
    var username = "<%= username != null ? username : "" %>";
    console.log(username);
    if (username) {
        document.getElementById('logout-container').style.display = 'block';
        
        document.getElementById('login-container').style.display = 'none';
    } 
    else {
        document.getElementById('logout-container').style.display = 'none';
        
        document.getElementById('login-container').style.display = 'block';
    }
    document.addEventListener("DOMContentLoaded", function() {
      
        const features = document.querySelectorAll(".features");
        
        if (username) {
            
        } else {
            features.forEach(function(feature) {
                feature.href = "/Login_Registration/login.jsp";
            });
        }
    });
    
    
    const toast = document.querySelector('.toast');

    if (toast) {
        toast.style.display = 'flex';
        setTimeout(() => {
            toast.style.display = 'none';
        }, 3000); // Hide after 3 seconds
    }
    

    
    
    </script>
</body>
</html>