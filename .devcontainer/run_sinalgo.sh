#!/bin/bash

# Default paths
BIN_DIR="binaries/bin"
JDOM_JAR="binaries/jdom.jar"
MAIN_CLASS="sinalgo.Run"

# Uncomment to enable headless mode for true batch runs
# JAVA_OPTS="-Djava.awt.headless=true"

# Show help message
print_usage() {
  echo ""
  echo "Sinalgo Simulation Runner"
  echo "=========================="
  echo "Usage: ./sinalgo.sh [OPTIONS]"
  echo ""
  echo "If no arguments are passed, you’ll be prompted to launch with defaults or view help."
  echo ""
  echo "Common Flags:"
  echo "  -help                   Show this help message"
  echo "  -gui                    Start in GUI mode (default)"
  echo "  -batch                  Start in batch mode (no GUI)"
  echo "  -project <name>         Load project by name"
  echo "  -rounds <n>             Run for <n> rounds after startup"
  echo "  -refreshRate <n>        Refresh GUI every <n> rounds"
  echo "  -gen '<args>'           Generate nodes with type, distribution, and models"
  echo "  -overwrite '<k=v>'      Override config parameters (quoted)"
  echo ""
  echo "Examples from Official Documentation:"
  echo ""
  echo "▶ Launch project selector (default when no args):"
  echo "  ./sinalgo.sh"
  echo ""
  echo "▶ Example 1: Run sample1 project with 1000 nodes of type S1Node"
  echo "  ./sinalgo.sh -project sample1 -gen \"1000 sample1:S1Node Random\" -rounds 10 -refreshRate 2"
  echo ""
  echo "▶ Example 2: Run sample2 with specific connectivity and mobility models"
  echo "  ./sinalgo.sh -project sample2 -gen \"10000 sample2:S2Node Random C=QUDG M=sample2:LakeAvoid\""
  echo ""
  echo "▶ Example 3: Enable mobility, disable interference, set rMax to 50"
  echo "  ./sinalgo.sh -project sample1 -overwrite \"mobility=true interference=false GeometricNodeCollection/rMax=50\""
  echo ""
  echo "▶ Example 4: Generate multiple node groups"
  echo "  ./sinalgo.sh -project sample1 -gen \"100 sample1:S1Node Random UDG\" -gen \"50 DummyNode Circle QUDG\" -gen \"10 sample2:S2Node Random\""
  echo ""
  echo "▶ Batch mode (no windows):"
  echo "  ./sinalgo.sh -batch -project sample1 -rounds 1000"
  echo ""
}

# If -help flag is passed
for arg in "$@"; do
  if [[ "$arg" == "-help" ]]; then
    print_usage
    exit 0
  fi
done

# If no arguments provided, prompt the user
if [ $# -eq 0 ]; then
  echo "No arguments provided."
  echo "What would you like to do?"
  echo "[d] Run Sinalgo with default project selector"
  echo "[h] Show help guide"
  read -rp "Enter your choice [d/h]: " choice

  case "$choice" in
    d|D)
      echo "Launching Sinalgo with project selector GUI..."
      java -cp "$BIN_DIR:$JDOM_JAR" $MAIN_CLASS
      exit 0
      ;;
    h|H)
      print_usage
      exit 0
      ;;
    *)
      echo "Invalid input. Exiting."
      exit 1
      ;;
  esac
fi

# Build and run full command
CMD="java $JAVA_OPTS -cp $BIN_DIR:$JDOM_JAR $MAIN_CLASS $@"
echo "Running: $CMD"
eval "$CMD"
