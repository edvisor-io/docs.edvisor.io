## Code Snippit

```
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<style>
#edvisor-form {
  width: 300px;
  font-family: sans-serif;
  font-weight: 100;
  padding: 20px;
}
#edvisor-form div {
  margin-bottom: 15px;
}
#edvisor-form label {
  display: block;
  margin-bottom: 5px;
}
#edvisor-form input,
#edvisor-form textarea {
  width: 100%;
  padding-left: 5px;
  border-radius: 2px;
  border: 1px solid #dfe3e5;
  outline: 0;
}
#edvisor-form input {
  height: 35px;
}
#edvisor-form textarea {
  height: 100px;
}
#edvisor-form ::-webkit-input-placeholder {
  font-family: sans-serif;
  font-weight: 100;
}
#edvisor-form button {
  padding: 10px 20px;
  border-radius: 2px;
  border: 1px solid #dfe3e5;
  background-color: #fff;
  display: block;
  margin-left: auto;
}
</style>

<form id='edvisor-form'>

  <div>
    <label>First Name *</label>
    <input id='edvisor-firstname' type='text' name='firstname' placeholder='Enter First Name' required />
  </div>

  <div>
    <label>Last Name</label>
    <input id='edvisor-lastname' type='text' name='lastname' placeholder='Enter Last Name' />
  </div>

  <div>
    <label>Email *</label>
    <input id='edvisor-email' type='email' name='email' placeholder='Enter Email' required/>
  </div>

  <div>
    <label>Message</label>
    <textarea id='edvisor-notes' name='notes' placeholder='Let us know what you think'></textarea>
  </div>

  <button type='submit'>Submit</button>
</form>

<script>
  var edvisorFormSending = false;

  $('#edvisor-form').submit(function(event){

    $('#edvisor-message').remove();

    var formData = {
      'agencyId' : '123'
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
          console.log(d
          edvisorFormSending = false;
        });

    };

    event.preventDefault();

  });
</script>
```

Here is the final code for the form above. After you add in your agencyId and API key as discussed in [Sending the data](#sending-the-data). You should be able to copy and paste this into your website.