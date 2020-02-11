" $KYAULabs: dellpc.vim,v 1.0.0 2020/01/27 19:57:57 kyau Exp $
"
" Language:     Dell PowerConnect Switches
" Maintainer:   kyau
" Filenames:    *.switch *.pc6224 *.pc6248 *.pc6224p *.pc6248p
" Version:      1.0

" quit when a syntax file was already loaded.
if exists("b:current_syntax")
    finish
endif

syntax case ignore
setlocal iskeyword+=/
setlocal iskeyword+=:
setlocal iskeyword+=.
setlocal iskeyword+=-


syntax match dell_comment /^!.*/
syntax keyword dell_todo contained TODO FIXME XXX NOTE

syntax match dell_command /^\(configure\|stack\|member\|hostname\|routing\|interface\|vlan\|ip\|route\)/
syntax match dell_command /^\(description\|switchport\|storm-control\|username\|exit\|name\)/
syntax match dell_command / password /

syntax keyword dell_keyword database association address default-gateway name-server domain-name routing
syntax keyword dell_keyword mode general access trunk broadcast multicast unicast
syntax match dell_keyword / routing$/

syntax keyword dell_optional tagged tagged-only
syntax match dell_optional /level \d\+/
syntax match dell_optional / \(vlan\|ethernet\|subnet\)/

syntax keyword dell_misc add delete

syntax match dell_important /encrypted$/
syntax match dell_number display +\%( \d\+\|,\d\+\)\%( \d\+$\|,\d\+\|$\)+
syntax match dell_interface /\d\+\/g\d\+$/

syntax region dell_string start=+"+ end=+"+
syntax match dell_string /\(^description \)\@<=.\+/
syntax match dell_string /\(^hostname \|^name \| domain-name \)\@<=.\+/

syntax match dell_special +[{}]+
syntax match dell_special +,+ contained

" IPv4
syntax match dell_ipv4 /\d\{1,3}\.\d\{1,3}\.\d\{1,3}\.\d\{1,3}/
" IPv6
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\{7}\(\:\|\(\x\{1,4}\)\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\{6}\(\:\|\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\|\(\:\x\{1,4}\)\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\{5}\(\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)\|\(\(\:\x\{1,4}\)\{1,2}\)\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\{4}\(\:\x\{1,4}\)\{0,1}\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\{4}\(\:\x\{1,4}\)\{0,1}\(\(\:\x\{1,4}\)\{1,2}\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\{3}\(\:\x\{1,4}\)\{0,2}\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\{3}\(\:\x\{1,4}\)\{0,2}\(\(\:\x\{1,4}\)\{1,2}\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\{2}\(\:\x\{1,4}\)\{0,3}\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\{2}\(\:\x\{1,4}\)\{0,3}\(\(\:\x\{1,4}\)\{1,2}\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\(\:\x\{1,4}\)\{0,4}\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)/
syntax match dell_ipv6 /\s\(\x\{1,4}\:\)\(\:\x\{1,4}\)\{0,4}\(\(\:\x\{1,4}\)\{1,2}\)/
syntax match dell_ipv6 /\s\:\(\:\x\{1,4}\)\{0,5}\(\(\:\(\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\(\.\(25[0-5]\|2[0-4]\d\|[01]\?\d\{1,2}\)\)\{3}\)\?\)\|\(\(\:\x\{1,4}\)\{1,2}\)\)/

hi def link dell_todo Todo
hi def link dell_comment Comment

hi def dell_command ctermfg=white
hi def dell_keyword ctermfg=198
hi def dell_optional ctermfg=cyan
hi def dell_misc ctermfg=green
hi def dell_ipv4 ctermfg=gray cterm=underline
hi def dell_ipv6 ctermfg=gray cterm=underline
hi def dell_number ctermfg=228
hi def dell_string ctermfg=228
hi def dell_important ctermfg=red
hi def dell_special ctermfg=gray

let b:current_syntax = "PowerConnect"

" vim: ft=vim sts=4 sw=4 ts=4 et:
