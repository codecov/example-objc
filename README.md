Codecov Xcode Example
==================

| [https://codecov.io][1] | [@codecov][2] | [hello@codecov.io][3] |
| ----------------------- | ------------- | --------------------- |

This repository serves as an **example** on how to use [Codecov Global][4] for Xcode in both Objective-C and Swift.

# Setup

* Create a shared scheme for your test target https://i.imgur.com/JKNFq0G.png
* At the highest, your deployment target can be 8.1 or earlier. This will update as Travis supports more simulators.
* Write unit tests
* Setup your CI

# Travis CI

Add to your `.travis.yml` file.
```yml
language: objective-c
script: 
  - xctool -project {{path_to_xcproject}} -scheme {{your_testing_schema}} build test -sdk iphonesimulator GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES
after_success:
  - bash <(curl -s https://codecov.io/bash)
```

> Reference http://docs.travis-ci.com/user/languages/objective-c/

The two important parts are: 
* `GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES` (To have Xcode create code coverage files)
* `bash <(curl -s https://codecov.io/bash)` (To upload code coverage to Codecov.io)

This is used to have Xcode output code coverage files for Codecov.io to process. 

## Private Repos
> Set `CODECOV_TOKEN` in your environment variables.

Add to your `.travis.yml` file.
```yml
env:
  global:
    - CODECOV_TOKEN=:uuid-repo-token

after_success:
  - bash <(curl -s https://codecov.io/bash)
```

View source and learn more about [Codecov Global Uploader][4]

[1]: https://codecov.io/
[2]: https://twitter.com/codecov
[3]: mailto:hello@codecov.io
[4]: https://github.com/codecov/codecov-bash

