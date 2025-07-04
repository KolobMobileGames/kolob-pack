[[ -t 0 && -t 1 && -t 2 && -o interactive && -o zle && -o no_xtrace ]] &&
  ! (( ${+__p9k_instant_prompt_disabled} || ZSH_SUBSHELL || ${+ZSH_SCRIPT} || ${+ZSH_EXECUTION_STRING} )) || return 0
() {
  emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match reply mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH REPLY OPTARG IFS=$' \t\n\0'
  typeset -gi __p9k_instant_prompt_disabled=1
  [[ $ZSH_VERSION == 5.9 && $ZSH_PATCHLEVEL == debian/5.9-8+b9 &&
     -z ${(M)TERM:#(screen*|tmux*)} &&
     ${#${(M)VTE_VERSION:#(<1-4602>|4801)}} == 0 &&
     $POWERLEVEL9K_DISABLE_INSTANT_PROMPT != 'true' &&
     $POWERLEVEL9K_INSTANT_PROMPT != 'off' ]] || return
  typeset -g __p9k_instant_prompt_param_sig=$'1.20.15\C-A5.9\C-Adebian/5.9-8+b9\C-A\C-A\'\'\C-A416\C-Akolob%\C-A\C-A\C-A\C-A\C-A\C-A\C-A1\C-A0\C-A0\C-A\C-A%B%S%#%s%b\C-A1\C-AUTF-8\C-A\C-A\C-A0\C-A1\C-A/home/kolob/.oh-my-zsh/custom/themes/powerlevel10k\C-A\C-A\C-A\C-A\C-A1\C-A256\C-A0\C-A4\C-A${${${${CONDA_PROMPT_MODIFIER#\\(}% }%\\)}:-${CONDA_PREFIX:t}}\C-A0\C-A7\C-A5\C-A0\C-A5\C-A0\C-A1\C-A0\C-A4\C-A0\C-A0\C-A4\C-A0\C-A3\C-A0\C-A7\C-A1\C-A2\C-A0\C-A4\C-A0\C-A2\C-A0\C-A4\C-A0\C-A5\C-A0\C-A6\C-A0\C-Afalse\C-A4\C-A0\C-A1\C-A0\C-A208\C-A0\C-A\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-A*\C-BDEFAULT\C-A${P9K_AWS_PROFILE//\\%/%%}${P9K_AWS_REGION:+ ${P9K_AWS_REGION//\\%/%%}}\C-A1\C-A7\C-A0\C-A2\C-Aaws|awless|cdk|terraform|pulumi|terragrunt\C-A*\C-BOTHER\C-A4\C-A7\C-Aaz|terraform|pulumi|terragrunt\C-A0\C-A6\C-Afalse\C-A0\C-A2\C-A2\C-A3\C-A1\C-A20\C-A%K{232}▁\C-B%K{232}▂\C-B%K{232}▃\C-B%K{232}▄\C-B%K{232}▅\C-B%K{232}▆\C-B%K{232}▇\C-B%K{232}█\C-Afalse\C-A4\C-A0\C-A3\C-A0\C-Ad h m s\C-A0\C-Atook \C-A3\C-A/home/kolob/.p10k.zsh\C-A0\C-A\C-A\C-A3\C-Awith \C-A0\C-A3\C-A0\C-A3\C-A%n@%m\C-A%n@%m\C-A0\C-A1\C-A%n@%m\C-A\C-A\C-A%n@%m\C-A3\C-A0\C-Atrue\C-A255\C-A4\C-A0\C-A3\C-A254\C-Afalse\C-A80\C-A40\C-A50\C-A250\C-Av3\C-Afalse\C-Atrue\C-A1\C-A7\C-A95\C-A0\C-A3\C-Afalse\C-A3\C-A0\C-A90\C-A5\C-A7\C-Atrue\C-A%{%}\C-A\C-A%{%}\C-A1\C-A3\C-A4\C-A0\C-A4\C-A${P9K_GCLOUD_PROJECT_NAME//\\%/%%}\C-A7\C-A${P9K_GCLOUD_PROJECT_ID//\\%/%%}\C-A60\C-Agcloud|gcs|gsutil\C-A4\C-A0\C-Afalse\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-A*\C-BDEFAULT\C-A4\C-A${P9K_GOOGLE_APP_CRED_PROJECT_ID//\\%/%%}\C-A7\C-Aterraform|pulumi|terragrunt\C-A2\C-A255\C-Atrue\C-Atrue\C-A3\C-A0\C-Ashell\C-Blocal\C-A\C-Anone\C-Averbose\C-A4\C-A${P9K_IP_RX_RATE:+⇣$P9K_IP_RX_RATE }${P9K_IP_TX_RATE:+⇡$P9K_IP_TX_RATE }$P9K_IP_IP\C-A0\C-A[ew].*\C-A7\C-A1\C-Afalse\C-Atrue\C-A7\C-A1\C-Afalse\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-A*\C-BDEFAULT\C-A5\C-A${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}\C-A7\C-Aat \C-Akubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|flux|fluxctl|stern|kubeseal|skaffold|kubent|kubecolor|cmctl|sparkctl\C-A7\C-A1\C-Aos_icon\C-Bdir\C-Bvcs\C-Bnewline\C-A\\uE0B2\C-A▓▒░\C-A\\uE0B0\C-A\\uE0B1\C-A6\C-A0\C-A1\C-A0\C-A2\C-A0\C-A3\C-A0\C-A5\C-A4\C-A0\C-Afalse\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-A0\C-A3\C-Aawesome-fontconfig\C-A\C-A─\C-A240\C-A%240F╭─\C-A%240F─╮\C-A%240F╰─\C-A%240F─╯\C-A\C-A%240F├─\C-A%240F─┤\C-A4\C-A0\C-A6\C-A0\C-A0\C-A2\C-A\C-A\C-Afalse\C-A0\C-A2\C-Afalse\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-A2\C-A7\C-Atrue\C-A4\C-A\C-A\C-A\C-A\C-A\C-A\C-A7\C-A5\C-A0\C-Afalse\C-Atrue\C-A7\C-A232\C-A6\C-A0\C-A3\C-A0\C-A5\C-A0\C-A67\C-Atrue\C-Afalse\C-A5\C-A0\C-Afalse\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-A5\C-A0\C-Atrue\C-A4\C-A0\C-Afalse\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-Atrue\C-A\C-A❮\C-A196\C-A❯\C-A196\C-A▶\C-A196\C-AV\C-A196\C-A\C-A\C-A\C-A\C-A❮\C-A76\C-A❯\C-A76\C-A▶\C-A76\C-AV\C-A76\C-Atrue\C-A0\C-A4\C-A0\C-A7\C-A4\C-A${P9K_CONTENT}${${P9K_CONTENT:#$P9K_PYENV_PYTHON_VERSION(|/*)}:+ $P9K_PYENV_PYTHON_VERSION}\C-A0\C-Afalse\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-A3\C-A0\C-A0\C-A3\C-A1\C-A0\C-Afalse\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-Astatus\C-Bcommand_execution_time\C-Bbackground_jobs\C-Bdirenv\C-Basdf\C-Bvirtualenv\C-Banaconda\C-Bpyenv\C-Bgoenv\C-Bnodenv\C-Bnvm\C-Bnodeenv\C-Brbenv\C-Brvm\C-Bfvm\C-Bluaenv\C-Bjenv\C-Bplenv\C-Bperlbrew\C-Bphpenv\C-Bscalaenv\C-Bhaskell_stack\C-Bkubecontext\C-Bterraform\C-Baws\C-Baws_eb_env\C-Bazure\C-Bgcloud\C-Bgoogle_app_cred\C-Btoolbox\C-Bcontext\C-Bnordvpn\C-Branger\C-Byazi\C-Bnnn\C-Blf\C-Bxplr\C-Bvim_shell\C-Bmidnight_commander\C-Bnix_shell\C-Bchezmoi_shell\C-Bvi_mode\C-Btodo\C-Btimewarrior\C-Btaskwarrior\C-Bper_directory_history\C-Btime\C-Bnewline\C-A░▒▓\C-A\\uE0B0\C-A\\uE0B2\C-A\\uE0B3\C-A208\C-A0\C-Atrue\C-A240\C-A0\C-Afalse\C-Afalse\C-A1\C-A0\C-Afalse\C-Atrue\C-Ashell\C-Blocal\C-Bglobal\C-A\C-A1\C-A(.bzr|.citc|.git|.hg|.node-version|.python-version|.go-version|.ruby-version|.lua-version|.java-version|.perl-version|.php-version|.tool-versions|.mise.toml|.shorten_folder_marker|.svn|.terraform|CVS|Cargo.toml|composer.json|go.mod|package.json|stack.yaml)\C-Atruncate_to_unique\C-Atrue\C-A1\C-A3\C-Atrue\C-A1\C-A3\C-A✘\C-Atrue\C-A1\C-A3\C-A✘\C-A✘\C-Atrue\C-Atrue\C-A0\C-A2\C-Atrue\C-A0\C-A2\C-A✔\C-A✔\C-Afalse\C-A3\C-A0\C-A6\C-A0\C-A*\C-BOTHER\C-A0\C-A4\C-Afalse\C-A0\C-A4\C-Aterraform|tf\C-A7\C-A0\C-A%D{%H:%M:%S}\C-Aat \C-Afalse\C-A8\C-A${P9K_CONTENT:0:24}${${P9K_CONTENT:24}:+…}\C-A255\C-A8\C-A0\C-Afalse\C-Atrue\C-A3\C-A${P9K_TOOLBOX_NAME:#fedora-toolbox-*}\C-A0\C-Ain \C-Aalways\C-Agit\C-A\\uF126 \C-A2\C-A-1\C-A-1\C-A3\C-A-1\C-A${$((my_git_formatter()))+${my_git_format}}\C-A~\C-Atrue\C-A8\C-A-1\C-A3\C-Aon \C-A-1\C-A-1\C-A2\C-A?\C-A-1\C-ANORMAL\C-A\C-A0\C-A8\C-A2\C-A3\C-A4\C-A2\C-A0\C-AOVERTYPE\C-A4\C-A0\C-A\C-A\C-Afalse\C-Afalse\C-AVISUAL\C-A6\C-A\C-A0\C-A(gpd|wg|(.*tun)|tailscale)[0-9]*|(zt.*)\C-Afalse\C-A4\C-A0\C-A6\C-A0\C-A0\C-A3'
  local gitstatus_dir=/home/kolob/.oh-my-zsh/custom/themes/powerlevel10k/gitstatus
  local gitstatus_header=\#\ 3
  local -i ZLE_RPROMPT_INDENT=1
  local PROMPT_EOL_MARK=%B%S%\#%s%b
  [[ -n $SSH_CLIENT || -n $SSH_TTY || -n $SSH_CONNECTION ]] && local ssh=1 || local ssh=0
  local cr=$'\r' lf=$'\n' esc=$'\e[' rs=$'\x1e' us=$'\x1f'
  local -i height=1
  local prompt_dir=/home/kolob/.cache/p10k-kolob

  (( _z4h_can_save_restore_screen == 1 )) && height=0

  local real_gitstatus_header
  if [[ -r $gitstatus_dir/install.info ]]; then
    IFS= read -r real_gitstatus_header <$gitstatus_dir/install.info || real_gitstatus_header=borked
  fi
  [[ $real_gitstatus_header == $gitstatus_header ]] || return
  zmodload zsh/langinfo zsh/terminfo zsh/system || return
  if [[ $langinfo[CODESET] != (utf|UTF)(-|)8 ]]; then
    local loc_cmd=$commands[locale]
    [[ -z $loc_cmd ]] && loc_cmd=/usr/bin/locale
    if [[ -x $loc_cmd ]]; then
      local -a locs
      if locs=(${(@M)$(locale -a 2>/dev/null):#*.(utf|UTF)(-|)8}) && (( $#locs )); then
        local loc=${locs[(r)(#i)C.UTF(-|)8]:-${locs[(r)(#i)en_US.UTF(-|)8]:-$locs[1]}}
        [[ -n $LC_ALL ]] && local LC_ALL=$loc || local LC_CTYPE=$loc
      fi
    fi
  fi
  (( terminfo[colors] == 256 )) || return
  (( $+terminfo[cuu] && $+terminfo[cuf] && $+terminfo[ed] && $+terminfo[sc] && $+terminfo[rc] )) || return
  local pwd=${(%):-%/}
  [[ $pwd == /* ]] || return
  local prompt_file=$prompt_dir/prompt-${#pwd}
  local key=$pwd:$ssh:${(%):-%#}
  local content
  if [[ ! -e $prompt_file ]]; then
    typeset -gi __p9k_instant_prompt_sourced=47
    return 1
  fi
  { content="$(<$prompt_file)" } 2>/dev/null || return
  local tail=${content##*$rs$key$us}
  if (( ${#tail} == ${#content} )); then
    typeset -gi __p9k_instant_prompt_sourced=47
    return 1
  fi
  local _p9k__ipe
  local P9K_PROMPT=instant
  if [[ -z $P9K_TTY || $P9K_TTY == old && -n ${_P9K_TTY:#$TTY} ]]; then

    typeset -gx P9K_TTY=old
    zmodload -F zsh/stat b:zstat || return
    zmodload zsh/datetime || return
    local -a stat
    if zstat -A stat +ctime -- $TTY 2>/dev/null &&
      (( EPOCHREALTIME - stat[1] < 5.0000000000 )); then
      P9K_TTY=new
    fi
  fi
  typeset -gx _P9K_TTY=$TTY
  local -i _p9k__empty_line_i=3 _p9k__ruler_i=3
  local -A _p9k_display_k=(-2/left 11 1/right/scalaenv 63 2/left 123 -2/right/timewarrior 109 -2/right/fvm 51 -2/right/nodenv 41 1/right/plenv 57 1/right/nvm 43 1/right/background_jobs 27 -2/right/per_directory_history 113 1/right/direnv 29 1/right/timewarrior 109 1/right/midnight_commander 99 1/right/rvm 49 -1/right 125 1/right/vim_shell 97 -2/right/plenv 57 -2/right/nvm 43 1/right/nnn 91 1/right/google_app_cred 79 1/right/asdf 31 1/right/nordvpn 85 -2/right/rvm 49 1/left/dir 19 -2/right/ranger 87 1/right/rbenv 47 1/right/terraform 69 1/right/nodenv 41 -1/left 123 -2/right/context 83 -2/left/vcs 21 -2/right/anaconda 35 -2/right/nnn 91 -2/right/google_app_cred 79 -2/right/asdf 31 1/right/virtualenv 33 1/right/yazi 89 -2/right/haskell_stack 65 1/right/perlbrew 59 -2/right/rbenv 47 1/right_frame 9 -2/right/chezmoi_shell 103 1/right 13 2/right 125 1/right/xplr 95 1/right/pyenv 37 -2/right/virtualenv 33 -2/right/yazi 89 1/right/nodeenv 45 1/right/goenv 39 -2/right 13 -2/right/background_jobs 27 2/right_frame 121 1/right/haskell_stack 65 -2/right_frame 9 1/right/chezmoi_shell 103 1/right/ranger 87 1/right/aws 71 1/right/jenv 55 -2/right/xplr 95 -2/right/pyenv 37 -2/right/toolbox 81 -2/right/goenv 39 empty_line 1 1/right/todo 107 -2/right/midnight_commander 99 -2/right/lf 93 -1 117 1/right/context 83 -2/right/aws 71 -2/right/jenv 55 -2 5 1/left 11 1/right/azure 75 -1/gap 127 -1/right_frame 121 -2/right/todo 107 -2/right/vim_shell 97 1/right/aws_eb_env 73 -2/gap 15 1/left/vcs 21 1/right/lf 93 1/right/time 115 -2/right/scalaenv 63 -2/right/gcloud 77 1/right/kubecontext 67 -2/right/vi_mode 105 -2/right/azure 75 1/right/anaconda 35 1/right/nix_shell 101 -2/right/status 23 -2/right/taskwarrior 111 -2/right/aws_eb_env 73 -2/right/terraform 69 1 5 1/left_frame 7 -1/left_frame 119 2 117 -2/right/time 115 -2/right/nordvpn 85 -2/right/luaenv 53 ruler 3 -2/left/os_icon 17 1/right/toolbox 81 -2/right/phpenv 61 1/gap 15 2/gap 127 1/right/command_execution_time 25 2/left_frame 119 1/right/taskwarrior 111 -2/right/kubecontext 67 -2/left_frame 7 1/right/per_directory_history 113 1/right/gcloud 77 -2/right/command_execution_time 25 -2/right/nix_shell 101 1/right/status 23 -2/right/nodeenv 45 -2/left/dir 19 -2/right/direnv 29 1/right/vi_mode 105 1/right/luaenv 53 1/left/os_icon 17 1/right/phpenv 61 -2/right/perlbrew 59 1/right/fvm 51)
  local -a _p9k__display_v=(empty_line hide ruler hide 1 show 1/left_frame show 1/right_frame show 1/left show 1/right show 1/gap show 1/left/os_icon show 1/left/dir show 1/left/vcs show 1/right/status show 1/right/command_execution_time show 1/right/background_jobs show 1/right/direnv show 1/right/asdf show 1/right/virtualenv show 1/right/anaconda show 1/right/pyenv show 1/right/goenv show 1/right/nodenv show 1/right/nvm show 1/right/nodeenv show 1/right/rbenv show 1/right/rvm show 1/right/fvm show 1/right/luaenv show 1/right/jenv show 1/right/plenv show 1/right/perlbrew show 1/right/phpenv show 1/right/scalaenv show 1/right/haskell_stack show 1/right/kubecontext show 1/right/terraform show 1/right/aws show 1/right/aws_eb_env show 1/right/azure show 1/right/gcloud show 1/right/google_app_cred show 1/right/toolbox show 1/right/context show 1/right/nordvpn show 1/right/ranger show 1/right/yazi show 1/right/nnn show 1/right/lf show 1/right/xplr show 1/right/vim_shell show 1/right/midnight_commander show 1/right/nix_shell show 1/right/chezmoi_shell show 1/right/vi_mode show 1/right/todo show 1/right/timewarrior show 1/right/taskwarrior show 1/right/per_directory_history show 1/right/time show 2 show 2/left_frame show 2/right_frame show 2/left show 2/right show 2/gap show)
  function p10k() {
    emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match reply mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH REPLY OPTARG IFS=$' \t\n\0'; [[ $langinfo[CODESET] != (utf|UTF)(-|)8 ]] && _p9k_init_locale && { [[ -n $LC_ALL ]] && local LC_ALL=$__p9k_locale || local LC_CTYPE=$__p9k_locale }
    [[ $1 == display ]] || return
    shift
    local -i k dump
    local opt prev new pair list name var
    while getopts ":ha" opt; do
      case $opt in
        a) dump=1;;
        h) return 0;;
        ?) return 1;;
      esac
    done
    if (( dump )); then
      reply=()
      shift $((OPTIND-1))
      (( ARGC )) || set -- "*"
      for opt; do
        for k in ${(u@)_p9k_display_k[(I)$opt]:/(#m)*/$_p9k_display_k[$MATCH]}; do
          reply+=($_p9k__display_v[k,k+1])
        done
      done
      return 0
    fi
    for opt in "${@:$OPTIND}"; do
      pair=(${(s:=:)opt})
      list=(${(s:,:)${pair[2]}})
      if [[ ${(b)pair[1]} == $pair[1] ]]; then
        local ks=($_p9k_display_k[$pair[1]])
      else
        local ks=(${(u@)_p9k_display_k[(I)$pair[1]]:/(#m)*/$_p9k_display_k[$MATCH]})
      fi
      for k in $ks; do
        if (( $#list == 1 )); then
          [[ $_p9k__display_v[k+1] == $list[1] ]] && continue
          new=$list[1]
        else
          new=${list[list[(I)$_p9k__display_v[k+1]]+1]:-$list[1]}
          [[ $_p9k__display_v[k+1] == $new ]] && continue
        fi
        _p9k__display_v[k+1]=$new
        name=$_p9k__display_v[k]
        if [[ $name == (empty_line|ruler) ]]; then
          var=_p9k__${name}_i
          [[ $new == hide ]] && typeset -gi $var=3 || unset $var
        elif [[ $name == (#b)(<->)(*) ]]; then
          var=_p9k__${match[1]}${${${${match[2]//\/}/#left/l}/#right/r}/#gap/g}
          [[ $new == hide ]] && typeset -g $var= || unset $var
        fi
      done
    done
  }
  [[ $P9K_TTY == old ]] && { unset _p9k__empty_line_i; _p9k__display_v[2]=print }

  local _p9k__1rkubecontext=
  _p9k__display_v[68]=hide

  local _p9k__1raws=
  _p9k__display_v[72]=hide

  local _p9k__1razure=
  _p9k__display_v[76]=hide

  local _p9k__1rgcloud=
  _p9k__display_v[78]=hide

  local _p9k__1rgoogle_app_cred=
  _p9k__display_v[80]=hide

  () {
	[[ -z $P9K_TOOLBOX_NAME ]] || return 0
	if [[ -f /run/.containerenv && -r /run/.containerenv ]]
	then
		local name=(${(Q)${${(@M)${(f)"$(</run/.containerenv)"}:#name=*}#name=}}) 
		[[ ${#name} -eq 1 && -n ${name[1]} ]] || return 0
		typeset -g P9K_TOOLBOX_NAME=${name[1]} 
	elif [[ -n $DISTROBOX_ENTER_PATH ]]
	then
		local name=${(%):-%m} 
		if [[ -n $name && $name == $NAME* ]]
		then
			typeset -g P9K_TOOLBOX_NAME=$name 
		fi
	fi
  }
  trap "unset -m _p9k__\*; unfunction p10k" EXIT
  local -a _p9k_t=("${(@ps:$us:)${tail%%$rs*}}")
  if [[ $+VTE_VERSION == 1 || $TERM_PROGRAM == Hyper ]] && (( $+commands[stty] )); then
    if [[ $TERM_PROGRAM == Hyper ]]; then
      local bad_lines=40 bad_columns=100
    else
      local bad_lines=24 bad_columns=80
    fi
    if (( LINES == bad_lines && COLUMNS == bad_columns )); then
      zmodload -F zsh/stat b:zstat || return
      zmodload zsh/datetime || return
      local -a tty_ctime
      if ! zstat -A tty_ctime +ctime -- $TTY 2>/dev/null || (( tty_ctime[1] + 2 > EPOCHREALTIME )); then
        local -F deadline=$((EPOCHREALTIME+0.025))
        local tty_size
        while true; do
          if (( EPOCHREALTIME > deadline )) || ! tty_size="$(command stty size 2>/dev/null)" || [[ $tty_size != <->" "<-> ]]; then
            (( $+_p9k__ruler_i )) || local -i _p9k__ruler_i=1
            local _p9k__g= _p9k__2r= _p9k__2r_frame=
            break
          fi
          if [[ $tty_size != "$bad_lines $bad_columns" ]]; then
            local lines_columns=(${=tty_size})
            local LINES=$lines_columns[1]
            local COLUMNS=$lines_columns[2]
            break
          fi
        done
      fi
    fi
  fi
  typeset -ga __p9k_used_instant_prompt=("${(@e)_p9k_t[-3,-1]}")

  local -i prompt_height=${#${__p9k_used_instant_prompt[1]//[^$lf]}}
  (( height += prompt_height ))
  local _p9k__ret
  function _p9k_prompt_length() {
    local -i COLUMNS=1024
    local -i x y=${#1} m
    if (( y )); then
      while (( ${${(%):-$1%$y(l.1.0)}[-1]} )); do
        x=y
        (( y *= 2 ))
      done
      while (( y > x + 1 )); do
        (( m = x + (y - x) / 2 ))
        (( ${${(%):-$1%$m(l.x.y)}[-1]} = m ))
      done
    fi
    typeset -g _p9k__ret=$x
  }
  local out=${(%):-%b%k%f%s%u}
  if [[ $P9K_TTY == old && ( $+VTE_VERSION == 0 && $TERM_PROGRAM != Hyper || $+_p9k__g == 0 ) ]]; then
    local mark=${(e)PROMPT_EOL_MARK}
    [[ $mark == "%B%S%#%s%b" ]] && _p9k__ret=1 || _p9k_prompt_length $mark
    local -i fill=$((COLUMNS > _p9k__ret ? COLUMNS - _p9k__ret : 0))
    out+="${(%):-$mark${(pl.$fill.. .)}$cr%b%k%f%s%u%E}"
  else
    out+="${(%):-$cr%E}"
  fi
  if (( _z4h_can_save_restore_screen != 1 )); then
    (( height )) && out+="${(pl.$height..$lf.)}$esc${height}A"
    out+="$terminfo[sc]"
  fi
  out+=${(%):-"$__p9k_used_instant_prompt[1]$__p9k_used_instant_prompt[2]"}
  if [[ -n $__p9k_used_instant_prompt[3] ]]; then
    _p9k_prompt_length "$__p9k_used_instant_prompt[2]"
    local -i left_len=_p9k__ret
    _p9k_prompt_length "$__p9k_used_instant_prompt[3]"
    if (( _p9k__ret )); then
      local -i gap=$((COLUMNS - left_len - _p9k__ret - ZLE_RPROMPT_INDENT))
      if (( gap >= 40 )); then
        out+="${(pl.$gap.. .)}${(%):-${__p9k_used_instant_prompt[3]}%b%k%f%s%u}$cr$esc${left_len}C"
      fi
    fi
  fi
  if (( _z4h_can_save_restore_screen == 1 )); then
    if (( height )); then
      out+="$cr${(pl:$((height-prompt_height))::\n:)}$esc${height}A$terminfo[sc]$out"
    else
      out+="$cr${(pl:$((height-prompt_height))::\n:)}$terminfo[sc]$out"
    fi
  fi
  if [[ -n "$TMPDIR" && ( ( -d "$TMPDIR" && -w "$TMPDIR" ) || ! ( -d /tmp && -w /tmp ) ) ]]; then
    local tmpdir=$TMPDIR
  else
    local tmpdir=/tmp
  fi
  typeset -g __p9k_instant_prompt_output=$tmpdir/p10k-instant-prompt-output-${(%):-%n}-$$
  { : > $__p9k_instant_prompt_output } || return
  print -rn -- "${out}${esc}?2004h" || return
  if (( $+commands[stty] )); then
    command stty -icanon 2>/dev/null
  fi
  local fd_null
  sysopen -ru fd_null /dev/null || return
  exec {__p9k_fd_0}<&0 {__p9k_fd_1}>&1 {__p9k_fd_2}>&2 0<&$fd_null 1>$__p9k_instant_prompt_output
  exec 2>&1 {fd_null}>&-
  typeset -gi __p9k_instant_prompt_active=1
  if (( _z4h_can_save_restore_screen == 1 )); then
    typeset -g _z4h_saved_screen
    -z4h-save-screen
  fi
  typeset -g __p9k_instant_prompt_dump_file=${XDG_CACHE_HOME:-~/.cache}/p10k-dump-${(%):-%n}.zsh
  if builtin source $__p9k_instant_prompt_dump_file 2>/dev/null && (( $+functions[_p9k_preinit] )); then
    _p9k_preinit
  fi
  function _p9k_instant_prompt_cleanup() {
    (( ZSH_SUBSHELL == 0 && ${+__p9k_instant_prompt_active} )) || return 0
    emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match reply mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH REPLY OPTARG IFS=$' \t\n\0'
    unset __p9k_instant_prompt_active
    exec 0<&$__p9k_fd_0 1>&$__p9k_fd_1 2>&$__p9k_fd_2 {__p9k_fd_0}>&- {__p9k_fd_1}>&- {__p9k_fd_2}>&-
    unset __p9k_fd_0 __p9k_fd_1 __p9k_fd_2
    typeset -gi __p9k_instant_prompt_erased=1
    if (( _z4h_can_save_restore_screen == 1 && __p9k_instant_prompt_sourced >= 35 )); then
      -z4h-restore-screen
      unset _z4h_saved_screen
    fi
    print -rn -- $terminfo[rc]${(%):-%b%k%f%s%u}$terminfo[ed]
    if [[ -s $__p9k_instant_prompt_output ]]; then
      command cat $__p9k_instant_prompt_output 2>/dev/null
      if (( $1 )); then
        local _p9k__ret mark="${(e)${PROMPT_EOL_MARK-%B%S%#%s%b}}"
        _p9k_prompt_length $mark
        local -i fill=$((COLUMNS > _p9k__ret ? COLUMNS - _p9k__ret : 0))
        echo -nE - "${(%):-%b%k%f%s%u$mark${(pl.$fill.. .)}$cr%b%k%f%s%u%E}"
      fi
    fi
    zshexit_functions=(${zshexit_functions:#_p9k_instant_prompt_cleanup})
    zmodload -F zsh/files b:zf_rm || return
    local user=${(%):-%n}
    local root_dir=${__p9k_instant_prompt_dump_file:h}
    zf_rm -f -- $__p9k_instant_prompt_output $__p9k_instant_prompt_dump_file{,.zwc} $root_dir/p10k-instant-prompt-$user.zsh{,.zwc} $root_dir/p10k-$user/prompt-*(N) 2>/dev/null
  }
  function _p9k_instant_prompt_precmd_first() {
    emulate -L zsh -o no_hist_expand -o extended_glob -o no_prompt_bang -o prompt_percent -o no_prompt_subst -o no_aliases -o no_bg_nice -o typeset_silent -o no_rematch_pcre
  (( $+__p9k_trapped )) || { local -i __p9k_trapped; trap : INT; trap "trap ${(q)__p9k_trapint:--} INT" EXIT }
  local -a match reply mbegin mend
  local -i MBEGIN MEND OPTIND
  local MATCH REPLY OPTARG IFS=$' \t\n\0'; [[ $langinfo[CODESET] != (utf|UTF)(-|)8 ]] && _p9k_init_locale && { [[ -n $LC_ALL ]] && local LC_ALL=$__p9k_locale || local LC_CTYPE=$__p9k_locale }
    function _p9k_instant_prompt_sched_last() {
      (( ${+__p9k_instant_prompt_active} )) || return 0
      _p9k_instant_prompt_cleanup 1
      setopt no_local_options prompt_cr prompt_sp
    }
    zmodload zsh/sched
    sched +0 _p9k_instant_prompt_sched_last
    precmd_functions=(${(@)precmd_functions:#_p9k_instant_prompt_precmd_first})
  }
  zshexit_functions=(_p9k_instant_prompt_cleanup $zshexit_functions)
  precmd_functions=(_p9k_instant_prompt_precmd_first $precmd_functions)
  DISABLE_UPDATE_PROMPT=true
} && unsetopt prompt_cr prompt_sp && typeset -gi __p9k_instant_prompt_sourced=47 ||
  typeset -gi __p9k_instant_prompt_sourced=${__p9k_instant_prompt_sourced:-0}
