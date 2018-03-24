# dput resource for Concourse CI

With this resource you can upload Debian/Ubuntu source packages to one of the
standard archives, including PPA's.

## Configuration

The following parameters are required

* `archive`: The archive to upload to
* `glob`: The `.sources` file to upload

## Example

The following is an example of how to use the resource. The steps to actually
build the source packages are left to the reader.

```
---
resource_types:
  - name: dput
    type: docker-image
    source:
      repository: seveas/concourse-dput-resource

resources:
  - name: dput
    type: dput

jobs:
  - name: ppa
    plan:
      - get: some-source-that-has-your-code
        trigger: true
      - task: build
        # This task should build the debian source package.
        config:
          inputs:
            - name: some-source-that-has-your-code
          outputs:
            - name: sources
      - put: debugme-dput
        params:
          archive: ppa:yourlogin/yourppa
          glob: sources/*.changes
```
