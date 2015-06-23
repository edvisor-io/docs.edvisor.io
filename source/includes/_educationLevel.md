# Education Level

## List all education levels

```shell
curl "https://app.edvisor.io/api/v1/education-level"
  -H "Authorization: private_key=\"your_edvisor_api_key\""
```

> The above command returns JSON structured like this:

```json
[
  {
    "educationLevelId": 1,
    "codeName": "High School",
    "displayOrder": 1
  },
  {
    "educationLevelId": 2,
    "codeName": "College",
    "displayOrder": 2
  },
  {
    "educationLevelId": 3,
    "codeName": "University",
    "displayOrder": 3
  },
  {
    "educationLevelId": 4,
    "codeName": "Middle School",
    "displayOrder": 0
  }
]
```

This endpoint will list all the education levels.

### HTTP Request

`GET https://app.edvisor.io/api/v1/education-level`

### URL Parameters

(None)

