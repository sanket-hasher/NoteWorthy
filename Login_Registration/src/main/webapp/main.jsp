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
				
			</div>

			<div class="flex flex-col justify-between flex-1 mt-6">
				<nav class="cursor-pointer">
					<p class="flex items-center px-4 py-2 text-white rounded-lg">
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

					<!-- Repeat similarly for other menu items like March, April, May, etc. -->
				</nav>
			</div>
		</aside>
		<div class="bg-purple-100 mx-auto w-[82%]">
			<div class="flex space-x-4 mt-8 justify-center">
				<!-- To Do Column -->
				<div class="w-[25rem] bg-white rounded-lg shadow-md p-4">
					<h2 class="font-bold text-xl mb-4">To Do</h2>
					<div class="mb-4" id="todo-column">
						<input class="border rounded p-2 w-full" id="new-task-todo"
							type="text" placeholder="Add new task" />
						<button class="mt-2 w-full bg-purple-600 text-white p-2 rounded"
							onclick="addTask('todo')">Add Task</button>
					</div>
					<div id="todo"
						class="min-h-[300px] p-2 space-y-2 bg-gray-50 rounded-lg"
						ondrop="drop(event)" ondragover="allowDrop(event)">
						<div class="task bg-blue-100 p-4 rounded-md cursor-pointer"
							draggable="true" ondragstart="drag(event)">
							Task 1
							<button onclick="removeTask(this)"
								class="float-right text-red-500">x</button>
						</div>
					</div>
				</div>

				<!-- In Progress Column -->
				<div class="w-[25rem] bg-white rounded-lg shadow-md p-4">
					<h2 class="font-bold text-xl mb-4">In Progress</h2>
					<div class="mb-4" id="in-progress-column">
						<input class="border rounded p-2 w-full" id="new-task-inprogress"
							type="text" placeholder="Add new task" />
						<button class="mt-2 w-full bg-purple-600 text-white p-2 rounded"
							onclick="addTask('inprogress')">Add Task
						</button>
					</div>
					<div id="inprogress"
						class="min-h-[300px] p-2 space-y-2 bg-gray-50 rounded-lg"
						ondrop="drop(event)" ondragover="allowDrop(event)">
						<div class="task bg-yellow-100 p-4 rounded-md cursor-pointer"
							draggable="true" ondragstart="drag(event)">
							Task 2
							<button onclick="removeTask(this)"
								class="float-right text-red-500">x</button>
						</div>
					</div>
				</div>

				<!-- Done Column -->
				<div class="w-[25rem] bg-white rounded-lg shadow-md p-4">
					<h2 class="font-bold text-xl mb-4">Done</h2>
					<div class="mb-4" id="done-column">
						<input id="new-task-done" type="text" placeholder="Add new task"
							class="border rounded p-2 w-full" />
						<button class="mt-2 w-full bg-purple-600 text-white p-2 rounded"
							onclick="addTask('done')">Add Task</button>
					</div>
					<div id="done"
						class="min-h-[300px] p-2 space-y-2 bg-gray-50 rounded-lg"
						ondrop="drop(event)" ondragover="allowDrop(event)">
						<div class="task bg-green-100 p-4 rounded-md cursor-pointer"
							draggable="true" ondragstart="drag(event)">
							Task 3
							<button onclick="removeTask(this)"
								class="float-right text-red-500">x</button>
						</div>
					</div>
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

		function drag(event) {
			event.dataTransfer.setData("text", event.target.id);
			event.target.classList.add("dragging");
		}

		function drop(event) {
			event.preventDefault();
			const data = event.dataTransfer.getData("text");
			const task = document.getElementById(data);
			event.target.appendChild(task);
			task.classList.remove("dragging");
		}

		function addTask(column) {
			console.log("column name", column)
			const taskInput = document.getElementById('new-task-' + column);
			console.log("Task Input element:", taskInput);
			if (!taskInput) {
				//console.error(Input element with ID 'new-task-${column}' not found.);
				return;
			}
			const taskText = taskInput.value.trim();
			if (taskText === "")
				return;

			const taskId = `task-${Date.now()}`;

			// Create new task element

			const taskElement = document.createElement("div");

			switch (column) {
			case 'todo':
				taskElement.className = "task bg-blue-100 p-4 rounded-md cursor-pointer"; // To Do
				break;
			case 'inprogress':
				taskElement.className = "task bg-yellow-100 p-4 rounded-md cursor-pointer"; // In Progress
				break;
			case 'done':
				taskElement.className = "task bg-green-100 p-4 rounded-md cursor-pointer"; // Done
				break;
			default:
				taskElement.className = "task bg-gray-100 p-4 rounded-md cursor-pointer"; // Default color
			}
			taskElement.draggable = true;
			taskElement.ondragstart = drag;
			taskElement.id = taskId;

			// Add task text
			taskElement.textContent = taskText;

			// Add remove button
			const removeButton = document.createElement("button");
			removeButton.textContent = "x";
			removeButton.className = "float-right text-red-500";
			removeButton.onclick = function() {
				removeTask(removeButton);
			};
			taskElement.appendChild(removeButton);

			// Add task to the appropriate column
			document.getElementById(column).appendChild(taskElement);

			// Clear input
			taskInput.value = "";
		}

		function removeTask(button) {
			button.parentElement.remove();
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