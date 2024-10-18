<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  
    %>
    <%
    String username=request.getParameter("username");
    String emailid=request.getParameter("email");%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.tailwindcss.com"></script>

    <title>Document</title>
  </head>
  <body>
    <div class="flex">
      <aside
      class="flex flex-col w-64 h-screen px-4 py-8 overflow-y-hidden bg-[#433878] rtl:border-r-0 rtl:border-l"
    >
      <a href="/">
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
        <h4 class="mx-2 mt-2 font-medium text-white"><%=username%></h4>
        <p class="mx-2 mt-1 text-sm font-medium text-white"><%=emailid%></p>
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
    
            <a class="mx-4 font-medium">Daily Tasks</a>
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
    
            <a href="/paint.html" class="mx-4 font-medium">Paint</a>
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
    
          <a href="/files.html" class="mx-4 font-medium">Files</a>
        </p>
    
          <!-- Repeat similarly for other menu items like March, April, May, etc. -->
        </nav>
      </div>
    </aside>
      <div class="container mx-auto">
        <div class="flex space-x-4 mt-8">
          <!-- To Do Column -->
          <div class="w-[25rem] bg-white rounded-lg shadow-md p-4">
            <h2 class="font-bold text-xl mb-4">To Do</h2>
            <div class="mb-4">
              <input
                id="new-task-todo"
                type="text"
                placeholder="Add new task"
                class="border rounded p-2 w-full"
              />
              <button
                onclick="addTask('todo')"
                class="mt-2 w-full bg-blue-500 text-white p-2 rounded"
              >
                Add Task
              </button>
            </div>
            <div
              id="todo"
              class="min-h-[300px] p-2 space-y-2 bg-gray-50 rounded-lg"
              ondrop="drop(event)"
              ondragover="allowDrop(event)"
            >
              <div
                class="task bg-blue-100 p-4 rounded-md cursor-pointer"
                draggable="true"
                ondragstart="drag(event)"
              >
                Task 1
                <button
                  onclick="removeTask(this)"
                  class="float-right text-red-500"
                >
                  x
                </button>
              </div>
            </div>
          </div>

          <!-- In Progress Column -->
          <div class="w-[25rem] bg-white rounded-lg shadow-md p-4">
            <h2 class="font-bold text-xl mb-4">In Progress</h2>
            <div class="mb-4">
              <input
                id="new-task-inprogress"
                type="text"
                placeholder="Add new task"
                class="border rounded p-2 w-full"
              />
              <button
                onclick="addTask('inprogress')"
                class="mt-2 w-full bg-blue-500 text-white p-2 rounded"
              >
                Add Task
              </button>
            </div>
            <div
              id="inprogress"
              class="min-h-[300px] p-2 space-y-2 bg-gray-50 rounded-lg"
              ondrop="drop(event)"
              ondragover="allowDrop(event)"
            >
              <div
                class="task bg-yellow-100 p-4 rounded-md cursor-pointer"
                draggable="true"
                ondragstart="drag(event)"
              >
                Task 2
                <button
                  onclick="removeTask(this)"
                  class="float-right text-red-500"
                >
                  x
                </button>
              </div>
            </div>
          </div>

          <!-- Done Column -->
          <div class="w-[25rem] bg-white rounded-lg shadow-md p-4">
            <h2 class="font-bold text-xl mb-4">Done</h2>
            <div class="mb-4">
              <input
                id="new-task-done"
                type="text"
                placeholder="Add new task"
                class="border rounded p-2 w-full"
              />
              <button
                onclick="addTask('done')"
                class="mt-2 w-full bg-blue-500 text-white p-2 rounded"
              >
                Add Task
              </button>
            </div>
            <div
              id="done"
              class="min-h-[300px] p-2 space-y-2 bg-gray-50 rounded-lg"
              ondrop="drop(event)"
              ondragover="allowDrop(event)"
            >
              <div
                class="task bg-green-100 p-4 rounded-md cursor-pointer"
                draggable="true"
                ondragstart="drag(event)"
              >
                Task 3
                <button
                  onclick="removeTask(this)"
                  class="float-right text-red-500"
                >
                  x
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script>
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
        const taskInput = document.getElementById(`new-task-${column}`);
        const taskText = taskInput.value.trim();
        if (taskText === "") return;

        // Create new task element
        const taskElement = document.createElement("div");
        taskElement.className =
          "task bg-blue-100 p-4 rounded-md cursor-pointer";
        taskElement.draggable = true;
        taskElement.ondragstart = drag;

        // Add task text
        taskElement.textContent = taskText;

        // Add remove button
        const removeButton = document.createElement("button");
        removeButton.textContent = "x";
        removeButton.className = "float-right text-red-500";
        removeButton.onclick = function () {
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
    </script>
  </body>
</html>
