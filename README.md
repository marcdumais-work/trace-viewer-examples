# Trace Viewer Examples

Trace viewer example applications and building blocks that can be used in or with them. Each application integrates either the [Eclipse Theia trace viewer extension](https://www.npmjs.com/package/theia-traceviewer) (npmjs.com) or the [Trace Viewer extension for VSCode](https://open-vsx.org/extension/eclipse-cdt/vscode-trace-extension) (open-vsx.org).

## Requirements

### General Requirements

Generally speaking, all trace viewer example applications rely on the Trace Server Protocol (TSP), and require a compatible _Trace Server_. ATM it's left to the user to provide the trace server, start it and potentially configure the example application to access it, if it's not on the default host/port (localhost:8080). For more details, please consult the following documentation:

- obtaining/using the Eclipse Trace Compass trace server: [doc](https://github.com/eclipse-cdt-cloud/vscode-trace-extension/blob/master/vscode-trace-extension/README.md#obtain-the-trace-server-eclipse-trace-compass)
- using the theia trace viewer extension: [README](https://github.com/eclipse-cdt-cloud/theia-trace-extension#using-the-trace-extension)
- using the trace viewer for vscode: [README](https://github.com/eclipse-cdt-cloud/vscode-trace-extension/blob/master/vscode-trace-extension/README.md)

### Development Requirements

To build Theia-based applications "natively", i.e. not in docker:

- see this page: [Theia Developing.md "Prerequisites"](https://github.com/eclipse-theia/theia/blob/master/doc/Developing.md#prerequisites)

To build the docker images you need to have Docker, or potentially a replacement such as Podman, installed and configured to be usable as a non-admin user.

## Examples Applications

### Docker examples

Easy to consume _trace viewer appliance_ Docker images, that you can build yourself. For more details look under folder [docker](./docker)

### Electron

(TODO) Electron-based desktop trace viewer application, that can be packaged for distribution
