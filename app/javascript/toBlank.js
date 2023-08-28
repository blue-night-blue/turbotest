const formArea = document.querySelector('.container_new form');
const inputArea = document.querySelector(".container_new [type='text']");

formArea.addEventListener('submit',()=>{
    setTimeout( ()=> {
        location.reload();
    }, 1000);
});

window.onload = ()=> {
    inputArea.focus();
};
