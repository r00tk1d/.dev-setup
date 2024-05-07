WIP

My mostly automated Ubuntu setup using bash scripts and dotfiles.

Clone Repo:
```bash
sudo apt update -y && sudo apt install -y curl git software-properties-common && cd ~ && git clone https://github.com/r00tk1d/dev_setup.git && cd dev_setup
```

**Set values in the `~/dev_setup/setup_scripts/values.sh` file.**

Run my personal setup:
```bash
cd ~/dev_setup/setup_scripts && chmod +x personal.sh && ./personal.sh
```

Run my work setup:
```bash
cd ~/dev_setup/setup_scripts && chmod +x work.sh && ./work.sh
```

The last run is logged in `setup_scripts/log.out`.