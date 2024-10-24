const pass = document.getElementById('pass');
const eyebtn = document.getElementById('eyebtn');
const toast = document.querySelector('.toast');


eyebtn.addEventListener('click', (e) => {
	console.log(e);
    // Check the current type and toggle between 'text' and 'password'
    const currentType = pass.getAttribute('type');
    if (currentType === 'text') {
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

document.getElementById('myForm').addEventListener('submit', (e) => {
    e.preventDefault();
    toast.style.display = 'block';
    setTimeout(() => {
        toast.style.display = 'none';
    }, 3000);
});
/**
 * 
 */