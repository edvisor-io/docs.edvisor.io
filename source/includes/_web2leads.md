# Web 2 Leads

## Getting started

Setting up a web2lead form on your website requires two steps.
First, you must have a form displaying what information you want to collect.
Second, you have to send that information to the Edvisor API. We will do that with Javascript.

### Form setup

Here is a basic form with a few fields and a submit button.
The first name and email fields are required.

```
<form id='edvisor-form'>

  <div>
    <label>First Name <strong><abbr title='required'>*</abbr></strong></label>
    <input type='text' name='firstname' placeholder='Enter First Name' required />
  </div>

  <div>
    <label>Last Name</label>
    <input type='text' name='lastname' placeholder='Enter Last Name' />
  </div>

  <div>
    <label>Email <strong><abbr title='required'>*</abbr></strong></label>
    <input type='email' name='email' placeholder='Enter Email' required/>
  </div>

  <div>
    <label>Message</label>
    <textarea name='notes' placeholder='Let us know what you think'></textarea>
  </div>

  <button type='submit'>Submit</button>
</form>
```

### Sending the data

First we are going to load in jQuery to help us send the data. If you don't already have jQuery, add this into your <head></head> or right before your form.
```
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
```

When the user hits submit, we need to control where the data is going.

```
<script>
  var edvisorFormSending = false;
  $('#edvisor-form').submit(function(event){
    $('#edvisor-form-message').remove();
    var formData = {
      'firstname' : $('#edvisor-form-firstname').val(),
      'lastname' : $('#edvisor-form-lastname').val(),
      'email' : $('#edvisor-form-email').val(),
      'notes' : $('#edvisor-form-notes').val(),
    }
    if(!edvisorFormSending) {
      edvisorFormSending = true;
      $.ajax({
        url: 'https://app.edvisor.io/api/v1/student?public_key=YOUR-KEY-HERE',
        data: formData,
        type:'PUT',
        contentType: 'application/json; charset=utf-8',
        processData: false
      })
        .done(function() {
          $('#edvisor-form').append('<p id="edvisor-form-message">Form was submitted!</p>');
          edvisorFormSending = false;
        })
        .fail(function(data) {
          $('#edvisor-form').append('<p id="edvisor-form-message">Something went wrong!</p>');
          console.log(data);
          edvisorFormSending = false;
        });
    };
    event.preventDefault();
  })
</script>
```
