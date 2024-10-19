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

  <body class="flex overflow-hidden bg-blue-400 ">
    <aside
    class="flex flex-col w-64 h-screen px-4 py-8 overflow-y-hidden bg-[#433878] rtl:border-r-0 rtl:border-l"
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
      <img
        class="object-cover w-24 h-24 mx-2 rounded-full"
        src="https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"
        alt="avatar"
      />
      <h4 class="mx-2 mt-2 font-medium text-white"><%=username %></h4>
      <p class="mx-2 mt-1 text-sm font-medium text-white"><%=emailid %></p>
    </div>
  
    <div class="flex flex-col justify-between flex-1 mt-6">
      <nav class="cursor-pointer">
        <p class="flex items-center px-4 py-2 text-white rounded-lg">
          <svg
            class="w-5 h-5"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M19 11H5M19 11C20.1046 11 21 11.8954 21 13V19C21 20.1046 20.1046 21 19 21H5C3.89543 21 3 20.1046 3 19V13C3 11.8954 3.89543 11 5 11M19 11V9C19 7.89543 18.1046 7 17 7M5 11V9C5 7.89543 5.89543 7 7 7M7 7V5C7 3.89543 7.89543 3 9 3H15C16.1046 3 17 3.89543 17 5V7M7 7H17"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>
  
          <a href="http://localhost:8080/Login_Registration/main.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Daily Tasks</a>
        </p>
        <p
            class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
            href="#"
          >
            <svg
              class="w-5 h-5"
              viewBox="0 0 24 24"
              fill="none"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7Z"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
              />
              <path
                d="M12 14C8.13401 14 5 17.134 5 21H19C19 17.134 15.866 14 12 14Z"
                stroke="currentColor"
                stroke-width="2"
                stroke-linecap="round"
                stroke-linejoin="round"
              />
            </svg>
    
            <a href="http://localhost:8080/Task/schedule.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Schedule</a>
          </p>
  
        <p
          class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
          href="#"
        >
          <svg
            class="w-5 h-5"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7Z"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
            <path
              d="M12 14C8.13401 14 5 17.134 5 21H19C19 17.134 15.866 14 12 14Z"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            />
          </svg>
  
          <a class="mx-4 font-medium">Paint</a>
        </p>
  
        <p
        class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
        href="#"
      >
        <svg
          class="w-5 h-5"
          viewBox="0 0 24 24"
          fill="none"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            d="M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7Z"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          />
          <path
            d="M12 14C8.13401 14 5 17.134 5 21H19C19 17.134 15.866 14 12 14Z"
            stroke="currentColor"
            stroke-width="2"
            stroke-linecap="round"
            stroke-linejoin="round"
          />
        </svg>
  
        <a href="http://localhost:8080/Task/files.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Files</a>
      </p>
  
        <!-- Repeat similarly for other menu items like March, April, May, etc. -->
      </nav>
    </div>
  </aside>
      <!-------------------------------------Paint section---------------------->
    <div class="container flex w-full gap-2.5 p-2.5">
      <section class="tools-board bg-white h-[60%] rounded-md w-52 p-4 pt-0">
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
          <button class="save-img w-full bg-blue-500 text-white border border-blue-500 rounded-md py-2 text-sm">
            Save As Image
          </button>
        </div>
      </section>
      <section class="drawing-board flex-1 overflow-hidden">
        <canvas class="border w-full h-full"></canvas>
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