# Student Status

## List all student statuses

```shell
curl "https://api.edvisor.io/v1/student-status/list?filter={"where":{"agencyId":92}}"
  -H "Authorization: your_edvisor_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "metadata": {
    "total": 10
  },
  "data": [{
    "studentStatusId": 795,
    "agencyId": 92, 
    "label": "Lead", 
    "position": 0,
    "studentCount": 1,
    "studentStatusSteps":[]
  }, {
    "studentStatusId": 796,
    "agencyId": 92,
    "label": "Deciding",
    "position": 1,
    "studentCount": 6,
    "studentStatusSteps": []
  },
  ...
  ]
}

```

This endpoint will list all the student statuses.

### HTTP Request

`GET https://api.edvisor.io/v1/student-status/list`

### Example

`GET https://api.edvisor.io/v1/student-status/list?filter={"where":{"agencyId":92}}`

### URL Parameters

Parameter | Required | Default | Description
--------- | -------- | ------- | -----------
filter | Yes | false | A JSON Object.
filter.where | Yes | false | A JSON Object.
filter.where.agencyId | Yes | false | The Agency ID to filter the student statuses.
