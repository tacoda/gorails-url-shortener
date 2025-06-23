# URL Shortener

# Notes

## Creating the app

```sh
r new gorails-url-shortener -d postgresql --css tailwind
```

## Adding Initial Models

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
