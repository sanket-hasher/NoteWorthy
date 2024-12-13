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
        <title>editor</title>
		<link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/43.3.1/ckeditor5.css">
        <script src="https://cdn.tailwindcss.com"></script>
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

html,body {
  width: 100%;
	height:100%;
}

 



.main-container {
	--ckeditor5-preview-height: 700px;
	height:100%;
	margin-left: auto;
	margin-right: auto;
}

.ck-content {
	
	line-height: 1.6;
	word-break: break-word;
	
}

#editor-menu-bar div,#editor-toolbar div {
  height:10%
}

.editor-container__editor-wrapper {
	display: flex;
	width: 100%;
	height:90%;
}
.ck-powered-by {
display:none;
}
.editor-container_document-editor {
	border: 1px solid var(--ck-color-base-border);
	height:100%;
}

.editor-container_document-editor .editor-container__toolbar {
	display: flex;
	position: relative;
	box-shadow: 0 2px 3px hsla(0, 0%, 0%, 0.078);
}

.editor-container_document-editor .editor-container__toolbar > .ck.ck-toolbar {
	flex-grow: 1;
	width: 0;
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
	border-top: 0;
	border-left: 0;
	border-right: 0;
}

.editor-container_document-editor .editor-container__menu-bar > .ck.ck-menu-bar {
	border-bottom-right-radius: 0;
	border-bottom-left-radius: 0;
	border-top: 0;
	border-left: 0;
	border-right: 0;
}

.editor-container_document-editor .editor-container__editor-wrapper {
    height:90%
	overflow:hidden;
	
}

.editor-container_document-editor .editor-container__editor {
	margin-top: 28px;
	margin-bottom: 28px;

}

.editor-container_document-editor .editor-container__editor .ck.ck-editor__editable {
	box-sizing: border-box;
	width: 75vw;
    height: 100%; 
    padding: 20mm 12mm;
	border: 1px hsl(0, 0%, 82.7%) solid;
	background: hsl(0, 0%, 100%);
	box-shadow: 0 2px 3px hsla(0, 0%, 0%, 0.078);
	flex: 1 1 auto;
	margin-left: 72px;
	margin-right: 72px;
}

/* Base styles */


   .spinner {
  border: 4px solid rgba(0, 0, 0, 0.1);
  border-left-color: #3498db;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}

.hidden {
  display: none;
}
   .copy-button {
  background: none;
  border: none;
  cursor: pointer;
  padding: 0.25rem 0.5rem;
  border-radius: 4px;
}

.copy-button:hover {
  background-color: rgba(59, 130, 246, 0.1); /* Light blue background */
}
   
    
    </style>
    <body class="bg-purple-100 ">
    <div class="flex w-full h-full">
      <aside
  class="flex w-[18%] flex-col h-screen px-4 py-8 overflow-y-hidden bg-[#433878] rtl:border-r-0 rtl:border-l"
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
            class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg"
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
        <svg class="w-5 h-5" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 576 512">
							<!--!Font Awesome Free 6.6.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
							<path fill="#ffffff"
								d="M339.3 367.1c27.3-3.9 51.9-19.4 67.2-42.9L568.2 74.1c12.6-19.5 9.4-45.3-7.6-61.2S517.7-4.4 499.1 9.6L262.4 187.2c-24 18-38.2 46.1-38.4 76.1L339.3 367.1zm-19.6 25.4l-116-104.4C143.9 290.3 96 339.6 96 400c0 3.9 .2 7.8 .6 11.6C98.4 429.1 86.4 448 68.8 448L64 448c-17.7 0-32 14.3-32 32s14.3 32 32 32l144 0c61.9 0 112-50.1 112-112c0-2.5-.1-5-.2-7.5z" /></svg>
        

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
						class="flex items-center px-4 py-2 mt-5 text-white transition-colors duration-300 transform rounded-lg bg-[#2E073F]"
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
       <div class="main-container">
    <div class="editor-container editor-container_document-editor" id="editor-container">
        <div class="editor-container__menu-bar" id="editor-menu-bar"></div>
        <div class="editor-container__toolbar" id="editor-toolbar"></div>
        <div class="editor-container__editor-wrapper">
            <div class="editor-container__editor">
                <div id="editor"></div>
            </div>
        </div>
       <div class="flex justify-between items-end fixed right-14 bottom-12 p-8 gap-x-6">
    <!-- Download Button -->
    <button class="bg-purple-600 text-white p-4 rounded-full" id="downloadBtn">
        <svg class="w-8 h-8" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
            <path
                fill="#ffffff"
                d="M288 32c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 242.7-73.4-73.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l128 128c12.5 12.5 32.8 12.5 45.3 0l128-128c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L288 274.7 288 32zM64 352c-35.3 0-64 28.7-64 64l0 32c0 35.3 28.7 64 64 64l384 0c35.3 0 64-28.7 64-64l0-32c0-35.3-28.7-64-64-64l-101.5 0-45.3 45.3c-25 25-65.5 25-90.5 0L165.5 352 64 352zm368 56a24 24 0 1 1 0 48 24 24 0 1 1 0-48z" />
        </svg>
    </button>

    <!-- Talk To Us Button -->
    <button
        class="flex items-center bg-gray-100 rounded-full gap-x-3.5 px-4 py-3 talk-to-us-btn">
        <svg class="h-8 w-8" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
            <path d="M16 8.016A8.522 8.522 0 008.016 16h-.032A8.521 8.521 0 000 8.016v-.032A8.521 8.521 0 007.984 0h.032A8.522 8.522 0 0016 7.984v.032z"
                fill="url(#prefix__paint0_radial_980_20147)" />
            <defs>
                <radialGradient id="prefix__paint0_radial_980_20147" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse"
                    gradientTransform="matrix(16.1326 5.4553 -43.70045 129.2322 1.588 6.503)">
                    <stop offset=".067" stop-color="#9168C0" />
                    <stop offset=".343" stop-color="#5684D1" />
                    <stop offset=".672" stop-color="#1BA1E3" />
                </radialGradient>
            </defs>
        </svg>
        <span>Talk To Us</span>
    </button>
</div>
       
        
    </div>
    

<!-- Gemini Query Container -->
<div class="gemini-query-container fixed bg-white rounded-t-3xl shadow-xl bottom-0 right-0 h-[80vh] w-[25vw] transform translate-y-full transition-transform duration-300 flex flex-col z-50">
 <div class="flex items-center justify-between px-4 py-3 bg-gray-100 rounded-t-3xl">
        <h3 class="text-lg font-semibold text-gray-800"> AI Assistant</h3>
        <button class="text-gray-600 hover:text-gray-800" id="closeChatBox">
            ✕
        </button>
    </div>
    <div class="flex-1 overflow-y-auto px-6 py-4">
        <!-- Welcome Card -->
        <div class="bg-blue-50 p-4 rounded-lg shadow">
            <img
                src="Assets/google-gemini-logo.jpg"
                alt="University Logo"
                class="w-24 h-auto mb-3"
            />
            <h4 class="text-xl font-bold text-gray-800 mb-2">Welcome to Our Ai Chatbot</h4>
            <p class="text-gray-700 text-sm">
                I am your AI Assistant! Feel free to ask me any questions regarding:
            </p>
            <ul class="list-disc list-inside text-gray-600 text-sm mt-2">
                <li>Summarize</li>
                <li>Describe</li>
                <li>Make Notes</li>
                <li>Write Essays</li>
            </ul>

        </div>
    
    <!-- Response Container -->
    <div id="response-container" class="mt-4">
        <!-- New response boxes will be added here dynamically -->
        <div id="loader" class="hidden flex items-center justify-center mb-8">
  <div class="spinner"></div>
</div>
        
    </div>
    
   <div class="p-4 bg-gray-100">
        <div class="flex items-center bg-white rounded-full shadow px-4 py-2">
            <input
                        id="geminiPrompt"
               
                type="text"
                placeholder="Ask me anything..."
                class="flex-1 border-none outline-none text-sm text-gray-800"
            />
            <button id="geminiSendButton" class="text-blue-600 hover:text-blue-800">
                ➤
            </button>
        </div>
    </div>
</div>
    <!-- Existing Download Button -->
    
</div>




</div>


			
			
			
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script>
    const chatBox = document.querySelector('.gemini-query-container');
    const talkToUsBtn = document.querySelector('.talk-to-us-btn');
    const closeChatBox = document.querySelector('#closeChatBox');
    
    // Show chatbox when hovering over the button
    talkToUsBtn.addEventListener('click', () => {
        chatBox.classList.remove('translate-y-full');
    });

    // Close chatbox when clicking the close button
    closeChatBox.addEventListener('click', () => {
        chatBox.classList.add('translate-y-full');
    });

    // Prevent chatbox from disappearing when the mouse hovers over it
    chatBox.addEventListener('mouseover', () => {
        chatBox.classList.remove('translate-y-full');
    });

    // Hide chatbox when the mouse leaves both the button and the chatbox
    /*chatBox.addEventListener('mouseleave', () => {
        chatBox.classList.add('translate-y-full');
    });
    talkToUsBtn.addEventListener('mouseleave', () => {
        if (!chatBox.matches(':hover')) {
            chatBox.classList.add('translate-y-full');
        }
    });*/
    document.getElementById('downloadBtn').addEventListener('click', () => {
        const { jsPDF } = window.jspdf;

        // Create a new instance of jsPDF with appropriate settings
        const doc = new jsPDF({
            orientation: 'p', // 'p' for portrait, 'l' for landscape
            unit: 'px',
            format: 'a4'
        });

        // Access the CKEditor content
        const editorElement = document.querySelector('#editor');

        if (editorElement) {
            // Ensure the full content is rendered
            doc.html(editorElement, {
                callback: function (doc) {
                    // Adjust layout, scale, or page size if needed
                    doc.save('your-note.pdf');
                },
                x: '9.52%',  // x position as a percentage of page width
                y: '5.72%',  // y position as a percentage of page height
                html2canvas: {
                    scale: 1, // Increase scale for better resolution
                    useCORS: true // For cross-origin images if any
                },
                width: doc.internal.pageSize.getWidth() - 20 // Adjust the width
            });
        }
 else {
            console.error('Editor content not found.');
        }
    });

</script>

     <script>
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
		
		 var username = "<%= username != null ? username : "" %>";
		    
		    if (username) {
		        document.getElementById('logout-container').style.display = 'block';
		  
		    } else {
		        document.getElementById('logout-container').style.display = 'none';
		       
		    }



     </script>
        <script type="importmap">
            {
                "imports": {
                    "ckeditor5": "https://cdn.ckeditor.com/ckeditor5/43.3.1/ckeditor5.js",
                    "ckeditor5/": "https://cdn.ckeditor.com/ckeditor5/43.3.1/"
                }
            }
        </script>
        <script type="module">
           import {
	DecoupledEditor,
	AccessibilityHelp,
	Alignment,
	Autoformat,
	AutoLink,
	Autosave,
	BalloonToolbar,
	Bold,
	Code,
	Essentials,
	FindAndReplace,
	FontBackgroundColor,
	FontColor,
	FontFamily,
	FontSize,
	Heading,
	HorizontalLine,
	Indent,
	IndentBlock,
	Italic,
	Link,
	Paragraph,
	RemoveFormat,
	SelectAll,
	SpecialCharacters,
	SpecialCharactersArrows,
	SpecialCharactersCurrency,
	SpecialCharactersEssentials,
	SpecialCharactersLatin,
	SpecialCharactersMathematical,
	SpecialCharactersText,
	Strikethrough,
	Subscript,
	Superscript,
	Table,
	TableCaption,
	TableCellProperties,
	TableColumnResize,
	TableProperties,
	TableToolbar,
	TextTransformation,
	Underline,
	Undo
} from 'ckeditor5';

const editorConfig = {
	toolbar: {
		items: [
			'undo',
			'redo',
			'|',
			'heading',
			'|',
			'fontSize',
			'fontFamily',
			'fontColor',
			'fontBackgroundColor',
			'|',
			'bold',
			'italic',
			'underline',
			'|',
			'link',
			'insertTable',
			'|',
			'alignment',
			'|',
			'outdent',
			'indent'
		],
		shouldNotGroupWhenFull: false
	},
	plugins: [
		AccessibilityHelp,
		Alignment,
		Autoformat,
		AutoLink,
		Autosave,
		BalloonToolbar,
		Bold,
		Code,
		Essentials,
		FindAndReplace,
		FontBackgroundColor,
		FontColor,
		FontFamily,
		FontSize,
		Heading,
		HorizontalLine,
		Indent,
		IndentBlock,
		Italic,
		Link,
		Paragraph,
		RemoveFormat,
		SelectAll,
		SpecialCharacters,
		SpecialCharactersArrows,
		SpecialCharactersCurrency,
		SpecialCharactersEssentials,
		SpecialCharactersLatin,
		SpecialCharactersMathematical,
		SpecialCharactersText,
		Strikethrough,
		Subscript,
		Superscript,
		Table,
		TableCaption,
		TableCellProperties,
		TableColumnResize,
		TableProperties,
		TableToolbar,
		TextTransformation,
		Underline,
		Undo
	],
	balloonToolbar: ['bold', 'italic', '|', 'link'],
	fontFamily: {
		supportAllValues: true
	},
	fontSize: {
		options: [10, 12, 14, 'default', 18, 20, 22],
		supportAllValues: true
	},
	heading: {
		options: [
			{
				model: 'paragraph',
				title: 'Paragraph',
				class: 'ck-heading_paragraph'
			},
			{
				model: 'heading1',
				view: 'h1',
				title: 'Heading 1',
				class: 'ck-heading_heading1'
			},
			{
				model: 'heading2',
				view: 'h2',
				title: 'Heading 2',
				class: 'ck-heading_heading2'
			},
			{
				model: 'heading3',
				view: 'h3',
				title: 'Heading 3',
				class: 'ck-heading_heading3'
			},
			{
				model: 'heading4',
				view: 'h4',
				title: 'Heading 4',
				class: 'ck-heading_heading4'
			},
			{
				model: 'heading5',
				view: 'h5',
				title: 'Heading 5',
				class: 'ck-heading_heading5'
			},
			{
				model: 'heading6',
				view: 'h6',
				title: 'Heading 6',
				class: 'ck-heading_heading6'
			}
		]
	},
	initialData:
		'<h2>Welcome to Our Learning Platform! 🎓</h2>\n<p>\n    \n  Welcome to <strong>Our Learning Platform</strong>  a place where knowledge meets innovation. \n</p>',
	link: {
		addTargetToExternalLinks: true,
		defaultProtocol: 'https://',
		decorators: {
			toggleDownloadable: {
				mode: 'manual',
				label: 'Downloadable',
				attributes: {
					download: 'file'
				}
			}
		}
	},
	menuBar: {
		isVisible: false
	},
	placeholder: 'Type or paste your content here!',
	table: {
		contentToolbar: ['tableColumn', 'tableRow', 'mergeTableCells', 'tableProperties', 'tableCellProperties']
	}
};

DecoupledEditor.create(document.querySelector('#editor'), editorConfig)
  .then(editor => {
    document.querySelector('#editor-toolbar').appendChild(editor.ui.view.toolbar.element);
    document.querySelector('#editor-menu-bar').appendChild(editor.ui.view.menuBarView.element);

    // Function to send the content from the "Send to Gemini" textarea to the server
    function sendPromptToServer(promptText, callback) {
const loader = document.querySelector('#loader'); // Reference the loader element
  
  // Show the loader before initiating the fetch
  if (loader) {
    loader.classList.remove('hidden');
  }
      fetch("gemini", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded"  // Sending as form data
        },
        body: new URLSearchParams({
          editorData: promptText  // Pass the prompt data as URL-encoded parameter
        })
      })
      .then(response => {
        if (!response.ok) {
          throw new Error("Error: " + response.statusText);
        }
        return response.text();  // Expecting plain text response from the server
      })
      .then(generatedContent => {
 if (loader) {
      loader.classList.add('hidden');
    }
        // Format the response into a more readable format
        const formattedContent = formatResponse(generatedContent);

        // Create a new box for Gemini's response
        const responseContainer = document.querySelector('#response-container');  // Get the container to add new boxes

        // Create a new div for the new response box
        const newResponseBox = document.createElement('div');
        newResponseBox.classList.add('response-box', 'mt-4', 'bg-white', 'p-4', 'border', 'border-gray-300', 'rounded');
        
        // Set the content of the response box
        const responseHeader = document.createElement('h4');
        responseHeader.classList.add('font-semibold', 'text-gray-700');
        responseHeader.textContent = "Gemini's Response:";  // Set the title

        const responseContent = document.createElement('div');
        responseContent.classList.add('text-gray-600');
        responseContent.innerHTML = formattedContent;  // Set the formatted content as response text

const copyButton = document.createElement('button');
copyButton.textContent = "Copy";
copyButton.classList.add('copy-button', 'ml-2', 'text-blue-600', 'hover:text-blue-800', 'text-sm');
copyButton.addEventListener('click', function () {
  const paragraphs = responseContent.querySelectorAll('p');
  let textToCopy = '';
  
  paragraphs.forEach((p) => {
    textToCopy += p.textContent.trim() + '\n';
  });
  
  navigator.clipboard.writeText(textToCopy.trim()).then(() => {
    copyButton.innerText = "Copied!";
    copyButton.classList.add('text-green-600'); // Optional: Add a green color for success feedback
    
    // Revert back to "Copy" after 2 seconds
    setTimeout(() => {
      copyButton.innerText = "Copy";
      copyButton.classList.remove('text-green-600');
    }, 2000);
  }).catch((err) => {
    console.error('Failed to copy text: ', err);
    copyButton.innerText = "Failed";
    copyButton.classList.add('text-red-600'); // Optional: Add a red color for error feedback
    
    // Revert back to "Copy" after 2 seconds
    setTimeout(() => {
      copyButton.innerText = "Copy";
      copyButton.classList.remove('text-red-600');
    }, 2000);
  });
});
        // Append the header and content to the new box
        newResponseBox.appendChild(responseHeader);
newResponseBox.appendChild(copyButton);
        newResponseBox.appendChild(responseContent);

        // Append the new response box to the container
        responseContainer.appendChild(newResponseBox);

        // Show the response container if hidden
        responseContainer.classList.remove('hidden');
        
        if (callback) callback(generatedContent);  // Execute callback if provided
      })
      .catch(error => {
        console.error("Error:", error);
        alert("Failed to fetch response: " + error.message);
if (loader) {
      loader.classList.add('hidden');
    }
      });
    }

    // Function to format the response content to make it more readable
    function formatResponse(responseText) {
      // Split response by lines and add proper formatting
      const lines = responseText.split('\n');
      let formattedContent = '';

      lines.forEach(function(line) {
        if (line.trim()) {
          // Add bullet points for each line (optional for bullet-point style)
          formattedContent += '<p class="mb-2">- ' + line.trim() + '</p>';
        } else {
          // Add a line break if the line is empty
          formattedContent += '<br>';
        }
      });

      return formattedContent;
    }

    // Listen for the button click to trigger sending the content
    const sendButton = document.querySelector('#geminiSendButton');
    if (sendButton) {
      sendButton.addEventListener('click', function() {
        const promptText = document.querySelector('#geminiPrompt').value.trim();  // Get text from the prompt textarea
        if (promptText) {
          sendPromptToServer(promptText);  // Send the prompt to the server
        } else {
          alert("Please enter a prompt.");
        }
      });
    }

  })
  .catch(function(error) {
    console.error("Error initializing the editor:", error);
  });






        </script>
        <!-- A friendly reminder to run on a server, remove this during the integration. -->
        <script>
		        window.onload = function() {
		            if ( window.location.protocol === "file:" ) {
		                alert( "This sample requires an HTTP server. Please serve this file with a web server." );
		            }
		        };
		</script>
    </body>
</html>