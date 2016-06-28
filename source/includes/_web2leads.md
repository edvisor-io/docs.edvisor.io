# Web 2 Leads

## Getting started

*If you have a wordpress site you can use our plugin to create your form. Please search for 'edvisor' in the wordpress plugins.*

Setting up a web2lead form on your website requires two steps.
First, you must have a form displaying what information you want to collect.
Second, you have to send that information to the Edvisor API. We will do that with Javascript.

## Form setup
![img](form.png)

> Basic Form Setup

```
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
```

Here is a basic form. We gave this form an id(identification) of 'edvisor-form'.

Inside this form we have several fields (First Name, Last Name, Email, Message), and also a submit button.

Each field is structured in the same way. There is a **label** and an **input** or **textarea** with a **div** around it.

![img](field.png)

The **label** is the text that shows above an input.

`<label> Text Here </label>`

The **input** is where the user can type information. The input below is saying that this is a *text* field and its name is *firstname*

`<input type='text' name='firstname' />`

The **placeholder** is the text inside of the **input**, and it disappears when the user starts typing.

`<input type='text' name='firstname' placeholder='This text shows inside the field' />`

Adding **required** into the field makes it required. They can't submit the form without filling in the field. An error message will pop up if they try.

`<input type='text' name='firstname' required />`

![img](required.png)


If you need help understanding HTML, here is some documentation:

* [Introduction to HTML](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Introduction)
* [How to make a form](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms)

## Sending the data

> Basic Javascript Setup

```
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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



## How to get your agencyId

1. Log into Edvisor
2. Go to your settings
3. If you have multiple offices, select the office you want.
4. Look for the **ID** field, that is your agencyId.

![agency](agencyId.png)


## Style your form

```
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
```

The code to the right is the styles of the form above.

Place this into your css file or place it in `<style>Code Here</style>` and place it above the form.

If you need help styling a form, here is some documentation:

* [How to style a form](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/Forms/Styling_HTML_forms)
* [Getting started with css](https://developer.mozilla.org/en-US/docs/Web/Guide/CSS/Getting_started)



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