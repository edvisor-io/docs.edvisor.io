# Country

## List all countries

```shell
curl "https://app.edvisor.io/api/v1/country"
  -H "Authorization: private_key=\"your_edvisor_api_key\""
```

> The above command returns JSON structured like this:

```json
[
  {
    "countryId": 1, 
    "code": ad,
    "continent": "EUROPE",
    "currencyId": 43,
    "languageId": null,
    "nameTranslationId": 37431
	}, {
    "countryId": 2, 
    "code": ae,
    "continent": "ASIA",
    "currencyId": 1,
    "languageId": null,
    "nameTranslationId": 37432
  },
  ...
]
```

This endpoint will list all the countries.

### HTTP Request

`GET https://app.edvisor.io/api/v1/country`

### URL Parameters

(None)

