" Vim syntax file
" Language:	Python
" Maintainer:	Neil Schemenauer <nas@python.ca>
" Updated:	2006-10-15
"		Added Python 2.4 features 2006 May 4 (Dmitry Vasiliev)
"
" Options to control Python syntax highlighting:
"
" For highlighted numbers:
"
"    let cython_highlight_numbers = 1
"
" For highlighted builtin functions:
"
"    let cython_highlight_builtins = 1
"
" For highlighted standard exceptions:
"
"    let cython_highlight_exceptions = 1
"
" Highlight erroneous whitespace:
"
"    let cython_highlight_space_errors = 1
"
" If you want all possible Python highlighting (the same as setting the
" preceding options):
"
"    let cython_highlight_all = 1
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn keyword cythonStatement	break continue del
syn keyword cythonStatement	except exec finally
syn keyword cythonStatement	pass print raise
syn keyword cythonStatement	return try with
syn keyword cythonStatement	global assert
syn keyword cythonStatement	lambda yield
syn keyword cythonStatement	def cdef ctypedef class nextgroup=cythonFunction skipwhite
syn match   cythonFunction	"[a-zA-Z_][a-zA-Z0-9_]*" contained
syn keyword cythonRepeat	for while
syn keyword cythonConditional	if elif else
syn keyword cythonOperator	and in is not or
" AS will be a keyword in Python 3
syn keyword cythonPreCondit	import cimport from as
syn match   cythonComment	"#.*$" contains=cythonTodo,@Spell
syn keyword cythonTodo		TODO FIXME XXX contained

" Decorators (new in Python 2.4)
syn match   cythonDecorator	"@" display nextgroup=cythonFunction skipwhite

" strings
syn region cythonString		matchgroup=Normal start=+[uU]\='+ end=+'+ skip=+\\\\\|\\'+ contains=cythonEscape,@Spell
syn region cythonString		matchgroup=Normal start=+[uU]\="+ end=+"+ skip=+\\\\\|\\"+ contains=cythonEscape,@Spell
syn region cythonString		matchgroup=Normal start=+[uU]\="""+ end=+"""+ contains=cythonEscape,@Spell
syn region cythonString		matchgroup=Normal start=+[uU]\='''+ end=+'''+ contains=cythonEscape,@Spell
syn region cythonRawString	matchgroup=Normal start=+[uU]\=[rR]'+ end=+'+ skip=+\\\\\|\\'+ contains=@Spell
syn region cythonRawString	matchgroup=Normal start=+[uU]\=[rR]"+ end=+"+ skip=+\\\\\|\\"+ contains=@Spell
syn region cythonRawString	matchgroup=Normal start=+[uU]\=[rR]"""+ end=+"""+ contains=@Spell
syn region cythonRawString	matchgroup=Normal start=+[uU]\=[rR]'''+ end=+'''+ contains=@Spell
syn match  cythonEscape		+\\[abfnrtv'"\\]+ contained
syn match  cythonEscape		"\\\o\{1,3}" contained
syn match  cythonEscape		"\\x\x\{2}" contained
syn match  cythonEscape		"\(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match  cythonEscape		"\\$"

if exists("cython_highlight_all")
  let cython_highlight_numbers = 1
  let cython_highlight_builtins = 1
  let cython_highlight_exceptions = 1
  let cython_highlight_space_errors = 1
endif

if exists("cython_highlight_numbers")
  " numbers (including longs and complex)
  syn match   cythonNumber	"\<0x\x\+[Ll]\=\>"
  syn match   cythonNumber	"\<\d\+[LljJ]\=\>"
  syn match   cythonNumber	"\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>"
  syn match   cythonNumber	"\<\d\+\.\([eE][+-]\=\d\+\)\=[jJ]\=\>"
  syn match   cythonNumber	"\<\d\+\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

if exists("cython_highlight_builtins")
  " builtin functions, types and objects, not really part of the syntax
  syn keyword cythonBuiltin	True False bool enumerate set frozenset help
  syn keyword cythonBuiltin	reversed sorted sum
  syn keyword cythonBuiltin	Ellipsis None NotImplemented __import__ abs
  syn keyword cythonBuiltin	apply buffer callable chr classmethod cmp
  syn keyword cythonBuiltin	coerce compile complex delattr dict dir divmod
  syn keyword cythonBuiltin	eval execfile file filter float getattr globals
  syn keyword cythonBuiltin	hasattr hash hex id input int intern isinstance
  syn keyword cythonBuiltin	issubclass iter len list locals long map max
  syn keyword cythonBuiltin	min object oct open ord pow property range
  syn keyword cythonBuiltin	raw_input reduce reload repr round setattr
  syn keyword cythonBuiltin	slice staticmethod str super tuple type unichr
  syn keyword cythonBuiltin	unicode vars xrange zip
endif

if exists("cython_highlight_exceptions")
  " builtin exceptions and warnings
  syn keyword cythonException	ArithmeticError AssertionError AttributeError
  syn keyword cythonException	DeprecationWarning EOFError EnvironmentError
  syn keyword cythonException	Exception FloatingPointError IOError
  syn keyword cythonException	ImportError IndentationError IndexError
  syn keyword cythonException	KeyError KeyboardInterrupt LookupError
  syn keyword cythonException	MemoryError NameError NotImplementedError
  syn keyword cythonException	OSError OverflowError OverflowWarning
  syn keyword cythonException	ReferenceError RuntimeError RuntimeWarning
  syn keyword cythonException	StandardError StopIteration SyntaxError
  syn keyword cythonException	SyntaxWarning SystemError SystemExit TabError
  syn keyword cythonException	TypeError UnboundLocalError UnicodeError
  syn keyword cythonException	UnicodeEncodeError UnicodeDecodeError
  syn keyword cythonException	UnicodeTranslateError
  syn keyword cythonException	UserWarning ValueError Warning WindowsError
  syn keyword cythonException	ZeroDivisionError
endif

if exists("cython_highlight_space_errors")
  " trailing whitespace
  syn match   cythonSpaceError   display excludenl "\S\s\+$"ms=s+1
  " mixed tabs and spaces
  syn match   cythonSpaceError   display " \+\t"
  syn match   cythonSpaceError   display "\t\+ "
endif

" This is fast but code inside triple quoted strings screws it up. It
" is impossible to fix because the only way to know if you are inside a
" triple quoted string is to start from the beginning of the file. If
" you have a fast machine you can try uncommenting the "sync minlines"
" and commenting out the rest.
syn sync match cythonSync grouphere NONE "):$"
syn sync maxlines=200
"syn sync minlines=2000

if version >= 508 || !exists("did_cython_syn_inits")
  if version <= 508
    let did_cython_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " The default methods for highlighting.  Can be overridden later
  HiLink cythonStatement	Statement
  HiLink cythonFunction		Function
  HiLink cythonConditional	Conditional
  HiLink cythonRepeat		Repeat
  HiLink cythonString		String
  HiLink cythonRawString	String
  HiLink cythonEscape		Special
  HiLink cythonOperator		Operator
  HiLink cythonPreCondit	PreCondit
  HiLink cythonComment		Comment
  HiLink cythonTodo		Todo
  HiLink cythonDecorator	Define
  if exists("cython_highlight_numbers")
    HiLink cythonNumber	Number
  endif
  if exists("cython_highlight_builtins")
    HiLink cythonBuiltin	Function
  endif
  if exists("cython_highlight_exceptions")
    HiLink cythonException	Exception
  endif
  if exists("cython_highlight_space_errors")
    HiLink cythonSpaceError	Error
  endif

  delcommand HiLink
endif

let b:current_syntax = "cython"

" vim: ts=8
