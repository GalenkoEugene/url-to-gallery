# README

Write an application that can find by URL address page, parse it, drag images from it and form a gallery of that pictures.
Plus it should have a *Rest API* endpoint that receives URL address
and return an array of image URLs from the received page.
This functionality should be covered with tests.
UI should have a more or less modern look.

API available on [heroku](https://picture-parser-api.herokuapp.com/api/v1/parser?url=https://unsplash.com/)

endpoint is: `/api/v1/parser`
required params is: `url`
