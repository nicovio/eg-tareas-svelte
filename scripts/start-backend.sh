#!/bin/bash
set -e

BACKEND_DIR="../eg-tareas-springboot-kotlin"
PORT=9000
REPO_URL="https://github.com/uqbar-project/eg-tareas-springboot-kotlin"

if [ ! -d "$BACKEND_DIR/.git" ]; then
  echo "📥 Cloning repository into $BACKEND_DIR..."
  mkdir -p "$(dirname "$BACKEND_DIR")"
  git clone "$REPO_URL" "$BACKEND_DIR"
fi

cd "$BACKEND_DIR"
./gradlew bootRun -Pserver.port=$PORT --no-daemon

# no hay que tratar de levantar en el mismo comando back y front
# porque se va a quedar colgado una vez que levanta Springboot