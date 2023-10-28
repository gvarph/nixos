{ config, pkgs, ... }:

let
  secrets = import /etc/nixos/secrets.nix;
in
{
  fileSystems."media-server" = {
    device = "//192.168.31.7/Multimedia";
    fsType = "cifs";
    options = [
      "username=${secrets.nas-login.username}"
      "password=${secrets.nas-login.password}"
      "uid=1000"
      "x-systemd.automount" # auto-mount on access
      "noauto" # don't mount on boot
      "x-systemd.idle-timeout=60" # unmount after 60 seconds of inactivity
      "x-systemd.device-timeout=5s" #  device timeout for the automount unit
      "x-systemd.mount-timeout=5s" #  mount timeout for the automount unit

    ];
    mountPoint = "/remote/nas/media";
  };
}
