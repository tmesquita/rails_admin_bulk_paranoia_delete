# Rails Admin Bulk Paranoia Delete

Rails Admin plugin to add a custom bulk delete action that plays nicely with objects that `acts_as_paranoid`

## Installation

To enable rails_admin_bulk_paranoia_delete, add the following to your `Gemfile`:

```ruby
gem 'rails_admin_bulk_paranoia_delete', :git => 'https://github.com/tmesquita/rails_admin_bulk_paranoia_delete.git'

```
Add in your `config/initializers/rails_admin.rb` initializer the configuration:

```ruby
RailsAdmin.config do |config|
  config.actions do
    dashboard
    index
    new
    export
    history_index
    bulk_delete
    show
    bulk_paranoia_delete   # Add the bulk_paranoia_delete action
    edit
    delete
    history_show
    show_in_app
  end
end
```


## Contributing
Submitting a Pull Request:

1. Fork the repository.

2. Create a topic branch.

3. Implement your feature or bug fix.

4. Add, commit, and push your changes.

5. Submit a pull request.

   ​


## License
This gem is released under the MIT license.