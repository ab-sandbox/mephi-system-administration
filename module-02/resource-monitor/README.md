## Resource Monitor

Bash script for periodic monitoring of system resources.

The script writes the current timestamp, memory usage, disk usage, and system uptime to `monitor.log` every 10 seconds.

### Usage

```bash
chmod +x script.sh
./script.sh
```

Stop the script with `Ctrl+C`.

### Running on the Multipass VM

Copy the script to the virtual machine:

```bash
scp -i ~/.ssh/id_ed25519_mephi \
    script.sh \
    ubuntu@10.22.227.68:~/resource-monitor/
```

Connect to the virtual machine:

```bash
ssh -i ~/.ssh/id_ed25519_mephi ubuntu@10.22.227.68
```

Run the script:

```bash
cd ~/resource-monitor
chmod +x script.sh
./script.sh
```

See [sample_output.txt](sample_output.txt) for an example of the output collected from the virtual machine.
