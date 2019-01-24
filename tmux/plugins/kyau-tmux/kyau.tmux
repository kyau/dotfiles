#!/usr/bin/env bash
# Copyright (c) 2017-present Arctic Ice Studio <development@arcticicestudio.com>
# Copyright (c) 2017-present Sven Greb <code@svengreb.de>

# Project:    Nord tmux
# Repository: https://github.com/arcticicestudio/nord-tmux
# License:    MIT
# References:
#   https://tmux.github.io
#
# Modified for use by kyau

KYAU_TMUX_COLOR_THEME_FILE=src/kyau.conf
KYAU_TMUX_VERSION=0.2.1
KYAU_TMUX_STATUS_CONTENT_FILE="src/kyau-status-content.conf"
KYAU_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE="src/kyau-status-content-no-patched-font.conf"
KYAU_TMUX_STATUS_CONTENT_OPTION="@kyau_tmux_show_status_content"
KYAU_TMUX_NO_PATCHED_FONT_OPTION="@kyau_tmux_no_patched_font"
_current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

__cleanup() {
  unset -v KYAU_TMUX_COLOR_THEME_FILE KYAU_TMUX_VERSION
  unset -v KYAU_TMUX_STATUS_CONTENT_FILE KYAU_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE
  unset -v KYAU_TMUX_STATUS_CONTENT_OPTION KYAU_TMUX_NO_PATCHED_FONT_OPTION
  unset -v _current_dir
  unset -f __load __cleanup
}

__load() {
  tmux source-file "$_current_dir/$KYAU_TMUX_COLOR_THEME_FILE"

  local status_content=$(tmux show-option -gqv "$KYAU_TMUX_STATUS_CONTENT_OPTION")
  local no_patched_font=$(tmux show-option -gqv "$KYAU_TMUX_NO_PATCHED_FONT_OPTION")

  if [ "$status_content" != "0" ]; then
    if [ "$no_patched_font" != "1" ]; then
      tmux source-file "$_current_dir/$KYAU_TMUX_STATUS_CONTENT_FILE"
    else
      tmux source-file "$_current_dir/$KYAU_TMUX_STATUS_CONTENT_NO_PATCHED_FONT_FILE"
    fi
  fi
}

__load
__cleanup
