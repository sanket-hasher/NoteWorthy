<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.net.URLEncoder" %>
    <%@ page session="true" %>
    
    <%
    //String username = (String) session.getAttribute("username");
   // String emailid = (String) session.getAttribute("email");
    String user=request.getParameter("username");
    String email=request.getParameter("email");
    session.setAttribute("username",user);
    session.setAttribute("email",email);
    String username = (String) session.getAttribute("username");
    String emailid = (String) session.getAttribute("email");
    %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta
      name="description"
      content="Stay organized with our user-friendly Calendar featuring events, reminders, and a customizable interface. Built with HTML, CSS, and JavaScript. Start scheduling today!"
    />
    <meta
      name="keywords"
      content="calendar, events, reminders, javascript, html, css, open source coding"
    />
  
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
 
 :root {
  --primary-clr: #b38add;
}
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
/* nice scroll bar */
::-webkit-scrollbar {
  width: 5px;
}
::-webkit-scrollbar-track {
  background: #f5f5f5;
  border-radius: 50px;
}
::-webkit-scrollbar-thumb {
  background: var(--primary-clr);
  border-radius: 50px;
}

body {
  position: relative;
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #e2e1dc;
}
.container {
  position: relative;
  width: 1200px;
  min-height: 850px;
  margin: 0 auto;
  padding: 5px;
  color: #fff;
  display: flex;

  border-radius: 10px;
  background-color: #373c4f;
}
.left {
  width: 60%;
  padding: 20px;
}
.calendar {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  justify-content: space-between;
  color: #878895;
  border-radius: 5px;
  background-color: #fff;
}
/* set after behind the main element */
.calendar::before,
.calendar::after {
  content: "";
  position: absolute;
  top: 50%;
  left: 100%;
  width: 12px;
  height: 97%;
  border-radius: 0 5px 5px 0;
  background-color: #d3d4d6d7;
  transform: translateY(-50%);
}
.calendar::before {
  height: 94%;
  left: calc(100% + 12px);
  background-color: rgb(153, 153, 153);
}
.calendar .month {
  width: 100%;
  height: 150px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 50px;
  font-size: 1.2rem;
  font-weight: 500;
  text-transform: capitalize;
}
.calendar .month .prev,
.calendar .month .next {
  cursor: pointer;
}
.calendar .month .prev:hover,
.calendar .month .next:hover {
  color: var(--primary-clr);
}
.calendar .weekdays {
  width: 100%;
  height: 100px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  font-size: 1rem;
  font-weight: 500;
  text-transform: capitalize;
}
.weekdays div {
  width: 14.28%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}
.calendar .days {
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 0 20px;
  font-size: 1rem;
  font-weight: 500;
  margin-bottom: 20px;
}
.calendar .days .day {
  width: 14.28%;
  height: 90px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  color: var(--primary-clr);
  border: 1px solid #f5f5f5;
}
.calendar .days .day:nth-child(7n + 1) {
  border-left: 2px solid #f5f5f5;
}
.calendar .days .day:nth-child(7n) {
  border-right: 2px solid #f5f5f5;
}
.calendar .days .day:nth-child(-n + 7) {
  border-top: 2px solid #f5f5f5;
}
.calendar .days .day:nth-child(n + 29) {
  border-bottom: 2px solid #f5f5f5;
}

.calendar .days .day:not(.prev-date, .next-date):hover {
  color: #fff;
  background-color: var(--primary-clr);
}
.calendar .days .prev-date,
.calendar .days .next-date {
  color: #b3b3b3;
}
.calendar .days .active {
  position: relative;
  font-size: 2rem;
  color: #fff;
  background-color: var(--primary-clr);
}
.calendar .days .active::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  box-shadow: 0 0 10px 2px var(--primary-clr);
}
.calendar .days .today {
  font-size: 2rem;
}
.calendar .days .event {
  position: relative;
}
.calendar .days .event::after {
  content: "";
  position: absolute;
  bottom: 10%;
  left: 50%;
  width: 75%;
  height: 6px;
  border-radius: 30px;
  transform: translateX(-50%);
  background-color: var(--primary-clr);
}
.calendar .days .day:hover.event::after {
  background-color: #fff;
}
.calendar .days .active.event::after {
  background-color: #fff;
  bottom: 20%;
}
.calendar .days .active.event {
  padding-bottom: 10px;
}
.calendar .goto-today {
  width: 100%;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 5px;
  padding: 0 20px;
  margin-bottom: 20px;
  color: var(--primary-clr);
}
.calendar .goto-today .goto {
  display: flex;
  align-items: center;
  border-radius: 5px;
  overflow: hidden;
  border: 1px solid var(--primary-clr);
}
.calendar .goto-today .goto input {
  width: 100%;
  height: 30px;
  outline: none;
  border: none;
  border-radius: 5px;
  padding: 0 20px;
  color: var(--primary-clr);
  border-radius: 5px;
}
.calendar .goto-today button {
  padding: 5px 10px;
  border: 1px solid var(--primary-clr);
  border-radius: 5px;
  background-color: transparent;
  cursor: pointer;
  color: var(--primary-clr);
}
.calendar .goto-today button:hover {
  color: #fff;
  background-color: var(--primary-clr);
}
.calendar .goto-today .goto button {
  border: none;
  border-left: 1px solid var(--primary-clr);
  border-radius: 0;
}
.container .right {
  position: relative;
  width: 40%;
  min-height: 100%;
  padding: 20px 0;
}

.right .today-date {
  width: 100%;
  height: 50px;
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  align-items: center;
  justify-content: space-between;
  padding: 0 40px;
  padding-left: 70px;
  margin-top: 50px;
  margin-bottom: 20px;
  text-transform: capitalize;
}
.right .today-date .event-day {
  font-size: 2rem;
  font-weight: 500;
}
.right .today-date .event-date {
  font-size: 1rem;
  font-weight: 400;
  color: #878895;
}
.events {
  width: 100%;
  height: 100%;
  max-height: 600px;
  overflow-x: hidden;
  overflow-y: auto;
  display: flex;
  flex-direction: column;
  padding-left: 4px;
}
.events .event {
  position: relative;
  min-height: 70px; /* Minimum height for the event container */
  display: flex;
  justify-content: space-evenly; /* Centers content horizontally */
  align-items:center;
  gap: 5px; /* Adds a gap between content inside the event */
  padding: 0 20px; /* Horizontal padding */
  color: #fff; /* White text color */
  background: linear-gradient(90deg, #3f4458, transparent); /* Gradient background */
  cursor: pointer; /* Pointer cursor on hover */
  border-radius: 8px; /* Optional: rounded corners */
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15); /* Optional: add shadow for depth */
}

/* even event */
.events .event:nth-child(even) {
  background: transparent;
}
.events .event:hover {
  background: linear-gradient(90deg, var(--primary-clr), transparent);
}
.events .event .title {
  display: flex;
  align-items: center;
  pointer-events: none;
}
.events .event .title .event-title {
  font-size: 1rem;
  font-weight: 400;
  margin-left: 20px;
}
.events .event i {
  color: var(--primary-clr);
  font-size: 0.5rem;
}
.events .event:hover i {
  color: #fff;
}
.events .event .event-time {
  font-size: 0.8rem;
  font-weight: 400;
  color: #878895;
  margin-left: 15px;
  pointer-events: none;
}
.events .event:hover .event-time {
  color: #fff;
}
/* add tick in event after */
.events .event::after {
  content: "✓";
  position: absolute;
  top: 50%;
  right: 0;
  font-size: 3rem;
  line-height: 1;
  display: none;
  align-items: center;
  justify-content: center;
  opacity: 0.3;
  color: var(--primary-clr);
  transform: translateY(-50%);
}
.events .event:hover::after {
  display: flex;
}
.add-event {
  position: absolute;
  bottom: 30px;
  right: 30px;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1rem;
  color: #878895;
  border: 2px solid #878895;
  opacity: 0.5;
  border-radius: 50%;
  background-color: transparent;
  cursor: pointer;
}
.add-event:hover {
  opacity: 1;
}
.add-event i {
  pointer-events: none;
}
.events .no-event {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  font-weight: 500;
  color: #878895;
}
.add-event-wrapper {
  position: absolute;
  bottom: 100px;
  left: 50%;
  width: 90%;
  max-height: 0;
  overflow: hidden;
  border-radius: 5px;
  background-color: #fff;
  transform: translateX(-50%);
  transition: max-height 0.5s ease;
}
.add-event-wrapper.active {
  max-height: 300px;
}
.add-event-header {
  width: 100%;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  color: #373c4f;
  border-bottom: 1px solid #f5f5f5;
}
.add-event-header .close {
  font-size: 1.5rem;
  cursor: pointer;
}
.add-event-header .close:hover {
  color: var(--primary-clr);
}
.add-event-header .title {
  font-size: 1.2rem;
  font-weight: 500;
}
.add-event-body {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  gap: 5px;
  padding: 20px;
}
.add-event-body .add-event-input {
  width: 100%;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 10px;
}
.add-event-body .add-event-input input {
  width: 100%;
  height: 100%;
  outline: none;
  border: none;
  border-bottom: 1px solid #f5f5f5;
  padding: 0 10px;
  font-size: 1rem;
  font-weight: 400;
  color: #373c4f;
}
.add-event-body .add-event-input input::placeholder {
  color: #a5a5a5;
}
.add-event-body .add-event-input input:focus {
  border-bottom: 1px solid var(--primary-clr);
}
.add-event-body .add-event-input input:focus::placeholder {
  color: var(--primary-clr);
}
.add-event-footer {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}
.add-event-footer .add-event-btn {
  height: 40px;
  font-size: 1rem;
  font-weight: 500;
  outline: none;
  border: none;
  color: #fff;
  background-color: var(--primary-clr);
  border-radius: 5px;
  cursor: pointer;
  padding: 5px 10px;
  border: 1px solid var(--primary-clr);
}
.add-event-footer .add-event-btn:hover {
  background-color: transparent;
  color: var(--primary-clr);
}

/* media queries */

@media screen and (max-width: 1000px) {
  body {
    align-items: flex-start;
    justify-content: flex-start;
  }
  .container {
    min-height: 100vh;
    flex-direction: column;
    border-radius: 0;
  }
  .container .left {
    width: 100%;
    height: 100%;
    padding: 20px 0;
  }
  .container .right {
    width: 100%;
    height: 100%;
    padding: 20px 0;
  }
  .calendar::before,
  .calendar::after {
    top: 100%;
    left: 50%;
    width: 97%;
    height: 12px;
    border-radius: 0 0 5px 5px;
    transform: translateX(-50%);
  }
  .calendar::before {
    width: 94%;
    top: calc(100% + 12px);
  }
  .events {
    padding-bottom: 340px;
  }
  .add-event-wrapper {
    bottom: 100px;
  }
}
@media screen and (max-width: 500px) {
  .calendar .month {
    height: 75px;
  }
  .calendar .weekdays {
    height: 50px;
  }
  .calendar .days .day {
    height: 40px;
    font-size: 0.8rem;
  }
  .calendar .days .day.active,
  .calendar .days .day.today {
    font-size: 1rem;
  }
  .right .today-date {
    padding: 20px;
  }
}

.credits {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  text-align: center;
  padding: 10px;
  font-size: 12px;
  color: #fff;
  background-color: #b38add;
}
.credits a {
  text-decoration: none;
  font-weight: 600;
}
.credits a:hover {
  text-decoration: underline;
}
 


  </style>
 
  <body class="flex w-full bg-purple-100 ">
    <aside
      class="flex w-[18%] flex-col h-screen px-4 py-8 overflow-y-hidden bg-[#433878] rtl:border-r-0 rtl:border-l "
    >
      <a href="/Login_Registration">
        <svg
          class="absolute h-5 cursor-pointer"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 576 512"
        >
          <!--! Font Awesome Free 6.6.0 by @fontawesome -->
          <path
            fill="#ffffff"
            d="M575.8 255.5c0 18-15 32.1-32 32.1l-32 0 .7 160.2c0 2.7-.2 5.4-.5 8.1l0 16.2c0 22.1-17.9 40-40 40l-16 0c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1L416 512l-24 0c-22.1 0-40-17.9-40-40l0-24 0-64c0-17.7-14.3-32-32-32l-64 0c-17.7 0-32 14.3-32 32l0 64 0 24c0 22.1-17.9 40-40 40l-24 0-31.9 0c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2l-16 0c-22.1 0-40-17.9-40-40l0-112c0-.9 0-1.9 .1-2.8l0-69.7-32 0c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"
          />
        </svg>
      </a>
    
      <div class="flex flex-col items-center mt-6 -mx-2">
         <div
				id="profile-icon"
					class="w-[6rem] h-[6rem] flex items-center justify-center text-center rounded-full">
					<h1 id="name" class="font-bold text-6xl text-white capitalize"><%=username.charAt(0)%></h1>
				</div>
        <h4 class="mx-2 mt-2 font-medium text-white"><%=username %></h4>
        <p class="mx-2 mt-1 text-sm font-medium text-white"><%=emailid %></p>
      </div>
    
      <div class="flex flex-col justify-between flex-1 mt-6">
        <nav class="cursor-pointer">
          <p class="flex items-center px-4 py-2 text-white rounded-lg">
           <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 512 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#ffffff"
								d="M152.1 38.2c9.9 8.9 10.7 24 1.8 33.9l-72 80c-4.4 4.9-10.6 7.8-17.2 7.9s-12.9-2.4-17.6-7L7 113C-2.3 103.6-2.3 88.4 7 79s24.6-9.4 33.9 0l22.1 22.1 55.1-61.2c8.9-9.9 24-10.7 33.9-1.8zm0 160c9.9 8.9 10.7 24 1.8 33.9l-72 80c-4.4 4.9-10.6 7.8-17.2 7.9s-12.9-2.4-17.6-7L7 273c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l22.1 22.1 55.1-61.2c8.9-9.9 24-10.7 33.9-1.8zM224 96c0-17.7 14.3-32 32-32l224 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-224 0c-17.7 0-32-14.3-32-32zm0 160c0-17.7 14.3-32 32-32l224 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-224 0c-17.7 0-32-14.3-32-32zM160 416c0-17.7 14.3-32 32-32l288 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-288 0c-17.7 0-32-14.3-32-32zM48 368a48 48 0 1 1 0 96 48 48 0 1 1 0-96z" /></svg>
    
            <a href="/Login_Registration/main.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Daily Tasks</a>
          </p>
          <p
            class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg bg-[#2E073F]"
            href="#"
          >
            <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 448 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#ffffff"
								d="M128 0c17.7 0 32 14.3 32 32l0 32 128 0 0-32c0-17.7 14.3-32 32-32s32 14.3 32 32l0 32 48 0c26.5 0 48 21.5 48 48l0 48L0 160l0-48C0 85.5 21.5 64 48 64l48 0 0-32c0-17.7 14.3-32 32-32zM0 192l448 0 0 272c0 26.5-21.5 48-48 48L48 512c-26.5 0-48-21.5-48-48L0 192zm64 80l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm128 0l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0zM64 400l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0zm112 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16z" /></svg>
						
            <a href="schedule.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Schedule</a>
          </p>
    
          <p
            class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
            href="#"
          >
           <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#ffffff" d="M339.3 367.1c27.3-3.9 51.9-19.4 67.2-42.9L568.2 74.1c12.6-19.5 9.4-45.3-7.6-61.2S517.7-4.4 499.1 9.6L262.4 187.2c-24 18-38.2 46.1-38.4 76.1L339.3 367.1zm-19.6 25.4l-116-104.4C143.9 290.3 96 339.6 96 400c0 3.9 .2 7.8 .6 11.6C98.4 429.1 86.4 448 68.8 448L64 448c-17.7 0-32 14.3-32 32s14.3 32 32 32l144 0c61.9 0 112-50.1 112-112c0-2.5-.1-5-.2-7.5z"/></svg>
    
            <a href="paint.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Whiteboard</a>
          </p>
    
          <p
          class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
          href="#"
        >
         <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 384 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#ffffff"
								d="M320 464c8.8 0 16-7.2 16-16l0-288-80 0c-17.7 0-32-14.3-32-32l0-80L64 48c-8.8 0-16 7.2-16 16l0 384c0 8.8 7.2 16 16 16l256 0zM0 64C0 28.7 28.7 0 64 0L229.5 0c17 0 33.3 6.7 45.3 18.7l90.5 90.5c12 12 18.7 28.3 18.7 45.3L384 448c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 64z" /></svg>
         
    
          <a href="files.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Files</a>
        </p>
    <p
						class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
						href="#">
												<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#ffffff" d="M441 58.9L453.1 71c9.4 9.4 9.4 24.6 0 33.9L424 134.1 377.9 88 407 58.9c9.4-9.4 24.6-9.4 33.9 0zM209.8 256.2L344 121.9 390.1 168 255.8 302.2c-2.9 2.9-6.5 5-10.4 6.1l-58.5 16.7 16.7-58.5c1.1-3.9 3.2-7.5 6.1-10.4zM373.1 25L175.8 222.2c-8.7 8.7-15 19.4-18.3 31.1l-28.6 100c-2.4 8.4-.1 17.4 6.1 23.6s15.2 8.5 23.6 6.1l100-28.6c11.8-3.4 22.5-9.7 31.1-18.3L487 138.9c28.1-28.1 28.1-73.7 0-101.8L474.9 25C446.8-3.1 401.2-3.1 373.1 25zM88 64C39.4 64 0 103.4 0 152L0 424c0 48.6 39.4 88 88 88l272 0c48.6 0 88-39.4 88-88l0-112c0-13.3-10.7-24-24-24s-24 10.7-24 24l0 112c0 22.1-17.9 40-40 40L88 464c-22.1 0-40-17.9-40-40l0-272c0-22.1 17.9-40 40-40l112 0c13.3 0 24-10.7 24-24s-10.7-24-24-24L88 64z"/></svg>
						
						<a
							href="editor.jsp?username=<%=username%>&email=<%=emailid%>"
							class="mx-4 font-medium">Notes</a>
					</p>
          <!-- Repeat similarly for other menu items like March, April, May, etc. -->
        </nav>
      </div>
       <div id="logout-container"  style="display: none">
        <form action="lout" method="post">
            <input type="submit"  class="block cursor-pointer text-white" value="LOGOUT">
             <div class="absolute left-0 right-0 bottom-0 h-[2px] bg-white transform scale-x-0 transition-transform duration-300 group-hover:scale-x-100"></div>
        </form>
    </aside>
    <div class="container relative  flex p-[5px] rounded-lg text-white  w-[82%] ">
        <div class="container">
      <div class="left">
        <div class="calendar">
          <div class="month">
           <svg class="fas fa-angle-left prev h-5 w-5"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l160 160c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L109.2 288 416 288c17.7 0 32-14.3 32-32s-14.3-32-32-32l-306.7 0L214.6 118.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-160 160z"/></svg>
            <div class="date">december 2015</div>
            <svg  class="fas fa-angle-right next h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"/></svg>
          </div>
          <div class="weekdays">
            <div>Sun</div>
            <div>Mon</div>
            <div>Tue</div>
            <div>Wed</div>
            <div>Thu</div>
            <div>Fri</div>
            <div>Sat</div>
          </div>
          <div class="days"></div>
          <div class="goto-today">
            <div class="goto">
              <input type="text" placeholder="mm/yyyy" class="date-input" />
              <button class="goto-btn">Go</button>
            </div>
            <button class="today-btn">Today</button>
          </div>
        </div>
      </div>
      <div class="right">
        <div class="today-date">
          <div class="event-day">Events</div>
          
        </div>
        <div class="events"></div>
        <div class="add-event-wrapper">
          <div class="add-event-header">
            <div class="title">Add Event</div>
            <i class="fas fa-times close"></i>
          </div>
          <div class="add-event-body">
            <div class="add-event-input">
              <input type="text" placeholder="Event Name" class="event-name" />
            </div>
            <div class="add-event-input">
              <input
                type="text"
                placeholder="Event Time From"
                class="event-time-from"
              />
            </div>
            <div class="add-event-input">
              <input
                type="text"
                placeholder="Event Time To"
                class="event-time-to"
              />
            </div>
          </div>
          <div class="add-event-footer">
            <button class="add-event-btn">Add Event</button>
          </div>
        </div>
      </div>
     <svg class="add-event h-8 w-8" xmlns="http://www.w3.org/2000/svg" fill="currentColor"  viewBox="0 0 16 16">
  	<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"/>
	</svg>
    </div>

     
    </div>


    
     <script >
     const colors = ["#FF5722", "#D32F2F", "#388E3C"];

  	// Select a random color from the array
  	document.addEventListener("DOMContentLoaded", function() {
  		// Pick a random color
  		const randomColor = colors[Math.floor(Math.random() * colors.length)];
  		// Apply it to the background of the profile-icon
  		document.getElementById("profile-icon").style.backgroundColor = randomColor;
  	});
     
  	 var username = "<%= username != null ? username : "" %>";
  	 
  	    
  	    if (username) {
  	        document.getElementById('logout-container').style.display = 'block';
  	  
  	    } else {
  	        document.getElementById('logout-container').style.display = 'none';
  	       
  	   }

  	   const calendar = document.querySelector(".calendar"),
  	     date = document.querySelector(".date"),
  	     daysContainer = document.querySelector(".days"),
  	     prev = document.querySelector(".prev"),
  	     next = document.querySelector(".next"),
  	     todayBtn = document.querySelector(".today-btn"),
  	     gotoBtn = document.querySelector(".goto-btn"),
  	     dateInput = document.querySelector(".date-input"),
  	     eventDay = document.querySelector(".event-day"),
  	     eventDate = document.querySelector(".event-date"),
  	     eventsContainer = document.querySelector(".events"),
  	     addEventBtn = document.querySelector(".add-event"),
  	     addEventWrapper = document.querySelector(".add-event-wrapper "),
  	     addEventCloseBtn = document.querySelector(".close "),
  	     addEventTitle = document.querySelector(".event-name "),
  	     addEventFrom = document.querySelector(".event-time-from "),
  	     addEventTo = document.querySelector(".event-time-to "),
  	     addEventSubmit = document.querySelector(".add-event-btn ");

  	   let today = new Date();
  	   let activeDay;
  	   let month = today.getMonth();
  	   let year = today.getFullYear();

  	   const months = [
  	     "January",
  	     "February",
  	     "March",
  	     "April",
  	     "May",
  	     "June",
  	     "July",
  	     "August",
  	     "September",
  	     "October",
  	     "November",
  	     "December",
  	   ];
  	   const eventsArr = [];
  	   //geteve();
  	   getevents();
  	  
  	   console.log(eventsArr);

  	   //function to add days in days with class day and prev-date next-date on previous month and next month days and active on today
  	   function initCalendar() {
  	     const firstDay = new Date(year, month, 1);
  	     const lastDay = new Date(year, month + 1, 0);
  	     const prevLastDay = new Date(year, month, 0);
  	     const prevDays = prevLastDay.getDate();
  	     const lastDate = lastDay.getDate();
  	     const day = firstDay.getDay();
  	     const nextDays = 7 - lastDay.getDay() - 1;

  	     date.innerHTML = months[month] + " " + year;

  	     let days = "";

  	     for (let x = day; x > 0; x--) {
  	    	days += '<div class="day prev-date">' + (prevDays - x + 1) + '</div>';

  	     }

  	     for (let i = 1; i <= lastDate; i++) {
  	       //check if event is present on that day
  	       let event = false;
  	       eventsArr.forEach((eventObj) => {
  	         if (
  	           eventObj.day === i &&
  	           eventObj.month === month + 1 &&
  	           eventObj.year === year
  	         ) {
  	           event = true;
  	         }
  	       });
  	       if (
  	         i === new Date().getDate() &&
  	         year === new Date().getFullYear() &&
  	         month === new Date().getMonth()
  	       ) {
  	         activeDay = i;
  	         getActiveDay(i);
  	         updateEvents(i);
  	         if (event) {
  	        	days = days + '<div class="day today active event">' + i + '</div>';

  	         } else {
  	        	days = days + '<div class="day today active">' + i + '</div>';

  	         }
  	       } else {
  	         if (event) {
  	        	days = days + '<div class="day event">' + i + '</div>';
  	         } else {
  	        	days = days + '<div class="day ">' + i + '</div>';
  	         }
  	       }
  	     }

  	     for (let j = 1; j <= nextDays; j++) {
  	    	days = days + '<div class="day next-date">' + j + '</div>';
  	     }
  	     daysContainer.innerHTML = days;
  	     addListner();
  	   }

  	   //function to add month and year on prev and next button
  	   function prevMonth() {
  	       month--;
  	       if (month < 0) {
  	           month = 11;
  	           year--;
  	       }
  	       initCalendar();
  	       updateEvents(activeDay);  // Update events after switching months
  	   }

  	   function nextMonth() {
  	       month++;
  	       if (month > 11) {
  	           month = 0;
  	           year++;
  	       }
  	       initCalendar();
  	       updateEvents(activeDay);  // Update events after switching months
  	   }

  	   prev.addEventListener("click", prevMonth);
  	   next.addEventListener("click", nextMonth);

  	   initCalendar();

  	   //function to add active on day
  	   function addListner() {
  	     const days = document.querySelectorAll(".day");

  	     days.forEach((day) => {
  	       day.addEventListener("click", (e) => {
  	         const dayNumber = Number(e.target.innerHTML);
  	         
  	         // Update the active day and display events
  	         getActiveDay(dayNumber);
  	         updateEvents(dayNumber); // Update events for clicked day
  	         activeDay = dayNumber;

  	         // Remove 'active' class from all days
  	         days.forEach(day => day.classList.remove("active"));
  	         
  	         // Add 'active' to the clicked day
  	         e.target.classList.add("active");

  	         // If clicked on a day in the previous month
  	         if (e.target.classList.contains("prev-date")) {
  	           prevMonth(); // Switch to the previous month
  	           setTimeout(() => {
  	             // After switching months, add 'active' to the day
  	             const days = document.querySelectorAll(".day");
  	             days.forEach((day) => {
  	               if (!day.classList.contains("prev-date") && day.innerHTML === e.target.innerHTML) {
  	                 day.classList.add("active");
  	               }
  	             });
  	           }, 100);
  	         } 
  	         // If clicked on a day in the next month
  	         else if (e.target.classList.contains("next-date")) {
  	           nextMonth(); // Switch to the next month
  	           setTimeout(() => {
  	             // After switching months, add 'active' to the day
  	             const days = document.querySelectorAll(".day");
  	             days.forEach((day) => {
  	               if (!day.classList.contains("next-date") && day.innerHTML === e.target.innerHTML) {
  	                 day.classList.add("active");
  	               }
  	             });
  	           }, 100);
  	         } 
  	         // If clicked on a day in the current month
  	         else {
  	           e.target.classList.add("active");
  	         }
  	       });
  	     });
  	   }


  	   
  	 
  	   todayBtn.addEventListener("click", () => {
  	     today = new Date();
  	     month = today.getMonth();
  	     year = today.getFullYear();
  	     initCalendar();
  	   });

  	   dateInput.addEventListener("input", (e) => {
  	     dateInput.value = dateInput.value.replace(/[^0-9/]/g, "");
  	     if (dateInput.value.length === 2) {
  	       dateInput.value += "/";
  	     }
  	     if (dateInput.value.length > 7) {
  	       dateInput.value = dateInput.value.slice(0, 7);
  	     }
  	     if (e.inputType === "deleteContentBackward") {
  	       if (dateInput.value.length === 3) {
  	         dateInput.value = dateInput.value.slice(0, 2);
  	       }
  	     }
  	   });

  	   gotoBtn.addEventListener("click", gotoDate);

  	   function gotoDate() {
  	    
  	     const dateArr = dateInput.value.split("/");
  	     if (dateArr.length === 2) {
  	       if (dateArr[0] > 0 && dateArr[0] < 13 && dateArr[1].length === 4) {
  	         month = dateArr[0] - 1;
  	         year = dateArr[1];
  	         initCalendar();
  	         return;
  	       }
  	     }
  	     alert("Invalid Date");
  	   }

  	   //function get active day day name and date and update eventday eventdate
  	   function getActiveDay(date) {
  	     const day = new Date(year, month, date);
  	     const dayName = day.toString().split(" ")[0];
  	   
  	   
  	   }

  	   //function update events when a day is active
  	   function updateEvents() {
  	     let events = "";
  	     let eventsFound = false;
  		 let totalEvents = 0;
  	     // Loop through all events and display them
  	     eventsArr.forEach(eventDay => {
  	       eventDay.events.forEach(event => {
  	         eventsFound = true;
  			 totalEvents++;
  			events += 
  			    '<div class="event">' +
  			        '<span class="serial-number">' + totalEvents + '.</span>' +
  			        '<div class="title">' +
  			            '<i class="fas fa-circle"></i>' +
  			            '<h3 class="event-title">' + event.title + '</h3>' +
  			        '</div>' +
  			        '<div class="event-time">' +
  			            '<span>' + event.time + '</span>'  +
	    	                "<div class=\"event-date\">" +
	    	                    "<span>" + eventDay.day + "-" + eventDay.month + "-" + eventDay.year + "</span>" +
	    	                "</div>"+
  			        '</div>' +
  			    '</div>';

  	       });
  	     });

  	     // If no events found, display "No Events"
  	     if (!eventsFound) {
  	    	events = '<div class="no-event">' +
            '<h3>No Events</h3>' +
        '</div>';

  	     }

  	     // Update the events container
  	     eventsContainer.innerHTML = events;
  	   }


  	   //function to add event
  	   addEventBtn.addEventListener("click", () => {
  	     addEventWrapper.classList.toggle("active");
  	   });

  	   addEventCloseBtn.addEventListener("click", () => {
  	     addEventWrapper.classList.remove("active");
  	   });

  	   document.addEventListener("click", (e) => {
  	     if (e.target !== addEventBtn && !addEventWrapper.contains(e.target)) {
  	       addEventWrapper.classList.remove("active");
  	     }
  	   });

  	   //allow 50 chars in eventtitle
  	   addEventTitle.addEventListener("input", (e) => {
  	     addEventTitle.value = addEventTitle.value.slice(0, 60);
  	   });

  	  

  	   //allow only time in eventtime from and to
  	   addEventFrom.addEventListener("input", (e) => {
  	     addEventFrom.value = addEventFrom.value.replace(/[^0-9:]/g, "");
  	     if (addEventFrom.value.length === 2) {
  	       addEventFrom.value += ":";
  	     }
  	     if (addEventFrom.value.length > 5) {
  	       addEventFrom.value = addEventFrom.value.slice(0, 5);
  	     }
  	   });

  	   addEventTo.addEventListener("input", (e) => {
  	     addEventTo.value = addEventTo.value.replace(/[^0-9:]/g, "");
  	     if (addEventTo.value.length === 2) {
  	       addEventTo.value += ":";
  	     }
  	     if (addEventTo.value.length > 5) {
  	       addEventTo.value = addEventTo.value.slice(0, 5);
  	     }
  	   });

  	   //function to add event to eventsArr
  	   addEventSubmit.addEventListener("click", () => {
  		
  	     const eventTitle = addEventTitle.value;
  	     const eventTimeFrom = addEventFrom.value;
  	     const eventTimeTo = addEventTo.value;
  	     if (eventTitle === "" || eventTimeFrom === "" || eventTimeTo === "") {
  	       alert("Please fill all the fields");
  	       return;
  	     }
      
  	     //check correct time format 24 hour
  	     const timeFromArr = eventTimeFrom.split(":");
  	     const timeToArr = eventTimeTo.split(":");
  	     if (
  	       timeFromArr.length !== 2 ||
  	       timeToArr.length !== 2 ||
  	       timeFromArr[0] > 23 ||
  	       timeFromArr[1] > 59 ||
  	       timeToArr[0] > 23 ||
  	       timeToArr[1] > 59
  	     ) {
  	       alert("Invalid Time Format");
  	       return;
  	     }

  	     const timeFrom = convertTime(eventTimeFrom);
  	     const timeTo = convertTime(eventTimeTo);

  	     //check if event is already added
  	     let eventExist = false;
  	     eventsArr.forEach((event) => {
  	       if (
  	         event.day === activeDay &&
  	         event.month === month + 1 &&
  	         event.year === year
  	       ) {
  	         event.events.forEach((event) => {
  	           if (event.title === eventTitle) {
  	             eventExist = true;
  	           }
  	         });
  	       }
  	     });
  	     if (eventExist) {
  	       alert("Event already added");
  	       return;
  	     }
  	     const newEvent = {
  	       title: eventTitle,
  	       time: timeFrom + " - " + timeTo,
  	     };
  	     console.log(newEvent);
  	     console.log(activeDay);
  	     let eventAdded = false;
  	     if (eventsArr.length > 0) {
  	       eventsArr.forEach((item) => {
  	         if (
  	           item.day === activeDay &&
  	           item.month === month + 1 &&
  	           item.year === year
  	         ) {
  	           item.events.push(newEvent);
  	           eventAdded = true;
  	         }
  	       });
  	     }

  	     if (!eventAdded) {
  	       eventsArr.push({
  	         day: activeDay,
  	         month: month + 1,
  	         year: year,
  	         events: [newEvent],
  	       });
  	     }

  	     console.log(eventsArr);
  		 let lastAddedEvent = eventsArr[eventsArr.length - 1];
  		 fetch('event-handler', { // Make sure this matches your servlet's URL mapping
  		 	         method: 'POST',
  		 	         headers: {
  		 	           'Content-Type': 'application/json',
  		 	         },
  		 	         body: JSON.stringify(lastAddedEvent),
  					  // Send events array to the server
  		 	       })
  		 	       .then(response => {
  		 	         if (!response.ok) {
  		 	           throw new Error('Failed to save events on the server');
  		 	         }
  		 	         return response.json();
  		 	       })
  		 	       .then(data => {
  		 	         console.log('Server Response:', data); // Optionally handle server response
  		 	         showToaster('Events successfully saved!');
  		 	       })
  		 	       .catch(error => {
  		 	         console.error('Error:', error);
  		 	         showToaster('Failed to save events');
  		 	       });
  				   renderEvents();
  	     addEventWrapper.classList.remove("active");
  	     addEventTitle.value = "";
  	     addEventFrom.value = "";
  	     addEventTo.value = "";
  	     updateEvents(activeDay);
  	     //select active day and add event class if not added
  	     const activeDayEl = document.querySelector(".day.active");
  	     if (!activeDayEl.classList.contains("event")) {
  	       activeDayEl.classList.add("event");
  	     }
  	   });

  	   //function to delete event when clicked on event
  	   eventsContainer.addEventListener("click", (e) => {
  	     if (e.target.classList.contains("event")) {
  	       if (confirm("Are you sure you want to delete this event?")) {
  	         const eventTitle = e.target.children[0].children[1].innerHTML;

  	         // Loop through eventsArr and delete the selected event
  	         eventsArr.forEach((event) => {
  	           if (event.day === activeDay && event.month === month + 1 && event.year === year) {
  	             event.events.forEach((item, index) => {
  	               if (item.title === eventTitle) {
  	                 event.events.splice(index, 1); // Remove event from the day
  	               }
  	             });

  	             // If no events left for the day, remove the entire day entry from eventsArr
  	             if (event.events.length === 0) {
  	               eventsArr.splice(eventsArr.indexOf(event), 1);

  	               // Remove the 'event' class from the corresponding day element
  	               const activeDayEl = document.querySelector(".day.active");
  	               if (activeDayEl.classList.contains("event")) {
  	                 activeDayEl.classList.remove("event");
  	               }
  	             }
  	           }
  	         });

  	         // Re-render the events and update the UI
  	         updateEvents(activeDay); // Ensure to refresh the event list for the active day
  	       }
  	     }
  	   });

  	   //function to save events in local storage

  	   

  	   //function to get events from local storage
  	   
  		 // Send a GET request to the server to fetch data
  		 function getevents() {
  		     if (localStorage.getItem("events") === null) {
  		         return; // No events in localStorage, so skip.
  		     }

  		     // Fetch events dynamically (Ensure the correct endpoint)
  		     fetch("loadd")  // Replace 'loadd' with correct endpoint
  		         .then(response => response.json()) // Parse JSON response
  		         .then(data => {
  		             eventsArr.length = 0; // Clear existing events

  		             // Check if events exist in the response and are an array
  		             if (data && Array.isArray(data.events)) {
  		                 data.events.forEach(event => {
  		                     eventsArr.push({
  		                         title: event.title,
  		                         time: event.time,
  		                         date: event.date,
  		                     });
  		                 });

  		                 // After fetching events, render them on the active day
  		                 renderEvents();
  		             }
  		         })
  		         .catch(error => console.error("Error fetching events:", error));
  		 }

  	   

  	   function convertTime(time) {
  	     //convert time to 24 hour format
  	     let timeArr = time.split(":");
  	     let timeHour = timeArr[0];
  	     let timeMin = timeArr[1];
  	     let timeFormat = timeHour >= 12 ? "PM" : "AM";
  	     timeHour = timeHour % 12 || 12;
  	     time = timeHour + ":" + timeMin + " " + timeFormat;
  	     return time;
  	   }
  	   /*function saveEvents() {
  	        localStorage.setItem("events", JSON.stringify(eventsArr));
  	       
  	       }*/
  		  

  		   // Example renderEvents function (this should render events as needed)
  	     function renderEvents() {
  	    	    // Clear the existing events
  	    	    eventsContainer.innerHTML = "";

  	    	    let totalEvents = 0; // Initialize the counter for total events

  	    	    // Iterate over all events and display them
  	    	    eventsArr.forEach((eventDay) => {
  	    	        eventDay.events.forEach((event) => {
  	    	            totalEvents++; // Increment the counter for each event

  	    	            const eventElement = document.createElement("div");
  	    	            eventElement.classList.add("event");

  	    	            eventElement.innerHTML = 
  	    	                "<span class=\"serial-number\">" + totalEvents + ".</span>" +  
  	    	                "<div class=\"title\">" +
  	    	                    "<i class=\"fas fa-circle\"></i>" +
  	    	                    "<h3 class=\"event-title\">" + event.title + "</h3>" +
  	    	                "</div>" +
  	    	                "<div class=\"event-time\">" +
  	    	                    "<span>" + event.time + "</span>" +
  	    	                "</div>" +
  	    	                "<div class=\"event-date\">" +
  	    	                    "<span>" + eventDay.day + "-" + eventDay.month + "-" + eventDay.year + "</span>" +
  	    	                "</div>";

  	    	            // Append the event to the eventsContainer
  	    	            eventsContainer.appendChild(eventElement);
  	    	        });
  	    	    });

  	    	    // Log the total number of events rendered
  	    	    console.log("Total Events Rendered:" + totalEvents);
  	    	}

     </script> 
     
  </body>
</html>