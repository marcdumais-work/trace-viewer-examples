# Resources for the "tave" example docker image

This folder contains the resources, needed to create a docker image example, that bundles at its core a Theia-based application that uses the _Trace Viewer for VSCode_ front-end.

`package.json`: This is where the Theia application is defined
`docker-entrypoint.sh`: the docker entrypoint script, that's called when starting a container based on the image
`webpack.config.js`: a webpack configuration file, used when building the Theia application

Notes:

- the various `@theia` packages used in the app need to be the same version as the ones used in other Theia apps in this monorepo, such that a single version of the Theia framework is pulled by `yarn`, else there will be problems

To check for this, run `yarn` in the parent folder and then `yarn why @theia/core` and confirm a single version is reported. e.g.:

```bash
[...]
=> Found "@theia/core@1.49.1"
[...]
