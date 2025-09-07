# Snapshot file
# Unset all aliases to avoid conflicts with functions
unalias -a 2>/dev/null || true
# Functions
log_log () {
	___x_cmd_log_pr log "$@"
}
x () {
	___x_cmd "$@"
}
x_ () {
	___x_cmd_defaultassignvar_ "$@"
}
x_log () {
	___x_cmd_log_pr x "$@"
}
xrc () {
	local IFS=" $___X_CMD_UNSEENCHAR_NEWLINE" 
	[ $# -eq 0 ] && set -- ""
	local subcmd="$1" 
	shift
	case "$subcmd" in
		(cat | which | reset | reload) ___x_cmd_source_inner xrc/lib/xrc/"$subcmd"
			___x_cmd_xrc_"$subcmd" "$@" ;;
		("") ___x_cmd help -m xrc >&2
			return 64 ;;
		(help | -h | --help) ___x_cmd help -m xrc ;;
		(root) printf "%s" "$___X_CMD_ROOT" ;;
		(--ls) ___x_cmd_cmds_ls "$___X_CMD_ROOT_MOD" ;;
		(setmain) ___x_cmd_xrc_set_main "$@" ;;
		(*) ___x_cmd_xrc_source_file "$subcmd" "$@"
			return $? ;;
	esac
}
# Shell Options
setopt nohashdirs
setopt login
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
alias -- arg:help=$'\ncase "$1" in\n    --help|-h)  shift; ___x_cmd help   -c  "$___X_CMD_ARG_CMDID"  "$@" ;   return 0    ;;\n    ,)          shift; ___x_cmd co     -c  "$___X_CMD_ARG_CMDID"  "$@" ;   return $?   ;;\n    ,,)         shift; ___x_cmd coco   -c  "$___X_CMD_ARG_CMDID"  "$@" ;   return $?   ;;\nesac\n'
alias -- arg:init=$'\n    2>/dev/null 1>&2 local ___X_CMD_ARG_LOGGERNAME;\n    2>/dev/null 1>&2 local ___X_CMD_ARG_HELPCMD;\n    ___x_cmd_arg___init'
alias -- arg:init:x=$'\n    2>/dev/null 1>&2 local ___X_CMD_ARG_LOGGERNAME;\n    2>/dev/null 1>&2 local ___X_CMD_ARG_CMDID;\n    2>/dev/null 1>&2 local ___X_CMD_ARG_HELPCMD;\n    ___x_cmd_arg_initx'
alias -- arg:invalid:ret:64='M="Unknown options -> $1"          arg:ret:64'
alias -- arg:ret:64=$'M="${M}${___X_CMD_ARG_HELPCMD:+"\nMore info: $___X_CMD_ARG_HELPCMD"}" N="${___X_CMD_ARG_LOGGERNAME:-arg}" log:ret:64'
alias -- arglist=___x_cmd_arg
alias -- ex:init='local ___X_CMD_EX_EXIT_CODE; local ___X_CMD_EX_EXIT_LOGGER; ___x_cmd_ex_init'
alias -- ex:ret:if-err='___x_cmd_ex_if_err || return $?'
alias -- ex:ret:if-int='___x_cmd_ex_if_int || return 130'
alias -- ex:save='___X_CMD_EX_EXIT_CODE=$?'
alias -- help:arg-null:parse=$'\ncase "$1" in\n    "")         help:show:ret:64 ;;\n    --help|-h)  help:show:ret:0\nesac\n'
alias -- help:arg:parse=$'\ncase "$1" in\n    --help|-h)  help:show:ret:0\nesac\n'
alias -- help:ret:0='___x_cmd_help_ret      || return 0 2>/dev/null || exit 0'
alias -- help:ret:1='___x_cmd_help_ret >&2  || return 1 2>/dev/null || exit 1'
alias -- help:ret:64='___x_cmd_help_ret >&2 || return 64 2>/dev/null || exit 64'
alias -- help:show:ret:0=$'\n    ___x_cmd help --show\n    unset X_help_cmd\n    return 0 || exit 0\n'
alias -- help:show:ret:64=$'\n    ___x_cmd help --show >&2\n    unset X_help_cmd\n    return 64 || exit 64\n'
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
alias -- log:sub:init=$'\n    local x_LOG_FLAT="${x_LOG_FLAT}" 2>/dev/null 1>&2;\n    local ___X_CMD_LOG_YML_INDENT="${___X_CMD_LOG_YML_INDENT}" 2>/dev/null 1>&2;\n    local ___X_CMD_LOG_YML_PID_LIST="${___X_CMD_LOG_YML_PID_LIST}" 2>/dev/null 1>&2;\n    ___x_cmd_log sub init'
alias -- log:sub:reset='___x_cmd_log sub reset'
alias -- log:trace='{ local ___X_CMD_LOG_DEBUG="${___X_CMD_LOG_DEBUG}"; local ___X_CMD_LOG_TRACE_LINE_LOCAL="${___X_CMD_LOG_TRACE_LINE_LOCAL}"; } 2>/dev/null; ___x_cmd_log trace'
alias -- log:trace:evex='___x_cmd_log trace_evex'
alias -- log:trace:time='___x_cmd_log trace_time'
alias -- log:warn='test -z "$___X_CMD_LOG_DEBUG" -a 3 -lt "${___X_CMD_LOG__log:-2}" || O=log ___x_cmd_log_pr_warn'
alias -- panic:exit='eval "___x_cmd_panic___loginner && exit"'
alias -- panic:return='eval "___x_cmd_panic___loginner && return"'
alias -- run-help=man
alias -- which-command=whence
alias -- x:debug='test -z "$___X_CMD_LOG_DEBUG" -a 1 -lt "${___X_CMD_LOG__x:-2}" || O=x ___x_cmd_log_pr_debug'
alias -- x:error='test -z "$___X_CMD_LOG_DEBUG" -a 4 -lt "${___X_CMD_LOG__x:-2}" || O=x ___x_cmd_log_pr_error'
alias -- x:info='test -z "$___X_CMD_LOG_DEBUG" -a 2 -lt "${___X_CMD_LOG__x:-2}" || O=x ___x_cmd_log_pr_info'
alias -- x:trace='{ local ___X_CMD_LOG_DEBUG="${___X_CMD_LOG_DEBUG}"; local ___X_CMD_LOG_TRACE_LINE_LOCAL="${___X_CMD_LOG_TRACE_LINE_LOCAL}"; } 2>/dev/null; ___x_cmd_log trace'
alias -- x:trace:evex='___x_cmd_log trace_evex'
alias -- x:trace:time='___x_cmd_log trace_time'
alias -- x:warn='test -z "$___X_CMD_LOG_DEBUG" -a 3 -lt "${___X_CMD_LOG__x:-2}" || O=x ___x_cmd_log_pr_warn'
alias -- xrc:inner=___x_cmd_source_inner
alias -- xrc:inner:lib=___x_cmd_source_inner_lib
alias -- xrc:mod=___x_cmd_source_inner
alias -- xrc:mod:lib=___x_cmd_source_inner_lib
# Check for rg availability
if ! command -v rg >/dev/null 2>&1; then
  alias rg='/nix/store/aas19cahp7bisigznz5b3z9hy3zh9qds-claude-code-1.0.98/lib/node_modules/\@anthropic-ai/claude-code/vendor/ripgrep/x64-linux/rg'
fi
export PATH=/run/wrappers/bin\:/home/player00/.local/share/flatpak/exports/bin\:/var/lib/flatpak/exports/bin\:/home/player00/.nix-profile/bin\:/nix/profile/bin\:/home/player00/.local/state/nix/profile/bin\:/etc/profiles/per-user/player00/bin\:/nix/var/nix/profiles/default/bin\:/run/current-system/sw/bin\:/nix/store/ky2x48xfid0nn5arablpwlnsngj70gws-binutils-wrapper-2.44/bin\:/nix/store/g49vmwgy8n1h67miaccqqzsmzhwf3psw-hyprland-qtutils-0.1.4/bin\:/nix/store/83clm3iscfyi4prrar8rbandrmss5sfd-pciutils-3.14.0/bin\:/nix/store/b6wz03kpkjvn6accwhnw6k6qki628dnx-pkgconf-wrapper-2.4.3/bin
