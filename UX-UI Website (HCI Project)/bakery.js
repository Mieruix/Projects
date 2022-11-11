window.onscroll = function () { myFunction() };
function myFunction() {

    if (document.documentElement.scrollTop > 1000) {
        document.getElementById("g1").className = "slideUp";
        document.getElementById("g2").className = "slideUp";
        document.getElementById("g3").className = "slideUp";
        document.getElementById("g4").className = "slideUp";
    }

    if (document.documentElement.scrollTop > 1100) {
        document.getElementById("g5").className = "slideUp";
        document.getElementById("g6").className = "slideUp";
        document.getElementById("g7").className = "slideUp";
        document.getElementById("g8").className = "slideUp";
    }

    if (document.documentElement.scrollTop > 200) {
        document.getElementById("intro1").className = "slideUp";
        document.getElementById("intro2").className = "slideUp";
    }
}

function acct() {
    alert("Not Available");
}

function stat() {
    alert("Our chefs is busy at the moment");
}

function logout() {
    alert("Pleae take a look at our website more");
}

function changePic1() {
    document.getElementById("timg1").src = "images/t2.jpg";
}

function changepic1b() {
    document.getElementById("timg1").src = "images/t1.jpg";
}

const exampleModal = document.getElementById('exampleModal')
exampleModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('data-bs-whatever')
    // If necessary, you could initiate an AJAX request here
    // and then do the updating in a callback.
    //
    // Update the modal's content.
    const modalTitle = exampleModal.querySelector('.modal-title')
    const modalBodyInput = exampleModal.querySelector('.modal-body input')

    modalTitle.textContent = `New message to ${recipient}`
    modalBodyInput.value = recipient
})

function specialc() {
    alert("Please wait a moment, our chef is reviewing your request.");
}

function socials() {
    alert("Placeholder / Under Construction");
}

function subs() {
    alert("Stay Tuned for upcoming Masterclass and Discounts!");
}

