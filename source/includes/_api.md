# API

You can view the full API documentation for our <a href='schema/'>GraphQL API here</a>. 

Please note that we are currently using GraphQL which is quite different from typical RESTful API's. To learn
more about how to interact with a GraphQL API, please checkout <a href='http://graphql.org/'>http://graphql.org/</a>.

### Queries

A full list of all the available queries can be found here: <a href='http://docs.edvisor.io/schema/query.doc.html'>http://docs.edvisor.io/schema/query.doc.html</a>

To access our API, please contact us at <a href='mailto:support@edvisor.io'>support@edvisor.io</a>.

## GraphQL Playground

You can test drive your GraphQL queries and mutations directly from here: <a href='https://www.graphqlbin.com/' target='_blank'>https://www.graphqlbin.com/</a>. When it prompts you to enter the endpoint URL please use `https://api.edvisor.io/graphql`

<img src='/images/step1.gif'>
<img src='/images/step2.gif'>

<aside class="notice">
Please remember to set the "Authorization" header with your API key.
</aside>

## Accessing the price of a course

> The GraphQL query could look like this:

```
query {
  # lookup a specific offering
  offering(offeringId: 1) {
    # get the offeringCourse relationship
    offeringCourse {
      # get the prices specified by the filter
      prices(filter: {
        startDate: {
          eq: "2018-01-01"
        },
        durationTypeId: 3,
        durationAmount: {
          eq: 8
        },
        nationalityId: 29,
        age: {
          eq: 21
        },
        agencyCountryId: 29
      }) {
        # specify the fields we want to see returned
        durationAmount,
        durationType {
          codeName
        },
        startDate,
        currency {
          code
        },
        originalPrice,
        hasPromotion
      }
    }
  }
}
```

> You can copy and paste this cURL command to test it out!

```shell
curl 'https://api.edvisor.io/graphql' \
  -H 'Authorization: Bearer <your_edvisor_api_key>' \
  -H 'Content-Type: application/json' \
  --data-binary '{"query":"query {\n  offering(offeringId: 417) {\n    offeringCourse {\n      prices(filter: {\n        startDate: {\n          eq: \"2018-01-01\"\n        }\n      }) {\n        durationAmount,\n        durationType {\n          codeName\n        },\n        startDate,\n        currency {\n          code\n        },\n        originalPrice,\n        hasPromotion\n      }\n    }\n  }\n}","variables":null}' \
  --compressed
```

A very common usage of the Edvisor API is to query for the pricing of a course.

This can be achieved easily with the `prices`</a> property on the <a href='http://docs.edvisor.io/schema/offeringcourse.doc.html'>`OfferingCourse`</a> object. 

You can read more about the parameters that the `prices` property accepts here: <a href='http://docs.edvisor.io/schema/offeringcourse.doc.html'>http://docs.edvisor.io/schema/offeringcourse.doc.html</a>

In the example to the left, we are using the root query `offering` to find a specific offering, then traversing through the `offeringCourse` relation to get to the `prices` property. 

You will notice that the `prices` property takes in a `filter` parameter which you can customize to meet your needs. You will notice that the `prices` property will return a list of `DerivedPrice` objects, which is described here: <a href='http://docs.edvisor.io/schema/derivedprice.doc.html'>http://docs.edvisor.io/schema/derivedprice.doc.html</a>

## Performing a search for courses

> The GraphQL query could look like this:

```
query {
  # use the offeringSearch query
  offeringSearch(filter: {
    # filter for only Courses (offeringTypeId = 1)
    offeringTypeIds: [1],
    durationTypeId: 3,
    durationAmount: {
      eq: 4
    },
    pagination: {
      limit: 10
    }
  }) {
    ... on OfferingCourseSearchResult {
      offering {
        name,
        school {
          name,
          schoolCompany {
            name
          }
        }
      }
    	offeringId,
      durationAmount,
      durationType {
        codeName
      },
      price {
        originalPrice,
        currency {
          code
        }
      }
  	}
  }
}
```

> You can copy and paste this cURL command to test it out!

```shell
curl 'https://api.edvisor.io/graphql' \
  -H 'Authorization: Bearer <your_edvisor_api_key>' \
  -H 'Content-Type: application/json' \
  --data-binary '{"query":"query {\n  offeringSearch(filter: {\n    offeringTypeIds: [1],\n    durationTypeId: 3,\n    durationAmount: {\n      eq: 4\n    },\n    pagination: {\n      limit: 10\n    }\n  }) {\n    ... on OfferingCourseSearchResult {\n      offering {\n        name,\n        school {\n          name,\n          schoolCompany {\n            name\n          }\n        }\n      }\n    \tofferingId,\n      durationAmount,\n      durationType {\n        codeName\n      },\n      price {\n        originalPrice,\n        currency {\n          code\n        }\n      }\n      \n  \t}\n  }\n}","variables":null}' \
  --compressed
```

Our API currently exposes the ability to search for offerings matching specific search criteria. 

You can use the `offeringSearch` query to perform a search for matching offerings, and also fetch the prices! For more details on what criteria you can set in the filter, please visit our documentation on the `OfferingSearchResultFilter` here: <a href='http://docs.edvisor.io/schema/offeringsearchresultfilter.doc.html'>http://docs.edvisor.io/schema/offeringsearchresultfilter.doc.html</a>. For more details on the result objects returned, please visit our documentation on the `OfferingSearchResult` object here: <a href='http://docs.edvisor.io/schema/offeringsearchresult.doc.html'>http://docs.edvisor.io/schema/offeringsearchresult.doc.html</a>

## Exploring your connected Schools

> The GraphQL query could look like this:

```
query {
  # start by querying for your own AgencyCompany object
  agencyCompany {
    agencyCompanyId,
    name,
    # now fetch the connectedSchoolCompanies relation
    connectedSchoolCompanies {
      schoolCompanyId,
      name,
      schools {
        name,
        # here we are fetching all the courses related to your schools
        courses {
          offeringId,
          name
        }
      }
    }
  }
}
```

> You can copy and paste this cURL command to test it out!

```shell
curl 'https://api.edvisor.io/graphql' 
  -H 'Authorization: Bearer <your_edvisor_api_key>' \
  -H 'Content-Type: application/json' \
  --data-binary '{"query":"query {\n  agencyCompany {\n    agencyCompanyId,\n    name,\n    connectedSchoolCompanies {\n      schoolCompanyId,\n      name,\n      schools {\n        name,\n        courses {\n          offeringId,\n          name\n        }\n      }\n    }\n  }\n}","variables":null}' 
  --compressed 
```

If you are an agency customer, you have full ability to explore the data of the schools you're connected to through our API.

To begin, we recommend you start with the `agencyCompany` query which will return to you data on your own Agency account. From there you can traverse our API in GraphQL to the data of your connected schools.

## Viewing a Quote

> To fetch all the course information on a quote

```
query {
  studentQuote(studentQuoteId:1) {
    studentQuoteId
    studentQuoteOptions {
      studentQuoteOptionItems {
        __typename
        
        ... on StudentQuoteOptionCourseItem {
          offeringPriceItem {
            durationAmount
            durationType {
              codeName
            }
            startDate
            endDate
            priceAmount
            priceCurrency {
              code
            }
          }
          courseSnapshot {
            offeringCourseCategory {
              codeName
            }
            name
          }
        }
      }
    }
  }
}
```

> You can copy and paste this cURL command to test it out!

```shell
curl 'https://api.edvisor.io/graphql' 
  -H 'Authorization: Bearer <your_edvisor_api_key>' \
  -H 'Content-Type: application/json' \
  --data-binary '{"query":"query {\n  studentQuote(studentQuoteId:<your_quote_id>) {\n    studentQuoteId\n    studentQuoteOptions {\n      studentQuoteOptionItems {\n        __typename\n        \n        ... on StudentQuoteOptionCourseItem {\n          offeringPriceItem {\n            durationAmount\n            durationType {\n              codeName\n            }\n            startDate\n            endDate\n            priceAmount\n            priceCurrency {\n              code\n            }\n          }\n          courseSnapshot {\n            offeringCourseCategory {\n              codeName\n            }\n            name\n          }\n        }\n      }\n    }\n  }\n}","variables":null}' 
  --compressed 
```

> To fetch all the fee information on a quote

```
query {
  studentQuote(studentQuoteId:1) {
    studentQuoteId
    studentQuoteOptions {
      studentQuoteOptionItems {
        __typename
        
        ... on StudentQuoteOptionFeeItem {
          appliedFeePriceItem {
            startDate
            endDate
            priceAmount
            priceCurrency {
              code
            }
          }
          feeSnapshot {
            name
          }
        }
      }
    }
  }
}
```

> You can copy and paste this cURL command to test it out!

```shell
curl 'https://api.edvisor.io/graphql' 
  -H 'Authorization: Bearer <your_edvisor_api_key>' \
  -H 'Content-Type: application/json' \
  --data-binary '{"query":"query {\n  studentQuote(studentQuoteId:<your_quote_id>) {\n    studentQuoteId\n    studentQuoteOptions {\n      studentQuoteOptionItems {\n        __typename\n        \n        ... on StudentQuoteOptionFeeItem {\n          appliedFeePriceItem {\n            startDate\n            endDate\n            priceAmount\n            priceCurrency {\n              code\n            }\n          }\n          feeSnapshot {\n            name\n          }\n        }\n      }\n    }\n  }\n}","variables":null}' 
  --compressed 
```

As an agency customer, you can retrieve data on any of the quotes that you have previously created. Please see the example on the right.

The example to the right shows only how to fetch information for the courses and fees attached to your quote. There are many more objects that you can fetch in addition to course information. Please see the documentation on the following objects for a full description of what data is available to you:

* <a href='http://docs.edvisor.io/schema/studentquoteoptioncourseitem.doc.html'>StudentQuoteOptionCourseItem</a>
* <a href='http://docs.edvisor.io/schema/studentquoteoptionaccommodationitem.doc.html'>StudentQuoteOptionAccommodationItem</a>
* <a href='http://docs.edvisor.io/schema/studentquoteoptionserviceitem.doc.html'>StudentQuoteOptionServiceItem</a>
* <a href='http://docs.edvisor.io/schema/studentquoteoptionfeeitem.doc.html'>StudentQuoteOptionFeeItem</a>
* <a href='http://docs.edvisor.io/schema/studentquoteoptiondiscountitem.doc.html'>StudentQuoteOptionDiscountItem</a>

## Viewing a StudentEnrollment

> To fetch all the salient details of a student enrollment

```
query {
  studentEnrollment(studentEnrollmentId: 1) {
    studentEnrollmentId
    agencyOwnerId
    sent
    studentEnrollmentOfferingItems {
      ... on StudentEnrollmentOfferingCourseItem {
        offeringTypeId
        courseSnapshot {
          offeringCourseCategory {
            offeringCourseCategoryId
            codeName
          }
          name
        }
      }
      ... on StudentEnrollmentOfferingCourseItem {
        accommodationSnapshot {
          bathroomType {
            bathroomTypeId
            codeName
          }
          offeringId
          offeringAccommodationCategoryId
          name
        }
      }
      ... on StudentEnrollmentOfferingServiceItem {
        offeringTypeId
        serviceSnapshot {
          offeringId
        }
      }
    }
  }
}
```

> You can copy and paste this cURL command to test it out!

```shell
curl 'https://api.edvisor.io/graphql' 
  -H 'Authorization: Bearer <your_edvisor_api_key>' \
  -H 'Content-Type: application/json' \
  --data-binary '{"query":"query {\n  studentQuote(studentQuoteId: 42157) {\n    studentQuoteId\n\n    studentQuoteOptions {\n      studentQuoteOptionId\n      \n      studentQuoteOptionItems {\n        ... on StudentQuoteOptionCourseItem {\n          studentQuoteOptionId\n        }\n      }\n    }\n  }\n  \n  studentEnrollment(studentEnrollmentId: 11722) {\n    studentEnrollmentId\n    studentEnrollmentStatusId\n    studentEnrollmentDecisionStatusId\n    schoolId\n    studentId\n    invoiceId\n    quoteId\n    languageId\n    obscuredId\n    studentSignature\n    signedDate\n    specialInstructions\n    created\n    modified\n    agencyOwnerId\n    schoolOwnerId\n    sent\n    isDeletedByAgency\n    isDeletedBySchool\n    studentEnrollmentOfferingItems {\n      ... on StudentEnrollmentOfferingAccommodationItem {\n        accommodationSnapshot {\n          offeringId\n          offeringAccommodationCategoryId\n          name\n        }\n      }\n      ... on StudentEnrollmentOfferingCourseItem {\n        offeringTypeId\n        studentEnrollmentOfferingItemId\n        courseSnapshot {\n          offeringId\n          offeringCourseCategoryId\n          name\n        }\n      }\n    }\n  }\n}","variables":null}'
  --compressed 
```

As an agency customer, you can retrieve data on any of the student enrollments that have been created through Edvisor. Please
see the example on the right. Student enrollments are variously called "applications" or "bookings" in the industry.

The example to the right shows only how to fetch information for the courses, accommodations, and services attached to the student enrollment. For more details as to which fields are available on which objects, consult the schema documentation. 

* <a href='http://docs.edvisor.io/schema/studentenrollmentofferingcourseitem.doc.html'>StudentEnrollmentOfferingCourseItem</a>
* <a href='http://docs.edvisor.io/schema/studentenrollmentofferingaccommodationitem.doc.html'>StudentEnrollmentOfferingAccommodationItem</a>
* <a href='http://docs.edvisor.io/schema/studentenrollmentofferingserviceitem.doc.html'>StudentEnrollmentOfferingServiceItem</a>
