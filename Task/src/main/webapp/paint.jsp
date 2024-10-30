<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  
    %>
    <%@ page import="java.net.URLEncoder" %>
    <%@ page session="true" %>
    
    <%
    String user=request.getParameter("username");
    String email=request.getParameter("email");
    session.setAttribute("username",user);
    session.setAttribute("email",email);
    String username = (String) session.getAttribute("username");
    String emailid = (String) session.getAttribute("email");%>
<!DOCTYPE html>

<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
      </style>

  <body class="flex w-full bg-purple-100">
    <aside
    class="flex w-[18%] flex-col h-screen px-4 py-8 overflow-y-hidden bg-[#433878] rtl:border-r-0 rtl:border-l "
  >
    <a href="/Login_Registration/index.jsp">
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
      <div class="w-[6rem] h-[6rem] flex items-center justify-center text-center bg-red-500 rounded-full">
    <h1 id="name" class="font-bold text-6xl text-white capitalize"><%= username.charAt(0) %></h1>
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
  
          <a href="http://localhost:8080/Login_Registration/main.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Daily Tasks</a>
        </p>
        <p
            class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
            href="#"
          >
           <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 448 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#ffffff"
								d="M128 0c17.7 0 32 14.3 32 32l0 32 128 0 0-32c0-17.7 14.3-32 32-32s32 14.3 32 32l0 32 48 0c26.5 0 48 21.5 48 48l0 48L0 160l0-48C0 85.5 21.5 64 48 64l48 0 0-32c0-17.7 14.3-32 32-32zM0 192l448 0 0 272c0 26.5-21.5 48-48 48L48 512c-26.5 0-48-21.5-48-48L0 192zm64 80l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm128 0l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0zM64 400l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0zm112 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16z" /></svg>
						
            <a href="http://localhost:8080/Task/schedule.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Schedule</a>
          </p>
  
        <p
          class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
          href="#"
        >
         <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#ffffff" d="M339.3 367.1c27.3-3.9 51.9-19.4 67.2-42.9L568.2 74.1c12.6-19.5 9.4-45.3-7.6-61.2S517.7-4.4 499.1 9.6L262.4 187.2c-24 18-38.2 46.1-38.4 76.1L339.3 367.1zm-19.6 25.4l-116-104.4C143.9 290.3 96 339.6 96 400c0 3.9 .2 7.8 .6 11.6C98.4 429.1 86.4 448 68.8 448L64 448c-17.7 0-32 14.3-32 32s14.3 32 32 32l144 0c61.9 0 112-50.1 112-112c0-2.5-.1-5-.2-7.5z"/></svg>
  
          <a class="mx-4 font-medium">Whiteboard</a>
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
       
  
        <a href="http://localhost:8080/Task/files.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Files</a>
      </p>
  
        <!-- Repeat similarly for other menu items like March, April, May, etc. -->
      </nav>
    </div>
  </aside>
      <!-------------------------------------Paint section---------------------->
    <div class="container  flex gap-2.5 p-2.5  w-[82%] ">
      <section class="tools-board border-4 border-black bg-white h-[60%] rounded-md w-52 p-4">
        <div class="row mb-5">
          <label class="title">Shapes</label>
          <ul class="options list-none mt-2.5 ml-1.25">
            <li class="option tool flex items-center cursor-pointer mb-2.5" id="rectangle">
              <img src="icons/rectangle.svg" alt="">
              <span class="pl-2.5 text-gray-600 cursor-pointer">Rectangle</span>
            </li>
            <li class="option tool flex items-center cursor-pointer mb-2.5" id="circle">
              <img src="icons/circle.svg" alt="">
              <span class="pl-2.5 text-gray-600 cursor-pointer">Circle</span>
            </li>
            <li class="option tool flex items-center cursor-pointer mb-2.5" id="triangle">
              <img src="icons/triangle.svg" alt="">
              <span class="pl-2.5 text-gray-600 cursor-pointer">Triangle</span>
            </li>
            <li class="option flex items-center cursor-pointer mb-2.5">
              <input type="checkbox" id="fill-color" class="cursor-pointer h-3.5 w-3.5">
              <label for="fill-color" class="pl-2.5 text-gray-600 cursor-pointer">Fill color</label>
            </li>
          </ul>
        </div>
        <div class="row mb-5">
          <label class="title">Options</label>
          <ul class="options list-none mt-2.5 ml-1.25">
            <li class="option active tool flex items-center cursor-pointer mb-2.5" id="brush">
              <img src="icons/brush.svg" alt="">
              <span class="pl-2.5 text-gray-600 cursor-pointer">Brush</span>
            </li>
            <li class="option tool flex items-center cursor-pointer mb-2.5" id="eraser">
              <img src="icons/eraser.svg" alt="">
              <span class="pl-2.5 text-gray-600 cursor-pointer">Eraser</span>
            </li>
            <li class="option">
              <input type="range" id="size-slider" min="1" max="30" value="5" class="w-full h-1.25 mt-2.5">
            </li>
          </ul>
        </div>
        <div class="row colors mb-5">
          <label class="title">Colors</label>
          <ul class="options flex justify-between mt-2.5">
            <li class="option h-5 w-5 rounded-full border border-gray-400 mt-0.75"></li>
            <li class="option selected h-5 w-5 rounded-full bg-black mt-0.75 relative">
              <div class="absolute inset-1/2 h-3 w-3 bg-current border border-white rounded-full transform -translate-x-1/2 -translate-y-1/2"></div>
            </li>
            <li class="option h-5 w-5 bg-red-600 rounded-full mt-0.75"></li>
            <li class="option h-5 w-5 bg-green-500 rounded-full mt-0.75"></li>
            <li class="option h-5 w-5 bg-blue-500 rounded-full mt-0.75 relative">
              <input type="color" id="color-picker" value="#4A98F7" class="absolute inset-0 opacity-0 cursor-pointer">
            </li>
          </ul>
        </div>
        <div class="row buttons">
          <button class="clear-canvas w-full text-gray-600 border border-gray-600 rounded-md py-2 text-sm mb-3 hover:bg-gray-600 hover:text-white transition-colors">
            Clear Canvas
          </button>
          <button class="save-img w-full bg-purple-500 text-white border bg-purple-800 rounded-md py-2 text-sm">
            Save As Image
          </button>
        </div>
      </section>
      <section class="drawing-board flex-1 overflow-hidden">
        <canvas class="border border-4 border-black w-full h-full"></canvas>
      </section>
    </div>
 
    <script>
        const canvas = document.querySelector("canvas"),
toolBtns = document.querySelectorAll(".tool"),
fillColor = document.querySelector("#fill-color"),
sizeSlider = document.querySelector("#size-slider"),
colorBtns = document.querySelectorAll(".colors .option"),
colorPicker = document.querySelector("#color-picker"),
clearCanvas = document.querySelector(".clear-canvas"),
saveImg = document.querySelector(".save-img"),
ctx = canvas.getContext("2d");

// global variables with default value
let prevMouseX, prevMouseY, snapshot,
isDrawing = false,
selectedTool = "brush",
brushWidth = 5,
selectedColor = "#000";

const setCanvasBackground = () => {
    // setting whole canvas background to white, so the downloaded img background will be white
    ctx.fillStyle = "#fff";
    ctx.fillRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = selectedColor; // setting fillstyle back to the selectedColor, it'll be the brush color
}

window.addEventListener("load", () => {
    // setting canvas width/height.. offsetwidth/height returns viewable width/height of an element
    canvas.width = canvas.offsetWidth;
    canvas.height = canvas.offsetHeight;
    setCanvasBackground();
});

const drawRect = (e) => {
    // if fillColor isn't checked draw a rect with border else draw rect with background
    if(!fillColor.checked) {
        // creating circle according to the mouse pointer
        return ctx.strokeRect(e.offsetX, e.offsetY, prevMouseX - e.offsetX, prevMouseY - e.offsetY);
    }
    ctx.fillRect(e.offsetX, e.offsetY, prevMouseX - e.offsetX, prevMouseY - e.offsetY);
}

const drawCircle = (e) => {
    ctx.beginPath(); // creating new path to draw circle
    // getting radius for circle according to the mouse pointer
    let radius = Math.sqrt(Math.pow((prevMouseX - e.offsetX), 2) + Math.pow((prevMouseY - e.offsetY), 2));
    ctx.arc(prevMouseX, prevMouseY, radius, 0, 2 * Math.PI); // creating circle according to the mouse pointer
    fillColor.checked ? ctx.fill() : ctx.stroke(); // if fillColor is checked fill circle else draw border circle
}

const drawTriangle = (e) => {
    ctx.beginPath(); // creating new path to draw circle
    ctx.moveTo(prevMouseX, prevMouseY); // moving triangle to the mouse pointer
    ctx.lineTo(e.offsetX, e.offsetY); // creating first line according to the mouse pointer
    ctx.lineTo(prevMouseX * 2 - e.offsetX, e.offsetY); // creating bottom line of triangle
    ctx.closePath(); // closing path of a triangle so the third line draw automatically
    fillColor.checked ? ctx.fill() : ctx.stroke(); // if fillColor is checked fill triangle else draw border
}

const startDraw = (e) => {
    isDrawing = true;
    prevMouseX = e.offsetX; // passing current mouseX position as prevMouseX value
    prevMouseY = e.offsetY; // passing current mouseY position as prevMouseY value
    ctx.beginPath(); // creating new path to draw
    ctx.lineWidth = brushWidth; // passing brushSize as line width
    ctx.strokeStyle = selectedColor; // passing selectedColor as stroke style
    ctx.fillStyle = selectedColor; // passing selectedColor as fill style
    // copying canvas data & passing as snapshot value.. this avoids dragging the image
    snapshot = ctx.getImageData(0, 0, canvas.width, canvas.height);
}

const drawing = (e) => {
    if(!isDrawing) return; // if isDrawing is false return from here
    ctx.putImageData(snapshot, 0, 0); // adding copied canvas data on to this canvas

    if(selectedTool === "brush" || selectedTool === "eraser") {
        // if selected tool is eraser then set strokeStyle to white 
        // to paint white color on to the existing canvas content else set the stroke color to selected color
        ctx.strokeStyle = selectedTool === "eraser" ? "#fff" : selectedColor;
        ctx.lineTo(e.offsetX, e.offsetY); // creating line according to the mouse pointer
        ctx.stroke(); // drawing/filling line with color
    } else if(selectedTool === "rectangle"){
        drawRect(e);
    } else if(selectedTool === "circle"){
        drawCircle(e);
    } else {
        drawTriangle(e);
    }
}

toolBtns.forEach(btn => {
    btn.addEventListener("click", () => { // adding click event to all tool option
        // removing active class from the previous option and adding on current clicked option
        document.querySelector(".options .active").classList.remove("active");
        btn.classList.add("active");
        selectedTool = btn.id;
    });
});

sizeSlider.addEventListener("change", () => brushWidth = sizeSlider.value); // passing slider value as brushSize

colorBtns.forEach(btn => {
    btn.addEventListener("click", () => { // adding click event to all color button
        // removing selected class from the previous option and adding on current clicked option
        document.querySelector(".options .selected").classList.remove("selected");
        btn.classList.add("selected");
        // passing selected btn background color as selectedColor value
        selectedColor = window.getComputedStyle(btn).getPropertyValue("background-color");
    });
});

colorPicker.addEventListener("change", () => {
    // passing picked color value from color picker to last color btn background
    colorPicker.parentElement.style.background = colorPicker.value;
    colorPicker.parentElement.click();
});

clearCanvas.addEventListener("click", () => {
    ctx.clearRect(0, 0, canvas.width, canvas.height); // clearing whole canvas
    setCanvasBackground();
});

saveImg.addEventListener("click", () => {
    const link = document.createElement("a"); // creating <a> element
    link.download = `${Date.now()}.jpg`; // passing current date as link download value
    link.href = canvas.toDataURL(); // passing canvasData as link href value
    link.click(); // clicking link to download image
});

canvas.addEventListener("mousedown", startDraw);
canvas.addEventListener("mousemove", drawing);
canvas.addEventListener("mouseup", () => isDrawing = false);
    </script>
  </body>
</html>