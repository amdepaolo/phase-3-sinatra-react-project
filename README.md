# Phase 3 Project Backend
## Library Museum Pass Reservation database

This project was inspired by work at a public library that allows patrons to check out passes that grant admission to local museums and other similar sites.

It uses Ruby, active record, and Sinatra to create a database of the passes that are available, keep track of reservations associated with those passes, and provides an API for view, create, edit, and delete those reservations.

There are models for MuseumPasses and Reservations. The MuseumPass model has methods to create reservations associated with that model, as well as check to make sure reservation dates don't conflict with previously made reservations.

The application manager handles Create and Read actions for the MuseumPass, and full CRUD actions for Reservations.

This project has an associated repo that contains the front end.That repo can be [found here](https://github.com/amdepaolo/phase-3-project-front-end.git) 