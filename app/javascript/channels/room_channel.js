$(document).on("turbolinks:load", function () {
    submit_messages();
  });
  submit_messages = function () {
    $(".new_room_message").on("keydown", function (event) {
      console.log(event.keyCode);
      if (event.keyCode == 13) {
        $("input").click();
        event.target.value = "";
        event.preventDefault();
      }
    });
    
    $('[data-channel-subscribe="room"]').each(function (index, element) {
      var $element = $(element),
        room_id = $element.data("room-id");
        messageTemplate = $('[data-role="message-template"]');
        console.log(messageTemplate);
      $element.animate({ scrollTop: $element.prop("scrollHeight") }, 1000);
      
      ActionCable.createConsumer().subscriptions.create(
        {
          channel: "RoomChannel",
          room: room_id,
        },
        {
          received: function (data) {
            var content = messageTemplate.children().clone(true, true);
            content
              .find('[data-role="user-avatar"]')
              .attr("src", data.user_avatar_url);
            content.find('[data-role="message-text"]').text(data.message);
            content.find('[data-role="message-date"]').text(data.updated_at);
            $element.append(content);
            $element.animate(
              { scrollTop: $element.prop("scrollHeight") },
              1000
            );
          },
        }
      );
    });
  };