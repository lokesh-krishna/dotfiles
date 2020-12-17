" Vim syntax file
" " Language: gemini
" " Maintainer: sloum < sloum AT rawtext.club >
" " Latest Revision: 08 Jun 2020

"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Handle monospaced blocks
syn region gmiMono start=/^```/ end=/^```/

" Handle between one and three heading levels
syn match gmiHeader /^#\{1,3}[^#].*$/

" Start a link line
syn match gmiLinkStart /^=>/ nextgroup=gmiLinkUrl skipwhite

" An extremely naive way of handling the URL portion of the link line
" This is left naive in a deliberate attempt to be unambiguous about
" what part of a link line gemini considers to be the URL, regardless
" of whether or not it is a valid URL
syn match gmiLinkUrl /\S\+/ contained nextgroup=gmiLinkTitle skipwhite

" Skipping whitespace from the URL match all text, including whitespace,
" until the end of the line
syn match gmiLinkTitle /.*$/ contained

" Handle list items
syn match gmiListItem /^\* .*$/

" Handle quotes
syn match gmiQuoteLine /^>.*/

let b:current_syntax = "gmi"


