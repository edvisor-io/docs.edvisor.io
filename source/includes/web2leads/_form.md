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
