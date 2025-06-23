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
