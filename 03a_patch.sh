#!/bin/bash

set -euo pipefail


kubectl patch cm config-logging-triggers -n tekton-pipelines  -p '{"data": {"zap-logger-config": "{\n  \"level\": \"debug\",\n  \"development\": false,\n  \"sampling\": {\n    \"initial\": 100,\n    \"thereafter\": 100\n  },\n  \"outputPaths\": [\"stdout\"],\n  \"errorOutputPaths\": [\"stderr\"],\n  \"encoding\": \"json\",\n  \"encoderConfig\": {\n    \"timeKey\": \"ts\",\n    \"levelKey\": \"level\",\n    \"nameKey\": \"logger\",\n    \"callerKey\": \"caller\",\n    \"messageKey\": \"msg\",\n    \"stacktraceKey\": \"stacktrace\",\n    \"lineEnding\": \"\",\n    \"levelEncoder\": \"\",\n    \"timeEncoder\": \"iso8601\",\n    \"durationEncoder\": \"\",\n    \"callerEncoder\": \"\"\n  }\n}\n"}}'
kubectl delete deployment el-webhook
