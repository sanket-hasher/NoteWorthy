<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.13/dist/full.min.css" rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  </head>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Poppins", sans-serif;
    }
    *,
*:hover {
    scrollbar-color: auto;
}

    ::-webkit-scrollbar {
      width: 10px;
    }

    ::-webkit-scrollbar-track {
      background: #f5f5f5;
      border-radius: 50px;
    }

    ::-webkit-scrollbar-thumb {
      background: #7f77a7;
      border-radius: 50px;
    }

    .swiper {
      width: 100%;
    }

    .swiper-slide {
      background-position: center;
      background-size: cover;
      width: 300px;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
    }

    .swiper-button-prev {
      left: -40px;
    }

    .swiper-button-next {
      right: -40px;
    }
    
     #get-started-btn:hover svg {
    transform: rotate(360deg);
  }
  </style>

  <body class="bg-[#eee] text-black">
    <nav class="w-screen flex justify-between items-center px-[20px] h-[10vh] bg-[#433878] text-white fixed top-0 z-50">
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
      <a href="/Login_Registration/main.jsp" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] rounded-t-md transition-all duration-300">Task</a>
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
    
    <div class="container h-screen max-w-[90%] m-auto ">
      <div id="anime2" class="flex w-full h-full justify-evenly items-center">
        <div >
          <h2 class="text-6xl font-bold mb-8">
            What are you aiming to
            <span class="text-[#674188]">accomplish </span>today?
          </h2>
          <p class="text-2xl font-medium mb-8">
            Remember everything and tackle any project with your notes, tasks,
            and schedule all in one place.
          </p>
         <a id="get-started-btn" href="/Login_Registration/main.jsp"
  class="inline-flex items-center justify-center px-8 py-4 rounded-md shadow-xl text-white uppercase bg-[#7E60BF] transition-all shadow-md hover:shadow-lg hover:border hover:border-[#7E60BF] hover:text-[#7E60BF]  hover:bg-white focus:bg-[#AD88C6] active:bg-[#AD88C6] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none">
  
  Get Started
  <svg class="w-4 h-4 ml-1 transition-transform duration-500 ease-in-out" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
    <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
  </svg>
</a>
         
          <div id="show-login" class="mt-8 underline font-semibold none">
            <a href="login.jsp">Already have an account? </a><a
              href="login.jsp">Login</a>
          </div>
        </div>
        <img class="h-[42rem] mix-blend-multiply" src="Assets/bg.jpg" />
      </div>
    </div>
    <div class="relative flex flex-col items-center w-full  mb-8 p-8">
      <video autoplay muted loop class="absolute top-0 left-0 w-full h-full object-cover z-0">
        <source src="Assets/file.mp4" type="video/mp4">

      </video>
      <div id="service" class="absolute top-0 left-0 w-full h-full bg-black opacity-50 z-10 "></div>
      <div id="anime1" class="relative z-20 w-full">
        <h2 class="text-center text-4xl font-bold mb-8 text-white">Services</h2>
        <div class="grid grid-cols-5 text-start gap-4 cursor-pointer">
          <div
            class=" relative flex flex-col my-6 ">
           <div class="p-4 bg-[#FFEECC] shadow-sm border border-slate-200 rounded-lg w-[22rem] transition-transform transform hover:scale-105 hover:shadow-lg hover:border-[#FF9900]">
    <h5 class="mb-2 text-slate-800 text-xl text-center font-semibold">Progress Tracker</h5>
    <p class="text-slate-600 leading-normal font-light">
      <span class="defaultText">Our study planner helps students stay focused and keep you on top of your academic goals with an integrated progress tracker. This feature lets students break down their study goals into manageable tasks, track their completion in real-time.</span>
      <span class="moreText hidden">and see visual representations of their progress. By regularly updating the tracker, students can stay organized, celebrate their accomplishments, and easily adjust their study plans as needed.</span>
    </p>
    <button
      class="rounded-md bg-[#FF9900] py-2 px-4 mt-6 text-center text-sm text-white hover:bg-[#CC7A00]"
      type="button"
      onclick="toggleText(this)">
      Read more
    </button>
  </div>
          </div>
		<div
            class=" relative flex flex-col my-6 ">
             <div class="p-4 bg-[#cdffcd] shadow-sm border border-slate-200 rounded-lg w-[22rem] transition-transform transform hover:scale-105 hover:shadow-lg hover:border-[#28A745]">
    <h5 class="mb-2 text-slate-800 text-xl text-center font-semibold">Whiteboard Support</h5>
    <p class="text-slate-600 leading-normal font-light">
      <span class="defaultText"> Our study planner includes whiteboard support, allowing students to brainstorm, organize, and visualize ideas, and map out complex topics interactively. This feature mimics a physical whiteboard, making it easy to draw diagrams </span>
      <span class="moreText hidden">,connect concepts, and organize thoughts.Perfect for collaborative or individual study, it enhances comprehension, simplifies revision, and brings creative flexibility to the planning process for more effective learning.</span>
    </p>
    <button
      class="rounded-md bg-[#28A745] py-2 px-4 mt-6 text-center text-sm text-white hover:bg-[#1E7E34]"
      type="button"
      onclick="toggleText(this)">
      Read more
    </button>
  </div>
          </div>
		
          <div
            class=" relative flex flex-col my-6 ">
             <div class="p-4 bg-[#E8DAEF] shadow-sm border border-slate-200 rounded-lg w-[22rem] transition-transform transform hover:scale-105 hover:shadow-lg hover:border-[#9B59B6]">
    <h5 class="mb-2 text-slate-800 text-xl text-center font-semibold">Notes Editor</h5>
    <p class="text-slate-600 leading-normal font-light">
      <span class="defaultText"> Our study planner’s notes editor feature offers students to organize their study materials in one convenient place. The notes editor allows for easy formatting, categorizing, and updating of study notes, making it simple to review key points and </span>
      <span class="moreText hidden">stay on top of course content.This feature supports efficient learning by enabling students to personalize notes, highlight important information, and quickly access them during study sessions.</span>
    </p>
    <button
      class="rounded-md bg-[#9B59B6] py-2 px-4 mt-6 text-center text-sm text-white hover:bg-[#7E3D96]"
      type="button"
      onclick="toggleText(this)">
      Read more
    </button>
  </div>
          </div>

          <div
            class=" relative flex flex-col my-6 ">
             <div class="p-4 bg-[#FDEBD0] shadow-sm border border-slate-200 rounded-lg w-[22rem] transition-transform transform hover:scale-105 hover:shadow-lg hover:border-[#FFC107]">
    <h5 class="mb-2 text-slate-800 text-xl text-center font-semibold">Personal Scheduler</h5>
    <p class="text-slate-600 leading-normal font-light">
      <span class="defaultText"> Personal scheduler empowers students to effectively manage their time by setting up a personalized study timetable. With this tool, students can allocate specific times for subjects, assignments, and breaks, creating a balanced study </span>
      <span class="moreText hidden">routine that fits their unique needs.The scheduler encourages consistency, helps prevent last-minute cramming, and ensures steady progress toward academic goals, reducing stress and enhancing productivity.</span>
    </p>
    <button
      class="rounded-md bg-[#FFC107] py-2 px-4 mt-6 text-center text-sm text-white hover:bg-[#E0A800]"
      type="button"
      onclick="toggleText(this)">
      Read more
    </button>
  </div>
          </div>
          <div
            class=" relative flex flex-col my-6 ">
             <div class="p-4 bg-[#D6EAF8] shadow-sm border border-slate-200 rounded-lg w-[22rem] transition-transform transform hover:scale-105 hover:shadow-lg hover:border-[#007BFF]">
    <h5 class="mb-2 text-slate-800 text-xl text-center font-semibold">Pdf Viewer</h5>
    <p class="text-slate-600 leading-normal font-light">
      <span class="defaultText"> Our study planner’s PDF viewer enables students to access and read study materials directly within the platform . With the integrated PDF viewer, students can open, annotate, and highlight documents without switching between apps.</span>
      <span class="moreText hidden"> This feature makes reviewing notes, textbooks, and resources more efficient, keeping all essential study tools in one place for a seamless learning experience.</span>
    </p>
    <button
      class="rounded-md bg-[#007BFF] py-2 px-4 mt-6 text-center text-sm text-white hover:bg-[#0056B3]"
      type="button"
      onclick="toggleText(this)">
      Read more
    </button>
  </div>
          </div>
        </div>
      </div>
    </div>
    <div class="flex max-w-[90%] m-auto mb-8 ">
    
    </div>
    <div class=" max-w-[90%]  m-auto mb-8 ">
      <h2 class="text-center text-4xl font-bold mb-8">Customer Reviews</h2>
      <div id="anime3" class="flex w-full items-start">
        <div class="w-[60%]">
          <img class="h-[35rem] mix-blend-multiply" src="Assets/customer.jpg" />
        </div>

        <div class="flex flex-col gap-4 w-[40%] ">
          <div class="swiper mySwiper">
        <div class="swiper-wrapper">
            <!-- Slides will be dynamically inserted here -->
        </div>
        <div class="swiper-pagination"></div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
       
        
          <div>

          </div>
          <div id="message" style="display: none;"></div>
          <form id="reviewForm" onsubmit="submitReview(event)">
            <!-- Name Field -->
            <div>
              <label for="Name" class="block text-sm font-medium text-gray-700">Name</label>
              <input type="text" id="Name" name="Name" class="mt-1 p-2 w-full border rounded-md bg-white  focus:border-2 focus:border-gray-900  focus:outline-0"
                required />
            </div>

            <!-- Review Text Area -->
            <div class="relative mt-8">
              <div class="relative w-full min-w-[200px]">
                <textarea rows="8"
                  name="comment"
                  class="peer h-full min-h-[100px] w-full !resize-none  rounded-[7px] border border-blue-gray-200 bg-white px-3 py-2.5 font-sans text-sm font-normal text-blue-gray-700 outline outline-0 transition-all placeholder-shown:border placeholder-shown:border-blue-gray-200 placeholder-shown:border-t-blue-gray-200 focus:border-2 focus:border-gray-900 focus:border-t-transparent focus:outline-0 disabled:resize-none disabled:border-0 disabled:bg-blue-gray-50"
                  placeholder=" "></textarea>
                <label
                  class="before:content[' '] after:content[' '] pointer-events-none absolute left-0 -top-1.5 flex h-full w-full select-none text-[11px] font-normal leading-tight text-blue-gray-400 transition-all before:pointer-events-none before:mt-[6.5px] before:mr-1 before:box-border before:block before:h-1.5 before:w-2.5 before:rounded-tl-md before:border-t before:border-l before:border-blue-gray-200 before:transition-all after:pointer-events-none after:mt-[6.5px] after:ml-1 after:box-border after:block after:h-1.5 after:w-2.5 after:flex-grow after:rounded-tr-md after:border-t after:border-r after:border-blue-gray-200 after:transition-all peer-placeholder-shown:text-sm peer-placeholder-shown:leading-[3.75] peer-placeholder-shown:text-blue-gray-500 peer-placeholder-shown:before:border-transparent peer-placeholder-shown:after:border-transparent peer-focus:text-[11px] peer-focus:leading-tight peer-focus:text-gray-900 peer-focus:before:border-t-2 peer-focus:before:border-l-2 peer-focus:before:!border-gray-900 peer-focus:after:border-t-2 peer-focus:after:border-r-2 peer-focus:after:!border-gray-900 peer-disabled:text-transparent peer-disabled:before:border-transparent peer-disabled:after:border-transparent peer-disabled:peer-placeholder-shown:text-blue-gray-500">
                  Your Review
                </label>
              </div>

              <!-- Rating Radio Buttons -->
              <div class="flex w-full justify-between py-1.5">
                <div class="rating">
                  <input type="radio" name="rating-2" value="1" class="mask mask-star-2 bg-orange-400" required />
                  <input type="radio" name="rating-2" value="2" class="mask mask-star-2 bg-orange-400" />
                  <input type="radio" name="rating-2" value="3" class="mask mask-star-2 bg-orange-400" />
                  <input type="radio" name="rating-2" value="4" class="mask mask-star-2 bg-orange-400" />
                  <input type="radio" name="rating-2" value="5" class="mask mask-star-2 bg-orange-400" />
                </div>

                <!-- Submit Button -->
                <div class="flex gap-2">
                  <input
                    class="select-none rounded-md bg-black py-2 px-4 text-center align-middle font-sans text-xs font-bold uppercase text-white shadow-md shadow-gray-900/10 transition-all hover:shadow-lg hover:shadow-gray-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
                    type="submit" value="Submit Review" />
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!--  <section>
      <div class=" w-full bg-[#D4BEE4]">
        <div class="flex justify-center items-center gap-[10rem] p-8">
          <div class="flex items-center lg:mb-0 mb-10">
            <div id="contact">
              <h4 class="text-indigo-600 text-base font-medium leading-6 mb-4 lg:text-left text-center">Contact Us</h4>
              <h2 class="text-gray-900 font-manrope text-4xl font-semibold leading-10 mb-9 lg:text-left text-center">
                Reach Out To Us</h2>
              <form action="">
                <input type="text"
                  class="bg-white w-full h-14 shadow-sm text-gray-600 placeholder-text-400 text-lg font-normal leading-7 rounded-full border border-gray-200 focus:outline-none py-2 px-4 mb-8"
                  placeholder="Name">
                <input type="email"
                  class="bg-white w-full h-14 shadow-sm text-gray-600 placeholder-text-400 text-lg font-normal leading-7 rounded-full border border-gray-200 focus:outline-none py-2 px-4 mb-8"
                  placeholder="Email">
                <textarea name="" id="text"
                  class="bg-white w-full h-48 shadow-sm resize-none text-gray-600 placeholder-text-400 text-lg font-normal leading-7 rounded-2xl border border-gray-200 focus:outline-none px-4 py-4 mb-8"
                  placeholder="Comment"></textarea>
                <button
                  class="w-full h-12 text-center text-white text-base font-semibold leading-6 rounded-full bg-indigo-600 shadow transition-all duration-700 hover:bg-indigo-800">Submit</button>
              </form>
            </div>
          </div>
          <div
            class="lg:max-w-xl w-full h-[600px] flex items-center justify-center  bg-cover bg-no-repeat bg-[url('https://pagedone.io/asset/uploads/1696245837.png')] ">
            <div class="">
              <div class="lg:w-96 w-auto h-auto bg-white shadow-xl lg:p-6 p-4">
                <svg width="164" height="33" viewBox="0 0 164 33" fill="none" xmlns="http://www.w3.org/2000/svg"
                  class="mb-6 mx-auto">
                  <path
                    d="M47 24.7231V7H54.4171C54.5916 7 54.816 7.00821 55.0903 7.02462C55.3645 7.03282 55.618 7.05744 55.8507 7.09846C56.8895 7.25436 57.7455 7.59487 58.4186 8.12C59.1001 8.64513 59.6029 9.30974 59.927 10.1138C60.2594 10.9097 60.4256 11.7959 60.4256 12.7723C60.4256 13.7405 60.2594 14.6267 59.927 15.4308C59.5945 16.2267 59.0876 16.8872 58.4061 17.4123C57.733 17.9374 56.8812 18.2779 55.8507 18.4338C55.618 18.4667 55.3604 18.4913 55.0778 18.5077C54.8035 18.5241 54.5833 18.5323 54.4171 18.5323H50.0042V24.7231H47ZM50.0042 15.7631H54.2925C54.4587 15.7631 54.6457 15.7549 54.8534 15.7385C55.0612 15.7221 55.2523 15.6892 55.4268 15.64C55.9255 15.5169 56.3161 15.2995 56.5986 14.9877C56.8895 14.6759 57.0931 14.3231 57.2094 13.9292C57.3341 13.5354 57.3964 13.1497 57.3964 12.7723C57.3964 12.3949 57.3341 12.0092 57.2094 11.6154C57.0931 11.2133 56.8895 10.8564 56.5986 10.5446C56.3161 10.2328 55.9255 10.0154 55.4268 9.89231C55.2523 9.84308 55.0612 9.81436 54.8534 9.80615C54.6457 9.78974 54.4587 9.78154 54.2925 9.78154H50.0042V15.7631Z"
                    fill="#101828"></path>
                  <path
                    d="M66.0975 25.0923C65.1252 25.0923 64.3024 24.9118 63.6293 24.5508C62.9561 24.1815 62.445 23.6933 62.096 23.0862C61.7553 22.479 61.5849 21.8103 61.5849 21.08C61.5849 20.44 61.6929 19.8656 61.909 19.3569C62.1251 18.84 62.4575 18.3969 62.9063 18.0277C63.355 17.6503 63.9368 17.3426 64.6515 17.1046C65.1917 16.9323 65.8233 16.7764 66.5463 16.6369C67.2776 16.4974 68.0671 16.3703 68.9148 16.2554C69.7707 16.1323 70.6641 16.001 71.5949 15.8615L70.5228 16.4646C70.5311 15.5456 70.3234 14.8687 69.8995 14.4338C69.4757 13.999 68.761 13.7815 67.7554 13.7815C67.1488 13.7815 66.5629 13.921 65.9978 14.2C65.4327 14.479 65.0379 14.959 64.8135 15.64L62.0711 14.7908C62.4035 13.6667 63.0351 12.7641 63.9659 12.0831C64.9049 11.4021 66.1681 11.0615 67.7554 11.0615C68.9522 11.0615 70.0034 11.2544 70.9093 11.64C71.8234 12.0256 72.5007 12.6574 72.9412 13.5354C73.1822 14.0031 73.3276 14.4831 73.3775 14.9754C73.4274 15.4595 73.4523 15.9887 73.4523 16.5631V24.7231H70.822V21.8431L71.2583 22.3108C70.6517 23.2708 69.9411 23.9764 69.1267 24.4277C68.3206 24.8708 67.3108 25.0923 66.0975 25.0923ZM66.6959 22.7292C67.3773 22.7292 67.9591 22.6103 68.4411 22.3723C68.9231 22.1344 69.3054 21.8431 69.5879 21.4985C69.8788 21.1538 70.0741 20.8297 70.1738 20.5262C70.3317 20.1487 70.419 19.7179 70.4356 19.2338C70.4605 18.7415 70.473 18.3436 70.473 18.04L71.3954 18.3108C70.4896 18.4503 69.7126 18.5733 69.0643 18.68C68.4161 18.7867 67.8593 18.8892 67.3939 18.9877C66.9286 19.0779 66.5172 19.1805 66.1598 19.2954C65.8108 19.4185 65.5158 19.5621 65.2748 19.7262C65.0338 19.8903 64.8468 20.079 64.7138 20.2923C64.5891 20.5056 64.5268 20.7559 64.5268 21.0431C64.5268 21.3713 64.6099 21.6626 64.7761 21.9169C64.9423 22.1631 65.1833 22.36 65.4991 22.5077C65.8233 22.6554 66.2222 22.7292 66.6959 22.7292Z"
                    fill="#101828"></path>
                  <path
                    d="M82.1078 31C81.3598 31 80.641 30.8851 79.9512 30.6554C79.2698 30.4256 78.6548 30.0933 78.1063 29.6585C77.5578 29.2318 77.109 28.7149 76.76 28.1077L79.5274 26.7538C79.785 27.2379 80.1465 27.5949 80.6119 27.8246C81.0856 28.0626 81.5884 28.1815 82.1203 28.1815C82.7435 28.1815 83.3003 28.0708 83.7907 27.8492C84.281 27.6359 84.6591 27.3159 84.925 26.8892C85.1993 26.4708 85.3281 25.9456 85.3115 25.3138V21.5354H85.6855V11.4308H88.3157V25.3631C88.3157 25.6995 88.2991 26.0195 88.2659 26.3231C88.2409 26.6349 88.1952 26.9385 88.1287 27.2338C87.9293 28.0954 87.547 28.801 86.9819 29.3508C86.4168 29.9087 85.7145 30.3231 84.8752 30.5938C84.0441 30.8646 83.1217 31 82.1078 31ZM81.846 25.0923C80.6077 25.0923 79.5274 24.7846 78.6049 24.1692C77.6825 23.5538 76.9678 22.7169 76.4608 21.6585C75.9539 20.6 75.7004 19.4062 75.7004 18.0769C75.7004 16.7313 75.9539 15.5333 76.4608 14.4831C76.9761 13.4246 77.7032 12.5918 78.6423 11.9846C79.5814 11.3692 80.6867 11.0615 81.9582 11.0615C83.238 11.0615 84.3101 11.3692 85.1744 11.9846C86.047 12.5918 86.7076 13.4246 87.1564 14.4831C87.6052 15.5415 87.8296 16.7395 87.8296 18.0769C87.8296 19.3979 87.6052 20.5918 87.1564 21.6585C86.7076 22.7169 86.0387 23.5538 85.1494 24.1692C84.2602 24.7846 83.1591 25.0923 81.846 25.0923ZM82.3072 22.4338C83.1134 22.4338 83.7616 22.2533 84.2519 21.8923C84.7505 21.5231 85.112 21.0103 85.3364 20.3538C85.5691 19.6974 85.6855 18.9385 85.6855 18.0769C85.6855 17.2072 85.5691 16.4482 85.3364 15.8C85.112 15.1436 84.7588 14.6349 84.2768 14.2738C83.7948 13.9046 83.1715 13.72 82.407 13.72C81.6008 13.72 80.936 13.9169 80.4124 14.3108C79.8889 14.6964 79.5024 15.2215 79.2531 15.8862C79.0038 16.5426 78.8792 17.2728 78.8792 18.0769C78.8792 18.8892 78.9997 19.6277 79.2407 20.2923C79.49 20.9487 79.8681 21.4697 80.375 21.8554C80.882 22.241 81.5261 22.4338 82.3072 22.4338Z"
                    fill="#101828"></path>
                  <path
                    d="M97.6827 25.0923C96.3198 25.0923 95.1231 24.801 94.0926 24.2185C93.0621 23.6359 92.256 22.8277 91.6743 21.7938C91.1008 20.76 90.8141 19.5703 90.8141 18.2246C90.8141 16.7723 91.0967 15.5128 91.6618 14.4462C92.2269 13.3713 93.0122 12.5385 94.0178 11.9477C95.0234 11.3569 96.1869 11.0615 97.5082 11.0615C98.9044 11.0615 100.089 11.3856 101.061 12.0338C102.042 12.6738 102.769 13.5805 103.242 14.7538C103.716 15.9272 103.895 17.3097 103.778 18.9015H100.799V17.8185C100.791 16.3744 100.533 15.32 100.026 14.6554C99.5194 13.9908 98.7216 13.6585 97.6329 13.6585C96.4029 13.6585 95.4888 14.0359 94.8904 14.7908C94.2921 15.5374 93.9929 16.6328 93.9929 18.0769C93.9929 19.4226 94.2921 20.4646 94.8904 21.2031C95.4888 21.9415 96.3614 22.3108 97.5082 22.3108C98.2479 22.3108 98.8836 22.1508 99.4155 21.8308C99.9557 21.5026 100.371 21.0308 100.662 20.4154L103.629 21.3015C103.114 22.4995 102.316 23.4308 101.235 24.0954C100.163 24.76 98.9792 25.0923 97.6827 25.0923ZM93.0455 18.9015V16.6615H102.308V18.9015H93.0455Z"
                    fill="#101828"></path>
                  <path
                    d="M111.708 25.0923C110.47 25.0923 109.39 24.7846 108.467 24.1692C107.545 23.5538 106.83 22.7169 106.323 21.6585C105.816 20.6 105.563 19.4062 105.563 18.0769C105.563 16.7313 105.816 15.5333 106.323 14.4831C106.838 13.4246 107.565 12.5918 108.505 11.9846C109.444 11.3692 110.549 11.0615 111.82 11.0615C113.1 11.0615 114.172 11.3692 115.037 11.9846C115.909 12.5918 116.57 13.4246 117.019 14.4831C117.467 15.5415 117.692 16.7395 117.692 18.0769C117.692 19.3979 117.467 20.5918 117.019 21.6585C116.57 22.7169 115.901 23.5538 115.012 24.1692C114.122 24.7846 113.021 25.0923 111.708 25.0923ZM112.169 22.4338C112.976 22.4338 113.624 22.2533 114.114 21.8923C114.613 21.5231 114.974 21.0103 115.199 20.3538C115.431 19.6974 115.548 18.9385 115.548 18.0769C115.548 17.2072 115.431 16.4482 115.199 15.8C114.974 15.1436 114.621 14.6349 114.139 14.2738C113.657 13.9046 113.034 13.72 112.269 13.72C111.463 13.72 110.798 13.9169 110.275 14.3108C109.751 14.6964 109.365 15.2215 109.115 15.8862C108.866 16.5426 108.741 17.2728 108.741 18.0769C108.741 18.8892 108.862 19.6277 109.103 20.2923C109.352 20.9487 109.73 21.4697 110.237 21.8554C110.744 22.241 111.388 22.4338 112.169 22.4338ZM115.548 24.7231V15.3938H115.174V7H118.203V24.7231H115.548Z"
                    fill="#101828"></path>
                  <path
                    d="M127.395 25.0923C126.049 25.0923 124.873 24.7928 123.867 24.1938C122.861 23.5949 122.08 22.7703 121.523 21.72C120.975 20.6615 120.701 19.4472 120.701 18.0769C120.701 16.6821 120.983 15.4595 121.548 14.4092C122.113 13.359 122.899 12.5385 123.904 11.9477C124.91 11.3569 126.073 11.0615 127.395 11.0615C128.749 11.0615 129.93 11.361 130.935 11.96C131.941 12.559 132.722 13.3877 133.279 14.4462C133.835 15.4964 134.114 16.7067 134.114 18.0769C134.114 19.4554 133.831 20.6738 133.266 21.7323C132.709 22.7826 131.928 23.6072 130.923 24.2062C129.917 24.7969 128.741 25.0923 127.395 25.0923ZM127.395 22.3108C128.592 22.3108 129.481 21.9169 130.062 21.1292C130.644 20.3415 130.935 19.3241 130.935 18.0769C130.935 16.7887 130.64 15.7631 130.05 15C129.46 14.2287 128.575 13.8431 127.395 13.8431C126.589 13.8431 125.924 14.0236 125.4 14.3846C124.885 14.7374 124.503 15.2338 124.253 15.8738C124.004 16.5056 123.879 17.24 123.879 18.0769C123.879 19.3651 124.174 20.3949 124.765 21.1662C125.363 21.9292 126.24 22.3108 127.395 22.3108Z"
                    fill="#101828"></path>
                  <path
                    d="M145.923 24.7231V18.3231C145.923 17.9046 145.894 17.441 145.836 16.9323C145.778 16.4236 145.64 15.9354 145.424 15.4677C145.217 14.9918 144.901 14.6021 144.477 14.2985C144.061 13.9949 143.496 13.8431 142.782 13.8431C142.399 13.8431 142.021 13.9046 141.647 14.0277C141.273 14.1508 140.933 14.3641 140.625 14.6677C140.326 14.9631 140.085 15.3733 139.902 15.8985C139.719 16.4154 139.628 17.08 139.628 17.8923L137.845 17.1415C137.845 16.0092 138.065 14.9836 138.506 14.0646C138.955 13.1456 139.611 12.4154 140.475 11.8738C141.34 11.3241 142.403 11.0492 143.667 11.0492C144.664 11.0492 145.487 11.2133 146.135 11.5415C146.783 11.8697 147.298 12.2882 147.681 12.7969C148.063 13.3056 148.345 13.8472 148.528 14.4215C148.711 14.9959 148.827 15.5415 148.877 16.0585C148.936 16.5672 148.965 16.9815 148.965 17.3015V24.7231H145.923ZM136.586 24.7231V11.4308H139.266V15.5538H139.628V24.7231H136.586Z"
                    fill="#101828"></path>
                  <path
                    d="M157.87 25.0923C156.507 25.0923 155.31 24.801 154.28 24.2185C153.249 23.6359 152.443 22.8277 151.861 21.7938C151.288 20.76 151.001 19.5703 151.001 18.2246C151.001 16.7723 151.284 15.5128 151.849 14.4462C152.414 13.3713 153.199 12.5385 154.205 11.9477C155.21 11.3569 156.374 11.0615 157.695 11.0615C159.091 11.0615 160.276 11.3856 161.248 12.0338C162.229 12.6738 162.956 13.5805 163.43 14.7538C163.903 15.9272 164.082 17.3097 163.966 18.9015H160.986V17.8185C160.978 16.3744 160.72 15.32 160.213 14.6554C159.706 13.9908 158.909 13.6585 157.82 13.6585C156.59 13.6585 155.676 14.0359 155.078 14.7908C154.479 15.5374 154.18 16.6328 154.18 18.0769C154.18 19.4226 154.479 20.4646 155.078 21.2031C155.676 21.9415 156.548 22.3108 157.695 22.3108C158.435 22.3108 159.071 22.1508 159.603 21.8308C160.143 21.5026 160.558 21.0308 160.849 20.4154L163.816 21.3015C163.301 22.4995 162.503 23.4308 161.423 24.0954C160.351 24.76 159.166 25.0923 157.87 25.0923ZM153.233 18.9015V16.6615H162.495V18.9015H153.233Z"
                    fill="#101828"></path>
                  <path
                    d="M24.5473 11.8941C25.1905 12.5063 25.2068 13.5149 24.5837 14.1468L18.7585 20.054C18.1354 20.686 17.1087 20.702 16.4654 20.0898C15.8222 19.4776 15.8059 18.469 16.429 17.8371L22.2542 11.9299C22.8773 11.2979 23.904 11.2819 24.5473 11.8941Z"
                    fill="url(#paint0_linear_6727_44729-1)"></path>
                  <path fill-rule="evenodd" clip-rule="evenodd"
                    d="M0 4.54673C0 2.03564 2.07211 0 4.62819 0H21.5399V0.00124069C28.9908 0.0998525 35 6.06429 35 13.4075C35 20.8123 28.8897 26.8151 21.3523 26.8151C18.6648 26.8151 16.1587 26.052 14.0463 24.7342L6.58815 31.9057C4.13431 34.2652 0 32.5573 0 29.1841V4.54673ZM11.5194 22.7055C9.15709 20.295 7.70452 17.0179 7.70452 13.4075C7.70452 12.5277 8.43056 11.8144 9.32619 11.8144C10.2218 11.8144 10.9479 12.5277 10.9479 13.4075C10.9479 19.0526 15.6061 23.6288 21.3523 23.6288C27.0985 23.6288 31.7567 19.0526 31.7567 13.4075C31.7567 7.76248 27.0985 3.18626 21.3523 3.18626H4.62819C3.86336 3.18626 3.24334 3.79536 3.24334 4.54673V29.1841C3.24334 29.7351 3.91866 30.014 4.31948 29.6286L11.5194 22.7055Z"
                    fill="url(#paint1_linear_6727_44729-1)"></path>
                  <defs>
                    <linearGradient id="paint0_linear_6727_44729-1" x1="31.5325" y1="2.21268" x2="1.00231" y2="33.2898"
                      gradientUnits="userSpaceOnUse">
                      <stop stop-color="#9038FF"></stop>
                      <stop offset="0.993738" stop-color="#5551FF"></stop>
                    </linearGradient>
                    <linearGradient id="paint1_linear_6727_44729-1" x1="31.5325" y1="2.21268" x2="1.00231" y2="33.2898"
                      gradientUnits="userSpaceOnUse">
                      <stop stop-color="#9038FF"></stop>
                      <stop offset="0.993738" stop-color="#5551FF"></stop>
                    </linearGradient>
                  </defs>
                </svg>
                <a href="javascript:;" class="flex items-center mb-6">
                  <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M22.3092 18.3098C22.0157 18.198 21.8689 18.1421 21.7145 18.1287C21.56 18.1154 21.4058 18.1453 21.0975 18.205L17.8126 18.8416C17.4392 18.9139 17.2525 18.9501 17.0616 18.9206C16.8707 18.891 16.7141 18.8058 16.4008 18.6353C13.8644 17.2551 12.1853 15.6617 11.1192 13.3695C10.9964 13.1055 10.935 12.9735 10.9133 12.8017C10.8917 12.6298 10.9218 12.4684 10.982 12.1456L11.6196 8.72559C11.6759 8.42342 11.7041 8.27233 11.6908 8.12115C11.6775 7.96998 11.6234 7.82612 11.5153 7.5384L10.6314 5.18758C10.37 4.49217 10.2392 4.14447 9.95437 3.94723C9.6695 3.75 9.29804 3.75 8.5551 3.75H5.85778C4.58478 3.75 3.58264 4.8018 3.77336 6.06012C4.24735 9.20085 5.64674 14.8966 9.73544 18.9853C14.0295 23.2794 20.2151 25.1426 23.6187 25.884C24.9335 26.1696 26.0993 25.1448 26.0993 23.7985V21.2824C26.0993 20.5428 26.0993 20.173 25.9034 19.8888C25.7076 19.6046 25.362 19.4729 24.6708 19.2096L22.3092 18.3098Z"
                      stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                  </svg>
                  <h5 class="text-black text-base font-normal leading-6 ml-5">470-601-1911</h5>
                </a>
                <a href="javascript:;" class="flex items-center mb-6">
                  <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                      d="M2.81501 8.75L10.1985 13.6191C12.8358 15.2015 14.1544 15.9927 15.6032 15.9582C17.0519 15.9237 18.3315 15.0707 20.8905 13.3647L27.185 8.75M12.5 25H17.5C22.214 25 24.5711 25 26.0355 23.5355C27.5 22.0711 27.5 19.714 27.5 15C27.5 10.286 27.5 7.92893 26.0355 6.46447C24.5711 5 22.214 5 17.5 5H12.5C7.78595 5 5.42893 5 3.96447 6.46447C2.5 7.92893 2.5 10.286 2.5 15C2.5 19.714 2.5 22.0711 3.96447 23.5355C5.42893 25 7.78595 25 12.5 25Z"
                      stroke="#000000" stroke-width="2" stroke-linecap="round"></path>
                  </svg>
                  <h5 class="text-black text-base font-normal leading-6 ml-5">Pagedone1234@gmail.com</h5>
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
                  <h5 class="text-black text-base font-normal leading-6 ml-5">789 Oak Lane, Lakeside, TX 54321</h5>
                </a>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>-->


    <footer class="bg-[#7E60BF] w-full">
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
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js" integrity="sha512-onMTRKJBKz8M1TnqqDuGBlowlH0ohFzMXYRNebz+yOcc5TQr/zAKsthzhuv0hiyUKEiQEQXEynnXCvNTOk50dg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"
      integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg=="
      crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
 
    function toggleText(button) {
    	  const card = button.closest('.relative'); // Find the clicked card
    	  const moreText = card.querySelector(".moreText"); // Find the text within the card
    	  const readMoreBtn = button; // Use the passed button element directly

    	  // First, reset the height of all cards to their default height
    	  const allCards = document.querySelectorAll('.relative');
    	  allCards.forEach((card) => {
    	    card.style.height = ''; // Reset height for all cards
    	  });

    	  // If the clicked card's moreText is hidden, show it and increase the height
    	  if (moreText.classList.contains("hidden")) {
    	    moreText.classList.remove("hidden"); // Show the extra content
    	    readMoreBtn.textContent = "Read less"; // Change button text
    	    card.style.height = 'auto'; // Increase the height of the clicked card
    	  } else {
    	    moreText.classList.add("hidden"); // Hide the extra content
    	    readMoreBtn.textContent = "Read more"; // Reset button text
    	    card.style.height = ''; // Reset the height to default (collapsed state)
    	  }
    	}


    
    /*document.addEventListener("DOMContentLoaded", function() {
        fetch('loadReviews')
            .then(response => {
                if (!response.ok) {
                    throw new Error("Network response was not ok");
                }
                return response.json();
            })
            .then(reviews => {
                const reviewsContainer = document.getElementById('reviewsContainer');
                reviews.forEach(review => {
                    const slide = document.createElement('div');
                    slide.className = 'swiper-slide';
                    slide.innerHTML = `
                        <p class="text-2xl">${'?'.repeat(review.stars)} (${review.stars})</p>
                        <h2 class="text-3xl font-bold">${review.name}</h2>
                        <p class="font-semibold">"${review.comment}"</p>
                    `;
                    reviewsContainer.appendChild(slide);
                });
                // Initialize Swiper here if needed
            })
            .catch(error => {
                console.error('Error fetching reviews:', error);
            });
    });*/
    document.addEventListener("DOMContentLoaded", async function () {
        try {
            const response = await fetch('loadReviews');
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }

            const reviews = await response.json();
            console.log('Fetched Reviews:', reviews); // Log the fetched reviews

            // Select the Swiper wrapper element
            const swiperWrapper = document.querySelector('.swiper-wrapper');

            // Clear any existing slides
            swiperWrapper.innerHTML = ''; // Clear previous content

            // Loop through each review and create slides
            reviews.forEach(review => {
                // Create a new slide
                const slide = document.createElement('div');
                slide.classList.add('swiper-slide');

                // Create the inner content for the slide
                const stars = document.createElement('p');
                stars.className = "text-2xl";
                stars.textContent = '⭐'.repeat(review.stars); // Set stars based on review.stars

                const name = document.createElement('h2');
                name.className = "text-3xl font-bold";
                name.textContent = review.name; // Set the review name

                const comment = document.createElement('p');
                comment.className = "font-semibold";
                comment.textContent = review.comment; // Set the review comment

                // Append the content to the slide
                slide.appendChild(stars);
                slide.appendChild(name);
                slide.appendChild(comment);

                // Append the slide to the Swiper wrapper
                swiperWrapper.appendChild(slide);
            });

            // Initialize Swiper after adding all slides
            var swiper = new Swiper(".mySwiper", {
                grabCursor: true,
                loop: true,
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
            });

        } catch (error) {
            console.error('Error fetching reviews:', error);
        }
    });

    
    var username = "<%= username != null ? username : "" %>";
    console.log(username);
    if (username) {
        document.getElementById('logout-container').style.display = 'block';
        document.getElementById('show-login').style.display = 'none';
        document.getElementById('login-container').style.display = 'none';
    } else {
        document.getElementById('logout-container').style.display = 'none';
        document.getElementById('show-login').style.display = 'block';
        document.getElementById('login-container').style.display = 'block';
    }
    
    document.addEventListener("DOMContentLoaded", function() {
        var getStartedButton = document.getElementById('get-started-btn');
        const features = document.querySelectorAll(".features");
        
        if (username) {
            getStartedButton.href = "/Login_Registration/main.jsp";
        } else {
            getStartedButton.href = "/Login_Registration/login.jsp";
            features.forEach(function(feature) {
                feature.href = "/Login_Registration/login.jsp";
            });
        }
    });


gsap.registerPlugin(ScrollTrigger);




      var swiper = new Swiper(".mySwiper", {

        grabCursor: true,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });

      function submitReview(event) {
    	    event.preventDefault(); // Prevent default form submission

    	    const form = document.getElementById("reviewForm");
    	    const formData = new URLSearchParams(new FormData(form));

    	    console.log("Form Data:", formData.toString()); // Debugging form data output

    	    fetch("submitReview", {
    	        method: "POST",
    	        headers: { "Content-Type": "application/x-www-form-urlencoded" },
    	        body: formData.toString()
    	    })
    	    .then(response => {
    	        // Check if the response is okay
    	        if (!response.ok) {
    	            throw new Error("Network response was not ok: " + response.statusText);
    	        }
    	        return response.text(); // Get the response text
    	    })
    	    .then(message => {
    	        console.log("Server Response:", message); // Debugging log
    	        displayMessage(message, 'success'); // Display success message
    	        document.getElementById("reviewForm").reset(); // Optionally reset the form after submission
    	    })
    	    .catch(error => {
    	        console.error("Error:", error); // Detailed error log
    	        displayMessage("An error occurred while submitting the review. Please try again later.", 'error'); // Display error message
    	    });
    	}

    	// Function to display messages
    	function displayMessage(message, type) {
    const messageElement = document.getElementById("message");
    console.log("Displaying message:", message, "Type:", type); // Log message type and content
    if (messageElement) {
        messageElement.innerHTML = `<p style='color:${type == 'success' ? 'green' : 'red'};'>${message}</p>`;
        messageElement.style.display = 'block'; // Ensure the message is visible
        console.log("Message displayed:", messageElement.innerHTML); // Log displayed message
    } else {
        console.log("Message element not found.");
    }
}


      gsap.from("#anime1 h2, #anime1 div div",{
        delay:0.4,
        opacity:0,
        duration:1,
        scrollTrigger:{
          trigger: "#anime1 h2",
          scroller: "body",
          start: "top 80%",
        }
      })

      gsap.from("#anime3 div div",{
        delay:0.4,
        opacity:0,
        duration:1,
        x:-60,
        scrollTrigger:{
          trigger: "#anime3 div img",
          scroller: "body",
          start: "top 90%",
        }
      })

      gsap.from("#anime3 div img",{
        delay:0.4,
        opacity:0,
        duration:1,
        y:60,
        scrollTrigger:{
          trigger: "#anime3 div img",
          scroller: "body",
          start: "top 90%",
        }
      })

      gsap.from("#anime2 div",{
        delay:0.4,
        opacity:0,
        duration:1,
        x:-60
      })
      gsap.from("#anime2 img",{
        delay:0.4,
        opacity:0,
        duration:1,
        y:60
      })
      document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      e.preventDefault();

      const targetId = this.getAttribute('href');
      const targetElement = document.querySelector(targetId);

      if (targetElement) {
        const navbarHeight = document.querySelector('nav').offsetHeight; 
        const targetPosition = targetElement.getBoundingClientRect().top + window.scrollY - navbarHeight; 

        window.scrollTo({
          top: targetPosition,
          behavior: 'smooth'
        });
      }
    });
  });
  
      
    </script>
  </body>

  </html>