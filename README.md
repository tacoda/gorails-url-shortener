# URL Shortener

# Notes

## Creating the app

```sh
r new gorails-url-shortener -d postgresql --css tailwind
```

## Add Link Model

```sh
r g model Link url title description image views_count:integer
r db:migrate
```

- Add links resource routes
- Add root route
- Add links controller
- Add views folder and link index view

```sh
bin/dev
```

- Add typography import to `tailwind/application.css`
- Update layout view
- Add form to create a new link on the link index page
- Add basic styling for using prose, and updating background color
- Add create action to link controller
- Add model validation to require link
- Add required to form input
- Render links in index view
- Update index to get links by created_at desc
- Refactor into a scope
- Add link partial

## Base62 Encoding

- Add base62 model
- Add tests for new model

```sh
r db:create
r test test/models/base62_test.rb
```

- Make tests pass
- Refactor base62 class to shortcode

```sh
r test test/models/short_code_test.rb
```

## Base62 Decoding

- Reverse expectations for test
- Implement model changes to make the test pass

## Find link by ShortCode

- Override `Link#to_param` to use `ShortCode`
- Add show action and view
- Override `Link.find` to use `ShortCode`

## Short URL Link Redirects

- Add views show route
- Add views controller
- Add show action
- Grab external link icon from heroicons
- Add link to link partial

## View Charts for Links

```sh
bundle add chartkick groupdate
```

- Add importmap config
- Add imports to `javascript/application.js`

```sh
bin/dev
```

- Add chart to link show view
- Add view model

```sh
r g model View link:belongs_to user_agent ip
r db:migrate
```

- Add association to Link
- Add counter cache to association in View
- Track the view in the view show action
- Add views count to link partial
- Update api call for chart

## Improving link designs

- Add edit link to show view
- Add edit, update, and destroy actions to links controller
- Add these actions to before_action call too
- Create edit view
- Create form partial and use it in index and edit views
- Add cancel link and delete button to edit page
- Implement update and delete actions
- Add rescue_from in views controller to handle link not found
- Add notice and alert to layout view
- Add back link on show page
- Style the link partial
- Update style on the show page
- Add image tag for favicon to link partial
- Add domain method to Link model
- Add favicon to view show page also
- Add favicon helper to refactor

## Retrieving Link Metadata

- Add after_save_commit callback to Link model
- Create MetadataJob
- Create Metadata model
- Add Metadata test

```sh
r test test/models/metadata_test.rb
```

Useful documentation: https://ogp.me

- Update link partial view
- Add turbo stream for link partial
- Update job to use turbo stream
- Add respond_to to link create action for turbo stream
- Clear out form input after submission
  - First method is using turbo stream to replace the link_form
  - Second method is using a Stimulus controller here

## Copy Link to Clipboard

Using https://clipboardjs.com and https://atomiks.github.io/tippyjs/

- Add tippy production cdn links to application layout
- Add clipboard using npm (via rails binary)

```sh
bin/importmap pin clipboard
```

- Rename hello_controller stimulus controller to clipboard_controller
- Add implementation to stimulus controller
- Update link partial to use a button and call the controller
- Copy button to view show page

## Deploy to Production

To change database:

```sh
r db:system:change --to=postgresql
```

To lock the bundle for linux:

```sh
bundle lock --add-platform x86_64-linux
```

```sh
fly launch
```

If background jobs don't work, install the Sucker Punch gem to run the jobs in the same process

```sh
bundle add sucker_punch
```

- Add sucker_punch queue adapter in `config/application.rb`

Deploy again

```sh
fly deploy
```

## Add Users

```sh
bundle add devise
r g devise:install
# Add default url options for development
r g devise User
r db:migrate
r g migration AddUserIdToLinks user_id:integer
r db:migrate
```

- Add optional relation to Link model
- Add relation to User model
- Update link index page to add nav links
- Move new markup to `layout/application` view
- Add user to link in links controller create action
- Add helper methods to Link model
- Add before_action to Link controller to use this new helper method
- Update link show page to display edit link only when appropriate

## Add Link Integration Tests

- Add user fixture
- Add link fixtures

List options for generators

```sh
r g -h
r g integration_test link
```

- Add tests to `test/integration/link_test.rb`
- Refactor Link lookup to use custom method instead of overriding find
- Add `user_test.rb`

```sh
r test test/integration/link_test.rb
```

## Adding Pagination

Create a bunch of links to work with

```sh
r c
```

```ruby
100.times { Link.create!(url: "https://example.com") }
```

```sh
bundle add pagy
```

- Include `Pagy::Backend` in Links Controller
- Include `Pagy::Frontend` in `application_helper.rb`
- Update Link Controller index action to use pagy
- Add pagy nav to index view
- Add styling to pagy nav

```sh
r test
```

- Add rescue for overflow error
- Fix test failures and errors

Adding another line to trigger a deployment
Adding another line to trigger a deployment
