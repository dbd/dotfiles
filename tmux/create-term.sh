# https://github.com/tmux/tmux/issues/1257#issuecomment-581378716
brew install ncurses
/usr/local/opt/ncurses/bin/infocmp tmux-256color > ~/tmux-256color.info
tic -xe tmux-256color tmux-256color.info
rm ~/tmux-256color.info
