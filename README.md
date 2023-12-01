# README

### When setting up the application for Guard file 

Gems used for Live reload
+ listen
+ guard
+ guard-zeus
+ rack-liverload
+ guard-livereload

These gemfiles are already on Gemfile, so just run

```bundle```

To Generate a guard file run

  ```guard init livereload```

Then run the rails server on one terminal using

  ```bin/dev```

And another terminal run

  ```guard```

  Change the view file and see the browser reload
