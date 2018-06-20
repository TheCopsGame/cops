# The Cops
Online RPG where you start as a rookie police officer and try to make it to the top

#### Setup
To run the game, follow the steps below:
```shell
bundle install
bundle exec figaro install
```
Create a PostgreSQL user named `cops` like this:
```shell
sudo -u postgres createuser -s cops
sudo -u postgres psql
\password cops
\q
```
The `figaro` gem (installed on the first step) will generate the unversioned file `config/application.yml`. Copy and paste the content from `config/application.yml.example` to `config/application.yml` and fill in the data needed.

After this, execute the following steps:
```shell
rake db:create
rake db:migrate
```
Finally, run the game:
```shell
rails s
```

#### Tests and coverage
Run the tests using:
```shell
bundle exec rspec
```
You can check the coverage for the project opening the `coverage/index.html` generated every time you run the RSpec.

#### Commit
Before pushing a commit, be sure to run the Rubocop and the tests:
```shell
rubocop -a
bundle exec rspec
```