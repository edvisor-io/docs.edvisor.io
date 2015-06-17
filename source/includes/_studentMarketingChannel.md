# Student Marketing Channel

## List all student marketing channels

```shell
curl "https://api.edvisor.io/v1/student-marketing-channel"
  -H "Authorization: your_edvisor_api_key"
```

> The above command returns JSON structured like this:

```json
[
  {
    "studentMarketingChannelId": 1,
    "codeName": "Word of mouth"
	}, {
    "studentMarketingChannelId": 2,
    "codeName": "Website"
  }, {
    "studentMarketingChannelId": 3,
    "codeName": "Social Media"
  },
  ...
]
```

This endpoint will list all the student marketing channels.

### HTTP Request

`GET https://api.edvisor.io/v1/student-marketing-channel`

### URL Parameters

(None)

