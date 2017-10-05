## Custom Fields

> Text or Date field

```
{
  "customPropertyValues": [
    {
     "customPropertyFieldId": "best-friend-name",
     "value" : "Kenta"
    }
  ]
}
```

> Dropdown field (case-sensitive)

```
{
  "customPropertyValues": [
    {
      "customPropertyFieldId": "favorite-color",
      "customOptionSelections": ["Red"]
    }
  ]
}
```

> Text and dropdown Field

```
{
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

Custom properties allow you to setup and store any additional fields you want to with a student.

**Custom fields are unique to each individual office.** *When creating 
new student with custom properties, you must ensure that the office you are assigning the student to has the custom properties that you wish to store with the student.*

You can create custom fields in your **Settings** under the **Agency** tab.

There are 3 types of custom fields. Text/Dropdown/Date

Please be aware that *Dropdown* is case sensitive and that you must send the exact text.

When you create a Custom field, you will get a *Field ID*. Use this ID as your 'customPropertyFieldId'. Please refer to the right to see how your data should be structured.

![agency](customField.png)