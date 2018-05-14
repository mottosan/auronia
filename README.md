# README

# Setup
* Clone the repo `git clone https://github.com/mottosan/auronia.git`
* Change to repo directory `cd auronia`
* Install dependencies `bundle install`. Refer to (this_ page)[https://coderwall.com/p/whbzrw/install-mysql2-gem-in-mac-os-x-with-mysql-installed-via-brew] for mysql2 gem installation issues
* Launch mysql server `mysql.server start`
* Create database and tables `bundle exec rails db:create db:migrate db:seed`
* Create a new file `config/application.yml` and add a new key called `SECRET_KEY_BASE` set to any random value
* Launch the rails server `bundle exec rails s"
* Go to `localhost:3000/admin` to login with admin creds to view the admin dashboard

# Authentication API
* To authenticate send a curl request to 
`curl -H "Content-Type: application/json" -X POST -d '{"email":"email_address","password":"supersecurepassword"}' http://localhost:3000/v1/authenticate`
* Use the token returned to set the header in all future requests.

# Document API
* To create a new document for the authenticated user, send a POST request to /v1/documents
`curl -H "Authorization: <auth_token>" -X POST -F "document[name]=document_name" -F "document[attachment]=@/path/to/file.pdf" -F 
"document[tags_attributes][][name]=tag_name" http://localhost:3000/v1/documents`

* To display a single document, send a GET request to /v1/documents/<document_id>
`curl -H "Authorization: <auth_token>" http://localhost:3000/v1/documents/1`

* To list all documents for the user, send a GET request to /v1/documents
`curl -H "Authorization: <auth_token>" http://localhost:3000/v1/documents`

* To delete a document, send a DELETE request to /v1/documents/<document_id>
`curl -H "Authorization: <auth_token>" http://localhost:3000/v1/documents/1`

* To update a document, send a PUT request to /v1/documents/<document_id>
`curl -H "Authorization: <auth_token>" -X POST -F "document[name]=new_document_name" -F "document[attachment]=@/path/to/new_file.pdf" -F 
"document[tags_attributes][][name]=new_tag_name" http://localhost:3000/v1/documents/<document_id>`

# Tags API
* To list all tags for a document, send a GET request to /v1/documents/<document_id>/tags
`curl -H "Authorization: <auth_token>" http://localhost:3000/v1/documents/<document_id>/tags`

* To display a single tag for a document, send a GET request to /v1/documents/<document_id>/tags/<tag_id>
`curl -H "Authorization: <auth_token>" http://localhost:3000/v1/documents/<document_id>/tags/<tag_id>`

* To create a new tag for a document, send a POST request to /v1/documents/<document_id>/tags
`curl -H "Authorization: <auth_token>" -X POST http://localhost:3000/v1/documents/<document_id>/tags` -F "tag[name]=tag_name"

* To update a tag, send a PUT request to /v1/documents/<document_id>/tags/<tag_id>
`curl -H "Authorization: <auth_token>" -X PUT http://localhost:3000/v1/documents/<document_id>/tags/<tag_id>` -F "tag[name]=new_tag_name"

* To delete a tag, send a DELETE request ot /v1/documents/<document_id>/tags/<tag_id>
`curl -H "Authorization: <auth_token>" -X DELETE http://localhost:3000/v1/documents/<document_id>/tags/<tag_id>`
