" $Arch: nft.vim,v 1.003 2018/12/04 23:31:57 kyau Exp $
"
" Language:     nftables rules
" Maintainer:   kyau
" Filenames:    *.nft nftables*.conf
" Version:      1.3

" quit when a syntax file was already loaded.
if exists("b:current_syntax")
    finish
endif

syntax region NFTSet start=/{/ end=/}/ contains=NFTSetEntry
syntax match NFTSetEntry contained /[a-zA-Z0-9-]\+/
highlight NFTSet ctermfg=White
highlight NFTSetEntry ctermfg=DarkCyan

"syntax region NFTTableDef start=/^\s*table \S\+ \S\+/ end=// contains=NFTKeyword
"syntax region NFTChainDef start=/^\s*chain / end=/\S\+/ contains=NFTKeyword
"syntax match NFTKeyword contained /table\|chain/
"highlight NFTTableDef ctermfg=White
"highlight NFTChainDef ctermfg=White
"highlight link NFTKeyword Keyword

syntax region Comment start=/^\s*#/ end=/$/
syntax region String start=/"/ end=/"/
syntax keyword Keyword flush
syntax keyword Keyword table chain
syntax keyword Keyword priority
syntax keyword Type ip ip6 arp bridge tcp udp iifname ct
syntax keyword Type nat route
syntax match Type /^\s*type/
syntax keyword Constant input output forward prerouting postrouting ruleset

syntax keyword Special accept drop reject queue
syntax keyword Keyword continue return jump goto
syntax keyword Keyword counter log

syntax match Delimiter /{$\|^\s*}\|;/
syntax match Number / \d\+/
highlight Number ctermfg=DarkCyan

let b:current_syntax = "nft"
