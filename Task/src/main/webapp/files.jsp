<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  
    %>
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.9.359/pdf.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.9.359/pdf.worker.min.js"></script>
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
<body class="flex">
    <aside
  class="flex flex-col h-screen px-4 py-8 overflow-y-hidden bg-[#433878] rtl:border-r-0 rtl:border-l"
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

        <a href="http://localhost:8080/Task/paint.jsp?username=<%= username %>&email=<%= emailid %>" class="mx-4 font-medium">Paint</a>
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

      <a class="mx-4 font-medium">Files</a>
    </p>

      <!-- Repeat similarly for other menu items like March, April, May, etc. -->
    </nav>
  </div>
</aside>

    <!------------------------------File upload---------------------->
    <div class="container bg-white p-6  flex flex-col">
        <h2 class="text-2xl font-bold mb-4 text-center">File Manager</h2>
        <div class="flex space-x-4 mb-4">
            <input type="file" id="fileInput" class="hidden" multiple />
            <button id="uploadFileBtn" class="bg-green-500 text-white py-2 px-4 rounded">Upload File</button>
        </div>
        <div class="flex h-full">
            <!-- File List Container -->
            <div id="fileContainer" class="bg-gray-50 p-4 rounded w-1/2">
                <h3 class="text-lg font-semibold mb-2">Uploaded Files</h3>
                <div id="files" class="flex flex-wrap gap-4"></div>
            </div>
            <!-- File Preview Container -->
            <div id="filePreview" class="bg-gray-50 p-4 rounded w-1/2 ml-4">
                <h3 class="text-lg font-semibold mb-2">File Preview</h3>
                <iframe id="fileViewer" class="w-full h-full  rounded" src=""></iframe>
            </div>
        </div>
    </div>
    <script>
 const filesList = [];

document.getElementById('uploadFileBtn').addEventListener('click', () => {
    document.getElementById('fileInput').click();
});

document.getElementById('fileInput').addEventListener('change', function(event) {
    const files = event.target.files;
    if (files.length > 0) {
        Array.from(files).forEach(file => {
            filesList.push(file);
        });
        renderFiles();
    }
});


function getFileIcon(extension) {
    switch (extension.toLowerCase()) {
        case 'pdf':
            return '/Task/Assets/pdf-download-2617.png'; 
        case 'jpg':
        case 'jpeg':
        case 'png':
        case 'gif':
            return '/Task/Assets/photos-10603.png'; 
        case 'doc':
        case 'docx':
            return '/Task/Assets/attachment-1483.png'; 
        case 'xls':
        case 'xlsx':
            return '/Task/Assets/attachment-1483.png'; 
        case 'txt':
            return '/Task/Assets/attachment-1483.png';
        default:
            return '/Task/Assets/folder-1485.png';
    }
}

function truncateFileName(name, wordLimit = 3) {
    const words = name.split(' ');
    if (words.length > wordLimit) {
        return words.slice(0, wordLimit).join(' ') + '';
    }
    return name;
}

function renderFiles() {
    const filesContainer = document.getElementById('files');
    const filePreview = document.getElementById('filePreview');
    const fileViewer = document.getElementById('fileViewer');
    filesContainer.innerHTML = '';

    filesList.forEach(file => {
        const fileDiv = document.createElement('div');
        fileDiv.className = 'p-4 bg-gray-100 rounded cursor-pointer flex flex-col items-center w-24 h-32';

        // Get file extension
        const extension = file.name.split('.').pop();
        const iconPath = getFileIcon(extension);

        // Create icon image element
        const iconImg = document.createElement('img');
        iconImg.src = iconPath;
        iconImg.alt = 'File Icon';
        iconImg.className = 'w-12 h-12 mb-2';

        // Create file title element
        const fileTitle = document.createElement('div');
        fileTitle.className = 'text-sm font-semibold text-center';
        fileTitle.textContent = truncateFileName(file.name);

        // Add click event for previewing the file
        fileDiv.addEventListener('click', () => {
            const fileType = file.type;
            if (fileType === 'application/pdf' || fileType.startsWith('image/')) {
                const fileURL = URL.createObjectURL(file);
                fileViewer.src = fileURL;
                filePreview.classList.remove('hidden');
            } else {
                alert('Preview not supported for this file type.');
            }
        });

        fileDiv.appendChild(iconImg);
        fileDiv.appendChild(fileTitle);
        filesContainer.appendChild(fileDiv);
    });
}

    </script>
</body>
</html>
