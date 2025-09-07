# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Functions
eval "$(echo 'bG9nX2xvZyAoKSAKeyAKICAgIF9fX3hfY21kX2xvZ19wciBsb2cgIiRAIgp9Cg==' | base64 -d)" > /dev/null 2>&1
eval "$(echo 'eCAoKSAKeyAKICAgIF9fX3hfY21kICIkQCIKfQo=' | base64 -d)" > /dev/null 2>&1
eval "$(echo 'eF8gKCkgCnsgCiAgICBfX194X2NtZF9kZWZhdWx0YXNzaWdudmFyXyAiJEAiCn0K' | base64 -d)" > /dev/null 2>&1
eval "$(echo 'eF9sb2cgKCkgCnsgCiAgICBfX194X2NtZF9sb2dfcHIgeCAiJEAiCn0K' | base64 -d)" > /dev/null 2>&1
eval "$(echo 'eHJjICgpIAp7IAogICAgbG9jYWwgSUZTPSIgJF9fX1hfQ01EX1VOU0VFTkNIQVJfTkVXTElORSI7
CiAgICBbICQjIC1lcSAwIF0gJiYgc2V0IC0tICIiOwogICAgbG9jYWwgc3ViY21kPSIkMSI7CiAg
ICBzaGlmdDsKICAgIGNhc2UgIiRzdWJjbWQiIGluIAogICAgICAgIGNhdCB8IHdoaWNoIHwgcmVz
ZXQgfCByZWxvYWQpCiAgICAgICAgICAgIF9fX3hfY21kX3NvdXJjZV9pbm5lciB4cmMvbGliL3hy
Yy8iJHN1YmNtZCI7CiAgICAgICAgICAgIF9fX3hfY21kX3hyY18iJHN1YmNtZCIgIiRAIgogICAg
ICAgIDs7CiAgICAgICAgIiIpCiAgICAgICAgICAgIF9fX3hfY21kIGhlbHAgLW0geHJjIDE+JjI7
CiAgICAgICAgICAgIHJldHVybiA2NAogICAgICAgIDs7CiAgICAgICAgaGVscCB8IC1oIHwgLS1o
ZWxwKQogICAgICAgICAgICBfX194X2NtZCBoZWxwIC1tIHhyYwogICAgICAgIDs7CiAgICAgICAg
cm9vdCkKICAgICAgICAgICAgcHJpbnRmICIlcyIgIiRfX19YX0NNRF9ST09UIgogICAgICAgIDs7
CiAgICAgICAgLS1scykKICAgICAgICAgICAgX19feF9jbWRfY21kc19scyAiJF9fX1hfQ01EX1JP
T1RfTU9EIgogICAgICAgIDs7CiAgICAgICAgc2V0bWFpbikKICAgICAgICAgICAgX19feF9jbWRf
eHJjX3NldF9tYWluICIkQCIKICAgICAgICA7OwogICAgICAgICopCiAgICAgICAgICAgIF9fX3hf
Y21kX3hyY19zb3VyY2VfZmlsZSAiJHN1YmNtZCIgIiRAIjsKICAgICAgICAgICAgcmV0dXJuICQ/
CiAgICAgICAgOzsKICAgIGVzYWMKfQo=' | base64 -d)" > /dev/null 2>&1
# Shell Options
shopt -u array_expand_once
shopt -u assoc_expand_once
shopt -u autocd
shopt -u bash_source_fullpath
shopt -u cdable_vars
shopt -u cdspell
shopt -u checkhash
shopt -u checkjobs
shopt -s checkwinsize
shopt -s cmdhist
shopt -u compat31
shopt -u compat32
shopt -u compat40
shopt -u compat41
shopt -u compat42
shopt -u compat43
shopt -u compat44
shopt -s complete_fullquote
shopt -u direxpand
shopt -u dirspell
shopt -u dotglob
shopt -u execfail
shopt -s expand_aliases
shopt -u extdebug
shopt -u extglob
shopt -s extquote
shopt -u failglob
shopt -s force_fignore
shopt -s globasciiranges
shopt -s globskipdots
shopt -u globstar
shopt -u gnu_errfmt
shopt -u histappend
shopt -u histreedit
shopt -u histverify
shopt -s hostcomplete
shopt -u huponexit
shopt -u inherit_errexit
shopt -s interactive_comments
shopt -u lastpipe
shopt -u lithist
shopt -u localvar_inherit
shopt -u localvar_unset
shopt -s login_shell
shopt -u mailwarn
shopt -u no_empty_cmd_completion
shopt -u nocaseglob
shopt -u nocasematch
shopt -u noexpand_translation
shopt -u nullglob
shopt -s patsub_replacement
shopt -s progcomp
shopt -u progcomp_alias
shopt -s promptvars
shopt -u restricted_shell
shopt -u shift_verbose
shopt -s sourcepath
shopt -u varredir_close
shopt -u xpg_echo
set -o braceexpand
set -o hashall
set -o interactive-comments
set -o monitor
set -o onecmd
shopt -s expand_aliases
# Aliases
alias -- @exit='___x_cmd_log_envmsg && exit'
alias -- @return='___x_cmd_log_envmsg && return'
alias -- arg:1:cama='___x_cmd_arg___cama "$1"      ||  M="Invalid Value $1"                                    arg:ret:64'
alias -- arg:1:float='___x_cmd_is float "$1"       ||  M="Please provide float value. Current value is $1"     arg:ret:64'
alias -- arg:1:in='___x_cmd_arg___in "$1"          ||  M="Invalid Value $1"                                    arg:ret:64'
alias -- arg:1:int='___x_cmd_is int "$1"           ||  M="Please provide int value. Current value is $1"       arg:ret:64'
alias -- arg:1:nonempty='[ -n "$1" ]               ||  M="Please provide non-empty value"                      arg:ret:64'
alias -- arg:2:cama='___x_cmd_arg___cama "$2"      ||  M="Invalid Value following $1 ==> $2"                   arg:ret:64'
alias -- arg:2:float='___x_cmd_is float "$2"       ||  M="Please provide float value following $1 ==> $2"      arg:ret:64'
alias -- arg:2:in='___x_cmd_arg___in "$2"          ||  M="Invalid Value following $1 ==> $2"                   arg:ret:64'
alias -- arg:2:int='___x_cmd_is int "$2"           ||  M="Please provide int value following $1 ==> $2"        arg:ret:64'
alias -- arg:2:kv='[ $# -ge 2 ] || M="Option requires more than 1 argument -> $1"          arg:ret:64; ___x_cmd_arg___kv; shift 2'
alias -- arg:2:nonempty='[ -n "$2" ]               ||  M="Please provide non-empty value following $1"         arg:ret:64'
alias -- arg:2:shift='[ $# -ge 2 ]                 ||  M="Option requires more than 1 argument -> $1"          arg:ret:64;  shift 2'
alias -- arg:add='___x_cmd cmdstr'
alias -- arg:help='
alias -- case "$1" in
alias --     --help|-h)  shift; ___x_cmd help   -c  "$___X_CMD_ARG_CMDID"  "$@" ;   return 0    ;;
alias --     ,)          shift; ___x_cmd co     -c  "$___X_CMD_ARG_CMDID"  "$@" ;   return $?   ;;
alias --     ,,)         shift; ___x_cmd coco   -c  "$___X_CMD_ARG_CMDID"  "$@" ;   return $?   ;;
alias -- esac
alias -- '
alias -- arg:init='
alias --     2>/dev/null 1>&2 local ___X_CMD_ARG_LOGGERNAME;
alias --     2>/dev/null 1>&2 local ___X_CMD_ARG_HELPCMD;
alias --     ___x_cmd_arg___init'
alias -- arg:init:x='
alias --     2>/dev/null 1>&2 local ___X_CMD_ARG_LOGGERNAME;
alias --     2>/dev/null 1>&2 local ___X_CMD_ARG_CMDID;
alias --     2>/dev/null 1>&2 local ___X_CMD_ARG_HELPCMD;
alias --     ___x_cmd_arg_initx'
alias -- arg:invalid:ret:64='M="Unknown options -> $1"          arg:ret:64'
alias -- arg:ret:64='M="${M}${___X_CMD_ARG_HELPCMD:+"
alias -- More info: $___X_CMD_ARG_HELPCMD"}" N="${___X_CMD_ARG_LOGGERNAME:-arg}" log:ret:64'
alias -- arglist='___x_cmd_arg'
alias -- ex:init='local ___X_CMD_EX_EXIT_CODE; local ___X_CMD_EX_EXIT_LOGGER; ___x_cmd_ex_init'
alias -- ex:ret:if-err='___x_cmd_ex_if_err || return $?'
alias -- ex:ret:if-int='___x_cmd_ex_if_int || return 130'
alias -- ex:save='___X_CMD_EX_EXIT_CODE=$?'
alias -- help:arg-null:parse='
alias -- case "$1" in
alias --     "")         help:show:ret:64 ;;
alias --     --help|-h)  help:show:ret:0
alias -- esac
alias -- '
alias -- help:arg:parse='
alias -- case "$1" in
alias --     --help|-h)  help:show:ret:0
alias -- esac
alias -- '
alias -- help:ret:0='___x_cmd_help_ret      || return 0 2>/dev/null || exit 0'
alias -- help:ret:1='___x_cmd_help_ret >&2  || return 1 2>/dev/null || exit 1'
alias -- help:ret:64='___x_cmd_help_ret >&2 || return 64 2>/dev/null || exit 64'
alias -- help:show:ret:0='
alias --     ___x_cmd help --show
alias --     unset X_help_cmd
alias --     return 0 || exit 0
alias -- '
alias -- help:show:ret:64='
alias --     ___x_cmd help --show >&2
alias --     unset X_help_cmd
alias --     return 64 || exit 64
alias -- '
alias -- log:debug='test -z "$___X_CMD_LOG_DEBUG" -a 1 -lt "${___X_CMD_LOG__log:-2}" || O=log ___x_cmd_log_pr_debug'
alias -- log:error='test -z "$___X_CMD_LOG_DEBUG" -a 4 -lt "${___X_CMD_LOG__log:-2}" || O=log ___x_cmd_log_pr_error'
alias -- log:exec='___x_cmd_log exec'
alias -- log:exit='___x_cmd_log___return || exit'
alias -- log:info='test -z "$___X_CMD_LOG_DEBUG" -a 2 -lt "${___X_CMD_LOG__log:-2}" || O=log ___x_cmd_log_pr_info'
alias -- log:panic='E="$?" ___x_cmd_log___return_auto || return'
alias -- log:ret:1='___x_cmd_log___return || return 1 2>/dev/null || exit 1'
alias -- log:ret:64='___x_cmd_log___return || return 64 2>/dev/null || exit 64'
alias -- log:return='E="$?" ___x_cmd_log___return_auto || return'
alias -- log:sub:fini='___x_cmd_log sub fini'
alias -- log:sub:init='
alias --     local x_LOG_FLAT="${x_LOG_FLAT}" 2>/dev/null 1>&2;
alias --     local ___X_CMD_LOG_YML_INDENT="${___X_CMD_LOG_YML_INDENT}" 2>/dev/null 1>&2;
alias --     local ___X_CMD_LOG_YML_PID_LIST="${___X_CMD_LOG_YML_PID_LIST}" 2>/dev/null 1>&2;
alias --     ___x_cmd_log sub init'
alias -- log:sub:reset='___x_cmd_log sub reset'
alias -- log:trace='{ local ___X_CMD_LOG_DEBUG="${___X_CMD_LOG_DEBUG}"; local ___X_CMD_LOG_TRACE_LINE_LOCAL="${___X_CMD_LOG_TRACE_LINE_LOCAL}"; } 2>/dev/null; ___x_cmd_log trace'
alias -- log:trace:evex='___x_cmd_log trace_evex'
alias -- log:trace:time='___x_cmd_log trace_time'
alias -- log:warn='test -z "$___X_CMD_LOG_DEBUG" -a 3 -lt "${___X_CMD_LOG__log:-2}" || O=log ___x_cmd_log_pr_warn'
alias -- panic:exit='eval "___x_cmd_panic___loginner && exit"'
alias -- panic:return='eval "___x_cmd_panic___loginner && return"'
alias -- x:debug='test -z "$___X_CMD_LOG_DEBUG" -a 1 -lt "${___X_CMD_LOG__x:-2}" || O=x ___x_cmd_log_pr_debug'
alias -- x:error='test -z "$___X_CMD_LOG_DEBUG" -a 4 -lt "${___X_CMD_LOG__x:-2}" || O=x ___x_cmd_log_pr_error'
alias -- x:info='test -z "$___X_CMD_LOG_DEBUG" -a 2 -lt "${___X_CMD_LOG__x:-2}" || O=x ___x_cmd_log_pr_info'
alias -- x:trace='{ local ___X_CMD_LOG_DEBUG="${___X_CMD_LOG_DEBUG}"; local ___X_CMD_LOG_TRACE_LINE_LOCAL="${___X_CMD_LOG_TRACE_LINE_LOCAL}"; } 2>/dev/null; ___x_cmd_log trace'
alias -- x:trace:evex='___x_cmd_log trace_evex'
alias -- x:trace:time='___x_cmd_log trace_time'
alias -- x:warn='test -z "$___X_CMD_LOG_DEBUG" -a 3 -lt "${___X_CMD_LOG__x:-2}" || O=x ___x_cmd_log_pr_warn'
alias -- xrc:inner='___x_cmd_source_inner'
alias -- xrc:inner:lib='___x_cmd_source_inner_lib'
alias -- xrc:mod='___x_cmd_source_inner'
alias -- xrc:mod:lib='___x_cmd_source_inner_lib'
# Check for rg availability
if ! command -v rg >/dev/null 2>&1; then
  alias rg='/nix/store/aas19cahp7bisigznz5b3z9hy3zh9qds-claude-code-1.0.98/lib/node_modules/\@anthropic-ai/claude-code/vendor/ripgrep/x64-linux/rg'
fi
export PATH=/nix/store/7xqn2kis5gaa01r6p95zw700k4lw0lxp-bash-interactive-5.3p3/bin\:/nix/store/b3rsa3r13bkp8hr5g3pncxpb6b3crvxl-patchelf-0.15.0/bin\:/nix/store/bcw9f6r9v2fm3kv7d15fcrya0mf34xds-gcc-wrapper-14.3.0/bin\:/nix/store/qdknxw57cwy1jkrhq7fzmiis73j42jv6-gcc-14.3.0/bin\:/nix/store/j941hd82ybw2czd7lgf3xwccmqy9281h-glibc-2.40-66-bin/bin\:/nix/store/xbp2j3z0lhizr5vvzff4dgdcxgs8i2w7-coreutils-9.7/bin\:/nix/store/ky2x48xfid0nn5arablpwlnsngj70gws-binutils-wrapper-2.44/bin\:/nix/store/xrwdb41dqi2ia6lr2s61w5bzfg2m71pi-binutils-2.44/bin\:/nix/store/aas19cahp7bisigznz5b3z9hy3zh9qds-claude-code-1.0.98/bin\:/nix/store/xbp2j3z0lhizr5vvzff4dgdcxgs8i2w7-coreutils-9.7/bin\:/nix/store/bn3p3g6lsl0wa4ybrvik5rk4j5h3q7lb-findutils-4.10.0/bin\:/nix/store/wjd5xfqk2cm55wfkc0nyxlg38d1h17x0-diffutils-3.12/bin\:/nix/store/i74283mw5bncn16i0zbz0lvvq4sn0q87-gnused-4.9/bin\:/nix/store/5ygilvgz6l47fw3x5ylb0cz1afgc3737-gnugrep-3.12/bin\:/nix/store/0f4bvykzxsjvxh01jh1zai6s5jjlrach-gawk-5.3.2/bin\:/nix/store/wa302h6k7rvrp6mzvq96swdyh3np0cyh-gnutar-1.35/bin\:/nix/store/6w3g3nzyqqvhv36q2xj22k4d9vw3jl7h-gzip-1.14/bin\:/nix/store/yiwcf5lsmalda0211g2nra5p20vmbp3q-bzip2-1.0.8-bin/bin\:/nix/store/3aliwf9m0ji0fvpb6dg5hhp691fsvi1p-gnumake-4.4.1/bin\:/nix/store/4bacfs7zrg714ffffbjp57nsvcz6zfkq-bash-5.3p3/bin\:/nix/store/8j75alqms3ldbds4b4zip9mmy4af59ml-patch-2.8/bin\:/nix/store/fksqvzy6pc1a4rbpyyiq4932m22aq5h4-xz-5.8.1-bin/bin\:/nix/store/z08sfbfszjqfd52v6ccw35l332rfskz6-file-5.45/bin\:/home/player00/.x-cmd.root/local/data/pkg/sphere/X/l/j/h/bin\:/home/player00/.x-cmd.root/bin\:/run/wrappers/bin\:/home/player00/.local/share/flatpak/exports/bin\:/var/lib/flatpak/exports/bin\:/home/player00/.nix-profile/bin\:/nix/profile/bin\:/home/player00/.local/state/nix/profile/bin\:/etc/profiles/per-user/player00/bin\:/nix/var/nix/profiles/default/bin\:/run/current-system/sw/bin\:/nix/store/ky2x48xfid0nn5arablpwlnsngj70gws-binutils-wrapper-2.44/bin\:/nix/store/g49vmwgy8n1h67miaccqqzsmzhwf3psw-hyprland-qtutils-0.1.4/bin\:/nix/store/83clm3iscfyi4prrar8rbandrmss5sfd-pciutils-3.14.0/bin\:/nix/store/b6wz03kpkjvn6accwhnw6k6qki628dnx-pkgconf-wrapper-2.4.3/bin\:/home/player00/.x-cmd.root/local/data/triarii/bin
