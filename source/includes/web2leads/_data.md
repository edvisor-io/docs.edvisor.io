## Sending the data

> Basic Javascript Setup

```
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
  var edvisorFormSending = false;

  $('#edvisor-form').submit(function(event){

    $('#edvisor-message').remove();

    var formData = {
      'agencyId' : '123',
      'firstname' : $('#edvisor-firstname').val(),
      'lastname' : $('#edvisor-lastname').val(),
      'email' : $('#edvisor-email').val(),
      'notes' : $('#edvisor-notes').val(),
    }

    if(!edvisorFormSending) {

      edvisorFormSending = true;

      $.ajax({
        url: 'https://app.edvisor.io/api/v1/student?public_key=YOUR-KEY-HERE',
        data: JSON.stringify(formData),
        type:'PUT',
        contentType: 'application/json; charset=utf-8',
        processData: false
      })
        .done(function() {
          $('#edvisor-form').append('<p id="edvisor-message">Form was submitted!</p>');
          edvisorFormSending = false;
        })
        .fail(function(data) {
          $('#edvisor-form').append('<p id="edvisor-message">Something went wrong!</p>');
          console.log(data)
          edvisorFormSending = false;
        });

    };

    event.preventDefault();

  });
</script>
```

This Javascript requires **two** things to work.

It needs to know your:

1. agencyId (the number assigned to your office by Edvisor)
2. API key

If you need help finding your agencyId, please go to [How to get your agencyId](#how-to-get-your-agencyid).

You can get your API Key by contacting us at support@edvisor.io

-

After gathering the required information. Please do the following:

* Find '*agencyId*' and replace '*123*' with your agencyId.
* Find '*YOUR-KEY-HERE*' and replace it with the API key you were given.


If you need help with Javascript, here is some documentation:

* [Guide to Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide)