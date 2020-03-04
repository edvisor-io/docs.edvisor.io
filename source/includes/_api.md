# API

To access our API, please contact us at <a href='mailto:support@edvisor.io'>support@edvisor.io</a>.

<aside class="notice">
Please note that we are currently using GraphQL which is quite different from typical RESTful API's. To learn
more about how to interact with a GraphQL API, please checkout <a href='http://graphql.org/'>http://graphql.org/</a>.
</aside>

## API Reference

<a href='schema/'>Graphql Schema</a>

<aside class="notice">
This document only contains the inputs and objects of our api.
To explore the queries and mutations, use GraphQL Playground's DOCS section.
</aside>

## GraphQL Playground

GraphQL Playground is a web tool to explore Edvisor api and test drive queries and mutations.

<a href='https://www.graphqlbin.com/' target='_blank'>https://www.graphqlbin.com/</a>

Use

`https://api.edvisor.io/graphql`

as the endpoint URL

<img src='/images/step1.gif'>
<img src='/images/step2.gif'>

<aside class="notice">
Please remember to set the "Authorization" header with your API key.

```
{
  "Authorization": "Bearer your-api-key"
}
```
</aside>
