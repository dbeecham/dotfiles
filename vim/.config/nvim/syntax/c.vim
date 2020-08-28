if exists("b:current_syntax")
    "finish
    syntax clear cIncludeGlobalHeader
    syntax clear cIncludeGlobal
    syntax clear cString
endif
let b:current_syntax = "c"


" normal c strings. begins with quote, skips all escaped stuff, and ends with
" a quote
syntax region cString start=:\v": skip=:\v\\.: end=:\v":

" comments
syntax match cComment :\v//.*:
syntax region cComment start=:\v/\*: end=:\v\*/:


" local headers are just like c strings
syntax region cIncludeLocalHeader start=:\v": skip=:\v\\.: end=:\v": contained

" global headers are <these>
syntax match cIncludeGlobalHeader :\v\<[^\>]*\>: contained

" include statements can be like
"#include <hello>
" #include <hello>
"    #   include <hello>
syntax match cInclude :\v^\s*#\s*include\s: nextgroup=cIncludeGlobalHeader,cIncludeLocalHeader


" gotta be careful with function definitions...
" some examples
"
" int gwyupnp_init_tcp (
"     struct gwyupnp_s * gwyupnp
" )
" {
"   for (stuff) {
"     ..
"   }
" }

" conditionals
syntax keyword Conditional if switch for while break continue case default

" Some additional defines
syntax keyword Keyword __FILE__ __LINE__ __func__

" I want the linux api specially highlighted
syntax keyword LinuxFunction syslog close getaddrinfo freeaddrinfo syslog
    \ openlog epoll_wait epoll_ctl strerror open exit read write bind epoll_create1 timerfd_create timerfd_settime
    \ socket setsockopt gai_strerror listen recvfrom printf snprintf sendto accept warn err fprintf closelog
    \ nanosleep fflush sigwaitinfo sigaddset sigemptyset waitpid pthread_create fork sethostname execl mount
    \ srand48 drand48 clock_gettime sigprocmask prctl

" these are type keywords, but I want them highlighted as normal
syntax keyword NormalType struct union const

" some other normal types
syntax keyword NormalType int char uint8_t return sizeof static volatile void unsigned NULL double float long


highlight link cIncludeLocalHeader Include
highlight link cIncludeGlobalHeader Include
highlight link cInclude Include
highlight link cString String
highlight link cComment Comment
"highlight link cType Type
