#!/bin/bash
set -e

cd "$(dirname "$0")/.."

# Only run if ./sinalgo does not already exist
if [ ! -d "sinalgo" ]; then
  echo "📥 Downloading Sinalgo..."
  wget -O sinalgo.zip "https://sourceforge.net/projects/sinalgo/files/sinalgo/sinalgo-0.75.3/sinalgo-0.75.3-regularRelease.zip/download"

  echo "📦 Creating sinalgo directory..."
  mkdir -p sinalgo

  echo "📂 Extracting into ./sinalgo..."
  unzip sinalgo.zip -d sinalgo

  echo "🧹 Cleaning up..."
  rm sinalgo.zip

  echo "java -cp "binaries/bin:binaries/jdom.jar" sinalgo.Run" > ./sinalgo/run.sh
  chmod +x ./sinalgo/run.sh

  echo "✅ Sinalgo is ready in ./sinalgo"
else
  echo "📦 Directory ./sinalgo already exists. Skipping download."
fi
