# Student

## Create a student

```shell
curl "https://app.edvisor.io/api/v1/student"
  -H "Authorization: private_key=\"your_edvisor_api_key\"; Content-Type: application/json" 
  -X POST 
  -d '{}' //your json parameters
```

> The above command returns JSON structured like this:

```json
{
  "studentId": 1,
  "agencyId": 1,
  "ownerId": null,
  "nationalityId": null,
  "firstname": "Joe",
  "lastname": "Biden",
  "email": "joebiden@fakemail.com",
  "phone": "555-555-5555",
  "address": null,
  "postalCode": null,
  "gender": "M",
  "birthdate": "2015-06-16T00:00:00.000Z",
  "passportNumber": null,
  "studentStatusId": 1,
  "notes": "Here are some notes about the student...",
  "accommodation": "Homestay",
  "budget": null,
  "startMonth": "01",
  "startYear": "2015",
  "startDay": "25",
  "durationWeekAmount": 10,
  "hoursPerWeek": 25,
  "amOrPm": "AM",
  "currentLocationGooglePlaceId": "ChIJ--IExB6rOQcRZysfWJNymsk",
  "isHighPriority": 0,
  "studentNumber": "fk3k333",
  "customPropertyValues": [
    {
      "customPropertyFieldId": "favorite-color",
      "customOptionSelections": ["Red"]
    },
    {
     "customPropertyFieldId": "best-friend-name",
     "value" : "Kenta"
    }
  ]
}
```

This endpoint will create a student.

### HTTP Request

`POST https://app.edvisor.io/api/v1/student`

### JSON Request Object

Parameter | Required | Type | Default | Description
--------- | -------- | ---- | ------- | -----------
agencyId | Yes | Number | | The ID of the office you want this student to belong to. This can be found in the settings page of Edvisor.io.
ownerId | No | Number | NULL | The ID of the user we want to assign the student to. This can be found in the settings page of Edvisor.io. If set to NULL, the student will be left as unassigned.
nationalityId | No | Number | NULL | The Country ID of the nationality of the student.
firstname | Yes | String | | The first name of the student.
lastname | No | String | NULL | The last name of the student.
email | No | String | NULL | The email of the student. Note: You can only have one student with the same email in your company.
phone | No | String | NULL | The phone number of the student.
address | No | String | NULL | The address of your student.
postalCode | No | String | NULL | The postal code of your student.
gender | No | String (M/F) | NULL | The gender of your student. Accepted values are 'M' or 'F'.
birthdate | No | String (YYYY-MM-DD) | NULL | The birthdate of your student. Format must be YYYY-MM-DD.
passportNumber | No | String | NULL | The passport number of the student.
studentStatusId | No | Number | NULL | The first stage in your student pipeline. | The Student Status ID to assign to your student.
notes | No | String | NULL | Any notes you wish to keep with the student.
accommodation | No | String | NULL | Accommodation goals for the student.
budget | No | String | NULL | Budget information
startMonth | No | Number | NULL | The numerical value of the month the student wishes to start.
startYear | No | Number | NULL | The numerical value of the year the student wishes to start.
startDay | No | Number | NULL | The numerical value of the day the student wishes to start.
durationWeekAmount | No | Number | NULL | The number of weeks the student wishes to study for.
hoursPerWeek | No | Number | NULL | The number of hours per week the student wishes to study for.
amOrPm | No | String (AM/PM) | NULL | Whether the student wants to study in the AM or PM.
currentLocationGooglePlaceId | No | String | NULL | The Place ID provided by Google's <a href='https://developers.google.com/places/webservice/'>Places API</a>. This represents where the student is currently residing.
isHighPriority | No | Boolean | false | Whether the student should be marked as high priority.
studentNumber | No | String | NULL | Any external student number that you wish to store with the student.
studentLocationPreferences | No | Object[] | NULL | An array of Google Place IDs which represent the locations that the student wishes to study in.
studentLocationPreferences[].googlePlaceId | No | String | NULL | Google Place ID which represent the locations that the student wishes to study in.
studentCoursePreferences | No | Object[] | NULL | An array of course names representing the courses that the student wishes to be enrolled in.
studentCoursePreferences[].name | No | String | NULL | A course name representing the course that the student wishes to be enrolled in.
studentSchoolPreferences | No | Object[] | NULL | An array of school names representing the schools that the student wishes to be enrolled in.
studentSchoolPreferences[].name | No | String | NULL | A school name representing the school that the student wishes to be enrolled in.
customPropertyValues | No | Object[] | NULL | An array of custom property values to save with the student
customPropertyValues[].customPropertyFieldId | Yes | String | NULL | The Custom Property Field ID of the custom property you wish to save
customPropertyValues[].value | Yes | String | NULL | The value you want to save with this custom property. This is required ONLY if the custom property is not a dropdown
customPropertyValues[].customOptionSelections[] | Yes | String[] | NULL | This is an array of option selections. In the case of a dropdown field, you will only need to pass one value into this array. Note, this is ONLY required if the custom property is a dropdown

## Custom Properties

Custom properties allow you to setup and store any additional fields you want to with a student.
Custom properties can be set up in the Settings section of the Edvisor.io application. 

Please note that custom properties are unique to each individual office. Therefore, when creating 
new student with custom properties, you must ensure that the office you are assigning the student
to has the custom properties that you wish to store with the student.

When storing custom properties with a student you will refer to the custom property by the Custom
Property Field ID. This ID is set during the creation of a custom property in the Settings section
of the Edvisor.io application.

