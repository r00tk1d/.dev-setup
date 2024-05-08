WIP

My mostly automated Ubuntu setup using bash scripts and dotfiles.

## 1. Clone Repo:
```bash
sudo apt update -y && sudo apt install -y curl git software-properties-common && cd ~ && git clone https://github.com/r00tk1d/dev_setup.git && cd dev_setup
```

## 2. Run Setup Script:
(The last run is logged in `~/dev_setup/setup_scripts/log.out`.)
### Run my personal setup:
1. Set values in the `~/dev_setup/setup_scripts/personal_values.sh` file
2. Run:
```bash
cd ~/dev_setup/setup_scripts && chmod +x personal.sh && ./personal.sh
```

### Run my work setup:
1. Set values in the `~/dev_setup/setup_scripts/work_values.sh` file
2. Run:
```bash
cd ~/dev_setup/setup_scripts && chmod +x work.sh && ./work.sh
```

