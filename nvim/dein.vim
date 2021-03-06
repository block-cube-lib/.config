let s:dein_dir = $XDG_CACHE_HOME. '/nvim/dein'
let s:dein_repo_dir = s:dein_dir. '/repos/github.com/Shougo/dein.vim'

if !isdirectory(expand(s:dein_repo_dir))
  execute '!git clone https://github.com/Shougo/dein.vim '. s:dein_repo_dir
endif
let &runtimepath = &runtimepath. ','. s:dein_repo_dir

let s:toml_file = $XDG_CONFIG_HOME. '/nvim/dein.toml'
let s:lazy_toml_file = $XDG_CONFIG_HOME. '/nvim/dein_lazy.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file, s:lazy_toml_file])
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" install plugin if not installed
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
