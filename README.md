Pivatal Tracker API JSON Proxy
------------------------------

Small Sinatra app that wraps the Pivotal Tracker XML API and converts the output to JSON.

Usage
=====

      rackup

      # Authorization
      curl -d email=<email> -d password=<password> -X POST http://localhost:9292/auth

      # Projects

      GET /projects
      GET /projects/:id

      # Memeberships

      GET /projects/:project_id/memberships
      GET /projects/:project_id/memberships/:id

      # Iterations

      GET /projects/:project_id/iterations
      GET /projects/:project_id/iterations/:group

      # Stories

      GET /projects/:project_id/stories
      GET /projects/:project_id/stories/:id

      # Tasks

      GET /projects/:project_id/stories/:story_id/tasks
      GET /projects/:project_id/stories/:story_id/tasks/:id
      

Todo
====

Still need to do a lot of the other API actions.  Mainly all the create/update actions.

License
=======

Pivotal Tracker API Proxy is released under the MIT License.
