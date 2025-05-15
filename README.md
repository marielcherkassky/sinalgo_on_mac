# Running Sinalgo with XQuartz on macOS

This guide explains how to set up your environment to run [Sinalgo](https://disco.ethz.ch/projects/sinalgo/) on macOS using XQuartz for GUI forwarding from a dev container.

---

## Prerequisites

- [XQuartz](https://www.xquartz.org/) installed
- VSCode with Dev Containers support
- Docker installed and running

---

## Setup Instructions

1. **Install XQuartz**  
   If you don't already have a display server, install [XQuartz](https://www.xquartz.org/).

2. **Enable Network Access in XQuartz**  
   - Open XQuartz
   - Go to `XQuartz` > `Preferences`
   - Under the **Security** tab, check:  
     ✅ *Allow connections from network clients*

3. **Allow Localhost Access to XQuartz**  
   Open your Mac terminal and run:
   ```bash
   xhost +localhost


4. **Build the Dev Container**
   Open the command palette in VSCode (`F1`) and run:

   ```
   Dev Containers: Rebuild Container Without Cache
   ```

5. **Verify Display Server Forwarding**
   Inside the container terminal, run:

   ```bash
   xlock
   ```

   > You should see a clock window open on your Mac.
   > If not, check that the `DISPLAY` environment variable is correctly set.

6. **Navigate to the Sinalgo Directory**
   List the directory to ensure `sinalgo` exists:

   ```bash
   ls -l sinalgo
   ```

   Change into it:

   ```bash
   cd ./sinalgo
   ```

7. **Run Sinalgo**
   Execute the run script:

   ```bash
   ./run.sh
   ```

   > This will launch the Sinalgo application with the project selector GUI by default.

---

## Sinalgo Runner Script Usage

The `run.sh` script provides a convenient way to launch Sinalgo in both GUI and batch modes, with various options.

**Usage:**
```bash
./run.sh [OPTIONS]
```

**Common Flags:**
- `-help`                   Show help message
- `-gui`                    Start in GUI mode (default)
- `-batch`                  Start in batch mode (no GUI)
- `-project <name>`         Load project by name
- `-rounds <n>`             Run for <n> rounds after startup
- `-refreshRate <n>`        Refresh GUI every <n> rounds
- `-gen '<args>'`           Generate nodes with type, distribution, and models
- `-overwrite '<k=v>'`      Override config parameters (quoted)

**Examples:**

- Launch project selector (default when no args):
  ```bash
  ./run.sh
  ```

- Run sample1 project with 1000 nodes of type S1Node:
  ```bash
  ./run.sh -project sample1 -gen "1000 sample1:S1Node Random" -rounds 10 -refreshRate 2
  ```

- Run sample2 with specific connectivity and mobility models:
  ```bash
  ./run.sh -project sample2 -gen "10000 sample2:S2Node Random C=QUDG M=sample2:LakeAvoid"
  ```

- Enable mobility, disable interference, set rMax to 50:
  ```bash
  ./run.sh -project sample1 -overwrite "mobility=true interference=false GeometricNodeCollection/rMax=50"
  ```

- Generate multiple node groups:
  ```bash
  ./run.sh -project sample1 -gen "100 sample1:S1Node Random UDG" -gen "50 DummyNode Circle QUDG" -gen "10 sample2:S2Node Random"
  ```

- Batch mode (no windows):
  ```bash
  ./run.sh -batch -project sample1 -rounds 1000
  ```

---

## Troubleshooting

* If you see an error like `Can't open display`, verify:

  * XQuartz is running
  * `DISPLAY` is set to `host.docker.internal:0` (inside the dev container)
  * `xhost +localhost` was run **after** launching XQuartz and before building the dev container.

---

## Notes

* `xlock` is used here as a simple way to test GUI forwarding.
* If needed, set the `DISPLAY` variable manually inside the container:

  ```bash
  export DISPLAY=host.docker.internal:0
  ```

---

Happy simulating! 🚀
