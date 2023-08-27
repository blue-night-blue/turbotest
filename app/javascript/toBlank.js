const inputArea = document.querySelector(".container_new [type='text']");

// 以下は実験用。ちなみにsubmitイベントで消すと、空白でsubmitされるのでバリデーションエラーに。
const submitButton = document.querySelector(".container_new [type='submit']");
const pageTitle = document.querySelector('h1');
const formArea = document.querySelector('.container_new form');

inputArea.addEventListener('focus',()=>{
    inputArea.value = '';
});
