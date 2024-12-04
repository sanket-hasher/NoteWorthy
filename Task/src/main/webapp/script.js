const colors = ["#FF5722", "#D32F2F", "#388E3C"];

	// Select a random color from the array
	document.addEventListener("DOMContentLoaded", function() {
		// Pick a random color
		const randomColor = colors[Math.floor(Math.random() * colors.length)];
		// Apply it to the background of the profile-icon
		document.getElementById("profile-icon").style.backgroundColor = randomColor;
	});
   
	 var username = "<%= username != null ? username : %>";
	 
	    
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

	   // const eventsArr = [
	   //   {
	   //     day: 13,
	   //     month: 11,
	   //     year: 2022,
	   //     events: [
	   //       {
	   //         title: "Event 1 lorem ipsun dolar sit genfa tersd dsad ",
	   //         time: "10:00 AM",
	   //       },
	   //       {
	   //         title: "Event 2",
	   //         time: "11:00 AM",
	   //       },
	   //     ],
	   //   },
	   // ];

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
	       days += `<div class="day prev-date">${prevDays - x + 1}</div>`;
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
	           days += `<div class="day today active event">${i}</div>`;
	         } else {
	           days += `<div class="day today active">${i}</div>`;
	         }
	       } else {
	         if (event) {
	           days += `<div class="day event">${i}</div>`;
	         } else {
	           days += `<div class="day ">${i}</div>`;
	         }
	       }
	     }

	     for (let j = 1; j <= nextDays; j++) {
	       days += `<div class="day next-date">${j}</div>`;
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
	         events += `
	           <div class="event">
			   <span class="serial-number">${totalEvents}.</span> 
	             <div class="title">
	               <i class="fas fa-circle"></i>
	               <h3 class="event-title">${event.title}</h3>
	             </div>
	             <div class="event-time">
	               <span>${event.time}</span>
	             </div>
	            
	           </div>
	         `;
	       });
	     });

	     // If no events found, display "No Events"
	     if (!eventsFound) {
	       events = `<div class="no-event"><h3>No Events</h3></div>`;
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
		     eventsContainer.innerHTML = '';

		     let totalEvents = 0; // Initialize the counter for total events

		     // Iterate over all events and display them
		     eventsArr.forEach((eventDay) => {
		       eventDay.events.forEach((event) => {
		         totalEvents++; // Increment the counter for each event

		         const eventElement = document.createElement('div');
		         eventElement.classList.add('event');

		         eventElement.innerHTML = `
				 <span class="serial-number">${totalEvents}.</span>  
		           <div class="title">
		            
		             <i class="fas fa-circle"></i>
		             <h3 class="event-title">${event.title}</h3>
		           </div>
		           <div class="event-time">
		             <span>${event.time}</span>
		           </div>
		           <div class="event-date">
		             <span>${eventDay.day}-${eventDay.month}-${eventDay.year}</span>
		           </div>
		         `;

		         // Append the event to the eventsContainer
		         eventsContainer.appendChild(eventElement);
		       });
		     });

		     // Log the total number of events rendered
		     console.log(`Total Events Rendered: ${totalEvents}`);
		   }





