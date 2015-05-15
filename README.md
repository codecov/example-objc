Codecov Xcode Example
==================

| [https://codecov.io][1] | [@codecov][2] | [hello@codecov.io][3] |
| ----------------------- | ------------- | --------------------- |

This repository serves as an **example** on how to use [Codecov Global][4] for Xcode in both Objective-C and Swift.

# Setup

* Create a shared scheme for your test target https://i.imgur.com/JKNFq0G.png
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

> All other CI you can simply run `bash <(curl -s https://codecov.io/bash)`.

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
