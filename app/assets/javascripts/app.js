function App() {}

App.prototype = {
  run: function run() {


    // ###### Using AJAX to show comments on Article page
    var url = $("#new_comment").attr("action");

    $.ajax({
      type: "GET",
      url: url,
      success: function (data) {
        data.forEach(function(object){
          console.log(object)
          this.id = object.id;
          this.content = object.content;
          this.date = object.created_at;
          this.article_id = object.article_id
          // console.log(this.article_id)

          $("h3").after(
            "<ul id='" + this.id + "' class='comment' >" +
              "<li>" +
                "<p>" + this.content + "</p>" +
                "<p>" + this.date + "</p>" +
                "<p>" +
                "<button type='button'> <a id='" + this.id +
                "'class = 'delete' href='/articles/" + this.article_id + "/comments/" + this.id + "'>delete<a/></button></p>" +
              "</li>" +
            "</ul>"
          );
        })
      },
      error: function(error) {
        console.log("error: ", error);
      }
    });


    // ######## Add a comment button, on Article page - hide / show
    $(".new_comment").hide();

    $("#container").on("click", ".add_comment", function(){
      var $form = $(this).next()
      var klass = $form.attr("class")
      $comment_class = $("." + klass)
      $comment_class.toggle();
    })


    $("#container").on("click", ".delete", function(event) {
      event.preventDefault();
      var $link = $(this);
      var url = $link.attr("href");
      console.log(url);

      $.ajax ({
        type: "DELETE",
        url: url,
        success: function(data) {
          console.log(data);
        },
        error: function (error) {
          console.log("error: ", error);
        }

      });
    });




  }
}



























