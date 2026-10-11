-- Extra autostart processes.
-- o.launch_on_start("my-service")

-- Keep external monitors on the left and the laptop panel on the right.
o.exec_on_start("$HOME/.config/hypr/scripts/arrange-monitors.sh")
