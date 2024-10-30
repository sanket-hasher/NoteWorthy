function handleCredentialResponse(response) {
    const userObject = jwt_decode(response.credential);
    const email = userObject.email;
    const name = userObject.name;

    // Redirect to main.jsp with user info
    window.location.href = `main.jsp?name=${encodeURIComponent(name)}&email=${encodeURIComponent(email)}`;
}

window.onload = function () {
    google.accounts.id.initialize({
        client_id: '454600243556-d5d9aeqpmmr1scbhqmsildr49tbgcnu5.apps.googleusercontent.com',
        callback: handleCredentialResponse
    });

    google.accounts.id.renderButton(
        document.getElementById('googleSignInButton'),
        { theme: 'outline', size: 'large' }
    );
};

const pass = document.getElementById('pass');
const eyebtn = document.getElementById('eyebtn');
const toast = document.querySelector('.toast');


eyebtn.addEventListener('click', (e) => {
	//console.log(" hello ")
	console.log(e);
	
    // Check the current type and toggle between 'text' and 'password'
    const currentType = pass.getAttribute('type');
    if (currentType == 'text') {
        pass.setAttribute('type', 'password');
    } else {
        pass.setAttribute('type', 'text');
    }
});

if (toast) {
    toast.style.display = 'flex';
    setTimeout(() => {
        toast.style.display = 'none';
    }, 3000); // Hide after 3 seconds
}

document.getElementById('myForm').addEventListener('submit', () => {
   
    toast.style.display = 'block';
    setTimeout(() => {
        toast.style.display = 'none';
    }, 3000);
});
/**
 * 
 */