#!/bin/sh

TMUX=$(which tmux)
$TMUX attach || $TMUX
