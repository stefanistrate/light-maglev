#!/usr/bin/env bash

set -e

# Set up the prefix highlight plugin.
tmux set -g @prefix_highlight_fg 'white'
tmux set -g @prefix_highlight_bg 'blue'
tmux set -g @prefix_highlight_show_copy_mode 'on'
tmux set -g @prefix_highlight_copy_mode_attr 'fg=black,bg=yellow,bold'

apply_theme() {
  left_separator=''
  left_separator_black=''
  right_separator=''
  right_separator_black=''
  session_symbol='❐'

  # Default status bar colors.
  status_fg=brightyellow
  status_bg=brightblack
  tmux set -g status-style fg=$status_fg,bg=$status_bg

  # Left status.
  session_fg=black
  session_bg=yellow
  status_left="#[fg=$session_fg,bg=$session_bg,bold] $session_symbol #S #[fg=$session_bg,bg=$status_bg,nobold]$left_separator_black "
  tmux set -g status-left-length 64
  tmux set -g status-left "$status_left"

  # Right status.
  host_fg=white
  status_right="#{prefix_highlight} #[fg=$host_fg,nobold]$right_separator #H "
  tmux set -g status-right-length 64
  tmux set -g status-right "$status_right"

  # Default window title colors.
  window_status_fg=brightyellow
  window_status_bg=brightblack
  window_status_format="#I #W"
  tmux setw -g window-status-style fg=$window_status_fg,bg=$window_status_bg
  tmux setw -g window-status-format "$window_status_format"

  # Active window title colors.
  window_status_current_fg=black
  window_status_current_bg=blue
  window_status_current_format="#[fg=$window_status_bg,bg=$window_status_current_bg]$left_separator_black#[fg=$window_status_current_fg,bg=$window_status_current_bg,bold] #I $left_separator #W #[fg=$window_status_current_bg,bg=$status_bg,nobold]$left_separator_black"
  tmux setw -g window-status-current-format "$window_status_current_format"
  tmux set -g status-justify left

  # Last window title colors.
  window_status_last_fg=blue
  tmux setw -g window-status-last-style fg=$window_status_last_fg

  # Window activity colors.
  window_status_activity_fg=default
  window_status_activity_bg=default
  window_status_activity_attr=underscore
  tmux setw -g window-status-activity-style fg=$window_status_activity_fg,bg=$window_status_activity_bg,$window_status_activity_attr

  # Pane border colors.
  pane_border_fg=brightblack
  pane_active_border_fg=blue
  tmux set -g pane-border-style fg=$pane_border_fg
  tmux set -g pane-active-border-style fg=$pane_active_border_fg

  # Pane number display.
  tmux set -g display-panes-colour red
  tmux set -g display-panes-active-colour green

  # Message colors.
  message_fg=black
  message_bg=yellow
  message_attr=bold
  tmux set -g message-style fg=$message_fg,bg=$message_bg,$message_attr
}
apply_theme
