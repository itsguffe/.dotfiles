{pkgs, ...}:
{
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  programs.hyprland.enable = true;
  environment.systemPackages = with pkgs; [
    wayland # for wayland support
    egl-wayland # for wayland support
    xwayland # for x11 support
    libsForQt5.qtimageformats # for dolphin image thumbnails
    libsForQt5.ffmpegthumbs # for dolphin video thumbnails
    libsForQt5.kde-cli-tools # for dolphin file type defaults
    libsForQt5.kdegraphics-thumbnailers # for dolphin video thumbnails
    libsForQt5.kimageformats # for dolphin image thumbnails
    libsForQt5.qtwayland # for wayland support
    libsForQt5.qtsvg # for svg thumbnails
    libsForQt5.kio # for fuse support
    libsForQt5.kio-extras # for extra protocol support
    libsForQt5.kwayland # for wayland support
    resvg # for svg thumbnails
    libnotify # for notifications
    emote # emoji picker gtk3
    envsubst # for environment variables
    killall # for killing processes
    wl-clipboard # clipboard for wayland
    hyprcursor # cursor theme
    hyprutils # for hyprland utils
    upower # for battery status

    #hyprland configs:
    dunst # notification daemon
    rofi-wayland # application launcher
    waybar # system bar
    swww # wallpaper
    swaylock # lock screen
    swaylock-fancy # lock screen
    wlogout # logout menu
    grimblast # screenshot tool
    hyprpicker # color picker
    slurp # region select for screenshot/screenshare
    swappy # screenshot editor
    cliphist # clipboard manager

    #music:
    cava # audio visualizer
    spicetify-cli # cli to customize spotify client

    #themes:
    nwg-look # gtk configuration tool
    libsForQt5.qt5ct # qt5 configuration tool
    kdePackages.qt6ct # qt6 configuration tool
    libsForQt5.qtstyleplugin-kvantum # svg based qt6 theme engine
    kdePackages.qtstyleplugin-kvantum # svg based qt5 theme engine
    gtk3 # gtk3
    gtk4 # gtk4
    glib # gtk theme management
    gsettings-desktop-schemas # gsettings schemas
    desktop-file-utils # for updating desktop database
    hicolor-icon-theme # Base fallback icon theme
    libsForQt5.breeze-icons # KDE's icon set, good for Qt apps

    pipewire # audio/video server
    wireplumber # pipewire session manager
    pavucontrol # pulseaudio volume control
    pamixer # pulseaudio cli mixer
    networkmanager # network manager
    networkmanagerapplet # network manager system tray utility
    bluez # bluetooth protocol stack
    bluez-tools # bluetooth utility cli
    blueman # bluetooth manager gui
    brightnessctl # screen brightness control
    udiskie # manage removable media
    ntfs3g # ntfs support
    exfat # exFAT support
    playerctl # media player cli
    trash-cli # cli to manage trash files
    libinput # libinput library
    lm_sensors # system sensors
    pciutils # pci utils
  ];
}
