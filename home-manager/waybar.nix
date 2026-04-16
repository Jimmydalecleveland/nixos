{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        reload_style_on_change = true;
        swap-icon-label = false;
        output = "HDMI-A-1";

        modules-left   = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right  = [ "mpris" "network" "pulseaudio" "pulseaudio#microphone" "tray" ];

        "hyprland/workspaces" = {
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            active  = "";
            urgent  = "";
            default = "";
          };
          sort-by-number = true;
        };

        "hyprland/window" = {
          max-length = 40;
        };

        clock = {
          format = "󰥔 {:%H:%M}";
          tooltip-format = "{:%A, %B %d %Y}";
        };

        network = {
          format-wifi     = "󰤨 {signalStrength}%";
          format-ethernet = "󰈀 Connected";
          format-disconnected = "󰤭 Off";
          on-click = "kitty -e nmtui";
        };

        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 Muted";
          format-icons = {
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-scroll-up   = "pactl set-sink-volume @DEFAULT_SINK@ +2%";
          on-scroll-down = "pactl set-sink-volume @DEFAULT_SINK@ -2%";
          on-click       = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭 Muted";
          on-click = "pactl set-source-mute @DEFAULT_SOURCE@ toggle";
        };

        mpris = {
          format = "{player_icon} {title} — {artist}";
          format-paused = " {title} — {artist}";
          player-icons = {
            default = "▶";
            spotify = "";
          };
          status-icons = {
            paused = "⏸";
          };
          max-length = 60;
        };

        tray = {
          spacing = 8;
        };
      };
    };

    style = ''
      /* ── Rose Pine palette ─────────────────────────────────── */
      @define-color base    #191724;
      @define-color overlay #26233a;
      @define-color muted   #6e6a86;
      @define-color text    #e0def4;
      @define-color iris    #c4a7e7;
      @define-color pine    #31748f;
      @define-color foam    #9ccfd8;
      @define-color love    #eb6f92;
      @define-color gold    #f6c177;
      @define-color rose    #ebbcba;

      /* ── Global reset ──────────────────────────────────────── */
      * {
        font-family: "JetBrainsMono Nerd Font", monospace;
        font-size: 15px;
        color: @text;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      /* ── Transparent bar window ────────────────────────────── */
      window#waybar {
        background: transparent;
      }

      /* ── Pill groups (from lepz0r/owlphin) ─────────────────── */
      .modules-left,
      .modules-center,
      .modules-right {
        background-color: @overlay;
        border-radius: 16px;
        margin: 6px 4px;
        padding: 2px 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
      }

      /* ── Module spacing and colors ────────────────────────── */
      #clock         { color: @iris; padding: 0 6px; }
      #network       { color: @foam; padding: 0 6px; }
      #pulseaudio    { color: @pine; padding: 0 6px; }
      #pulseaudio.muted { color: @muted; padding: 0 6px; }
      #mpris         { color: @rose; padding: 0 6px; }
      #workspaces    { padding: 0 2px; }
      #window        { padding: 0 6px; }

      /* ── Workspaces ────────────────────────────────────────── */
      #workspaces button {
        color: @muted;
        padding: 0 4px;
      }
      #workspaces button.active {
        color: @iris;
      }
      #workspaces button.urgent {
        color: @love;
      }

      /* ── Hidden state ──────────────────────────────────────── */
      window#waybar.hidden { opacity: 0.2; }
    '';
  };
}
