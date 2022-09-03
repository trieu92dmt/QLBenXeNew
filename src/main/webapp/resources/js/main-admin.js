//let sidebar = document.querySelector(".sidebar");
//let sidebarBtn = document.querySelector(".fa-bars");
//console.log(sidebarBtn);
//sidebarBtn.addEventListener("click", ()=>{
//   sidebar.classList.toggle("close");
//});
$(".fa-bars").click(function () {
    $(".sidebar").toggleClass("close");
})

function updateStatusCompany(companyId, status) {
    if (confirm("Cập nhật trạng thái ?") == true) {
        fetch("/QLBenXe/api/admin/update-status", {
            method: 'post',
            body: JSON.stringify({
                "companyId": companyId,
                "status": status
            }),
            headers: {
                "Content-Type": "application/json"
            }
        }).then(function (res) {
            return res.json();
        }).then(function (code) {
            console.log(code);
            location.reload();
        })
    }
}