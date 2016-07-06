## Form googlePlaceId

### Ajax and Autocomplete for googlePlaceId fields

```
$("#your-field").autocomplete({
  source: function( request, response ) {
    $.ajax({
      url: 'https://app.edvisor.io/api/v1/google-place/search?public_key=APIKEY',
      type: 'GET',
      data: {
        query: request.term
      },
      success: function(data) {
        response(jQuery.map(data, function(item) {
          return {
            label: item.description,
            id: item.place_id
          };
        }));
      },
    });
  },
  select: function(event, ui) {
    var googleId = ui.item.id
    event.target.setAttribute('data-google', googleId)
  },
  change: function (event, ui) {
    if(ui.item == null || ui.item == undefined) {
      $(this).val("")
    }
  }
});

// prevent hitting the enter button on the google field and accidently submitting the form.
$("#your-field").keypress(function(event) {
  if (event.keyCode == 13) {
    event.preventDefault();
  }
});
```

If you want to have **city** or **destinations** on your form, you will need to do the following.

You will need to load in jQuery Ui if you don't have an autocomplete library in your code.

`
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
`

The code to the right will check to see if what the user types into the selected field matches anything in our database, and if it does, it will show everything that matches in a dropdown. The user can then select an option from the dropdown. 

Once the selection is over, it will store the Google Place Id into an attribute on the field called 'data-google'. You can then select this by 

`$(your-field).attr('data-google')`

Below the ajax get, is a function to disable the enter key when inside the field. We found users were accidently submitting the form when using the auto complete.

Replace **your-field** with the id of your field.
Replace **APIKEY** with your Api key.