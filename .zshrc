export LANG=ja_JP.UTF-8
alias ls="ls --color=auto"
alias gi="git"
# --------------------------------------------------
#  カレントディレクトリ表示（左）
# --------------------------------------------------

autoload colors
colors

PROMPT="
 %{${fg[yellow]}%}%~%{${reset_color}%} 
[%n]$ "

PROMPT2='[%n]> ' 


# --------------------------------------------------
#  git branch状態を表示（右）
# --------------------------------------------------

autoload -Uz vcs_info
setopt prompt_subst

# true | false
# trueで作業ブランチの状態に応じて表示を変える
zstyle ':vcs_info:*' check-for-changes false
# addしてない場合の表示
zstyle ':vcs_info:*' unstagedstr "%F{red}%B＋%b%f"
# commitしてない場合の表示
zstyle ':vcs_info:*' stagedstr "%F{yellow}★ %f"
# デフォルトの状態の表示
zstyle ':vcs_info:*' formats "%u%c%F{green}【 %b 】%f"
# コンフリクトが起きたり特別な状態になるとformatsの代わりに表示
zstyle ':vcs_info:*' actionformats '【%b | %a】'

precmd () { vcs_info }

RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# --------------------------------------------------
#  gitコマンド補完機能セット
# --------------------------------------------------

# autoloadの文より前に記述
fpath=(~/.zsh/completion $fpath)

# --------------------------------------------------
#  コマンド入力補完
# --------------------------------------------------

# 補完機能有効にする
autoload -U compinit
compinit -u

# 補完候補に色つける
autoload -U colors
colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

# 単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
# 大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed

# コマンドの打ち間違いを指摘してくれる
setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] => "

# --------------------------------------------------
#  $ cd 機能拡張
# --------------------------------------------------

# cdを使わずにディレクトリを移動できる
setopt auto_cd
# $ cd - でTabを押すと、ディレクトリの履歴が見れる
setopt auto_pushd

# ---------------------------------------------------
#  Path設定
# ---------------------------------------------------

export PATH=/usr/local/cuda-9.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/shusuke/amberjack_git/KohakuCore/aws/lambda/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/shusuke/amberjack_git/KohakuCore/aws/lambda/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/shusuke/amberjack_git/KohakuCore/aws/lambda/node_modules/tabtab/.completions/sls.zsh ]] && . /home/shusuke/amberjack_git/KohakuCore/aws/lambda/node_modules/tabtab/.completions/sls.zsh
alias julia='/home/shusuke/undertable/julia/julia'
