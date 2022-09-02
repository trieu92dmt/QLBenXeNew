//let sidebar = document.querySelector(".sidebar");
//let sidebarBtn = document.querySelector(".fa-bars");
//console.log(sidebarBtn);
//sidebarBtn.addEventListener("click", ()=>{
//   sidebar.classList.toggle("close");
//});
$(".fa-bars").click(function(){
    $(".sidebar").toggleClass("close");
})