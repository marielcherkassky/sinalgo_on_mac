# sinalgo_on_mac

1. First, install a display server if you dont have one (e.g XQuartz - https://www.xquartz.org/.).
2. Open XQuartz settings -> under security check "Allow connections from network clients".
2. On your mac's terminal run : `xhost +localhost`
2. Build your dev container in vscode (F1 => `Dev Containers: Rebuild Container Without Cache`)
3. Run in the terminal `xlock` to check that the display server forwarding works. (Expect a clock app to open on your host)
4. The sinalgo dir should be available under the root directory : `/sinalgo`
5. To run sinalgo just run : `/sinalgo/run.sh`. It should open the app on the host.