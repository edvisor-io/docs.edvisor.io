# B2C Widget Documentation

* [Edvisor CDN](#edvisor-cdn)
* [Edvisor Search Modal](#edvisor-search-modal)
  * [Configuration](#configurations)
  * [Usage](#usages)
* [Edvisor Search App](edvisor-search-app)
  * [Configuration](#configurations-1)
  * [Usage](#usage)
* [Edvisor Search Page](#edvisor-search-page)
* [Analytics](#analytics)
* [Google Place Ids](#google-place-ids)
* [Notes](#notes)

### Edvisor CDN

* **Production**

The production edvisor app is hosted at `https://cdn.edvisor.io/b2c/edvisor-search.js`,
**Beware**, this will be pointing at your production Edvisor Account creating real students, Quotes, and Applications in the system possibly contacting other schools or sending emails to students.


* **Staging**

For setup and testing we recommend using our staging version of the application hosted at `https://cdn.edvisor.io/b2c/sandbox/edvisor-search.js`. This will point at a replicated version of our system. (The data found on the staging may be outdated.)
You will still be able to log into your Edvisor Account through `https://sandbox.edvisor.io` with your normal Edvisor credientials.
The stability & speed of the staging system can be less reliable as we are occasionally deploying new features to test to this server.


## [Edvisor Search Modal](https://i.imgur.com/Yo5gX36.png)

### Configurations


In the table below, use the column Data Type to determine where a value should come from. For example,
`startQuoteSelector` is an _HTML selector_. You can read more about HTML Selectors online! On the other
hand, a list of Edvisor Ids must come from Edvisor.

| **Key**                      | **Example Value**                                        | **Data Type**        | **Description**                                                                                                                                                                                                                                                                                                                                              | **Required V Optional** |
|:-----------------------------|:---------------------------------------------------------|:---------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:----------------------------------------|
| startQuoteSelector           | `#btWidget`                                              | HTML selector        | Within the rendered HTML page there must be an empty div with this value as it's id. This allows us somewhere to render the modal.                                                                                                                                                                                                                           | Required                |
| apiKey                       | `public_1234`                                            | Edvisor API Key      | This is your api key provided by Edvisor. This allows us to query courses from connected schools, possible location destinations...                                                                                                                                                                                                                          | Required                |
| studentNationality           | `jp` (Japan)                                             | ISO Country Code     | Within the Edvisor system the Student's nationality is an important value. This will determind certain prices, unlock possible promotions, etc... This value is not used for localization. For more information on ISO country codes, look [here](https://en.wikipedia.org/wiki/ISO_3166-1)                                                                  | Optional*               |
| studentLanguage              | `ja` (Japanese)                                          | ISO Language Code    | At Edvisor we expect people of many different languages to use our system. This value will set the language to be displayed in the system. For more information on ISO language codes, look [here](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes). Currently Edvisor only supports a sub-set of these codes, [see below](#supported-language-codes). | Required                |
| agencyId                     | `1234`                                                   | Edvisor Id           | On the Edvisor System a company can have many agency offices. This value allows us to know where to add the created student within the Edvisor System.                                                                                                                                                                                                       | Required                |
| defaultCourseCategoryIds     | `[3, 4]` (General English, Business English)             | List<Edvisor Id>     | These values will pre-populate the dropdown for course types                                                                                                                                                                                                                                                                                                 | Optional                |
| defaultGooglePlaceIds        | `['ChIJs0-pQ_FzhlQRi_OBm-qWkbs']` (Vancouver, BC Canada) | List<GooglePlace Id> | These values will pre-populate the dropdown for possible study locations. To find Google Place Ids in the Edvisor system look [here](#google-place-ids)                                                                                                                                                                                                      | Optional                |
| defaultSchoolIds             | `[1, 2, 3]`                                              | List<Edvisor Id>     | Passing this parameter will limit the search to these schools, identified by their school ID. The location dropdown will be disabled and the schools will be a static search parameter in the modal.                                                                                                                                                         | Optional                |
| redirectUrl                  | `app.html`                                               | url                  | This is the page for viewing results and holding the next part of the Edvisor Application.                                                                                                                                                                                                                                                                   | Required                |
| gaTrackingId                 | `UA-111111111-1`                                         | GoogleAnalytics Id   | Used for Analytics through Google Analytics, more information can be found [here](#analytics)                                                                                                                                                                                                                                                                | Optional                |
| searchBySchool               | `true`                                                   | Boolean              | If set to true, users will be able to search for courses by school campus, rather than by location. By default, users can search for courses by location.                                                                                                                                                                                                    | Optional                |
| requireStudentCurrentCountry | `false`                                                  | Boolean              | If set to true, users will be required to choose a country where they currently reside. This value will be used as an additional search parameter when determining available courses and prices. By default, a user's current country is not required.                                                                                                       | Optional                |


\* If no studentNationality is provided a required field will show on the initial student quote modal. An example can be found [here](https://i.imgur.com/RZ0o3uj.png)

Note that it is an error to use an apiKey that starts with `private_`. You must only use an apiKey that starts with `public_`. If you have any questions about this behaviour, please contact Edvisor support.

### Usages

  * You can initialize the modal in Javascript and call the render function within the button onclick. This allows the ability to create many Edvisor widget instances on the same page with each being able to be rendered individually.

  ```HTML
    <!-- Load the Edvisor Widget from the CDN -->
    <script type="text/javascript" src="****/edvisor-search.js"></script>

    <script>
      var widget = Edvisor.widgets.StartQuoteModal.newInstance({
        startQuoteSelector: '#btWidget',
        apiKey: 'public_1234',
        studentNationality: 'ca',
        agencyId: 1234,
        studentLanguage: 'en',
        defaultCourseCategoryIds: [3],
        searchBySchool: false,
        redirectUrl: 'app.html',
        gaTrackingId: 'UA-107862751-1'
      })
    </script>

    <body>
      <!-- Button triggering the Edvisor Widget -->
      <input type="button" value="Find a Course!" onClick="widget.render()" />

      <!-- Placeholder for edvisor widget -->
      <div id="btWidget"></div>
    </body>
  ```

  ----

  * Or you can create an anonymous instance of widget and pass all the configurations into the render function

  ```HTML
    <!-- Load the Edvisor Widget from the CDN -->
    <script type="text/javascript" src="****/edvisor-search.js"></script>

    <body>
      <!-- Button triggering the Edvisor Widget -->
      <input type="button" value="Find a Course!" onClick="Edvisor.widgets.StartQuoteModal.newInstance().render({
        startQuoteSelector: '#btWidget',
        apiKey: 'public_1234',
        studentNationality: 'ca',
        agencyId: 1234,
        defaultStudentLanguage: 'en',
        defaultCourseCategoryIds: [3],
        redirectUrl: 'app.html',
        gaTrackingId: 'UA-107862751-1'
      })" />

      <!-- Placeholder for edvisor widget -->
      <div id="btWidget"></div>
    </body>
  ```

-----

## Edvisor Search App

### Configurations


| **Key**                      | **Example Value**                                        | **Data Type**         | **Description**                                                                                                                                                                                                                                        | **Required V Optional** |
|:-----------------------------|:---------------------------------------------------------|:----------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|:------------------------|
| agencyId                     | `1234`                                                   | Edvisor Id            | On the Edvisor System a company can have many agency offices. This value allows us to know where to add the created student within the Edvisor System.                                                                                                 | Required                |
| termsUrl                     | `'http://www.example.com'`                               | url                   | The URL of the terms and agreements for a student signing up with your agency / school                                                                                                                                                                 | Required                |
| apiKey                       | `public_1234`                                            | Edvisor API Key       | This is your api key provided by Edvisor. This allows us to query courses from connected schools, possible location destinations...                                                                                                                    | Required                |
| studentNationality           | `'ca'`                                                   | ISO Country Code      | Within the Edvisor system the Student's nationality is an important value. This will determind certain prices, unlock possible promotions, ...                                                                                                         | Required                |
| studentLanguage              | `en` (English)                                           | ISO Language Code     | At Edvisor we expect people of many different languages to use our system. These values will set the language to be displayed in the system.                                                                                                           | Required                |
| defaultCourseCategoryIds     | `[3, 4]`                                                 | List<Edvisor Ids>     | These values will pre-populate the dropdown for course types                                                                                                                                                                                           | Optional                |
| defaultGooglePlaceIds        | `['ChIJs0-pQ_FzhlQRi_OBm-qWkbs']` (Vancouver, BC Canada) | List<GooglePlace Ids> | These values will pre-populate the dropdown for possible study locations. To find Google Place Ids in the Edvisor system look [here](#google-place-ids)                                                                                                | Optional                |
| gaTrackingId                 | `UA-111111111-1`                                         | Google Analytics Id   | Used for Analytics through Google Analytics, more information can be found [here](#analytics)                                                                                                                                                          | Optional                |
| selector                     | `#Widget`                                                | HTML Selector         | A placeholder used for the modal when a user selects to create another quote                                                                                                                                                                           | Required                |
| searchBySchool               | `true`                                                   | Boolean               | If set to true, users will be able to search for courses by school campus, rather than by location. By default, users can search for courses by location.                                                                                              | Optional                |
| requireStudentCurrentCountry | `false`                                                  | Boolean               | If set to true, users will be required to choose a country where they currently reside. This value will be used as an additional search parameter when determining available courses and prices. By default, a user's current country is not required. | Optional                |
requirePhoneNumber | `true`                                                  | Boolean               | If set to false, the phone input will not be displayed when capturing the student information before the quote is submitted. If a custom property `contact-by-phone` is set up for the Agency, then a new checkbox will apear, asking the student if they would like to be contacted by phone. If that box is checked then the phone input will be displayed. For more details see documentation below on this feature. The default is to always require the phone number. | Optional                ||

### Usage

* This should be added to the `redirectUrl` page defined in the modal configurations. The page should be primarily empty as the search and results will take up most of the page.

~ Note the HTML definition of the selector must be defined before the script tag, otherwise the selector will not be found. Resulting in the console error, `Error: Target container is not a DOM element.`

```HTML
  <!-- Load the Edvisor Widget from the CDN -->
  <script type="text/javascript" src="****/edvisor-search.js">

  <body>
    <!-- Placeholder for edvisor search app -->
    <div id="btWidget"></div>
    <div id="Widget"></div>
  </body>

  <script type="text/javascript">
    (function () {
      Edvisor.widgets.CourseSearchApp.newInstance().render({
        selector: '#Widget',
        agencyId: 1234,
        startQuoteSelector: '#btWidget',
        termsUrl: 'http://www.example.com',
        apiKey: 'public_1234',
        studentNationality: 'ca',
        searchBySchool: false,
        requireStudentCurrentCountry: true,
        gaTrackingId: 'UA-107862751-1'
      })
    })()
  </script>

```

### Optional phone number usage

The search app can be configured to make the phone number input optional when capturing the student information. If the flag `requirePhoneNumber` is set to false we can also capture information on whether the student would like to be contacted by phone. In order to do so, the agency must configure a custom property to capture the student's preference. In the Edvisor app, under the settings for offices, a new custom property must be added with the following key: `contact-by-phone`. The field must be a dropdown with possible values of `Yes` and `No` (ensure case matches). With this setup, when the student gets to the final step of submitting the quote, there will be an additional checkbox prompting them on their preference on whether they would like to be contacted by phone. If they tick the box then the input for the phone number will appear.

---

## Styling

Style rules used in the edvisor B2C Widget are always of the form:

```css
.edvisor_app-container .edvisor_app-inner {
  /* ... styles */
}
```

This guarantees that B2C's internal styles will only affect elements on the page that are contained within the `.edvisor_app-container` element. All class names used within B2C are prefixed with `edvisor_`, which makes it unlikely
that an external style from the host site will accidentally change the appearance of the B2C widget.

### Modal Overlay

The CSS rule `z-index` maintains the order in which elements are displayed from front to back. Unfortunately there is
no way of guaranteeing that an element will be "the topmost" on a page. We have defined the semi-opaque grey modal overlay
used throughout the B2C app as having a `z-index` of 9999, since a value over 9000 will win in most cases. However, if the
host website uses z-index greater than 9999 the modal overlay will appear below those elements. To fix this issue, override
the value by defining a custom css rule on the host site:

```css
.edvisor_app-container .edvisor_modal-overlay {
  z-index: 99999; /* <-- or any desired integer value */
}
```

For more information see: [MDN z-index](https://developer.mozilla.org/en-US/docs/Web/CSS/z-index)

## Edvisor Search Page

The search page with results can be directly accessed with some hard coded search parameters without the user having to use the Modal.

| **URL parameter**  | **Sub Properties**         | **Example**                                                                                          | **Description**                                                                              |
|:-------------------|:---------------------------|:-----------------------------------------------------------------------------------------------------|:---------------------------------------------------------------------------------------------|
| `startingAfter`    |                            | `startingAfter: 2017-10-09`                                                                          |                                                                                              |
| `locations`        | `googlePlaceIds`, `name`   | ```locations: [{googlePlaceIds: [ChIJ--acWvtHDW0RF5miQ2HvAAU], name: Auckland,%20New%20Zealand }]``` |                                                                                              |
| `courseCategories` | `id`, `name`               | ```courseCategories:[{id: 9, name:  Work%20and%20Study}]```                                          |                                                                                              |
| `age`              |                            | `age: 18`                                                                                            |                                                                                              |
| `duration`         | `durationTypeId`, `length` | ```duration: {durationTypeId: 3, length: 4}```                                                       |                                                                                              |
| `schoolIds`        |                            | `[1234]`                                                                                             | Using the url parameter schoolIds will filter the specific schools returned for your search. |

Example url:

- `app.html#/search/{"startingAfter":"2017-10-25","locations":[{"googlePlaceIds":["ChIJ--acWvtHDW0RF5miQ2HvAAU"],"name":"Auckland, New Zealand"}],"courseCategories":[{"id":3,"name":"General English"}],"age":18,"duration":{"durationTypeId":3,"length":4}}`
- Searching for a General English course in Auckland, starting after October 25th with a duration of at least 4 weeks, for an 18 year old student


## Analytics

A users flow through the application can be tracked by passing the optional `gaTrackingId` property into the snippits. This Tracking Id will be provided by Google Analytics and can be found under Admin -> Your Account -> Track Info. This will allow you to use Google Analytics within the app in the same way you would with it embeded in a website


| **Page**                | **Stage description**                                                          |
|:------------------------|:-------------------------------------------------------------------------------|
| `/start-quote-modal`    | A user has triggered the startQuote modal to show                              |
| `/`                     | Course results / course selection page                                         |
| `/course-customization` | Accommodation & Service Selection page, this also includes the lead generation |
| `/review-quote`         | Review quote page, email quote, contact Advisor                                |
| `/course-registration`  | Filling out the registration information                                       |
| `/thank-you`            | User has completed the entire app flow                                         |



### Google Place Id's

Google Place Ids can be retrieved on the Edvisor system by curling our API with the city name you wish to find the google place id for. This will return a Google Place JSON object, within which the `placeId` can be found.

#### Example

```sh
$ curl https://app.edvisor.io/api/v1/google-place/autocomplete\?input\=copenhagen | json_pp
[{
  "placeId" : "ChIJIz2AXDxTUkYRuGeU5t1-3QQ",
  "types" : [
    "locality",
    "political",
    "geocode"
  ],
  "terms" : [{
    "offset" : 0,
    "value" : "Copenhagen"
  },{
    "value" : "Denmark",
    "offset" : 12
  }],
  "description" : "Copenhagen, Denmark",

  ...
}]
```

### Supported Language Codes

Edvisor uses ISO language and country codes. In some cases we need to represent multiple
languages from the same family or group whose usage differs by region. In this case, we
disambiguate the language code by appending the country code. For example, Spanish spoken
in Colombia differs from that spoken in Spain so we use the compound `es_co` to represent "Colombian Spanish".

At this time, Edvisor only provides translations for the following languages (alphabetically):

| **ISO Language Name** | **Code** |
|:----------------------|:---------|
| Albanian              | sq       |
| Arabic                | ar       |
| Chinese               | zh       |
| English               | en       |
| French                | fr       |
| German                | de       |
| Italian               | it       |
| Japanese              | ja       |
| Korean                | ko       |
| Polish                | pl       |
| Portuguese            | pt       |
| Russian               | ru       |
| Spanish (Castilian)   | es-es    |
| Spanish (Colombia)    | es-co    |
| Thai                  | th       |

## Notes

Currenty to track if the student has selected to be contacted about future promotions we need the connected agency to create a **dropdown** custom field. This field should look like [this](https://imgur.com/a/s9WZB), with the important pieces being the Field ID must be "promotion" and the options must be Yes & No. At this time if the custom field is not found you will see an error when clicking on Get Quote that says `Cannot read property 'fieldTypeId' of null`.
