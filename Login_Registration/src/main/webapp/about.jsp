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
<title>Eduler</title>
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
/* General Styling */
:root {
    --color-bg1: #f8f9fa;
    --color-bg2: #ffffff;
    --color-primary: #6c63ff;
    --color-danger: #ff6b6b;
    --color-success: #1dd1a1;
    --color-text-dark: #333333;
    --color-text-light: #666666;
    --transition: all 0.3s ease-in-out;
}

body {
    
    color: var(--color-text-dark);
}

/* Achievements Section */
.about_achievements {
    margin: 6rem auto;
    padding: 2rem 0;
    
}

.about_achievements-container {
    display: grid;
    grid-template-columns: 40% 60%;
    gap: 8rem;
    max-width: 90vw;
    margin: 0 auto;
}

.about_achievements-left img {
    width: 100%;
    height: auto;
    border-radius: 1rem;
}
.about_achievements-right {
width:fit-content;
}

.about_achievements-right > p {
    margin: 1.5rem 0 2rem;
    line-height: 1.6;
    text-align: justify;
    overflow: hidden;
    text-overflow: ellipsis;
    width:50rem;
}

.achievements_slider {
    display: flex;
    overflow-x: auto;
    gap: 1rem;
    padding: 1rem 0;
}

.achievements_card {
    background: var(--color-bg2);
    border-radius: 1rem;
    padding: 2rem;
    text-align: center;
    min-width: 200px;
    height: 200px;
    transition: var(--transition);
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
    flex: 0 0 auto;
}

.achievements_card:hover {
    transform: translateY(-5px);
    background: var(--color-primary);
    color: white;
}

.achievements_icon {
    font-size: 2.5rem;
    margin-bottom: 1rem;
}

/* Team Section */
.team {
    background: var(--color-bg1);
    padding: 3rem 0;
    text-align: center;
}

.team-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 2rem;
    max-width: 1200px;
    margin: 0 auto;
}

.team_member {
    background: var(--color-bg2);
    border-radius: 1rem;
    text-align: center;
    padding: 2rem;
    height: 350px;
    transition: var(--transition);
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
    align-items:center;
}

.team_member:hover {
    background: var(--color-primary);
    color: white;
}

.team_member-image img {
    width: 170px;
    height: 170px;
    object-fit: cover;
    border-radius: 50%;
}

.team_member-info h4 {
    margin: 1rem 0 0.5rem;
}

.team_member-info p {
    color: var(--color-text-light);
}
</style>
<body>
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
      <a href="http://localhost:8080/Task/files.jsp?username=<%=username%>&email=<%=emailid%>" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] transition-all duration-300" >Files</a>
      <a href="http://localhost:8080/Task/paint.jsp?username=<%=username%>&email=<%=emailid%>" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] transition-all duration-300">Whiteboard</a>
       <a href="http://localhost:8080/Task/editor.jsp?username=<%=username%>&email=<%=emailid%>" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] transition-all duration-300" >Notes</a>
        <a href="http://localhost:8080/Task/schedule.jsp?username=<%=username%>&email=<%=emailid%>" class="features block px-4 py-2 text-sm text-gray-700 hover:bg-[#F3F4F6] hover:text-[#7E60BF] transition-all duration-300" >Schedule</a>
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
            <a href="http://localhost:8080/Login_Registration/login.jsp" id="login-container" style="display: none" class="block">login</a>
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
 <!-- Achievements Section -->
    <section class=" about_achievements">
        <div class=" about_achievements-container">
            <div class="about_achievements-left">
                <img src="Assets/achievements.jpg" alt="Achievements">
            </div>
            <div class="about_achievements-right">
                <h1 class="text-6xl font-semibold">Achievements</h1>
                <p class="text-lg">
                    Our platform empowers users with advanced productivity tools, including a seamless task planner for efficient scheduling, an interactive whiteboard for brainstorming and collaboration, and a robust assignments upload and preview feature. Additionally, the MS Word-like writing tool offers a professional environment for content creation, making it a comprehensive solution for both personal and professional needs. Trusted by users for its intuitive design and versatile functionality, our platform continues to redefine digital productivity.
                </p>
                <div class="achievements_slider flex flex-wrap justify-center gap-6">
    <article class="achievements_card bg-white shadow-md p-6 rounded-lg text-center w-64">
        <span class="achievements_icon flex items-center justify-center w-16 h-16 mx-auto mb-4 bg-indigo-100 rounded-full">
            <!-- SVG for Courses -->
            <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8 text-indigo-600" viewBox="0 0 24 24" fill="currentColor">
                <path d="M21 6.5a1 1 0 0 0-.5-.87l-8-4a1 1 0 0 0-.92 0l-8 4a1 1 0 0 0-.58.87v10a1 1 0 0 0 .58.87l8 4a1 1 0 0 0 .92 0l8-4a1 1 0 0 0 .5-.87v-10Zm-9-2.72L18.75 6.5 12 9.72 5.25 6.5ZM11 20.28l-6-3V8.78l6 3Zm2 0v-8.5l6-3v8.5Z"/>
            </svg>
        </span>
        <h3 class="text-2xl font-semibold text-gray-800">69+</h3>
        <p class="text-gray-600">Courses</p>
    </article>

    <article class="achievements_card bg-white shadow-md p-6 rounded-lg text-center w-64">
        <span class="achievements_icon flex items-center justify-center w-16 h-16 mx-auto mb-4 bg-green-100 rounded-full">
            <!-- SVG for Students -->
            <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8 text-green-600" viewBox="0 0 24 24" fill="currentColor">
                <path d="M12 12a5 5 0 1 0-5-5 5 5 0 0 0 5 5Zm-6 2a6 6 0 0 0-6 6 1 1 0 0 0 1 1h20a1 1 0 0 0 1-1 6 6 0 0 0-6-6Z"/>
            </svg>
        </span>
        <h3 class="text-2xl font-semibold text-gray-800">122</h3>
        <p class="text-gray-600">Students</p>
    </article>

    <article class="achievements_card bg-white shadow-md p-6 rounded-lg text-center w-64">
        <span class="achievements_icon flex items-center justify-center w-16 h-16 mx-auto mb-4 bg-yellow-100 rounded-full">
            <!-- SVG for Awards -->
            <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8 text-yellow-600" viewBox="0 0 24 24" fill="currentColor">
                <path d="M12 2a6 6 0 0 0-6 6 5.94 5.94 0 0 0 2 4.5v5.92l-2.16 1.08a1 1 0 0 0 .38 1.88 1 1 0 0 0 .44-.1L12 20.29l5.34 2.1a1 1 0 0 0 .44.1 1 1 0 0 0 .38-1.88L16 18.42v-5.92a5.94 5.94 0 0 0 2-4.5 6 6 0 0 0-6-6Zm0 2a4 4 0 0 1 4 4 3.94 3.94 0 0 1-1.8 3.34A1 1 0 0 0 14 12.29v6.48l-2-1-2 1v-6.48a1 1 0 0 0-.2-.63A3.94 3.94 0 0 1 8 8a4 4 0 0 1 4-4Z"/>
            </svg>
        </span>
        <h3 class="text-2xl font-semibold text-gray-800">0</h3>
        <p class="text-gray-600">Awards</p>
    </article>
</div>
                
            </div>
        </div>
    </section>
    <!-- End Achievements -->

    <!-- Team Section -->
    <section class="team">
        <h2 class="text-4xl font-semibold mb-8">Meet Our Team</h2>
        <div class="container team-container">
            <article class="team_member">
                <div class="team_member-image">
                    <img src="https://i.pinimg.com/736x/1a/96/03/1a96033f708fd1b8942a25527c622044.jpg" alt="Team Member">
                </div>
                <div class="team_member-info">
                    <h4>John Dumelo</h4>
                    <p>Expert Tutor</p>
                </div>
            </article>

            <article class="team_member">
                <div class="team_member-image">
                    <img src="https://i.pinimg.com/736x/1a/96/03/1a96033f708fd1b8942a25527c622044.jpg" alt="Team Member">
                </div>
                <div class="team_member-info">
                    <h4>Shatta Wale</h4>
                    <p>Expert Tutor</p>
                </div>
            </article>

            <article class="team_member">
                <div class="team_member-image">
                    <img src="https://i.pinimg.com/736x/1a/96/03/1a96033f708fd1b8942a25527c622044.jpg" alt="Team Member">
                </div>
                <div class="team_member-info">
                    <h4>Diana Ayi</h4>
                    <p>Expert Tutor</p>
                </div>
            </article>

            <article class="team_member">
                <div class="team_member-image">
                    <img src="https://i.pinimg.com/736x/1a/96/03/1a96033f708fd1b8942a25527c622044.jpg" alt="Team Member">
                </div>
                <div class="team_member-info">
                    <h4>Mia Jones</h4>
                    <p>Expert Tutor</p>
                </div>
            </article>

            <article class="team_member">
                <div class="team_member-image">
                    <img src="https://i.pinimg.com/736x/1a/96/03/1a96033f708fd1b8942a25527c622044.jpg" alt="Team Member">
                </div>
                <div class="team_member-info">
                    <h4>Debeneek Rai</h4>
                    <p>Professional Hater</p>
                </div>
            </article>

            <article class="team_member">
                <div class="team_member-image">
                    <img src="https://i.pinimg.com/736x/1a/96/03/1a96033f708fd1b8942a25527c622044.jpg" alt="Team Member">
                </div>
                <div class="team_member-info">
                    <h4>Jane Doe</h4>
                    <p>Professional Coder</p>
                </div>
            </article>
        </div>
    </section>
    <!-- End Team -->
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
    <script>
 var username = "<%= username != null ? username : "" %>";
    
    if (username) {
        document.getElementById('logout-container').style.display = 'block';
    
        document.getElementById('login-container').style.display = 'none';
    } else {
        document.getElementById('logout-container').style.display = 'none';
       
        document.getElementById('login-container').style.display = 'block';
    }
    
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
    </script>
</body>
</html>