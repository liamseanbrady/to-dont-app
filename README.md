## To-Don't App

#### Summary

To-don't app is a simple way to consciously break bad habits. Along with a supportive community and lists of meetups in your area, there's no reason not to start positively breaking those negative habits today!

#### Features

- User authentication which is built from scratch using bcrypt-ruby, and Rails' built-in has_secure_password. I decided to set validations for has_secure_password  to false and write validations for each attribute myself manually. Authenitcation also includes optional two-factor authentication using the Twilio API.

- Users can create support groups and other users have the option to join those support groups for various to-don'ts.

- Users can ogranize meetups and other users register to attend those meetups.

- A user can create as many to-don'ts as they wish.

- Once they have created a to-don't, they can register a 'success day' for that to-don't if the deem that today was successful in terms of achieving their to-don't.

- A user can also create a progress log at any time for a particular to-don't in order to track general progress.

- If a user has a Gravatar account attached to the email address provided, then the app will automatically generate a url to retrieve their Gravatar image. This is done using my Gravatarable gem.

#### Design Decisions

- I chose to forego using the `resources` helper in `config/routes.rb` on the basis that it's always good practice to strip back abstractions now and again and achieve the same result more manually. Doing this challenged me to better understand the structure of routing and making sure all of the routes were RESTful.

- A user can only ever create a progress log on a todon't that they created. With this in mind, I felt it would be overkill to create a direct relationship between a user and their todon'ts and also a direct relationship between a user and their progress logs for each to-don't. Therefore, I decided to use the `has_many` relationship between a user and their todon't to create a `has_many through` relationship on that user for progress logs through each to-don't.
