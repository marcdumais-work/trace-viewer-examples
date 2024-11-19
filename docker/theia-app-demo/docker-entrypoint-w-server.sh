#!/usr/bin/env bash
# start trace server
/app/trace-compass-server/tracecompass-server &
# @theia/cli not installed, so start the app directly.
# Use Tutorial traces folder as workspace for easy access to traces
node ./src-gen/backend/main.js --hostname 0.0.0.0 --port 4000 --plugins=local-dir:plugins /workspaces/TraceCompassTutorialTraces/