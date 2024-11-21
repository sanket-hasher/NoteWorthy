<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page session="true"%>

<%
//String username=request.getParameter("username");
//String emailid=request.getParameter("email");
// String username = (String) session.getAttribute("username");
// String emailid = (String) session.getAttribute("email");
String username = null;
String emailid = null;

// Get cookies from the request
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
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://cdn.tailwindcss.com"></script>

<title>Document</title>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}


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
</style>
<body>
	<div class="flex w-full">
		<aside
			class="flex w-[18%] flex-col h-screen px-4 py-8 overflow-y-hidden bg-[#433878] rtl:border-r-0 rtl:border-l">
			<a href="/Login_Registration/index.jsp"> <svg
					class="absolute h-5 cursor-pointer"
					xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
         
          <path fill="#ffffff"
						d="M575.8 255.5c0 18-15 32.1-32 32.1l-32 0 .7 160.2c0 2.7-.2 5.4-.5 8.1l0 16.2c0 22.1-17.9 40-40 40l-16 0c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1L416 512l-24 0c-22.1 0-40-17.9-40-40l0-24 0-64c0-17.7-14.3-32-32-32l-64 0c-17.7 0-32 14.3-32 32l0 64 0 24c0 22.1-17.9 40-40 40l-24 0-31.9 0c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2l-16 0c-22.1 0-40-17.9-40-40l0-112c0-.9 0-1.9 .1-2.8l0-69.7-32 0c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z" />
        </svg>

			</a>

			<div class="flex flex-col items-center mt-6 -mx-2">
				<div
				id="profile-icon"
					class="w-[6rem] h-[6rem] flex items-center justify-center text-center rounded-full">
					<h1 id="name" class="font-bold text-6xl text-white capitalize"><%=username.charAt(0)%></h1>
				</div>


				<h4 class="mx-2 mt-2 font-medium text-white"><%=username%></h4>
				<p class="mx-2 mt-1 text-sm font-medium text-white"><%=emailid %></p>
			</div>

			<div class="flex flex-col justify-between flex-1 mt-6">
				<nav class="cursor-pointer">
					<p class="flex items-center px-4 py-2 text-white rounded-lg bg-[#2E073F]">
						<svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 512 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#ffffff"
								d="M152.1 38.2c9.9 8.9 10.7 24 1.8 33.9l-72 80c-4.4 4.9-10.6 7.8-17.2 7.9s-12.9-2.4-17.6-7L7 113C-2.3 103.6-2.3 88.4 7 79s24.6-9.4 33.9 0l22.1 22.1 55.1-61.2c8.9-9.9 24-10.7 33.9-1.8zm0 160c9.9 8.9 10.7 24 1.8 33.9l-72 80c-4.4 4.9-10.6 7.8-17.2 7.9s-12.9-2.4-17.6-7L7 273c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l22.1 22.1 55.1-61.2c8.9-9.9 24-10.7 33.9-1.8zM224 96c0-17.7 14.3-32 32-32l224 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-224 0c-17.7 0-32-14.3-32-32zm0 160c0-17.7 14.3-32 32-32l224 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-224 0c-17.7 0-32-14.3-32-32zM160 416c0-17.7 14.3-32 32-32l288 0c17.7 0 32 14.3 32 32s-14.3 32-32 32l-288 0c-17.7 0-32-14.3-32-32zM48 368a48 48 0 1 1 0 96 48 48 0 1 1 0-96z" /></svg>

						<a class="mx-4 font-medium">Daily Tasks</a>
					</p>
					<p
						class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
						href="#">
						<svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 448 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#ffffff"
								d="M128 0c17.7 0 32 14.3 32 32l0 32 128 0 0-32c0-17.7 14.3-32 32-32s32 14.3 32 32l0 32 48 0c26.5 0 48 21.5 48 48l0 48L0 160l0-48C0 85.5 21.5 64 48 64l48 0 0-32c0-17.7 14.3-32 32-32zM0 192l448 0 0 272c0 26.5-21.5 48-48 48L48 512c-26.5 0-48-21.5-48-48L0 192zm64 80l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm128 0l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0zM64 400l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0zm112 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16z" /></svg>
						<a
							href="http://localhost:8080/Task/schedule.jsp?username=<%=username%>&email=<%=emailid%>"
							class="mx-4 font-medium">Schedule</a>
					</p>

					<p
						class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
						href="#">
						<svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 576 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#ffffff"
								d="M339.3 367.1c27.3-3.9 51.9-19.4 67.2-42.9L568.2 74.1c12.6-19.5 9.4-45.3-7.6-61.2S517.7-4.4 499.1 9.6L262.4 187.2c-24 18-38.2 46.1-38.4 76.1L339.3 367.1zm-19.6 25.4l-116-104.4C143.9 290.3 96 339.6 96 400c0 3.9 .2 7.8 .6 11.6C98.4 429.1 86.4 448 68.8 448L64 448c-17.7 0-32 14.3-32 32s14.3 32 32 32l144 0c61.9 0 112-50.1 112-112c0-2.5-.1-5-.2-7.5z" /></svg>

						<a
							href="http://localhost:8080/Task/paint.jsp?username=<%=username%>&email=<%=emailid%>"
							class="mx-4 font-medium">Whiteboard</a>
					</p>

					<p
						class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
						href="#">
						<svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 384 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#ffffff"
								d="M320 464c8.8 0 16-7.2 16-16l0-288-80 0c-17.7 0-32-14.3-32-32l0-80L64 48c-8.8 0-16 7.2-16 16l0 384c0 8.8 7.2 16 16 16l256 0zM0 64C0 28.7 28.7 0 64 0L229.5 0c17 0 33.3 6.7 45.3 18.7l90.5 90.5c12 12 18.7 28.3 18.7 45.3L384 448c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 64z" /></svg>

						<a
							href="http://localhost:8080/Task/files.jsp?username=<%=username%>&email=<%=emailid%>"
							class="mx-4 font-medium">Files</a>
					</p>
					
					<p
						class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
						href="#">
												<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path fill="#ffffff" d="M441 58.9L453.1 71c9.4 9.4 9.4 24.6 0 33.9L424 134.1 377.9 88 407 58.9c9.4-9.4 24.6-9.4 33.9 0zM209.8 256.2L344 121.9 390.1 168 255.8 302.2c-2.9 2.9-6.5 5-10.4 6.1l-58.5 16.7 16.7-58.5c1.1-3.9 3.2-7.5 6.1-10.4zM373.1 25L175.8 222.2c-8.7 8.7-15 19.4-18.3 31.1l-28.6 100c-2.4 8.4-.1 17.4 6.1 23.6s15.2 8.5 23.6 6.1l100-28.6c11.8-3.4 22.5-9.7 31.1-18.3L487 138.9c28.1-28.1 28.1-73.7 0-101.8L474.9 25C446.8-3.1 401.2-3.1 373.1 25zM88 64C39.4 64 0 103.4 0 152L0 424c0 48.6 39.4 88 88 88l272 0c48.6 0 88-39.4 88-88l0-112c0-13.3-10.7-24-24-24s-24 10.7-24 24l0 112c0 22.1-17.9 40-40 40L88 464c-22.1 0-40-17.9-40-40l0-272c0-22.1 17.9-40 40-40l112 0c13.3 0 24-10.7 24-24s-10.7-24-24-24L88 64z"/></svg>
						
						<a
							href="http://localhost:8080/Task/editor.jsp?username=<%=username%>&email=<%=emailid%>"
							class="mx-4 font-medium">Notes</a>
					</p>
					

					<!-- Repeat similarly for other menu items like March, April, May, etc. -->
				</nav>
			</div>
			 <div id="logout-container"  style="display: none">
        <form action="logout" method="post">
            <input type="submit"  class="block cursor-pointer text-white" value="LOGOUT">
             <div class="absolute left-0 right-0 bottom-0 h-[2px] bg-white transform scale-x-0 transition-transform duration-300 group-hover:scale-x-100"></div>
        </form>
		</aside>
		<div class="bg-purple-100 mx-auto w-[82%]">
			<div class="flex space-x-4 mt-8 justify-center">
				<!-- To Do Column -->
				
<div class="w-[25rem] bg-white rounded-lg shadow-md p-4">
    <h2 class="font-bold text-xl mb-4">To Do</h2>
    <div class="mb-4" id="todo-column">
        <input class="border rounded p-2 w-full" id="new-task-todo" type="text" placeholder="Add new task" />
        <button class="mt-2 w-full bg-purple-600 text-white p-2 rounded" onclick="addTask('todo')">Add Task</button>
    </div>
    <div id="todo" class="h-[300px] overflow-y-scroll p-2 space-y-2 bg-gray-50 rounded-lg">
        <!-- Sample Task -->
        <div class="flex justify-between items-center task bg-blue-100 p-4 rounded-md cursor-pointer">
            <p>Task 1</p>
            <div class="flex gap-2">
                <button class="bg-green-500 rounded-md py-1 px-3 text-white" onclick="moveTask(this.parentElement.parentElement, 'inprogress')">Start</button>
                <button onclick="removeTask(this)"><svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="#ff0000" d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96h384c17.7 0 32-14.3 32-32s-14.3-32-32-32H135.2zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45h245.8c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg></button>
            </div>
        </div>
    </div>
</div>

<!-- In Progress Column -->
<div class="w-[25rem] bg-white rounded-lg shadow-md p-4">
    <h2 class="font-bold text-xl mb-4">In Progress</h2>
    <div id="inprogress" class="h-[400px]  overflow-y-scroll p-2 space-y-2 bg-gray-50 rounded-lg"></div>
</div>

<!-- Done Column -->
<div class="w-[25rem] bg-white rounded-lg shadow-md p-4">
    <h2 class="font-bold text-xl mb-4">Done</h2>
    <div id="done" class="h-[400px]  overflow-y-scroll p-2 space-y-2 bg-gray-50 rounded-lg"></div>
</div>
				
				
			</div>
			<div>
				<h2 class="font-bold text-xl mb-4">Audio Recorder</h2>
  				<button class="mt-2 w-half bg-purple-600 text-white p-2 rounded" id="start">Start Recording</button>
  				<button class="mt-2 w-half bg-purple-600 text-white p-2 rounded" id="stop" disabled>Stop Recording</button>
  
  				<h3 class="font-bold text-xl mb-4">Recordings:</h3>
  				<ul id="recordingsList"></ul>
				</div>
		</div>
	</div>
	<script type="text/javascript">
		const nameElement = document.getElementById("name");
		const firstChar = nameElement.textContent.charAt(0);
		nameElement.textContent = firstChar;
		const colors = ["#FF5722", "#D32F2F", "#388E3C"];

		// Select a random color from the array
		document.addEventListener("DOMContentLoaded", function() {
			// Pick a random color
			const randomColor = colors[Math.floor(Math.random() * colors.length)];
			// Apply it to the background of the profile-icon
			document.getElementById("profile-icon").style.backgroundColor = randomColor;
		});


		function addTask(column) {
		    const taskInput = document.getElementById('new-task-' + column);
		    if (!taskInput) return;

		    const taskText = taskInput.value.trim();
		    if (taskText === "") return; // Avoid adding empty tasks
		    
		    const taskId = 'task-' + new Date().getTime();


		    console.log(taskId);

		    // Send data to the server (AddTask servlet)
		    fetch('addtask', {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify({ taskName: taskText,taskId: taskId }) // Send taskName to the server
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            // Proceed with UI updates only if the server insert was successful
		            // Create task container
		            const taskElement = document.createElement("div");
		            taskElement.className = `flex justify-between items-center task bg-blue-100 p-4 rounded-md cursor-pointer mb-2`;
		            taskElement.id = taskId;

		            // Create the task text
		            const taskTextElement = document.createElement("p");
		            taskTextElement.textContent = taskText;
		            taskElement.appendChild(taskTextElement);

		            // Create a div for the buttons
		            const buttonContainer = document.createElement("div");
		            buttonContainer.className = "flex gap-2";

		            // Add "Start" button for tasks in the "To Do" column
		            if (column === 'todo') {
		                const startButton = document.createElement("button");
		                startButton.textContent = "Start";
		                startButton.className = "bg-green-500 rounded-md py-1 px-3 text-white";
		                startButton.onclick = function() {
		                    moveTask(taskElement, 'inprogress');
		                };
		                buttonContainer.appendChild(startButton);
		            }

		            // Add remove button
		            const removeButton = document.createElement("button");
		            removeButton.innerHTML = '<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="#ff0000" d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96h384c17.7 0 32-14.3 32-32s-14.3-32-32-32H135.2zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45h245.8c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg>';
		            removeButton.onclick = function() {
		                removeTask(removeButton);
		            };
		            buttonContainer.appendChild(removeButton);

		            // Append button container to the task element
		            taskElement.appendChild(buttonContainer);

		            // Add the task to the appropriate column
		            document.getElementById(column).appendChild(taskElement);

		            // Clear input field
		            taskInput.value = "";
		        } else {
		            // Handle failure response
		            console.error('Failed to add task:', data.message);
		        }
		    })
		    .catch(error => console.error('Error:', error));
		}

		function moveTask(taskElement, targetColumnId) {
		    const taskId = taskElement.id; // Use the unique ID as the task ID
		    const taskDescription = taskElement.querySelector("p").textContent; // Get task description

		    // Define the URL for moving tasks based on the target column
		    const url = targetColumnId === 'inprogress' ? 'movetoinprogress' : 'movetodone';

		    // Send a fetch request to move the task in the database
		    fetch(url, {
		        method: 'POST',
		        headers: { 'Content-Type': 'application/json' },
		        body: JSON.stringify({ taskId, taskDescription })
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            // Update the task element class based on the target column
		            if (targetColumnId === 'inprogress') {
		                taskElement.className = "flex justify-between items-center task bg-yellow-100 p-4 rounded-md cursor-pointer mb-2";
		            } else if (targetColumnId === 'done') {
		                taskElement.className = "flex justify-between items-center task bg-green-100 p-4 rounded-md cursor-pointer mb-2";
		                taskElement.innerHTML += `
		                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="#04ff00" d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>`;
		            }

		            let buttonContainer = taskElement.querySelector('div');
		            if (buttonContainer) {
		                buttonContainer.innerHTML = '';
		            } else {
		                buttonContainer = document.createElement('div');
		                buttonContainer.className = 'flex gap-2';
		                taskElement.appendChild(buttonContainer);
		            }

		            if (targetColumnId === 'inprogress') {
		                const doneButton = document.createElement("button");
		                doneButton.textContent = "Done";
		                doneButton.className = "float-right bg-green-500 rounded-md py-1 px-3 text-white";
		                doneButton.onclick = function() {
		                    moveTask(taskElement, 'done');
		                };
		                buttonContainer.appendChild(doneButton);
		            }

		            document.getElementById(targetColumnId).appendChild(taskElement);
		        } else {
		            console.error('Failed to move task:', data.message);
		        }
		    })
		    .catch(error => console.error('Error:', error));
		}

		function removeTask(button) {
		    const taskElement = button.closest('.task');
		    const taskId = taskElement.id;

		    // Send request to remove the task from the database
		    fetch('deletetask', {
		        method: 'POST',
		        headers: { 'Content-Type': 'application/json' },
		        body: JSON.stringify({ taskId })
		    })
		    .then(response => response.json())
		    .then(data => {
		        if (data.success) {
		            taskElement.remove();
		        } else {
		            console.error('Failed to delete task:', data.message);
		        }
		    })
		    .catch(error => console.error('Error:', error));
		}
		
		document.addEventListener('DOMContentLoaded', function() {
		    fetchTasks();
		});

		function fetchTasks() {
		    fetch('loadTasks') // Assuming this is the endpoint to get tasks from the database
		        .then(response => response.json())
		        .then(data => {
		            if (data.success) {
		                // Ensure tasks is an array and loop through it
		                const tasks = Array.isArray(data.tasks) ? data.tasks : [];
		                populateTasks(tasks);
		            } else {
		                console.error('Error fetching tasks:', data.message);
		            }
		        })
		        .catch(error => console.error('Error:', error));
		}

		function populateTasks(tasks) {
		    // Clear current tasks
		    document.getElementById('todo').innerHTML = '';
		    document.getElementById('inprogress').innerHTML = '';
		    document.getElementById('done').innerHTML = '';

		    tasks.forEach(task => {
		        const taskElement = document.createElement("div");
		        taskElement.className = `flex justify-between items-center task bg-blue-100 p-4 rounded-md cursor-pointer mb-2`;
		        taskElement.id = task.taskid;

		        const taskTextElement = document.createElement("p");
		        taskTextElement.textContent = task.description;
		        taskElement.appendChild(taskTextElement);

		        const buttonContainer = document.createElement("div");
		        buttonContainer.className = "flex gap-2";

		        // Add buttons based on the task status
		        if (task.status === 'todo') {
		            const startButton = document.createElement("button");
		            startButton.textContent = "Start";
		            startButton.className = "bg-green-500 rounded-md py-1 px-3 text-white";
		            startButton.onclick = function() {
		                moveTask(taskElement, 'inprogress');
		            };
		            buttonContainer.appendChild(startButton);

		            // Add remove button only for 'todo' tasks
		            const removeButton = document.createElement("button");
		            removeButton.innerHTML = '<svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="#ff0000" d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96h384c17.7 0 32-14.3 32-32s-14.3-32-32-32H135.2zM416 128H32L53.2 467c1.6 25.3 22.6 45 47.9 45h245.8c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg>';
		            removeButton.onclick = function() {
		                removeTask(removeButton);
		            };
		            buttonContainer.appendChild(removeButton);
		        } else if (task.status === 'inprogress') {
		            taskElement.className = "flex justify-between items-center task bg-yellow-100 p-4 rounded-md cursor-pointer mb-2";
		            const doneButton = document.createElement("button");
		            doneButton.textContent = "Done";
		            doneButton.className = "float-right bg-green-500 rounded-md py-1 px-3 text-white";
		            doneButton.onclick = function() {
		                moveTask(taskElement, 'done');
		            };
		            buttonContainer.appendChild(doneButton);
		        }
		        taskElement.appendChild(buttonContainer);

		        // Add the green checkmark icon for completed tasks in the 'done' status
		        if (task.status === 'done') {
		            taskElement.className = "flex justify-between items-center task bg-green-100 p-4 rounded-md cursor-pointer mb-2";
		            taskElement.innerHTML += `
		                <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="#04ff00" d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg>
		            `;
		        }

		        

		        // Append task to the appropriate column
		        const columnId = task.status; // Get column based on status
		        document.getElementById(columnId).appendChild(taskElement);
		    });
		}







		 var username = "<%= username != null ? username : "" %>";
		    
		    if (username) {
		        document.getElementById('logout-container').style.display = 'block';
		  
		    } else {
		        document.getElementById('logout-container').style.display = 'none';
		       
		    }





		

		
		let mediaRecorder;
		let audioChunks = [];
		const recordingsList = document.getElementById("recordingsList");

		document.getElementById("start").addEventListener("click", async () => {
		  // Request permission and start recording
		  const stream = await navigator.mediaDevices.getUserMedia({ audio: true });
		  mediaRecorder = new MediaRecorder(stream);
		  audioChunks = [];

		  // Collect audio data in chunks
		  mediaRecorder.ondataavailable = event => {
		    audioChunks.push(event.data);
		  };

		  // Handle stopping of recording
		  mediaRecorder.onstop = () => {
		    const audioBlob = new Blob(audioChunks, { type: 'audio/webm' });
		    const audioUrl = URL.createObjectURL(audioBlob);

		    // Create new audio element for playback
		    const audioElement = document.createElement("audio");
		    audioElement.controls = true;
		    audioElement.src = audioUrl;

		    // Create a download link
		    const downloadLink = document.createElement("a");
		    downloadLink.href = audioUrl;

		    // Append audio and download link to the list
		    const listItem = document.createElement("li");
		    listItem.appendChild(audioElement);
		    listItem.appendChild(document.createTextNode(" "));
		    recordingsList.appendChild(listItem);
		  };

		  mediaRecorder.start();
		  document.getElementById("start").disabled = true;
		  document.getElementById("stop").disabled = false;
		});

		document.getElementById("stop").addEventListener("click", () => {
		  mediaRecorder.stop();
		  document.getElementById("start").disabled = false;
		  document.getElementById("stop").disabled = true;
		});
	</script>
</body>
</html>