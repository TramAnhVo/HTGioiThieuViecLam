function Xoa(path) {
    if (confirm("Bạn chắc chắn xóa không?") === true) {
        fetch(path, {
            method: "delete"
        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Hệ thống có lỗi! Vui lòng quay lại sau!");
        });
    }
}

function load() {
    var selectElement = document.getElementById("userRole");

    if (selectElement.value === 'ROLE_EMPLOYER') {
        var content = document.querySelector(".abc");
        if (content.style.display === "block") {
            content.style.display = "none";
        } else {
            content.style.display = "block";
        }
    }
}

function showPassword() {
    var passwordField = document.getElementById("pwd");
    passwordField.type = "text";
}

function loadSpinner(flag) {
    let els = document.getElementsByClassName("spinner");
    for (let d of els) 
        d.style.display = flag;
}

function updateActive(path) {
    if (confirm("Bạn chắc chắn duyệt không?") === true) {
        var loadingOverlay = document.getElementById("loadingOverlay");
        loadingOverlay.style.display = "block";
        
        var buttonHide = document.getElementById("btn-hide");
        buttonHide.style.display = "none";
        
        fetch(path, {
            method: "put"
        })
            .then(res => {
               if (res.status === 204)
                    location.reload();
                else
                    alert("Hệ thống có lỗi! Vui lòng quay lại sau!");
            })
            .catch(error => {
                alert("Hệ thống có lỗi! Vui lòng quay lại sau!");
            })
            .finally(() => {
                loadingOverlay.style.display = "none";
            });
    }
}

