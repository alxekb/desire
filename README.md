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

Open rails console
```
$ rails c
```

Get last user credentials
```
$ User.last.login
```

Copy user's login without quotes. Password in this case is 123123123.

Or create a new user 
```
$ User.create!(login: 'login', password: 'password', name: 'name', signature: 'signature')
```

You'll get something like this
```
 (0.2ms)  BEGIN
  User Exists (0.5ms)  SELECT  1 AS one FROM "users" WHERE "users"."login" = $1 LIMIT $2  [["login", "login"], ["LIMIT", 1]]
  User Create (8.3ms)  INSERT INTO "users" ("login", "password_digest", "signature", "name", "created_at", "updated_at", "token") VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING "id"  [["login", "login"], ["password_digest", "$2a$12$VikcIC8XKwAVBhNPt0wMw.CBpCJgGmoVJwLcSEE/YXB8QSMuQKDpe"], ["signature", "signature"], ["name", "name"], ["created_at", "2019-09-06 13:04:59.404288"], ["updated_at", "2019-09-06 13:04:59.404288"], ["token", "wpqCka2yjVkneWEU/3rD5q1dsgh+M2BMMfhF7+BIOilK47JvVJ2GpSFRcZQwfNBZhFeiJoacMvbTtxZTczk0HQ=="]]
   (0.8ms)  COMMIT
 => #<User id: 24, login: "login", password_digest: "$2a$12$VikcIC8XKwAVBhNPt0wMw.CBpCJgGmoVJwLcSEE/YXB...", signature: "signature", name: "name", created_at: "2019-09-06 13:04:59", updated_at: "2019-09-06 13:04:59", token: "wpqCka2yjVkneWEU/3rD5q1dsgh+M2BMMfhF7+BIOilK47JvVJ..."> 
2.5.3 :006 > 
```
Get token
```
$ User.last.token
```

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


__Results__

- [x] только аутентифицированный пользователь может создавать/обновлять 
```
curl -X POST localhost:3000/login -d "login=Hugo&password=123123123"
```
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   153    0   124  100    29    200     46 --:--:-- --:--:-- --:--:--   200
{
  "auth_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiZXhwIjoxNTY3ODYzMzQyfQ.RiBeFTK-ETUnT-hPi4sCy3zexMDbOJkXw6DCz9z_gR0"
}
```

- [x] выдача всех новостей конкретного автора
```
curl -X GET localhost:3000/authors/1 -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiZXhwIjoxNTY3ODU2NzE4fQ.FL8gCJqZ-hywvmhopBDO6Uyek1WTlKBz0Mwa7YYV8w4" | jq
```

- [x] выдача списка авторов
```
curl -X GET localhost:3000/authors -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiZXhwIjoxNTY3ODU2NzE4fQ.FL8gCJqZ-hywvmhopBDO6Uyek1WTlKBz0Mwa7YYV8w4" | jq
```
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   476    0   476    0     0   3126      0 --:--:-- --:--:-- --:--:--  3131
{
  "author": {
    "signature": "Hi! I'm a Joe!"
  },
  "news": [
    {
      "title": "Ducimus expedita aliquid qui.",
      "notice": "Officiis ullam at assumenda.",
      "content": "Placeat eligendi quaerat. Porro quo assumenda. Sunt non nesciunt."
    },
    {
      "title": "Ut voluptas veniam omnis.",
      "notice": "Nihil quaerat libero sed.",
      "content": "Sint et aut. Dolorem nihil sed. Magnam ut rem."
    },
    {
      "title": "Ullam nisi porro amet.",
      "notice": "Nobis sit est ut.",
      "content": "Et aliquam non. Omnis ipsam consequatur. Aut vel dolor."
    }
  ]
}
```

- [x] выдача списка новостей
```
curl -X GET localhost:3000/news -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiZXhwIjoxNTY3ODU2NzE4fQ.FL8gCJqZ-hywvmhopBDO6Uyek1WTlKBz0Mwa7YYV8w4" | jq
```
```
CJqZ-hywvmhopBDO6Uyek1WTlKBz0Mwa7YYV8w4" | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1006    0  1006    0     0   8300      0 --:--:-- --:--:-- --:--:--  8314
{
  "news": [
    {
      "news_id": 121,
      "title": "Est ut facere atque.",
      "notice": "Expedita pariatur ex sunt.",
      "content": "Id ea minima. Totam iure dolor. Dolores repellendus commodi."
    },
    {
      "news_id": 122,
      "title": "Laborum sit incidunt tenetur.",
      "notice": "Quisquam distinctio rerum et.",
      "content": "Eum et sapiente. Quia sunt aliquid. Quo beatae in."
    },
    {
      "news_id": 123,
      "title": "Voluptatum ratione soluta incidunt.",
      "notice": "Quaerat commodi non nobis.",
      "content": "Ea mollitia in. Fuga et sint. Voluptatem aut labore."
    },
    {
      "news_id": 124,
      "title": "Quaerat laboriosam dolorem sint.",
      "notice": "Odit tenetur aut esse.",
      "content": "Aut quia praesentium. Porro quia dolorum. Quibusdam distinctio vitae."
    },
    {
      "news_id": 125,
      "title": "Facere reprehenderit id libero.",
      "notice": "Eum et aliquid et.",
      "content": "Sit velit ab. Eaque temporibus fuga. Voluptas ipsam eum."
    },
    {
      "news_id": 126,
      "title": "Aliquid quidem quasi harum.",
      "notice": "Nulla enim repellat temporibus.",
      "content": "Officia cumque perspiciatis. Possimus nisi magni. Ut exercitationem in."
    }
  ]
}

```

- [x] показывать запрошенную 
```
curl -X GET localhost:3000/news/1 -H "Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMywiZXhwIjoxNTY3ODU2NzE4fQ.FL8gCJqZ-hywvmhopBDO6Uyek1WTlKBz0Mwa7YYV8w4" | jq
```
```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   260    0   260    0     0   1828      0 --:--:-- --:--:-- --:--:--  1830
{
  "news": {
    "title": "Est quia beatae voluptate.",
    "notice": "Et iste architecto facilis.",
    "content": "Natus quaerat qui. Voluptatem labore ea. Fuga eligendi veritatis."
  },
  "author": {
    "name": "Cole Shields",
    "signature": "I love you too, honey. Good luck with your show."
  }
}
```

- [ ] выдача всех непрочитанных пользователем новостей 
