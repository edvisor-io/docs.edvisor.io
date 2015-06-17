# English Level

## List all english levels

```shell
curl "https://api.edvisor.io/v1/english-level"
  -H "Authorization: your_edvisor_api_key"
```

> The above command returns JSON structured like this:

```json
[
  {
    "englishLevelId": 1,
    "codeName": "Beginner"
  },
  {
    "englishLevelId": 2,
    "codeName": "Intermediate"
  },
  {
    "englishLevelId": 3,
    "codeName": "Advanced"
  }
]
```

This endpoint will list all the english levels.

### HTTP Request

`GET https://api.edvisor.io/v1/english-level`

### URL Parameters

(None)