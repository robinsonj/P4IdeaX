# BBYIDX - Share your ideas

[BBYIDX](https://github.com/ecumen/ideabox) is a free and open source idea-gathering application written in Ruby and distributed under the GNU Affero General Public License.

The application has been recreated as P4IdeaX as an update to Rails 4.

## Requirements

### Ruby & Rails versions

The application runs on Ruby 2.0 and Rails 4.0.

### Database

The app requires a PostgreSQL database and runs on version 9.3.

The application takes advantage of Postgres' text search capabilities and as such does not current work with other database systems.

If you want to run it on MySQL, we welcome patches! However, it will likely require a dependency on an external search engine.

### System Requirements

The application expects its gem dependencies to be managed by **rvm** and **bundler**.

## Configuration

You will first need to edit the following files to get the app running in your environment:

* config/environment_custom.rb
* config/database.yml
* config/omniauth_providers.yml (Twitter and Facebook integration)

_* Note: Don't use the same database for development & testing as production. Specify separate databases for different environments. *_

## Customization

To customize the UI, edit / create files in the following directories:

* app/views/
* app/assets/stylesheets/
* app/assets/images/

## Installation

1. `git clone https://github.com/robinsonj/P4IdeaX && cd ./P4IdeaX`
2. `$ bundle install`
3. `$ psql template1 -c "CREATE USER ideabox WITH CREATEDB PASSWORD 'ideabox';"`
4. `$ rake db:create && rake db:migrate`
5. `$ rails server`

_* Note: Use the same name and password set here in the config/database.yml configuration. *_

## Testing

BBYIDX uses Rspec for its testing suite. To verify the application is working correctly, run:

`$ rspec`

If you submit patches, please make sure that they don't break existing tests.
