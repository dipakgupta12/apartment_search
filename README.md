# README

https://github.com/dipakgupta12/apartment_search.git

*Setup Instructions*

* ruby version - 2.7.1
* database - postgreSQL

clone this repository
`git clone https://github.com/dipakgupta12/apartment_search.git`

`cd apartment_search`

Install all dependencies with bundle
`bundle install`

Create database
`rails db:create`

Run the migrations
`rails db:migrate`

Run rails server
`rails s`

Example API calls:

`curl --location --request GET 'http://localhost:3000/api/v1/apartments'`
`curl --location --request GET 'localhost:3000/api/v1/apartments?min_price=400&max_price=500&min_sqm=200&max_sqm=400&number_of_bedrooms=7'`

Output:
```
[
  {
    "id":1,
    "title":"Pariatur sunt magnam nisi veritatis.",
    "price":540,
    "sqm":872,
    "number_of_bedrooms":3,
    "number_of_bathrooms":2,
    "picture":"https://loremflickr.com/100/100/apartment",
    "created_at":"2021-04-28T15:24:22.960Z",
    "updated_at":"2021-04-28T15:24:22.960Z"
  }
]
```

`curl --location --request GET 'http://localhost:3000/api/v1/apartments?number_of_bathrooms=3'`
Output:
`{"message":"Invalid key(s): number_of_bathrooms"}`
