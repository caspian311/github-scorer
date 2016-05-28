##Github Scorer##

This was based off of sample chapter I downloaded from "Refactoring to Collections" by Adam Wathan.

###Goal###

Given a github user name, create a score based on the following scoring criteria:

* PushEvent: 5pts
* CreateEvent: 3pts
* IssuesEvent: 2pts
* All other events: 1pt

To obtain the data needed for this, use the open github API:

    https://api.github.com/users/{your-username}/events

###Example###

Sample output:

    $ github-scorer caspian311
    Your Github score is 250


#The Build#

So for whatever reason I decided to use this as another example of getting Docker working.

##Building containers##

###Building mysql###

    $ docker build -t caspian311/github-scorer-db:1.0 db_server

###Building rails###

    $ docker build -t caspian311/github-scorer-app:1.0 app_server

##Starting containers##

###Starting mysql###

    $ docker run -d -p 3306:3306 caspian311/github-scorer-db:1.0

###Starting rails###

    $ docker run -d -p 3000:3000 caspian311/github-scorer-app:1.0


