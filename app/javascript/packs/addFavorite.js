$(document).ready(function(){

});

$(document).on("click", ".addFavorite", function(){
    var currentPath = window.location.pathname;
    var bookId = currentPath.substring(currentPath.lastIndexOf('/') + 1);
    var isUpdate = $(".rateId").val() !== undefined;
    var method = 'POST';
    var route = '/favorites';
    $.ajax({
        url: route,
        type: method,
        dataType: 'json',
        data: {
          authenticity_token: $('[name="csrf-token"]')[0].content,
          "favorite[book_id]": bookId
        },
        success:function(data){
          alert("Added");
            // $('#ratingNoti').addClass("alert-success").removeClass("alert-danger");
            // $('#ratingNoti').html("Cam on ban da danh gia");
            // $('#ratingNoti').addClass("alert-danger").removeClass("alert-success");
            // $('#ratingNoti').html("Loi. Khong the danh gia");
        },
        error:function(data){
          // document.location.href="/";
        }
    });

  });

