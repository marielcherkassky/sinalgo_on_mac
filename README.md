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
   If you don’t already have a display server, install [XQuartz](https://www.xquartz.org/).

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

   > This should launch the Sinalgo application on your host.

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
