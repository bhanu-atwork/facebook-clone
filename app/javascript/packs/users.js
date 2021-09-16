var like_post_comment;
var show_hide_comment;

$(document).ready(function () {
  $("#comment-block").hide();

  window.show_hide_comment = function (element) {
    id = $(element).attr("id_value");
    id_val = "[id_value=" + id + "]";
    $("div").filter("[id='comment-block']").filter(id_val).toggle();
  };

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
          id_val = "[id_value=" + id + "]";
          if (type == "Post") {
            $("i")
              .filter("[id='post_like']")
              .filter(id_val)
              .attr("action", "unlike");
            $("span")
              .filter("[id='post_like_icon']")
              .filter(id_val)
              .text(result["current_likes_count"]);
          } else {
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
          id_val = "[id_value=" + id + "]";
          if (type == "Post") {
            $("i")
              .filter("[id='post_like']")
              .filter(id_val)
              .attr("action", "like");
            $("span")
              .filter("[id='post_like_icon']")
              .filter(id_val)
              .text(result["current_likes_count"]);
          } else {
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
