# Student

## Create a student

```shell
curl "https://api.edvisor.io/v1/student"
  -H "Authorization: your_edvisor_api_key; Content-Type: application/json" 
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
  "nationalIdNumber": 12345,
  "studentStatusId": 1,
  "notes": "Here are some notes about the student...",
  "accommodation": "Homestay",
  "budget": null,
  "startMonth": "01",
  "startYear": "2015",
  "startDay": "25",
  "studentMarketingChannelId": null,
  "educationLevelId": 1,
  "englishLevelId": 1,
  "durationWeekAmount": 10,
  "hoursPerWeek": 25,
  "amOrPm": "AM",
  "currentLocationGooglePlaceId": "ChIJ--IExB6rOQcRZysfWJNymsk",
  "isHighPriority": 0,
  "studentNumber": "fk3k333"
}
```

This endpoint will create a student.

### HTTP Request

`POST https://api.edvisor.io/v1/student`

### JSON Request Object

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
agencyId | Yes | | The ID of the office you want this student to belong to.
ownerId | No | NULL | The ID of the user we want to assign the student to. If set to NULL, the student will be left as unassigned.
nationalityId | No | NULL | The Country ID of the nationality of the student.
firstname | Yes | | The first name of the student.
lastname | No | NULL | The last name of the student.
email | No | NULL | The email of the student. Note: You can only have one student with the same email in your company.
phone | No | NULL | The phone number of the student.
address | No | NULL | The address of your student.
postalCode | No | NULL | The postal code of your student.
gender | No | NULL | The gender of your student. Accepted values are 'M' or 'F'.
birthdate | No | NULL | The birthdate of your student. Format must be YYYY-MM-DD.
passportNumber | No | NULL | The passport number of the student.
nationalIdNumber | No | NULL | The national ID number of the student.
studentStatusId | No | The first stage in your student pipeline. | The Student Status ID to assign to your student.
notes | No | NULL | Any notes you wish to keep with the student.
accommodation | No | NULL | Accommodation goals for the student.
budget | No | NULL | Budget information
startMonth | No | NULL | The numerical value of the month the student wishes to start.
startYear | No | NULL | The numerical value of the year the student wishes to start.
startDay | No | NULL | The numerical value of the day the student wishes to start.
studentMarketingChannelId | No | NULL | The Student Marketing Channel ID that describes the channel the student came in from.
educationLevelId | No | NULL | The Education Level ID that describes what education level the student is currently at.
englishLevelId | No | NULL | The English Level ID that describes what english level the student currently has.
durationWeekAmount | No | NULL | The number of weeks the student wishes to study for.
hoursPerWeek | No | NULL | The number of hours per week the student wishes to study for.
amOrPm | No | NULL | Whether the student wants to study in the AM or PM.
currentLocationGooglePlaceId | No | NULL | The Place ID provided by Google's <a href='https://developers.google.com/places/webservice/'>Places API</a>. This represents where the student is currently residing.
isHighPriority | No | false | Whether the student should be marked as high priority.
studentNumber | No | NULL | Any external student number that you wish to store with the student.
<!-- student_visa_type_id -->
<!-- student_priority_id -->

