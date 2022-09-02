$("i.notification").click(function () {
    $(".notification-list").toggleClass("notification-list--active");
    $(this).toggleClass("notification--active");
})
$(".btn-register-company").click(function () {
    $("#package-id").val($(this).next(".package-id").val());
    $("#package-name").text($(this).nextAll(".package-name").val());
    $("#package-expire").text($(this).nextAll(".package-expire").val() + " ngày");
    $("#package-price").text(new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format($(this).nextAll(".package-price").val()));
    $(".company-register").fadeIn();
    $('html, body').animate({
        scrollTop: $(".company-register").offset().top
    });
})
window.addEventListener('click', function (e) {
    if (!document.getElementById('notification-list').contains(e.target)
            && !document.getElementById('notification').contains(e.target)) {
        $("#notification-list").removeClass("notification-list--active");
        $("#notification").removeClass("notification--active");
    }
});



$(".btn-seat").click(function () {
    $(this).toggleClass("btn-primary")
    $(this).toggleClass("btn-success")
})

function addToCompanyCart(tripId, seatNumber, price, companyName, destination, departureDate, departureTime) {
    fetch("/QLBenXe/cart-api/company-cart", {
        method: 'post',
        body: JSON.stringify({
            "tripId": tripId,
            "seatNumber": seatNumber,
            "price": price,
            "companyName": companyName,
            "destination": destination,
            "departureDate": departureDate,
            "departureTime": departureTime
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json()
    }).then(function (data) {
        console.log(data)
        $("#cart-btn").text(data);
    })
}

$(".ticket-book-btn").click(function () {
    $($(this).children(".trip-id").val()).fadeToggle('fast');
})


function updateTicket() {
    if (confirm("Cập nhật vé ?") == true) {
        fetch("/QLBenXe/cart-api/update-ticket", {
            method: 'post'
        }).then(function (res) {
            return res.json();
        }).then(function (code) {
            console.log(code);
            location.reload();
        })
    }
}

function getTicketBooked(tripId) {
    var url = new URL('http://localhost:8080/QLBenXe/ticket-api/tickets');
    var params = {
        tripId: tripId
    }
    url.search = new URLSearchParams(params).toString();
    fetch(url).then(function (res) {
        return res.json();
    }).then(function (data) {
        console.log(data);
        var selector = ".btn-seat-"+ tripId;
        var btnSeat = document.querySelectorAll(selector);
        for (var i = 0; i < btnSeat.length; i++) {
            for (var j = 0; j < data.length; j++) {
//                var checkId = data[j].seatNumber + "-" + data[j].tripId.tripId;
                if (btnSeat[i].value === data[j].seatNumber) {
//                     && btnSeat[i].id === checkId
                    btnSeat[i].classList.add("btn-danger");
                    btnSeat[i].disabled = true;
//                    alert(checkId);
                }
            }
        }
    })
}

function deleteRouteById(routeId) {
    if (confirm("Xóa tuyến xe ?") == true) {
        fetch(`/QLBenXe/route-api/delete-route-by-id/${routeId}`, {
            method: "delete"
        }).then(function (res) {
            return res.json();
        }).then(function (code) {
            console.log(code);
            location.reload();
        })
    }
}

function addComment(companyId) {
    fetch(`/QLBenXe/cmt-api/add-comment`, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("cmt").value,
            "companyId": companyId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        console.log(data);

        let area = document.getElementById("list-comment");
        area.innerHTML = `<div class="comment d-flex my-3">
                    <div class="avatar-cmt">
                        <img src="${data.avt}" alt="avt-cmt"/>
                    </div>
                    <div class="main-cmt w-100 ps-3">
                        <div class="cmt-info d-flex align-items-center justify-content-lg-between">
                            <label class="username fw-bold fs-5 d-block">${data.username}</label>
                            <span class="cmt-time d-block">7 giờ trước</span>
                        </div>
                        <div class="cmt-content">
                            <span>${data.comment.content}</span>
                        </div>
                    </div>
                </div>` + area.innerHTML;
    })
}

$("#upload-img").on("change", function ()
{
    var files = !!this.files ? this.files : [];
    if (!files.length || !window.FileReader)
        return; // no file selected, or no FileReader support

    if (/^image/.test(files[0].type)) { // only image file
        var reader = new FileReader(); // instance of the FileReader
        reader.readAsDataURL(files[0]); // read the local file

        reader.onloadend = function () { // set image data as background of div
            $("#image-preview").css("background-image", "url(" + this.result + ")");
        }
    }
});