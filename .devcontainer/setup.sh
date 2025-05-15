#!/bin/bash
set -e

# Only run if ./sinalgo does not already exist
if [ ! -d "sinalgo" ]; then
  echo "📥 Downloading Sinalgo..."
  wget -O sinalgo.zip "https://sourceforge.net/projects/sinalgo/files/sinalgo/sinalgo-0.75.3/sinalgo-0.75.3-regularRelease.zip/download"

  echo "📦 Creating sinalgo directory..."
  mkdir -p sinalgo

  echo "📂 Extracting into ./sinalgo..."
  unzip sinalgo.zip -d sinalgo

  rm sinalgo.zip
  cp .devcontainer/run_sinalgo.sh sinalgo/run.sh
  chmod +x sinalgo/run.sh


  echo "✅ Sinalgo is ready in ./sinalgo"
else
  echo "📦 Directory ./sinalgo already exists. Skipping download."
fi
