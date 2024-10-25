<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.13/dist/full.min.css" rel="stylesheet" type="text/css" />
        <link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
/>
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

.swiper {
      width: 100%;
    }

    .swiper-slide {
      background-position: center;
      background-size: cover;
      width: 300px;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
    }

    .swiper-button-prev {
      left: -40px;
    }

    .swiper-button-next {
      right: -40px;
    }
    
    .block {
    animation: appear 5s linear;
    animation-timeline: view();
    animation-range: entry cover 40%;
    }
    
    .block-2{
    animation: appear2 5s linear;
    animation-timeline: view();
    animation-range: entry cover 40%;
    }
    

@keyframes appear{
 
 from{
 opacity:0;
 scale:0.5;
 }
 to{
 opacity:1;
 scale:1;
 }

}

@keyframes appear2{
 
 from{
 opacity:0;
 transform:translateX(-200px);
 }
 to{
 opacity:1;
 transform:translateX(0px);
 }

}



      </style>
      <body class="bg-white text-black" >
        <nav
          class="w-screen flex justify-between items-center px-[20px] h-[10vh] bg-[#433878] text-white fixed top-0 z-50"
        >
          <a href="/Login_Registration" class="text-4xl font-bold">LOGO</a>
          <ul class="flex w-[30%] justify-evenly font-semibold uppercase">
             <a>EXPLORE</a>
            <!-- <form action="logout" method="post">
            <input type="submit" value="Logout"></form>-->
            <a>about</a>
            <a href="/contact.jsp">contact</a>
            <a href="/Login_Registration/login.jsp">login</a>
          </ul>
        </nav>
        <div class="container h-screen max-w-[90%] m-auto ">
          <div class="flex w-full h-full justify-evenly items-center">
            <div>
              <h2 class="text-6xl font-bold mb-8">
                What are you aiming to
                <span class="text-[#674188]">accomplish </span>today?
              </h2>
              <p class="text-2xl font-medium mb-8">
                Remember everything and tackle any project with your notes, tasks,
                and schedule all in one place.
              </p>
              <a href="/Login_Registration/main.jsp"
                class="px-8 py-4 rounded-md shadow-xl text-white   uppercase bg-[#7E60BF]"
              >
              
                Get Started
              </a>
              <div class="mt-8 underline font-semibold">
                <a href="/Login_Registration/login.jsp">Already have an account? </a><a href="/Login_Registration/login.jsp">Login</a>
              </div>
            </div>
            <img class="h-[42rem]" src="Assets/bg.jpg" />
          </div>
        </div>
       <div class="relative flex flex-col items-center w-full mb-8 p-8">
  <video autoplay muted loop class="absolute top-0 left-0 w-full h-full object-cover z-0">
    <source src="Assets/file.mp4" type="video/mp4">
   
  </video>
  <div class="absolute top-0 left-0 w-full h-full bg-black opacity-50 z-10"></div> 
  <div class="relative z-20 w-full">
    <h2 class="text-center text-4xl font-bold mb-8 text-white">Services</h2>
    <div class="grid grid-cols-4 text-start gap-16">
      <div class="block relative flex flex-col my-6 bg-white shadow-sm border border-slate-200 rounded-lg w-[25rem]">
        <div class=" p-4">
          <h5 class="mb-2 text-slate-800 text-xl font-semibold">
            Website Review Check Update from Our Team in San Francisco
          </h5>
          <p class="text-slate-600 leading-normal font-light">
            The place is close to Barceloneta Beach and bus stop just 2 min by
            walk and near to Naviglio where you can enjoy the main nightlife
            in Barcelona.
          </p>
          <button
            class="rounded-md bg-[#7E60BF] py-2 px-4 mt-6 border border-transparent text-center text-sm text-white transition-all shadow-md hover:shadow-lg focus:bg-slate-[#AD88C6] focus:shadow-none active:bg-slate-[#AD88C6] hover:bg-[#AD88C6] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
            type="button"
          >
            Read more
          </button>
        </div> 
      </div>

      <div class="block relative flex flex-col my-6 bg-white shadow-sm border border-slate-200 rounded-lg w-[25rem]">
        <div class=" p-4">
          <h5 class="mb-2 text-slate-800 text-xl font-semibold">
            Website Review Check Update from Our Team in San Francisco
          </h5>
          <p class="text-slate-600 leading-normal font-light">
            The place is close to Barceloneta Beach and bus stop just 2 min by
            walk and near to Naviglio where you can enjoy the main nightlife
            in Barcelona.
          </p>
          <button
            class="rounded-md bg-[#7E60BF] py-2 px-4 mt-6 border border-transparent text-center text-sm text-white transition-all shadow-md hover:shadow-lg focus:bg-slate-[#AD88C6] focus:shadow-none active:bg-slate-[#AD88C6] hover:bg-[#AD88C6] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
            type="button"
          >
            Read more
          </button>
        </div>
      </div>

      <div class="block relative flex flex-col my-6 bg-white shadow-sm border border-slate-200 rounded-lg w-[25rem]">
        <div class=" p-4">
          <h5 class="mb-2 text-slate-800 text-xl font-semibold">
            Website Review Check Update from Our Team in San Francisco
          </h5>
          <p class="text-slate-600 leading-normal font-light">
            The place is close to Barceloneta Beach and bus stop just 2 min by
            walk and near to Naviglio where you can enjoy the main nightlife
            in Barcelona.
          </p>
          <button
            class="rounded-md bg-[#7E60BF] py-2 px-4 mt-6 border border-transparent text-center text-sm text-white transition-all shadow-md hover:shadow-lg focus:bg-slate-[#AD88C6] focus:shadow-none active:bg-slate-[#AD88C6] hover:bg-[#AD88C6] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
            type="button"
          >
            Read more
          </button>
        </div>
      </div>
      <div class="block relative flex flex-col my-6 bg-white shadow-sm border border-slate-200 rounded-lg w-[25rem]">
        <div class=" p-4">
          <h5 class="mb-2 text-slate-800 text-xl font-semibold">
            Website Review Check Update from Our Team in San Francisco
          </h5>
          <p class="text-slate-600 leading-normal font-light">
            The place is close to Barceloneta Beach and bus stop just 2 min by
            walk and near to Naviglio where you can enjoy the main nightlife
            in Barcelona.
          </p>
          <button
            class="rounded-md bg-[#7E60BF] py-2 px-4 mt-6 border border-transparent text-center text-sm text-white transition-all shadow-md hover:shadow-lg focus:bg-slate-[#AD88C6] focus:shadow-none active:bg-slate-[#AD88C6] hover:bg-[#AD88C6] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
            type="button"
          >
            Read more
          </button>
        </div>
      </div>
    </div>
  </div>
</div>
       
        <div class=" max-w-[90%] m-auto mb-8 ">
          <h2 class="text-center text-4xl font-bold mb-8">Customer Reviews</h2>
          <div class="flex w-full items-start">
            <div class="w-[60%]">
              <img class="h-[35rem]" src="Assets/customer.jpg" />
            </div>
          
          <div class="flex flex-col w-[40%] block-2">
            <div class="swiper mySwiper">
              <div class="swiper-wrapper">
                <div class="swiper-slide"> <p class="text-2xl">⭐⭐⭐⭐⭐</p>
                  <h2 class=" text-3xl font-bold">Emily R</h2>
                  <p class="font-semibold">"I absolutely love this study planner! It helps me stay organized and 
                    on track with my work. The automatic syncing between my laptop 
                    and phone is a game-changer!"
                    </p></div>
                    <div class="swiper-slide"> <p class="text-2xl">⭐⭐⭐⭐⭐</p>
                      <h2 class=" text-3xl font-bold">Emily R</h2>
                      <p class="font-semibold">"I absolutely love this study planner! It helps me stay organized and 
                        on track with my work. The automatic syncing between my laptop 
                        and phone is a game-changer!"
                        </p></div>
                        <div class="swiper-slide"> <p class="text-2xl">⭐⭐⭐⭐⭐</p>
                          <h2 class=" text-3xl font-bold">Emily R</h2>
                          <p class="font-semibold">"I absolutely love this study planner! It helps me stay organized and 
                            on track with my work. The automatic syncing between my laptop 
                            and phone is a game-changer!"
                            </p></div>
                            <div class="swiper-slide"> <p class="text-2xl">⭐⭐⭐⭐⭐</p>
                              <h2 class=" text-3xl font-bold">Emily R</h2>
                              <p class="font-semibold">"I absolutely love this study planner! It helps me stay organized and 
                                on track with my work. The automatic syncing between my laptop 
                                and phone is a game-changer!"
                                </p></div>
                                <div class="swiper-slide"> <p class="text-2xl">⭐⭐⭐⭐⭐</p>
                                  <h2 class=" text-3xl font-bold">Emily R</h2>
                                  <p class="font-semibold">"I absolutely love this study planner! It helps me stay organized and 
                                    on track with my work. The automatic syncing between my laptop 
                                    and phone is a game-changer!"
                                    </p></div>
                                    <div class="swiper-slide"> <p class="text-2xl">⭐⭐⭐⭐⭐</p>
                                      <h2 class=" text-3xl font-bold">Emily R</h2>
                                      <p class="font-semibold">"I absolutely love this study planner! It helps me stay organized and 
                                        on track with my work. The automatic syncing between my laptop 
                                        and phone is a game-changer!"
                                        </p></div>
              </div>
              <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div>
            </div>
            <div>
  
              </div>
            
                   <form id="reviewForm" onsubmit="submitReview(event)">
  <!-- Name Field -->
  <div>
    <label for="Name" class="block text-sm font-medium text-gray-700">Name</label>
    <input type="text" id="Name" name="Name" class="mt-1 p-2 w-full border rounded-md bg-white focus:bg-white" required />
  </div>

  <!-- Review Text Area -->
  <div class="relative w-[32rem] mt-8">
    <div class="relative w-full min-w-[200px]">
                        <textarea rows="8"
                          class="peer h-full min-h-[100px] w-full !resize-none  rounded-[7px] border border-blue-gray-200 border-t-transparent bg-transparent px-3 py-2.5 font-sans text-sm font-normal text-blue-gray-700 outline outline-0 transition-all placeholder-shown:border placeholder-shown:border-blue-gray-200 placeholder-shown:border-t-blue-gray-200 focus:border-2 focus:border-gray-900 focus:border-t-transparent focus:outline-0 disabled:resize-none disabled:border-0 disabled:bg-blue-gray-50"
                          placeholder=" "></textarea>
                        <label
                          class="before:content[' '] after:content[' '] pointer-events-none absolute left-0 -top-1.5 flex h-full w-full select-none text-[11px] font-normal leading-tight text-blue-gray-400 transition-all before:pointer-events-none before:mt-[6.5px] before:mr-1 before:box-border before:block before:h-1.5 before:w-2.5 before:rounded-tl-md before:border-t before:border-l before:border-blue-gray-200 before:transition-all after:pointer-events-none after:mt-[6.5px] after:ml-1 after:box-border after:block after:h-1.5 after:w-2.5 after:flex-grow after:rounded-tr-md after:border-t after:border-r after:border-blue-gray-200 after:transition-all peer-placeholder-shown:text-sm peer-placeholder-shown:leading-[3.75] peer-placeholder-shown:text-blue-gray-500 peer-placeholder-shown:before:border-transparent peer-placeholder-shown:after:border-transparent peer-focus:text-[11px] peer-focus:leading-tight peer-focus:text-gray-900 peer-focus:before:border-t-2 peer-focus:before:border-l-2 peer-focus:before:!border-gray-900 peer-focus:after:border-t-2 peer-focus:after:border-r-2 peer-focus:after:!border-gray-900 peer-disabled:text-transparent peer-disabled:before:border-transparent peer-disabled:after:border-transparent peer-disabled:peer-placeholder-shown:text-blue-gray-500">
                          Your Review
                        </label>
                      </div>

    <!-- Rating Radio Buttons -->
    <div class="flex w-full justify-between py-1.5">
      <div class="rating">
        <input type="radio" name="rating-2" value="1" class="mask mask-star-2 bg-orange-400" required />
        <input type="radio" name="rating-2" value="2" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating-2" value="3" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating-2" value="4" class="mask mask-star-2 bg-orange-400" />
        <input type="radio" name="rating-2" value="5" class="mask mask-star-2 bg-orange-400" />
      </div>

      <!-- Submit Button -->
      <div class="flex gap-2">
        <input
          class="select-none rounded-md bg-gray-900 py-2 px-4 text-center align-middle font-sans text-xs font-bold uppercase text-white shadow-md shadow-gray-900/10 transition-all hover:shadow-lg hover:shadow-gray-900/20 focus:opacity-[0.85] focus:shadow-none active:opacity-[0.85] active:shadow-none disabled:pointer-events-none disabled:opacity-50 disabled:shadow-none"
          type="submit"
          value="Submit Review"
        />
      </div>
    </div>
  </div>
</form>
          </div>
          </div>
        </div>
        <section >
          <div class=" w-full bg-[#D4BEE4]">
            <div class="flex justify-center items-center gap-[10rem] p-8">
                <div class="flex items-center lg:mb-0 mb-10">
                    <div class="">
                        <h4 class="text-indigo-600 text-base font-medium leading-6 mb-4 lg:text-left text-center">Contact Us</h4>
                        <h2 class="text-gray-900 font-manrope text-4xl font-semibold leading-10 mb-9 lg:text-left text-center">Reach Out To Us</h2>
                        <form action="">
                            <input type="text" class="bg-white w-full h-14 shadow-sm text-gray-600 placeholder-text-400 text-lg font-normal leading-7 rounded-full border border-gray-200 focus:outline-none py-2 px-4 mb-8" placeholder="Name">
                            <input type="email" class="bg-white w-full h-14 shadow-sm text-gray-600 placeholder-text-400 text-lg font-normal leading-7 rounded-full border border-gray-200 focus:outline-none py-2 px-4 mb-8" placeholder="Email">
                            <textarea name="" id="text" class="bg-white w-full h-48 shadow-sm resize-none text-gray-600 placeholder-text-400 text-lg font-normal leading-7 rounded-2xl border border-gray-200 focus:outline-none px-4 py-4 mb-8" placeholder="Phone"></textarea>
                        <button class="w-full h-12 text-center text-white text-base font-semibold leading-6 rounded-full bg-indigo-600 shadow transition-all duration-700 hover:bg-indigo-800">Submit</button>
                        </form>
                    </div>
                </div>
                <div class="lg:max-w-xl w-full h-[600px] flex items-center justify-center  bg-cover bg-no-repeat bg-[url('https://pagedone.io/asset/uploads/1696245837.png')] ">
                    <div class="">
                        <div class="lg:w-96 w-auto h-auto bg-white shadow-xl lg:p-6 p-4">
                            <svg width="164" height="33" viewBox="0 0 164 33" fill="none" xmlns="http://www.w3.org/2000/svg" class="mb-6 mx-auto">
                                <path d="M47 24.7231V7H54.4171C54.5916 7 54.816 7.00821 55.0903 7.02462C55.3645 7.03282 55.618 7.05744 55.8507 7.09846C56.8895 7.25436 57.7455 7.59487 58.4186 8.12C59.1001 8.64513 59.6029 9.30974 59.927 10.1138C60.2594 10.9097 60.4256 11.7959 60.4256 12.7723C60.4256 13.7405 60.2594 14.6267 59.927 15.4308C59.5945 16.2267 59.0876 16.8872 58.4061 17.4123C57.733 17.9374 56.8812 18.2779 55.8507 18.4338C55.618 18.4667 55.3604 18.4913 55.0778 18.5077C54.8035 18.5241 54.5833 18.5323 54.4171 18.5323H50.0042V24.7231H47ZM50.0042 15.7631H54.2925C54.4587 15.7631 54.6457 15.7549 54.8534 15.7385C55.0612 15.7221 55.2523 15.6892 55.4268 15.64C55.9255 15.5169 56.3161 15.2995 56.5986 14.9877C56.8895 14.6759 57.0931 14.3231 57.2094 13.9292C57.3341 13.5354 57.3964 13.1497 57.3964 12.7723C57.3964 12.3949 57.3341 12.0092 57.2094 11.6154C57.0931 11.2133 56.8895 10.8564 56.5986 10.5446C56.3161 10.2328 55.9255 10.0154 55.4268 9.89231C55.2523 9.84308 55.0612 9.81436 54.8534 9.80615C54.6457 9.78974 54.4587 9.78154 54.2925 9.78154H50.0042V15.7631Z" fill="#101828"></path>
                                <path d="M66.0975 25.0923C65.1252 25.0923 64.3024 24.9118 63.6293 24.5508C62.9561 24.1815 62.445 23.6933 62.096 23.0862C61.7553 22.479 61.5849 21.8103 61.5849 21.08C61.5849 20.44 61.6929 19.8656 61.909 19.3569C62.1251 18.84 62.4575 18.3969 62.9063 18.0277C63.355 17.6503 63.9368 17.3426 64.6515 17.1046C65.1917 16.9323 65.8233 16.7764 66.5463 16.6369C67.2776 16.4974 68.0671 16.3703 68.9148 16.2554C69.7707 16.1323 70.6641 16.001 71.5949 15.8615L70.5228 16.4646C70.5311 15.5456 70.3234 14.8687 69.8995 14.4338C69.4757 13.999 68.761 13.7815 67.7554 13.7815C67.1488 13.7815 66.5629 13.921 65.9978 14.2C65.4327 14.479 65.0379 14.959 64.8135 15.64L62.0711 14.7908C62.4035 13.6667 63.0351 12.7641 63.9659 12.0831C64.9049 11.4021 66.1681 11.0615 67.7554 11.0615C68.9522 11.0615 70.0034 11.2544 70.9093 11.64C71.8234 12.0256 72.5007 12.6574 72.9412 13.5354C73.1822 14.0031 73.3276 14.4831 73.3775 14.9754C73.4274 15.4595 73.4523 15.9887 73.4523 16.5631V24.7231H70.822V21.8431L71.2583 22.3108C70.6517 23.2708 69.9411 23.9764 69.1267 24.4277C68.3206 24.8708 67.3108 25.0923 66.0975 25.0923ZM66.6959 22.7292C67.3773 22.7292 67.9591 22.6103 68.4411 22.3723C68.9231 22.1344 69.3054 21.8431 69.5879 21.4985C69.8788 21.1538 70.0741 20.8297 70.1738 20.5262C70.3317 20.1487 70.419 19.7179 70.4356 19.2338C70.4605 18.7415 70.473 18.3436 70.473 18.04L71.3954 18.3108C70.4896 18.4503 69.7126 18.5733 69.0643 18.68C68.4161 18.7867 67.8593 18.8892 67.3939 18.9877C66.9286 19.0779 66.5172 19.1805 66.1598 19.2954C65.8108 19.4185 65.5158 19.5621 65.2748 19.7262C65.0338 19.8903 64.8468 20.079 64.7138 20.2923C64.5891 20.5056 64.5268 20.7559 64.5268 21.0431C64.5268 21.3713 64.6099 21.6626 64.7761 21.9169C64.9423 22.1631 65.1833 22.36 65.4991 22.5077C65.8233 22.6554 66.2222 22.7292 66.6959 22.7292Z" fill="#101828"></path>
                                <path d="M82.1078 31C81.3598 31 80.641 30.8851 79.9512 30.6554C79.2698 30.4256 78.6548 30.0933 78.1063 29.6585C77.5578 29.2318 77.109 28.7149 76.76 28.1077L79.5274 26.7538C79.785 27.2379 80.1465 27.5949 80.6119 27.8246C81.0856 28.0626 81.5884 28.1815 82.1203 28.1815C82.7435 28.1815 83.3003 28.0708 83.7907 27.8492C84.281 27.6359 84.6591 27.3159 84.925 26.8892C85.1993 26.4708 85.3281 25.9456 85.3115 25.3138V21.5354H85.6855V11.4308H88.3157V25.3631C88.3157 25.6995 88.2991 26.0195 88.2659 26.3231C88.2409 26.6349 88.1952 26.9385 88.1287 27.2338C87.9293 28.0954 87.547 28.801 86.9819 29.3508C86.4168 29.9087 85.7145 30.3231 84.8752 30.5938C84.0441 30.8646 83.1217 31 82.1078 31ZM81.846 25.0923C80.6077 25.0923 79.5274 24.7846 78.6049 24.1692C77.6825 23.5538 76.9678 22.7169 76.4608 21.6585C75.9539 20.6 75.7004 19.4062 75.7004 18.0769C75.7004 16.7313 75.9539 15.5333 76.4608 14.4831C76.9761 13.4246 77.7032 12.5918 78.6423 11.9846C79.5814 11.3692 80.6867 11.0615 81.9582 11.0615C83.238 11.0615 84.3101 11.3692 85.1744 11.9846C86.047 12.5918 86.7076 13.4246 87.1564 14.4831C87.6052 15.5415 87.8296 16.7395 87.8296 18.0769C87.8296 19.3979 87.6052 20.5918 87.1564 21.6585C86.7076 22.7169 86.0387 23.5538 85.1494 24.1692C84.2602 24.7846 83.1591 25.0923 81.846 25.0923ZM82.3072 22.4338C83.1134 22.4338 83.7616 22.2533 84.2519 21.8923C84.7505 21.5231 85.112 21.0103 85.3364 20.3538C85.5691 19.6974 85.6855 18.9385 85.6855 18.0769C85.6855 17.2072 85.5691 16.4482 85.3364 15.8C85.112 15.1436 84.7588 14.6349 84.2768 14.2738C83.7948 13.9046 83.1715 13.72 82.407 13.72C81.6008 13.72 80.936 13.9169 80.4124 14.3108C79.8889 14.6964 79.5024 15.2215 79.2531 15.8862C79.0038 16.5426 78.8792 17.2728 78.8792 18.0769C78.8792 18.8892 78.9997 19.6277 79.2407 20.2923C79.49 20.9487 79.8681 21.4697 80.375 21.8554C80.882 22.241 81.5261 22.4338 82.3072 22.4338Z" fill="#101828"></path>
                                <path d="M97.6827 25.0923C96.3198 25.0923 95.1231 24.801 94.0926 24.2185C93.0621 23.6359 92.256 22.8277 91.6743 21.7938C91.1008 20.76 90.8141 19.5703 90.8141 18.2246C90.8141 16.7723 91.0967 15.5128 91.6618 14.4462C92.2269 13.3713 93.0122 12.5385 94.0178 11.9477C95.0234 11.3569 96.1869 11.0615 97.5082 11.0615C98.9044 11.0615 100.089 11.3856 101.061 12.0338C102.042 12.6738 102.769 13.5805 103.242 14.7538C103.716 15.9272 103.895 17.3097 103.778 18.9015H100.799V17.8185C100.791 16.3744 100.533 15.32 100.026 14.6554C99.5194 13.9908 98.7216 13.6585 97.6329 13.6585C96.4029 13.6585 95.4888 14.0359 94.8904 14.7908C94.2921 15.5374 93.9929 16.6328 93.9929 18.0769C93.9929 19.4226 94.2921 20.4646 94.8904 21.2031C95.4888 21.9415 96.3614 22.3108 97.5082 22.3108C98.2479 22.3108 98.8836 22.1508 99.4155 21.8308C99.9557 21.5026 100.371 21.0308 100.662 20.4154L103.629 21.3015C103.114 22.4995 102.316 23.4308 101.235 24.0954C100.163 24.76 98.9792 25.0923 97.6827 25.0923ZM93.0455 18.9015V16.6615H102.308V18.9015H93.0455Z" fill="#101828"></path>
                                <path d="M111.708 25.0923C110.47 25.0923 109.39 24.7846 108.467 24.1692C107.545 23.5538 106.83 22.7169 106.323 21.6585C105.816 20.6 105.563 19.4062 105.563 18.0769C105.563 16.7313 105.816 15.5333 106.323 14.4831C106.838 13.4246 107.565 12.5918 108.505 11.9846C109.444 11.3692 110.549 11.0615 111.82 11.0615C113.1 11.0615 114.172 11.3692 115.037 11.9846C115.909 12.5918 116.57 13.4246 117.019 14.4831C117.467 15.5415 117.692 16.7395 117.692 18.0769C117.692 19.3979 117.467 20.5918 117.019 21.6585C116.57 22.7169 115.901 23.5538 115.012 24.1692C114.122 24.7846 113.021 25.0923 111.708 25.0923ZM112.169 22.4338C112.976 22.4338 113.624 22.2533 114.114 21.8923C114.613 21.5231 114.974 21.0103 115.199 20.3538C115.431 19.6974 115.548 18.9385 115.548 18.0769C115.548 17.2072 115.431 16.4482 115.199 15.8C114.974 15.1436 114.621 14.6349 114.139 14.2738C113.657 13.9046 113.034 13.72 112.269 13.72C111.463 13.72 110.798 13.9169 110.275 14.3108C109.751 14.6964 109.365 15.2215 109.115 15.8862C108.866 16.5426 108.741 17.2728 108.741 18.0769C108.741 18.8892 108.862 19.6277 109.103 20.2923C109.352 20.9487 109.73 21.4697 110.237 21.8554C110.744 22.241 111.388 22.4338 112.169 22.4338ZM115.548 24.7231V15.3938H115.174V7H118.203V24.7231H115.548Z" fill="#101828"></path>
                                <path d="M127.395 25.0923C126.049 25.0923 124.873 24.7928 123.867 24.1938C122.861 23.5949 122.08 22.7703 121.523 21.72C120.975 20.6615 120.701 19.4472 120.701 18.0769C120.701 16.6821 120.983 15.4595 121.548 14.4092C122.113 13.359 122.899 12.5385 123.904 11.9477C124.91 11.3569 126.073 11.0615 127.395 11.0615C128.749 11.0615 129.93 11.361 130.935 11.96C131.941 12.559 132.722 13.3877 133.279 14.4462C133.835 15.4964 134.114 16.7067 134.114 18.0769C134.114 19.4554 133.831 20.6738 133.266 21.7323C132.709 22.7826 131.928 23.6072 130.923 24.2062C129.917 24.7969 128.741 25.0923 127.395 25.0923ZM127.395 22.3108C128.592 22.3108 129.481 21.9169 130.062 21.1292C130.644 20.3415 130.935 19.3241 130.935 18.0769C130.935 16.7887 130.64 15.7631 130.05 15C129.46 14.2287 128.575 13.8431 127.395 13.8431C126.589 13.8431 125.924 14.0236 125.4 14.3846C124.885 14.7374 124.503 15.2338 124.253 15.8738C124.004 16.5056 123.879 17.24 123.879 18.0769C123.879 19.3651 124.174 20.3949 124.765 21.1662C125.363 21.9292 126.24 22.3108 127.395 22.3108Z" fill="#101828"></path>
                                <path d="M145.923 24.7231V18.3231C145.923 17.9046 145.894 17.441 145.836 16.9323C145.778 16.4236 145.64 15.9354 145.424 15.4677C145.217 14.9918 144.901 14.6021 144.477 14.2985C144.061 13.9949 143.496 13.8431 142.782 13.8431C142.399 13.8431 142.021 13.9046 141.647 14.0277C141.273 14.1508 140.933 14.3641 140.625 14.6677C140.326 14.9631 140.085 15.3733 139.902 15.8985C139.719 16.4154 139.628 17.08 139.628 17.8923L137.845 17.1415C137.845 16.0092 138.065 14.9836 138.506 14.0646C138.955 13.1456 139.611 12.4154 140.475 11.8738C141.34 11.3241 142.403 11.0492 143.667 11.0492C144.664 11.0492 145.487 11.2133 146.135 11.5415C146.783 11.8697 147.298 12.2882 147.681 12.7969C148.063 13.3056 148.345 13.8472 148.528 14.4215C148.711 14.9959 148.827 15.5415 148.877 16.0585C148.936 16.5672 148.965 16.9815 148.965 17.3015V24.7231H145.923ZM136.586 24.7231V11.4308H139.266V15.5538H139.628V24.7231H136.586Z" fill="#101828"></path>
                                <path d="M157.87 25.0923C156.507 25.0923 155.31 24.801 154.28 24.2185C153.249 23.6359 152.443 22.8277 151.861 21.7938C151.288 20.76 151.001 19.5703 151.001 18.2246C151.001 16.7723 151.284 15.5128 151.849 14.4462C152.414 13.3713 153.199 12.5385 154.205 11.9477C155.21 11.3569 156.374 11.0615 157.695 11.0615C159.091 11.0615 160.276 11.3856 161.248 12.0338C162.229 12.6738 162.956 13.5805 163.43 14.7538C163.903 15.9272 164.082 17.3097 163.966 18.9015H160.986V17.8185C160.978 16.3744 160.72 15.32 160.213 14.6554C159.706 13.9908 158.909 13.6585 157.82 13.6585C156.59 13.6585 155.676 14.0359 155.078 14.7908C154.479 15.5374 154.18 16.6328 154.18 18.0769C154.18 19.4226 154.479 20.4646 155.078 21.2031C155.676 21.9415 156.548 22.3108 157.695 22.3108C158.435 22.3108 159.071 22.1508 159.603 21.8308C160.143 21.5026 160.558 21.0308 160.849 20.4154L163.816 21.3015C163.301 22.4995 162.503 23.4308 161.423 24.0954C160.351 24.76 159.166 25.0923 157.87 25.0923ZM153.233 18.9015V16.6615H162.495V18.9015H153.233Z" fill="#101828"></path>
                                <path d="M24.5473 11.8941C25.1905 12.5063 25.2068 13.5149 24.5837 14.1468L18.7585 20.054C18.1354 20.686 17.1087 20.702 16.4654 20.0898C15.8222 19.4776 15.8059 18.469 16.429 17.8371L22.2542 11.9299C22.8773 11.2979 23.904 11.2819 24.5473 11.8941Z" fill="url(#paint0_linear_6727_44729-1)"></path>
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M0 4.54673C0 2.03564 2.07211 0 4.62819 0H21.5399V0.00124069C28.9908 0.0998525 35 6.06429 35 13.4075C35 20.8123 28.8897 26.8151 21.3523 26.8151C18.6648 26.8151 16.1587 26.052 14.0463 24.7342L6.58815 31.9057C4.13431 34.2652 0 32.5573 0 29.1841V4.54673ZM11.5194 22.7055C9.15709 20.295 7.70452 17.0179 7.70452 13.4075C7.70452 12.5277 8.43056 11.8144 9.32619 11.8144C10.2218 11.8144 10.9479 12.5277 10.9479 13.4075C10.9479 19.0526 15.6061 23.6288 21.3523 23.6288C27.0985 23.6288 31.7567 19.0526 31.7567 13.4075C31.7567 7.76248 27.0985 3.18626 21.3523 3.18626H4.62819C3.86336 3.18626 3.24334 3.79536 3.24334 4.54673V29.1841C3.24334 29.7351 3.91866 30.014 4.31948 29.6286L11.5194 22.7055Z" fill="url(#paint1_linear_6727_44729-1)"></path>
                                <defs>
                                    <linearGradient id="paint0_linear_6727_44729-1" x1="31.5325" y1="2.21268" x2="1.00231" y2="33.2898" gradientUnits="userSpaceOnUse">
                                        <stop stop-color="#9038FF"></stop>
                                        <stop offset="0.993738" stop-color="#5551FF"></stop>
                                    </linearGradient>
                                    <linearGradient id="paint1_linear_6727_44729-1" x1="31.5325" y1="2.21268" x2="1.00231" y2="33.2898" gradientUnits="userSpaceOnUse">
                                        <stop stop-color="#9038FF"></stop>
                                        <stop offset="0.993738" stop-color="#5551FF"></stop>
                                    </linearGradient>
                                </defs>
                            </svg>
                            <a href="javascript:;" class="flex items-center mb-6">
                                <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M22.3092 18.3098C22.0157 18.198 21.8689 18.1421 21.7145 18.1287C21.56 18.1154 21.4058 18.1453 21.0975 18.205L17.8126 18.8416C17.4392 18.9139 17.2525 18.9501 17.0616 18.9206C16.8707 18.891 16.7141 18.8058 16.4008 18.6353C13.8644 17.2551 12.1853 15.6617 11.1192 13.3695C10.9964 13.1055 10.935 12.9735 10.9133 12.8017C10.8917 12.6298 10.9218 12.4684 10.982 12.1456L11.6196 8.72559C11.6759 8.42342 11.7041 8.27233 11.6908 8.12115C11.6775 7.96998 11.6234 7.82612 11.5153 7.5384L10.6314 5.18758C10.37 4.49217 10.2392 4.14447 9.95437 3.94723C9.6695 3.75 9.29804 3.75 8.5551 3.75H5.85778C4.58478 3.75 3.58264 4.8018 3.77336 6.06012C4.24735 9.20085 5.64674 14.8966 9.73544 18.9853C14.0295 23.2794 20.2151 25.1426 23.6187 25.884C24.9335 26.1696 26.0993 25.1448 26.0993 23.7985V21.2824C26.0993 20.5428 26.0993 20.173 25.9034 19.8888C25.7076 19.6046 25.362 19.4729 24.6708 19.2096L22.3092 18.3098Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                </svg>
                                <h5 class="text-black text-base font-normal leading-6 ml-5">470-601-1911</h5>
                            </a>
                            <a href="javascript:;" class="flex items-center mb-6">
                                <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M2.81501 8.75L10.1985 13.6191C12.8358 15.2015 14.1544 15.9927 15.6032 15.9582C17.0519 15.9237 18.3315 15.0707 20.8905 13.3647L27.185 8.75M12.5 25H17.5C22.214 25 24.5711 25 26.0355 23.5355C27.5 22.0711 27.5 19.714 27.5 15C27.5 10.286 27.5 7.92893 26.0355 6.46447C24.5711 5 22.214 5 17.5 5H12.5C7.78595 5 5.42893 5 3.96447 6.46447C2.5 7.92893 2.5 10.286 2.5 15C2.5 19.714 2.5 22.0711 3.96447 23.5355C5.42893 25 7.78595 25 12.5 25Z" stroke="#000000" stroke-width="2" stroke-linecap="round"></path>
                                </svg>
                                <h5 class="text-black text-base font-normal leading-6 ml-5">Pagedone1234@gmail.com</h5>
                            </a>
                            <a href="javascript:;" class="flex items-center mb-6">
                                <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M25 12.9169C25 17.716 21.1939 21.5832 18.2779 24.9828C16.8385 26.6609 16.1188 27.5 15 27.5C13.8812 27.5 13.1615 26.6609 11.7221 24.9828C8.80612 21.5832 5 17.716 5 12.9169C5 10.1542 6.05357 7.5046 7.92893 5.55105C9.8043 3.59749 12.3478 2.5 15 2.5C17.6522 2.5 20.1957 3.59749 22.0711 5.55105C23.9464 7.5046 25 10.1542 25 12.9169Z" stroke="#000000" stroke-width="2"></path>
                                    <path d="M17.5 11.6148C17.5 13.0531 16.3807 14.219 15 14.219C13.6193 14.219 12.5 13.0531 12.5 11.6148C12.5 10.1765 13.6193 9.01058 15 9.01058C16.3807 9.01058 17.5 10.1765 17.5 11.6148Z" stroke="#000000" stroke-width="2"></path>
                                </svg>
                                <h5 class="text-black text-base font-normal leading-6 ml-5">789 Oak Lane, Lakeside, TX 54321</h5>
                            </a>
                           
                        </div>
                    </div>
                </div>
          </div>
        </div>
    </section>
                                                
    
        <footer class="bg-[#7E60BF] w-full">
          <div class="w-full space-y-8 px-4 py-4 sm:px-6 lg:space-y-16 lg:px-8">
            <div class="sm:flex sm:items-center sm:justify-between">
              <div class="text-teal-600">
                <svg
                  class="h-8"
                  viewBox="0 0 118 24"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M37.83 19.2047C37.2352 19.237 36.6469 19.0679 36.16 18.7247C35.9566 18.5739 35.7929 18.3758 35.6831 18.1476C35.5733 17.9193 35.5208 17.6678 35.53 17.4147V8.1447C35.5252 8.1055 35.5293 8.0656 35.5422 8.0282C35.555 7.9908 35.5762 7.9569 35.6042 7.9289C35.6322 7.9009 35.6661 7.8797 35.7035 7.8669C35.7409 7.854 35.7808 7.8499 35.82 7.8547H37.5C37.69 7.8547 37.78 7.9547 37.78 8.1447V16.6947C37.78 17.0747 37.95 17.2647 38.3 17.2647C38.4484 17.2708 38.5968 17.254 38.74 17.2147C38.94 17.2147 39.05 17.2747 39.06 17.4547L39.21 18.7047C39.2172 18.7412 39.2165 18.7787 39.208 18.8149C39.1995 18.851 39.1833 18.885 39.1605 18.9143C39.1378 18.9437 39.109 18.9679 39.0762 18.9852C39.0433 19.0025 39.0071 19.0126 38.97 19.0147C38.602 19.1363 38.2175 19.2004 37.83 19.2047Z"
                    fill="currentColor"
                  />
                  <path
                    d="M47.28 18.1347C46.4359 18.8322 45.375 19.2137 44.28 19.2137C43.185 19.2137 42.1242 18.8322 41.28 18.1347C40.5381 17.3857 40.1218 16.374 40.1218 15.3197C40.1218 14.2654 40.5381 13.2537 41.28 12.5047C42.1258 11.8108 43.186 11.4316 44.28 11.4316C45.374 11.4316 46.4342 11.8108 47.28 12.5047C48.0049 13.2606 48.4096 14.2674 48.4096 15.3147C48.4096 16.362 48.0049 17.3688 47.28 18.1247V18.1347ZM42.86 16.8147C43.2518 17.1696 43.7614 17.3661 44.29 17.3661C44.8186 17.3661 45.3283 17.1696 45.72 16.8147C46.0746 16.4071 46.2698 15.885 46.2698 15.3447C46.2698 14.8045 46.0746 14.2824 45.72 13.8747C45.3283 13.5199 44.8186 13.3233 44.29 13.3233C43.7614 13.3233 43.2518 13.5199 42.86 13.8747C42.5055 14.2824 42.3102 14.8045 42.3102 15.3447C42.3102 15.885 42.5055 16.4071 42.86 16.8147Z"
                    fill="currentColor"
                  />
                  <path
                    d="M57.66 11.6847C57.85 11.6847 57.94 11.7847 57.94 11.9747V19.1447C57.9575 19.6287 57.8669 20.1104 57.6749 20.5549C57.4829 20.9995 57.1943 21.3957 56.83 21.7147C56.0214 22.4042 54.9816 22.7615 53.92 22.7147C52.9612 22.7484 52.0151 22.4866 51.21 21.9647C50.8662 21.739 50.5725 21.4449 50.3472 21.1009C50.1218 20.7568 49.9696 20.3701 49.9 19.9647C49.9 19.7647 49.9 19.6747 50.17 19.6747H51.85C51.9213 19.6771 51.9905 19.7002 52.049 19.741C52.1076 19.7818 52.1531 19.8386 52.18 19.9047C52.289 20.2084 52.5062 20.4613 52.79 20.6147C53.1359 20.7932 53.5209 20.8826 53.91 20.8747C54.1448 20.8876 54.3798 20.8535 54.6013 20.7745C54.8228 20.6956 55.0263 20.5732 55.2 20.4147C55.3587 20.2489 55.4821 20.0526 55.5629 19.8378C55.6437 19.623 55.6801 19.394 55.67 19.1647V18.5347C55.0685 18.9771 54.3364 19.2059 53.59 19.1847C53.0676 19.2037 52.5468 19.117 52.0587 18.9297C51.5707 18.7423 51.1256 18.4584 50.75 18.0947C50.0291 17.3489 49.6261 16.3521 49.6261 15.3147C49.6261 14.2774 50.0291 13.2806 50.75 12.5347C51.1274 12.1743 51.5731 11.8931 52.0608 11.7076C52.5486 11.5221 53.0685 11.4361 53.59 11.4547C54.358 11.4344 55.1098 11.678 55.72 12.1447V11.9847C55.7154 11.9464 55.7194 11.9075 55.7317 11.8709C55.744 11.8344 55.7643 11.801 55.7911 11.7732C55.8179 11.7454 55.8506 11.724 55.8867 11.7104C55.9229 11.6968 55.9616 11.6915 56 11.6947L57.66 11.6847ZM53.78 17.4047C54.0376 17.4127 54.2939 17.364 54.5306 17.262C54.7673 17.1601 54.9788 17.0074 55.15 16.8147C55.4825 16.3854 55.6629 15.8577 55.6629 15.3147C55.6629 14.7717 55.4825 14.2441 55.15 13.8147C54.9794 13.6247 54.7692 13.4742 54.5343 13.374C54.2993 13.2738 54.0453 13.2263 53.79 13.2347C53.5294 13.2265 53.2702 13.275 53.0302 13.3769C52.7902 13.4788 52.5752 13.6316 52.4 13.8247C52.0317 14.2354 51.838 14.7735 51.86 15.3247C51.842 15.8705 52.0314 16.4029 52.39 16.8147C52.5656 17.0073 52.7807 17.1598 53.0206 17.2616C53.2605 17.3634 53.5195 17.4122 53.78 17.4047Z"
                    fill="currentColor"
                  />
                  <path
                    d="M66.57 18.1347C65.7242 18.8286 64.664 19.2078 63.57 19.2078C62.476 19.2078 61.4158 18.8286 60.57 18.1347C59.8445 17.3771 59.4395 16.3687 59.4395 15.3197C59.4395 14.2708 59.8445 13.2623 60.57 12.5047C61.4166 11.8126 62.4765 11.4345 63.57 11.4345C64.6635 11.4345 65.7234 11.8126 66.57 12.5047C67.2949 13.2606 67.6996 14.2674 67.6996 15.3147C67.6996 16.362 67.2949 17.3688 66.57 18.1247V18.1347ZM62.14 16.8147C62.3317 16.9971 62.5577 17.1396 62.8049 17.234C63.0521 17.3284 63.3155 17.3729 63.58 17.3647C63.8428 17.3715 64.1044 17.3265 64.3498 17.2321C64.5952 17.1377 64.8195 16.9959 65.01 16.8147C65.3588 16.4043 65.5503 15.8833 65.5503 15.3447C65.5503 14.8061 65.3588 14.2851 65.01 13.8747C64.8195 13.6936 64.5952 13.5517 64.3498 13.4574C64.1044 13.363 63.8428 13.3179 63.58 13.3247C63.3155 13.3166 63.0521 13.361 62.8049 13.4554C62.5577 13.5498 62.3317 13.6924 62.14 13.8747C61.7913 14.2851 61.5998 14.8061 61.5998 15.3447C61.5998 15.8833 61.7913 16.4043 62.14 16.8147Z"
                    fill="currentColor"
                  />
                  <path
                    d="M71.31 9.9847C71.0457 10.2161 70.7063 10.3436 70.355 10.3436C70.0037 10.3436 69.6644 10.2161 69.4 9.9847C69.2802 9.8716 69.1847 9.7352 69.1194 9.5839C69.0542 9.4326 69.0205 9.2695 69.0205 9.1047C69.0205 8.9399 69.0542 8.7769 69.1194 8.6255C69.1847 8.4742 69.2802 8.3378 69.4 8.2247C69.6671 7.9991 70.0054 7.8754 70.355 7.8754C70.7046 7.8754 71.0429 7.9991 71.31 8.2247C71.4299 8.3378 71.5254 8.4742 71.5906 8.6255C71.6559 8.7769 71.6895 8.9399 71.6895 9.1047C71.6895 9.2695 71.6559 9.4326 71.5906 9.5839C71.5254 9.7352 71.4299 9.8716 71.31 9.9847ZM71.52 19.2047C70.9256 19.2339 70.3383 19.0651 69.85 18.7247C69.6497 18.5717 69.4888 18.3729 69.381 18.145C69.2731 17.9171 69.2213 17.6667 69.23 17.4147V11.9747C69.2252 11.9355 69.2293 11.8956 69.2422 11.8582C69.255 11.8208 69.2762 11.7869 69.3042 11.7589C69.3322 11.7309 69.3661 11.7097 69.4035 11.6969C69.4409 11.684 69.4808 11.6799 69.52 11.6847H71.2C71.39 11.6847 71.48 11.7847 71.48 11.9747V16.6947C71.48 17.0747 71.65 17.2647 71.99 17.2647C72.1417 17.2702 72.2933 17.2533 72.44 17.2147C72.64 17.2147 72.75 17.2747 72.76 17.4547L72.91 18.7047C72.9172 18.7412 72.9165 18.7787 72.908 18.8149C72.8995 18.851 72.8833 18.885 72.8605 18.9143C72.8378 18.9437 72.809 18.9679 72.7762 18.9852C72.7433 19.0025 72.7071 19.0126 72.67 19.0147C72.2988 19.137 71.9109 19.2011 71.52 19.2047Z"
                    fill="currentColor"
                  />
                  <path
                    d="M79.09 11.4447C79.6148 11.424 80.1383 11.5089 80.6296 11.6944C81.1209 11.88 81.57 12.1623 81.95 12.5247C82.6572 13.2837 83.0504 14.2824 83.0504 15.3197C83.0504 16.357 82.6572 17.3558 81.95 18.1147C81.5718 18.4804 81.1233 18.7655 80.6317 18.9528C80.1401 19.1402 79.6157 19.2259 79.09 19.2047C78.3412 19.2214 77.6073 18.9932 77 18.5547V22.1647C77 22.3547 76.9 22.4447 76.71 22.4447H75.03C74.9917 22.4519 74.9522 22.4496 74.9149 22.4381C74.8777 22.4265 74.8438 22.4061 74.8162 22.3785C74.7887 22.3509 74.7682 22.3171 74.7567 22.2798C74.7451 22.2426 74.7429 22.2031 74.75 22.1647V13.9647C74.7618 13.8845 74.7546 13.8027 74.7292 13.7257C74.7037 13.6488 74.6605 13.5788 74.6032 13.5215C74.5459 13.4642 74.476 13.4211 74.399 13.3956C74.3221 13.3701 74.2402 13.363 74.16 13.3747H73.83C73.61 13.3747 73.5 13.2947 73.5 13.1347V11.9547C73.4948 11.8817 73.5148 11.8091 73.5567 11.7491C73.5985 11.689 73.6597 11.6451 73.73 11.6247C74.0759 11.499 74.442 11.438 74.81 11.4447C75.177 11.4122 75.5453 11.4901 75.8678 11.6682C76.1902 11.8464 76.4522 12.1168 76.62 12.4447C76.9421 12.1189 77.3273 11.8622 77.752 11.6902C78.1767 11.5183 78.632 11.4347 79.09 11.4447ZM77.53 16.8147C77.7083 17.0011 77.9225 17.1494 78.1597 17.2507C78.3969 17.352 78.6521 17.4042 78.91 17.4042C79.1679 17.4042 79.4232 17.352 79.6603 17.2507C79.8975 17.1494 80.1117 17.0011 80.29 16.8147C80.6656 16.3958 80.8629 15.8469 80.84 15.2847C80.8662 14.7221 80.6684 14.1719 80.29 13.7547C80.1117 13.5684 79.8975 13.4201 79.6603 13.3188C79.4232 13.2174 79.1679 13.1652 78.91 13.1652C78.6521 13.1652 78.3969 13.2174 78.1597 13.3188C77.9225 13.4201 77.7083 13.5684 77.53 13.7547C77.1662 14.1793 76.9768 14.726 77 15.2847C76.9797 15.843 77.1688 16.3887 77.53 16.8147Z"
                    fill="currentColor"
                  />
                  <path
                    d="M87.77 19.2047C86.8723 19.2416 85.9822 19.0269 85.2 18.5847C84.8862 18.3957 84.619 18.1384 84.4181 17.832C84.2173 17.5256 84.0881 17.1779 84.04 16.8147C84.04 16.6147 84.11 16.5147 84.33 16.5147H85.8C85.8699 16.5175 85.9378 16.5394 85.996 16.5783C86.0542 16.6171 86.1006 16.6712 86.13 16.7347C86.34 17.2747 86.89 17.5447 87.77 17.5447C88.077 17.5588 88.3826 17.4969 88.66 17.3647C88.7558 17.3215 88.8379 17.2531 88.8978 17.1668C88.9577 17.0805 88.993 16.9795 89 16.8747C89 16.6147 88.84 16.4347 88.52 16.3147C88.1405 16.1884 87.7481 16.1045 87.35 16.0647C86.8785 16.0113 86.4109 15.9278 85.95 15.8147C85.5018 15.7133 85.0943 15.4799 84.78 15.1447C84.5949 14.9169 84.4587 14.6534 84.3797 14.3707C84.3008 14.088 84.2809 13.792 84.3212 13.5013C84.3616 13.2105 84.4613 12.9311 84.6142 12.6806C84.7671 12.43 84.9699 12.2136 85.21 12.0447C85.9308 11.5856 86.7765 11.3619 87.63 11.4047C88.4564 11.3768 89.274 11.5812 89.99 11.9947C90.2786 12.1582 90.527 12.3839 90.7173 12.6555C90.9076 12.9271 91.0349 13.2377 91.09 13.5647C91.09 13.7647 91 13.8647 90.82 13.8647H89.34C89.2777 13.8684 89.2157 13.8532 89.1622 13.8211C89.1087 13.789 89.0661 13.7414 89.04 13.6847C88.9411 13.4479 88.7549 13.2581 88.52 13.1547C88.255 13.0161 87.959 12.9472 87.66 12.9547C87.3669 12.9388 87.0745 12.9973 86.81 13.1247C86.7168 13.1607 86.6366 13.2237 86.5795 13.3057C86.5225 13.3877 86.4913 13.4849 86.49 13.5847C86.4964 13.7215 86.5465 13.8526 86.6329 13.9588C86.7193 14.065 86.8374 14.1406 86.97 14.1747C87.354 14.3195 87.7533 14.4201 88.16 14.4747C88.6277 14.5363 89.0917 14.6231 89.55 14.7347C89.9982 14.8362 90.4057 15.0695 90.72 15.4047C90.8882 15.5894 91.018 15.8055 91.1021 16.0407C91.1862 16.2758 91.2229 16.5253 91.21 16.7747C91.2186 17.1204 91.1375 17.4624 90.9745 17.7674C90.8115 18.0723 90.5722 18.3298 90.28 18.5147C89.5329 18.9944 88.6574 19.235 87.77 19.2047Z"
                    fill="currentColor"
                  />
                  <path
                    d="M101.78 18.7047C101.786 18.7402 101.784 18.7765 101.776 18.8114C101.767 18.8464 101.752 18.8792 101.73 18.9081C101.709 18.937 101.682 18.9613 101.651 18.9796C101.62 18.9979 101.586 19.0098 101.55 19.0147C101.185 19.1339 100.804 19.198 100.42 19.2047C100.04 19.2441 99.656 19.1847 99.306 19.0323C98.955 18.8799 98.65 18.6396 98.42 18.3347C97.714 18.942 96.8 19.2536 95.87 19.2047C95.438 19.2246 95.007 19.1539 94.604 18.9972C94.201 18.8405 93.835 18.6012 93.53 18.2947C93.227 17.9736 92.9922 17.5946 92.8392 17.1805C92.6863 16.7664 92.6186 16.3257 92.64 15.8847V11.9747C92.64 11.7847 92.73 11.6847 92.92 11.6847H94.6C94.79 11.6847 94.88 11.7847 94.88 11.9747V15.5847C94.862 16.0345 95.015 16.4743 95.31 16.8147C95.457 16.9707 95.636 17.0933 95.834 17.1744C96.032 17.2555 96.246 17.2931 96.46 17.2847C96.679 17.2943 96.898 17.2604 97.104 17.1848C97.31 17.1093 97.499 16.9937 97.66 16.8447C97.812 16.6877 97.931 16.5011 98.008 16.2964C98.086 16.0917 98.12 15.8733 98.11 15.6547V11.9747C98.11 11.7847 98.2 11.6847 98.39 11.6847H100.09C100.28 11.6847 100.37 11.7847 100.37 11.9747V16.6847C100.37 17.0747 100.54 17.2647 100.87 17.2647C101.025 17.2707 101.18 17.2539 101.33 17.2147C101.368 17.2041 101.408 17.2022 101.446 17.2092C101.485 17.2161 101.521 17.2317 101.553 17.2548C101.585 17.2779 101.611 17.3079 101.63 17.3425C101.648 17.3771 101.658 17.4155 101.66 17.4547L101.78 18.7047Z"
                    fill="currentColor"
                  />
                  <path
                    d="M117.67 18.7047C117.679 18.7405 117.68 18.7779 117.673 18.8141C117.665 18.8502 117.65 18.8844 117.628 18.914C117.606 18.9436 117.578 18.968 117.545 18.9854C117.513 19.0029 117.477 19.0129 117.44 19.0147C117.068 19.1356 116.681 19.1997 116.29 19.2047C115.695 19.2354 115.108 19.0665 114.62 18.7247C114.409 18.5783 114.238 18.3822 114.121 18.1537C114.004 17.9252 113.945 17.6713 113.95 17.4147V15.0647C113.971 14.6163 113.821 14.1766 113.53 13.8347C113.39 13.6784 113.216 13.5552 113.023 13.4739C112.829 13.3927 112.62 13.3554 112.41 13.3647C112.221 13.3576 112.033 13.3935 111.859 13.4697C111.686 13.5459 111.533 13.6605 111.41 13.8047C111.146 14.1398 111.011 14.5586 111.03 14.9847V18.6747C111.03 18.8647 110.94 18.9647 110.75 18.9647H109.06C109.021 18.9696 108.981 18.9654 108.944 18.9526C108.906 18.9397 108.872 18.9185 108.844 18.8905C108.816 18.8626 108.795 18.8286 108.782 18.7912C108.769 18.7538 108.765 18.714 108.77 18.6747V15.0647C108.792 14.6212 108.653 14.1846 108.38 13.8347C108.258 13.6877 108.105 13.5694 107.932 13.4882C107.76 13.407 107.571 13.3648 107.38 13.3647C107.176 13.3565 106.973 13.3914 106.783 13.4673C106.593 13.5431 106.422 13.6581 106.28 13.8047C105.994 14.1291 105.847 14.5529 105.87 14.9847V18.6747C105.875 18.714 105.871 18.7538 105.858 18.7912C105.845 18.8286 105.824 18.8626 105.796 18.8905C105.768 18.9185 105.734 18.9397 105.697 18.9526C105.659 18.9654 105.619 18.9696 105.58 18.9647H103.95C103.76 18.9647 103.67 18.8647 103.67 18.6747V13.9647C103.682 13.8845 103.675 13.8027 103.649 13.7257C103.624 13.6488 103.581 13.5788 103.523 13.5215C103.466 13.4642 103.396 13.4211 103.319 13.3956C103.242 13.3701 103.16 13.363 103.08 13.3747H102.75C102.53 13.3747 102.42 13.2947 102.42 13.1347V11.9547C102.415 11.8817 102.435 11.8091 102.477 11.7491C102.519 11.689 102.58 11.6451 102.65 11.6247C102.996 11.499 103.362 11.438 103.73 11.4447C104.083 11.4146 104.438 11.485 104.753 11.6478C105.068 11.8106 105.33 12.0591 105.51 12.3647C105.847 12.045 106.247 11.7982 106.684 11.6399C107.121 11.4816 107.586 11.4152 108.05 11.4447C108.501 11.4227 108.95 11.5072 109.362 11.6914C109.774 11.8756 110.136 12.1542 110.42 12.5047C110.751 12.145 111.158 11.8634 111.611 11.68C112.064 11.4967 112.552 11.4164 113.04 11.4447C113.476 11.4243 113.912 11.4946 114.32 11.6513C114.728 11.8079 115.099 12.0474 115.41 12.3547C115.714 12.6752 115.949 13.0541 116.102 13.4684C116.255 13.8826 116.323 14.3237 116.3 14.7647V16.6947C116.3 17.0747 116.47 17.2647 116.79 17.2647C116.945 17.2719 117.1 17.2551 117.25 17.2147C117.457 17.2147 117.567 17.2947 117.58 17.4547L117.67 18.7047Z"
                    fill="currentColor"
                  />
                  <path
                    d="M0.41 10.3847C1.14777 7.4194 2.85643 4.7861 5.2639 2.90424C7.6714 1.02234 10.6393 0 13.695 0C16.7507 0 19.7186 1.02234 22.1261 2.90424C24.5336 4.7861 26.2422 7.4194 26.98 10.3847H25.78C23.7557 10.3549 21.7729 10.9599 20.11 12.1147C20.014 12.1842 19.9138 12.2477 19.81 12.3047H19.67C19.5662 12.2477 19.466 12.1842 19.37 12.1147C17.6924 10.9866 15.7166 10.3841 13.695 10.3841C11.6734 10.3841 9.6976 10.9866 8.02 12.1147C7.924 12.1842 7.8238 12.2477 7.72 12.3047H7.58C7.4762 12.2477 7.376 12.1842 7.28 12.1147C5.6171 10.9599 3.6343 10.3549 1.61 10.3847H0.41ZM23.62 16.6547C24.236 16.175 24.9995 15.924 25.78 15.9447H27.39V12.7347H25.78C24.4052 12.7181 23.0619 13.146 21.95 13.9547C21.3243 14.416 20.5674 14.6649 19.79 14.6649C19.0126 14.6649 18.2557 14.416 17.63 13.9547C16.4899 13.1611 15.1341 12.7356 13.745 12.7356C12.3559 12.7356 11.0001 13.1611 9.86 13.9547C9.2343 14.416 8.4774 14.6649 7.7 14.6649C6.9226 14.6649 6.1657 14.416 5.54 13.9547C4.4144 13.1356 3.0518 12.7072 1.66 12.7347H0V15.9447H1.61C2.39051 15.924 3.154 16.175 3.77 16.6547C4.908 17.4489 6.2623 17.8747 7.65 17.8747C9.0377 17.8747 10.392 17.4489 11.53 16.6547C12.1468 16.1765 12.9097 15.9257 13.69 15.9447C14.4708 15.9223 15.2348 16.1735 15.85 16.6547C16.9901 17.4484 18.3459 17.8738 19.735 17.8738C21.1241 17.8738 22.4799 17.4484 23.62 16.6547ZM23.62 22.3947C24.236 21.915 24.9995 21.664 25.78 21.6847H27.39V18.4747H25.78C24.4052 18.4581 23.0619 18.886 21.95 19.6947C21.3243 20.156 20.5674 20.4049 19.79 20.4049C19.0126 20.4049 18.2557 20.156 17.63 19.6947C16.4899 18.9011 15.1341 18.4757 13.745 18.4757C12.3559 18.4757 11.0001 18.9011 9.86 19.6947C9.2343 20.156 8.4774 20.4049 7.7 20.4049C6.9226 20.4049 6.1657 20.156 5.54 19.6947C4.4144 18.8757 3.0518 18.4472 1.66 18.4747H0V21.6847H1.61C2.39051 21.664 3.154 21.915 3.77 22.3947C4.908 23.1889 6.2623 23.6147 7.65 23.6147C9.0377 23.6147 10.392 23.1889 11.53 22.3947C12.1468 21.9165 12.9097 21.6657 13.69 21.6847C14.4708 21.6623 15.2348 21.9135 15.85 22.3947C16.9901 23.1884 18.3459 23.6138 19.735 23.6138C21.1241 23.6138 22.4799 23.1884 23.62 22.3947Z"
                    fill="currentColor"
                  />
                </svg>
              </div>
    
              <ul class="mt-8 flex justify-start gap-6 sm:mt-0 sm:justify-end">
                <li>
                  <a
                    href="#"
                    rel="noreferrer"
                    target="_blank"
                    class="text-white transition hover:opacity-75"
                  >
                    <span class="sr-only">Facebook</span>
    
                    <svg
                      class="size-6"
                      fill="currentColor"
                      viewBox="0 0 24 24"
                      aria-hidden="true"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"
                        clip-rule="evenodd"
                      />
                    </svg>
                  </a>
                </li>
    
                <li>
                  <a
                    href="#"
                    rel="noreferrer"
                    target="_blank"
                    class="text-white transition hover:opacity-75"
                  >
                    <span class="sr-only">Instagram</span>
    
                    <svg
                      class="size-6"
                      fill="currentColor"
                      viewBox="0 0 24 24"
                      aria-hidden="true"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M12.315 2c2.43 0 2.784.013 3.808.06 1.064.049 1.791.218 2.427.465a4.902 4.902 0 011.772 1.153 4.902 4.902 0 011.153 1.772c.247.636.416 1.363.465 2.427.048 1.067.06 1.407.06 4.123v.08c0 2.643-.012 2.987-.06 4.043-.049 1.064-.218 1.791-.465 2.427a4.902 4.902 0 01-1.153 1.772 4.902 4.902 0 01-1.772 1.153c-.636.247-1.363.416-2.427.465-1.067.048-1.407.06-4.123.06h-.08c-2.643 0-2.987-.012-4.043-.06-1.064-.049-1.791-.218-2.427-.465a4.902 4.902 0 01-1.772-1.153 4.902 4.902 0 01-1.153-1.772c-.247-.636-.416-1.363-.465-2.427-.047-1.024-.06-1.379-.06-3.808v-.63c0-2.43.013-2.784.06-3.808.049-1.064.218-1.791.465-2.427a4.902 4.902 0 011.153-1.772A4.902 4.902 0 015.45 2.525c.636-.247 1.363-.416 2.427-.465C8.901 2.013 9.256 2 11.685 2h.63zm-.081 1.802h-.468c-2.456 0-2.784.011-3.807.058-.975.045-1.504.207-1.857.344-.467.182-.8.398-1.15.748-.35.35-.566.683-.748 1.15-.137.353-.3.882-.344 1.857-.047 1.023-.058 1.351-.058 3.807v.468c0 2.456.011 2.784.058 3.807.045.975.207 1.504.344 1.857.182.466.399.8.748 1.15.35.35.683.566 1.15.748.353.137.882.3 1.857.344 1.054.048 1.37.058 4.041.058h.08c2.597 0 2.917-.01 3.96-.058.976-.045 1.505-.207 1.858-.344.466-.182.8-.398 1.15-.748.35-.35.566-.683.748-1.15.137-.353.3-.882.344-1.857.048-1.055.058-1.37.058-4.041v-.08c0-2.597-.01-2.917-.058-3.96-.045-.976-.207-1.505-.344-1.858a3.097 3.097 0 00-.748-1.15 3.098 3.098 0 00-1.15-.748c-.353-.137-.882-.3-1.857-.344-1.023-.047-1.351-.058-3.807-.058zM12 6.865a5.135 5.135 0 110 10.27 5.135 5.135 0 010-10.27zm0 1.802a3.333 3.333 0 100 6.666 3.333 3.333 0 000-6.666zm5.338-3.205a1.2 1.2 0 110 2.4 1.2 1.2 0 010-2.4z"
                        clip-rule="evenodd"
                      />
                    </svg>
                  </a>
                </li>
    
                <li>
                  <a
                    href="#"
                    rel="noreferrer"
                    target="_blank"
                    class="text-white transition hover:opacity-75"
                  >
                    <span class="sr-only">Twitter</span>
    
                    <svg
                      class="size-6"
                      fill="currentColor"
                      viewBox="0 0 24 24"
                      aria-hidden="true"
                    >
                      <path
                        d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84"
                      />
                    </svg>
                  </a>
                </li>
    
                <li>
                  <a
                    href="#"
                    rel="noreferrer"
                    target="_blank"
                    class="text-white transition hover:opacity-75"
                  >
                    <span class="sr-only">GitHub</span>
    
                    <svg
                      class="size-6"
                      fill="currentColor"
                      viewBox="0 0 24 24"
                      aria-hidden="true"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"
                        clip-rule="evenodd"
                      />
                    </svg>
                  </a>
                </li>
    
                <li>
                  <a
                    href="#"
                    rel="noreferrer"
                    target="_blank"
                    class="text-white transition hover:opacity-75"
                  >
                    <span class="sr-only">Dribble</span>
    
                    <svg
                      class="size-6"
                      fill="currentColor"
                      viewBox="0 0 24 24"
                      aria-hidden="true"
                    >
                      <path
                        fill-rule="evenodd"
                        d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10c5.51 0 10-4.48 10-10S17.51 2 12 2zm6.605 4.61a8.502 8.502 0 011.93 5.314c-.281-.054-3.101-.629-5.943-.271-.065-.141-.12-.293-.184-.445a25.416 25.416 0 00-.564-1.236c3.145-1.28 4.577-3.124 4.761-3.362zM12 3.475c2.17 0 4.154.813 5.662 2.148-.152.216-1.443 1.941-4.48 3.08-1.399-2.57-2.95-4.675-3.189-5A8.687 8.687 0 0112 3.475zm-3.633.803a53.896 53.896 0 013.167 4.935c-3.992 1.063-7.517 1.04-7.896 1.04a8.581 8.581 0 014.729-5.975zM3.453 12.01v-.26c.37.01 4.512.065 8.775-1.215.25.477.477.965.694 1.453-.109.033-.228.065-.336.098-4.404 1.42-6.747 5.303-6.942 5.629a8.522 8.522 0 01-2.19-5.705zM12 20.547a8.482 8.482 0 01-5.239-1.8c.152-.315 1.888-3.656 6.703-5.337.022-.01.033-.01.054-.022a35.318 35.318 0 011.823 6.475 8.4 8.4 0 01-3.341.684zm4.761-1.465c-.086-.52-.542-3.015-1.659-6.084 2.679-.423 5.022.271 5.314.369a8.468 8.468 0 01-3.655 5.715z"
                        clip-rule="evenodd"
                      />
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
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
        <script>
        
        

       
        
       var swiper = new Swiper(".mySwiper", {
     
      grabCursor: true,
      loop: true,
      pagination: {
        el: ".swiper-pagination",
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
       
       
       function submitReview(event) {
           event.preventDefault(); // Prevent default form submission

           const form = document.getElementById("reviewForm");
           const formData = new URLSearchParams(new FormData(form));

           fetch("/Login_Registration/submitReview", {
               method: "POST",
               headers: { "Content-Type": "application/x-www-form-urlencoded" },
               body: formData.toString()
           })
           .then(response => {
               // Check if the response is okay
               if (!response.ok) {
                   throw new Error("Network response was not ok: " + response.statusText);
               }
               return response.text(); // Get the response text
           })
           .then(message => {
               console.log("Server Response:", message); // Debugging log
               document.getElementById("message").innerHTML = `<p>${message}</p>`; // Display server message
               document.getElementById("reviewForm").reset(); // Optionally reset the form after submission
           })
           .catch(error => {
               console.error("Error:", error); // Detailed error log
               document.getElementById("message").innerHTML = "<p style='color:red;'>An error occurred while submitting the review. Please try again later.</p>";
           });
       }
        </script>
      </body>
    </html>