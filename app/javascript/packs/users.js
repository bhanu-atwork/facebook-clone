var like_post_comment;
$(document).ready(function () {
  $("#1").hide();

  $("#xta").click(function () {
    $("#1").toggle();
  });

  window.like_post_comment = function (event, element) {
    event.preventDefault();
    event.stopPropagation();
    var id = $(element).attr("id_value");
    var type = $(element).attr("like_type");
    var action = $(element).attr("action");
    if (action == "like") {
      $.ajax({
        url: "http://localhost:3000/likes/",
        type: "POST",
        data: { type: type, id: id },
        success: function (result) {
          console.log(result);

          if (type == "Post") {
            $("#post_like_icon").text(result["current_likes_count"]);
            $("#post_like").attr("action", "unlike");
          } else {
            id_val = "[id_value=" + id + "]";
            $("i")
              .filter("[id='comment_like']")
              .filter(id_val)
              .attr("action", "unlike");
            $("span")
              .filter("[id='comment_like_icon']")
              .filter(id_val)
              .text(result["current_likes_count"]);
          }
        },
        error: function (error) {
          console.log(error);
        },
      });
    } else if (action == "unlike") {
      $.ajax({
        url: "http://localhost:3000/likes/" + id,
        type: "DELETE",
        data: { type: type, id: id },
        success: function (result) {
          console.log(result);
          if (type == "Post") {
            $("#post_like_icon").text(result["current_likes_count"]);
            $("#post_like").attr("action", "like");
          } else {
            id_val = "[id_value=" + id + "]";
            $("i")
              .filter("[id='comment_like']")
              .filter(id_val)
              .attr("action", "like");
            $("span")
              .filter("[id='comment_like_icon']")
              .filter(id_val)
              .text(result["current_likes_count"]);
          }
        },
        error: function (error) {
          console.log(error);
        },
      });
    }
  };
});
