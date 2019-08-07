" Vim syntax file
" Language: rEFInd config
" License: AGPLv3
" Maintainer: Kyau <kyau@kyaulabs.com>
" Latest Revision: 29 July 2019
"
" $KYAULabs: refind.vim,v 1.000 2019/07/29 01:45:33 kyau Exp $

if exists("b:current_syntax")
  finish
endif

" Comments
syn keyword rTodo contained TODO FIXME XXX NOTE
syn match rComment +#.*$+ contains=rTodo

" Numbers
syn match rNumber display + \d\+\%( \d\+$\|$\)+
syn match rUUID display /\x\{8}\-\x\{4}\-[1-5]\x\{3}\-[89AB]\x\{3}\-\x\{12}/

" Strings
syn region rString start=+"+ end=+"+

" Constants
syn match rConstant +\<[~yn]\>+
syn keyword rConstant true True TRUE false False FALSE yes Yes on ON no No off
syn keyword rConstant OFF null Null NULL nil Nil NIL

" Settings
syn match rSetting +^\(\s*\|\)banner+
syn match rSetting +^\(\s*\|\)timeout+
syn match rSetting +^\(\s*\|\)shutdown_after_timeout+
syn match rSetting +^\(\s*\|\)use_nvram+
syn match rSetting +^\(\s*\|\)screensaver+
syn match rSetting +^\(\s*\|\)hideui+
syn match rSetting +^\(\s*\|\)icons_dir+
syn match rSetting +^\(\s*\|\)banner_scale+
syn match rSetting +^\(\s*\|\)small_icon_size+
syn match rSetting +^\(\s*\|\)big_icon_size+
syn match rSetting +^\(\s*\|\)selection_big+
syn match rSetting +^\(\s*\|\)selection_small+
syn match rSetting +^\(\s*\|\)font+
syn match rSetting +^\(\s*\|\)textonly+
syn match rSetting +^\(\s*\|\)textmode+
syn match rSetting +^\(\s*\|\)resolution+
syn match rSetting +^\(\s*\|\)enable_touch+
syn match rSetting +^\(\s*\|\)enable_mouse+
syn match rSetting +^\(\s*\|\)mouse_size+
syn match rSetting +^\(\s*\|\)mouse_speed+
syn match rSetting +^\(\s*\|\)use_graphics_for+
syn match rSetting +^\(\s*\|\)showtools+
syn match rSetting +^\(\s*\|\)dont_scan_tools+
syn match rSetting +^\(\s*\|\)windows_recovery_files+
syn match rSetting +^\(\s*\|\)scan_driver_dirs+
syn match rSetting +^\(\s*\|\)scanfor+
syn match rSetting +^\(\s*\|\)include+
syn match rSetting +^\(\s*\|\)uefi_deep_legacy_scan+
syn match rSetting +^\(\s*\|\)scan_delay+
syn match rSetting +^\(\s*\|\)also_scan_for+
syn match rSetting +^\(\s*\|\)csr_values+
syn match rSetting +^\(\s*\|\)dont_scan_volumes+
syn match rSetting +^\(\s*\|\)dont_scan_dirs+
syn match rSetting +^\(\s*\|\)dont_scan_files+
syn match rSetting +^\(\s*\|\)scan_all_linux_kernels+
syn match rSetting +^\(\s*\|\)fold_linux_kernels+
syn match rSetting +^\(\s*\|\)spoof_osx_version+
syn match rSetting +^\(\s*\|\)extra_kernel_version_strings+
syn match rSetting +^\(\s*\|\)max_tags+
syn match rSetting +^\(\s*\|\)default_selection+
syn match rSetting +^\(\s*\|\)enable_and_lock_vmx+
syn match rSetting +^\(\s*\|\)menuentry+
syn match rSetting +^\(\s*\|\)submenuentry+

syn match rDisable +^\(\s*\|\)disabled+

syn match rType +^\(\s*\|\)icon+
syn match rType +^\(\s*\|\)volume+
syn match rType +^\(\s*\|\)loader+
syn match rType +^\(\s*\|\)initrd+
syn match rType +^\(\s*\|\)options+
syn match rType +^\(\s*\|\)add_options+

" Blocks / Separators
syn match rBlock +[{}]+
syn match rDelim +,+

hi rTodo ctermfg=green
hi rComment ctermfg=darkgray
hi rConstant ctermfg=214
hi rNumber ctermfg=214
hi rUUID ctermfg=172
hi rString ctermfg=144
hi rSetting ctermfg=darkblue
hi rDisable ctermfg=darkblue
hi rSubSetting ctermfg=darkblue
hi rTitle ctermfg=cyan
hi rBlock ctermfg=170
hi rDelim ctermfg=170
hi rType ctermfg=darkcyan

" vim: ft=vim sts=2 sw=2 ts=2 et:
