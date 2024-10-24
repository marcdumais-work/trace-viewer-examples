# Docker examples

This folder and sub-folders contain what's necessary to build Trace Viewer example Docker images, that each contain a Trace Viewer frontend application.

Each application has a `DockerFile` in this folder and its resources in a sub-folder:

- `DockerFile-tate, resources folder: theia-app-theia-ext/`: Dockerfile and resourced needed to build a Trace Viewer Appliance, using a Theia application that includes the _Theia Trace Viewer_ _(Theia) extension_, installed [from npm][npm package].
- `DockerFile-tave, resources folder: theia-app-vscode-ext/`: Dockerfile and resources needed to build a Trace Viewer Appliance, using a Theia application that includes the _Trace Viewer for VSCode_ _(vsix) extension_, installed [from the open vsx public registry][vsix package]

Note:

- the images will contain exclusively the trace viewer front-end. If you want to run a complete _trace viewer_ application, you will need a service running the trace-server (not included here)
- see section "Docker tips and tricks" if you are relatively new to Docker and want to learn about some potential alternatives or refinements about some of the commands in this document.

## Quickly Build/Run the example Docker images

(_see section further down to learn how to manually build/run the images_)

For convenience and use in CI, there are `package.json scripts` to build the docker images on Linux. Note that it's not necessary to build anything in the repo first:

```bash
$ cd <repo>/docker

# build all docker images
$ yarn build:docker


# build docker images individually

# build "tate" image: Theia app that uses 
# the theia trace viewer extension:
$ yarn build:docker:tate
# Run image:
$ yarn run:docker:tate


# build "tave" image: Theia app that uses 
# the vscode trace viewer extension:
$ yarn build:docker:tave
# Run image:
$ yarn run:docker:tave

# Access the application at http://localhost:4000/
# e.g.:
$ firefox http://localhost:4000

```

## Manually Build/run the example Docker images

The Docker images can be build from the `<repo>/docker` folder. For each image, the resources it needs are in a sub-folder, whose name is passed as a `docker build` build argument and used to retrieve expected resourced needed during image build.

### Build/Run the "tate" image

Build the image and name it _tv-tate_ (short for `"trace viewer - theia application/theia extension"`). You may use a different name if you prefer.

Try adding `--network host` in case of build failures related to debian packages retrieval:

```bash
docker build -f Dockerfile-tate -t tv-tate --build-arg RESOURCES=theia-app-theia-ext .
```

Once the image has been built, start a container named _tv-tate-1_ from the _tv-tate_ image:

```bash
# Keep container after the execution is done:
docker run --name tv-tate-1 --network="host" tv-tate
# if you do not need the container after execution and want
# to avoid having to clean-up:
docker run --rm --name tv-tate-1 --network="host" tv-tate
```

Find the IP address of the _tv-tate-1_ container:

```bash
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tv-tate-1
```

Connect to port `4000` of the IP identified earlier using your browser. You should be able to see the theia-trace-extension UI. If it is not visible, click on `View -> Open View... -> Trace Viewer`

Alternatively, one may start the container using "--network host" and then the app will be accessible opening in the browser: "localhost:4000":

```bash
docker run --name tv-tate-1 --network="host" tv-tate
# open "http://localhost:4000" in browser. e.g.:
firefox http://localhost:4000
```

#### Connect to a remote trace-server

Let's say you have another container running the trace-server at IP 172.17.0.2, port `8080`. You can launch the _tv-tate-1_ container and connect it to the trace-server using the following command:

```bash
docker run --name tv-tate-1 --network="host" -e TRACE_SERVER_URL=172.17.0.2:8080/tsp/api tv-tate
```

### Build/Run the "tave" image

Build the image and name it _tv-tave_ (short for `"trace viewer - theia application/vscode extension"`). You may use a different name if you prefer.

Try adding `--network host` in case of build failures related to debian packages retrieval.

```bash
docker build -f Dockerfile-tave -t tv-tave --build-arg RESOURCES=theia-app-vscode-ext .
```

Once the image has been built, start a container named _tv-tave-1_ fromthe _tave_ image:

```bash
docker run --name tv-tave-1 --network host tv-tave
```

Connect to `localhost:4000` your browser. You should be able to see the trace-extension UI. If it is not visible, click on `View -> Open View... -> Trace Viewer`

## Development

When the _Theia applications_ are modified/updated, e.g. to update the contained trace extension or for other reasons, it's important to build the modified app(s) outside Docker and check-in the modified `yarn.lock`. The lock file is used when building in the container, to insure a known/curated set of dependencies/versions are used. Without the lock file, unexpected 3PPs or versions of 3PPs might be pulled.

To build the Theia applications:

```bash
# build both apps (dev)
$ yarn && yarn build

# build both apps (prod version)
$ yarn && yarn build:prod
```

If after the build, it turns-out that `yarn.lock` has been modified, the new version needs to be upstreamed as part of the PR that changed the Theia application.

## Docker tips and tricks

### docker run

#### Dangling containers

If a container already exists with the same name, you will get an error like this:

> docker: Error response from daemon: Conflict. The container name "/tv-tate-1" is already in use by container "bdc7e40b3c61d60538b54e2842c34a66e9641d00b17511096d01d7db81e4782f". You have to remove (or rename) that container to be able to reuse that name.

Option 1: you may delete the old version of that container:

```bash
# The error message above provides the container id. You may use it
# directly to delete the container (you may use the beginning of the SHA):
docker rm bdc7e40b

# If you need to find the id for the old container yourself:
docker ps -a
CONTAINER ID   IMAGE                        COMMAND                  CREATED          STATUS                        PORTS     NAMES
bdc7e40b3c61   tv-tate                      "docker-entrypoint.sh"   56 minutes ago   Exited (137) 13 minutes ago             tv-tate-1
```

Options 2 and 3 will avoid the error in the future:

Option 2: use "--rm" when running "docker run" so that docker will itself remove the container upon exit:

```bash
# for example
docker run --rm --name tv-tate-1 tv-tate
```

option 3: do not name the containers and let Docker give them a randomly-generated name.

```bash
# for example
docker run --rm tv-tate
# use "docker ps" to find the name
docker ps
CONTAINER ID   IMAGE                        COMMAND                  CREATED         STATUS         PORTS      NAMES
693f53e05929   tv-tate                      "docker-entrypoint.sh"   4 seconds ago   Up 3 seconds   4000/tcp   eloquent_wozniak

# in this case the container is named: "eloquent_wozniak"

```

### docker build

If docker can't connect to the apt repository to fetch required packages, use "--network host". e.g.:

```bash
# if this times-out accessing the apt repo
docker build -f Dockerfile-tate -t tv-tate --build-arg RESOURCES=theia-app-theia-ext .

# try this instead:
docker build --network host -f Dockerfile-tate -t tv-tate --build-arg RESOURCES=theia-app-theia-ext .
```

### docker network

Using "--network host" as part of "docker run [...]": This configures the Docker container to use the host network stack directly instead of creating an isolated network namespace for the container. This can make some use-cases easier, e.g. having the trace viewer app running in the container accessing a trace server running on the host.

But be aware that this may have security implications in some contexts.

[npm package]: https://www.npmjs.com/package/theia-traceviewer
[vsix package]: https://open-vsx.org/extension/eclipse-cdt/vscode-trace-extension