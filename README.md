List of Apis:
1) User's sign_up
    url: localhost:3000/users
    method: Post
    params: {
              "user":{
                "email": email of user,
                "password": password of user,
                "password_confirmation": confirm password of user,
                "name": name of user
              }
            }
    headers: 1. Content-Type - application/json

2) User's sign in / create token
    url: localhost:3000/oauth/token
    method: Post
    params: {
              "email": email of user,
              "password": password of user,
              "grant_type": "password"
            }
    headers: 1. Content-Type - application/json

3) User's log out / Revoke token
    url: localhost:3000/oauth/revoke
    method: Post
    params: {
              "token": auth_token
            }
    headers: 1. Content-Type - application/json

4) Follow a user
    url: localhost:3000/relationships
    method: Post
    pass the params in form-data
    params: followed_id: user_id
    headers: 1. Content-Type - application/json
             2. Authorization - "Bearer" + auth_token

5) Unfollow a user
    url: localhost:3000/relationships/user_id
    method: Delete
    headers: 1. Content-Type - application/json
             2. Authorization - "Bearer" + auth_token

6) Create the Tweet
    url: localhost:3000/tweets
    method: Post
    pass the params in form-data
    params: tweet[content]: content of tweet
    headers: 1. Content-Type - application/json
             2. Authorization - "Bearer" + auth_token

7) list tweets from users one follows with sorting
    url: localhost:3000/tweets?user_id={user_id}
    method: Get
    headers: 1. Content-Type - application/json
             2. Authorization - "Bearer" + auth_token

8) User profile Api with list of followers and followings
    url: localhost:3000/user_profile
    method: Get
    headers: 1. Content-Type - application/json
             2. Authorization - "Bearer" + auth_token