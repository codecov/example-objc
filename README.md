# [Codecov][1] Objective-C Example
[![codecov.io](http://codecov.io/github/codecov/example-objc/branch/master/graphs/badge.svg)](http://codecov.io/github/codecov/example-objc)
> PS there is a Swift specific example here https://github.com/codecov/example-swift

## Guide
### Travis Setup

Add to your `.travis.yml` file.
```yml
language: objective-c
script: 
  - xctool -project {{path_to_xcodeproj}} -scheme {{your_testing_scheme}} build test -sdk iphonesimulator GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES
after_success:
  - bash <(curl -s https://codecov.io/bash)
```
### Produce Coverage Reports
The two important parts are:

- `GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES GCC_GENERATE_TEST_COVERAGE_FILES=YES` (To have Xcode create code coverage files)
* Create a shared scheme for your test target https://i.imgur.com/JKNFq0G.png
* xctool also does not respect the `/Scheme/TestAction/@codeCoverageEnabled` setting in `.xcscheme` files. Make sure `-enableCodeCoverage YES` is set.
## Caveats
### Private Repos
Add to your `.travis.yml` file.
```yml
after_success:
  - bash <(curl -s https://codecov.io/bash) -t uuid-repo-token
```
### Build specific projects
```
# match ExampleName and ExampleNameTests
bash <(curl -s https://codecov.io/bash) -J 'ExampleName'

# user regexp to match only ExampleName and not ExampleNameTests
bash <(curl -s https://codecov.io/bash) -J '^ExampleName$'
```
## Support

### Contact
- Intercom (in-app messanger)
- Email: support@codecov.io
- Slack: slack.codecov.io
- [gh/codecov/support](https://github.com/codecov/support)

1. More documentation at https://docs.codecov.io
2. Configure codecov through the `codecov.yml`  https://docs.codecov.io/docs/codecov-yaml



[1]: https://codecov.io/
[2]: https://github.com/codecov/example-php/blob/master/.travis.yml#L15
[3]: https://github.com/codecov/example-php/blob/master/.travis.yml#L18
[4]: https://github.com/codecov/codecov-python
