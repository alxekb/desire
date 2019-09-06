README

__Please follow this steps to get the API running__

* Ruby version
The project uses ruby 2.5.3 and rails 5.2.3

clone the repo
```
$ git clone git@github.com:alxekb/desire.git
```

cd into working directory
```
$ cd desire
```

* Database creation
```
$ rails db:create
```

* Database initialization
```
$ rails db:seed
```

* How to run the test suite
```
$ bundle exec rspec spec
```

Get credentials
```
$ rails c
$ User.last.login
```
Copy user's login without quotes

Start the server
```
$ rails s
```

Open anoter terminal window to get your token and access the API
Before install jq (Mac OS and brew). jq - is a curl json formatter, with jq server response will look much prettier. You can skip this step. Please remove "| jq" symbols in all curl's commands in that case. 
```
$ brew install jq
```

Get your token to access the API
```
$ curl -X POST localhost:3000/login -d "login=Hugo&password=123123123" | jq
```

Server will return a token for you. Get it from the response.

Now you can acces to the API using this command
```
$ curl -X GET localhost:3000/news -H "Authorization: paste_your_token_here" | jq
$ curl -X GET localhost:3000/authors -H "Authorization: paste_your_token_here" | jq
```

For example
```
$ curl -X GET localhost:3000/authors -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiZXhwIjoxNTY3ODU2NzE4fQ.FL8gCJqZ-hywvmhopBDO6Uyek1WTlKBz0Mwa7YYV8w4" | jq
```

You'll get something like this:
```
% Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1801    0  1801    0     0  11412      0 --:--:-- --:--:-- --:--:-- 11471
{
  "authors": [
    {
      "name": "Joe Dow Jr",
      "signature": "Hi! I'm a Joe!",
      "news": 3
    },
    {
      "name": "Ms. Enedina Emard",
      "signature": "I don't think they even heard me.",
      "news": 8
    },
    {
      "name": "Janette Gutmann",
      "signature": "Yes, it's tough, but not as tough as doing comedy.",
      "news": 6
    },
    {
      "name": "Lenna Kreiger V",
      "signature": "I love you.",
      "news": 7
    },
    {
      "name": "Rupert Harvey",
      "signature": "Van Halen!",
      "news": 8
    },
    {
      "name": "January Nienow",
      "signature": "I don't think they even heard me.",
      "news": 5
    },
    {
      "name": "Matthew Rogahn",
      "signature": "Well, this is certainly a pleasant surprise.",
      "news": 3
    },
    {
      "name": "Faye Mohr",
      "signature": "I went the distance.",
      "news": 5
    },
    {
      "name": "Lera Langworth",
      "signature": "I love you too, honey. Good luck with your show.",
      "news": 7
    },
    {
      "name": "Brandon VonRueden",
      "signature": "Yes, it's tough, but not as tough as doing comedy.",
      "news": 3
    },
    {
      "name": "Bernie Green",
      "signature": "That's good. Go on, read some more.",
      "news": 6
    },
    {
      "name": "Cole Shields",
      "signature": "I love you too, honey. Good luck with your show.",
      "news": 6
    },
    {
      "name": "Alise Stokes",
      "signature": "Is it not meningitis?",
      "news": 1
    },
    {
      "name": "Harland Reilly",
      "signature": "Yes, it's tough, but not as tough as doing comedy.",
      "news": 5
    },
    {
      "name": "Carrie Dooley",
      "signature": "Happy.",
      "news": 1
    },
    {
      "name": "Dr. Misty Renner",
      "signature": "One! Two! Three!",
      "news": 7
    },
    {
      "name": "Deanne Buckridge V",
      "signature": "Van Halen!",
      "news": 3
    },
    {
      "name": "Reanna Morar",
      "signature": "I love you.",
      "news": 10
    },
    {
      "name": "Theodore Ebert",
      "signature": "I love you too, honey. Good luck with your show.",
      "news": 3
    },
    {
      "name": "Dan Bruen",
      "signature": "I am confound.",
      "news": 7
    },
    {
      "name": "Ray Nitzsche",
      "signature": "One! Two! Three!",
      "news": 2
    },
    {
      "name": "Mrs. Ingrid Boyer",
      "signature": "I don't know.",
      "news": 11
    },
    {
      "name": "Cameron Simonis II",
      "signature": "All my possessions for a moment of time.",
      "news": 9
    }
  ]
}
```
