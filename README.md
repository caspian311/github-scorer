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

    $ ./build.sh

