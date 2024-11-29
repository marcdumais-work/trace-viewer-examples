# Resources for the "theia-app-demo" Example docker image

This folder contains the resources, needed to create a "demo" Docker image, based on one of the Theia app images. The demo image includes the necessary extras to easily perform a quick demo or immediately play with the trace viewer: the Eclipse Trace Compass Trace Server and a selection of Tutorial traces.

## Build the demo images

After connecting to either the tate or tave application using a browser, following the instructions below, the app should open with the trace server running and the workspace already selected, containing the tutorial traces, ready to use.

Run the following commands from the parent folder (\<repo root\>/docker):

```bash
# e.g. make "tate" / "tave" demo image(s)

# pre-requisite: the base image(s) need to be already built locally. 
# If not, or it they are not up-to-date, start by (re)building them:
yarn build:docker:tate
yarn build:docker:tave

# make the demo image(s) that extend the base image(s)
yarn build:docker:tate-demo
yarn build:docker:tave-demo
```

## Run the demo images

### tate-demo (isolated docker network)

Note: since the isolated docker network is used, you may start several containers from the tate-demo image and each one will have its own, indepandant trace server.

Run the following commands from the parent folder (\<repo root\>/docker):

```bash
# start the demo image
yarn run:docker:tate-demo

# using the start script above, the image is deployed isolated
# find its IP address:
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' tv-tate-demo-1
100.109.0.1

# connect to it (replace with the ip address you obtained in the
# previous step):
firefox 100.109.0.1:4000
```

### tave-demo (host network)

The trace viewer contained in the "tave" image uses vscode webviews. For security reasons, these webviews, by default, only work with SSL (HTTPS) and some extra network setup \[*\]. There is however an exception made for running the app on the localhost network, that's considered "safe" by default. It's beyond the scope of this guide to go into these details, so we will provide instructions to run that image using the host network, which should work OOTB locally and still be safe.

\[*\]: for more info start here:
https://github.com/eclipse-theia/theia/blob/86267992e133b3ee59508d4e2afbcfc6e384d61c/packages/plugin-ext/README.md

Note: because the image's trace server uses the host's network, it might interfere or be interfered-with, by a trace server running locally on the host or in another container running the same image. To avoid issues, kill any trace server running locally on the host before starting this demo image and kill the container before starting a local trace server.

Run the following commands from the parent folder (\<repo root\>/docker):

```bash
# start the demo image
yarn run:docker:tave-demo

# ***tave-demo***:
# using the start script above, the image is deployed using the 
# docker host network. 
firefox localhost:4000
```
