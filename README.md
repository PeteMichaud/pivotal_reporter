public_tracker
==============

Public Tracker is a Rails Mountable Engine that injects a reporting overlay for rails applications that ties into PivotalTracker in order to provide in-app bug reporting and feature requests.

Installation
============

## Install the Gem

    gem 'public_tracker', :git => 'git://github.com/7eyesllc/public_tracker.git'

    bundle install

## Set Up Route

In routes.rb:

```ruby
    mount PublicTracker::Engine => "/tracker" # can be mounted at whatever endpoint you want, not just /tracker
```

If you want to limit the engine to logged in users with devise then:

```ruby
authenticated :user do
    mount PublicTracker::Engine => "/tracker" # can be mounted at whatever endpoint you want, not just /tracker
end
```

## Configure

Add the top of the /config/application.rb:

    require "public_tracker"

Inside the application class defininion in /config/application.rb:

```ruby
PublicTracker.config do |config|
  config.token = '<your_api_token>'
  config.project_id = <your_project_id>
  config.mount_point = '/tracker'
  config.request_user = '<your_request_user>'
end
```

**API Token** can be found by visiting https://www.pivotaltracker.com/profile (logged in to your PivotalTracker account),
then scrolling all the way to the bottom.

**Project ID** is a large integer like `625931`. The idea behind this engine is that users can submit bugs and features
to a specific PivotalTracker project that corresponds to the rails application into which the engine is mounted. To find
your project ID, go to the project page in PivotalTracker and look at the url. The number in that URL is the Project ID.

**Mount Point** should match the endpoint you specified in your routes file in the previous step

**Request User** is the name of the PivotalTracker user under whom you will submit the bugs and features. The name is
literally just a name like "Pete Michaud" and should correspond exactly to the name of a project member who has access
to the project in PivotalTracker (otherwise the report submission will fail). Ideally this will be a generic "API user".

Alternatively, you can choose not to specify a request_user. What happens in that case is PublicTracker will look for a
variable called current_user (the devise gem, for example, would define current_user), and it calls the full_name method
on current_user. So instead of using "Pete Michaud" it would use `current_user.full_name`.

The only way that will work is if:
    1) You have authentication set up so that current_user.full_name is defined
    2) All users who access the reporting tool are authenticated
    3) All users of your application correspond to PivotalTracker users who have access to the PivotalTracker project
    4) All those users use the exact same names across the application and PivotalTracker

## Including the Widget

At this point the engine is mounted and accessible via the endpoint you specified. But the idea here is that the
reporting tool should be available at all times, on all pages. To make that happen:

1) Add `//= require public_tracker/report_button` to your application.js manifest

2) Add `*= require public_tracker/report_button` to your application.css manifest

The button should now appear.

## Customizing the Widget

If you want to change the style of the widget, add these definitions to your application css files:

```css
a#pt_report_button { } /* The Report button itself */

div#public_tracker { } /* The frame that appears after clicking the Report button */
```

If you want to style the report form or report list you'll have to fork and edit the engine repo. If that sounds
daunting, it's probably not worth the effort.

License
=======

MIT

