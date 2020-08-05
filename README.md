# [Codecov](https://codecov.io) Objective-C Example
> For a Swift-specific example, see https://github.com/codecov/example-swift

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
### Private Repo
Repository tokens are required for (a) all private repos, (b) public repos not using Travis-CI, CircleCI or AppVeyor. Find your repository token at Codecov and provide via appending `-t <your upload token>` to you where you upload reports.

### Build specific projects
```
# match ExampleName and ExampleNameTests
bash <(curl -s https://codecov.io/bash) -J 'ExampleName'

# user regexp to match only ExampleName and not ExampleNameTests
bash <(curl -s https://codecov.io/bash) -J '^ExampleName$'
```

## Links
- [Community Boards](https://community.codecov.io)
- [Support](https://codecov.io/support)
- [Documentation](https://docs.codecov.io)
