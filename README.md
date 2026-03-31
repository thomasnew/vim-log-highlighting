# Vim Log Highlighting

![Log highlighting example](doc/mylog.png)

## Overview

Provides syntax highlighting for generic log files in VIM.

Some of the highlighted elements are:
- Dates and times
- Common log level keywords like ERROR, INFO, DEBUG
- Numbers, booleans and strings
- URLs and file paths
- IP and MAC addresses
- SysLog format columns
- XML Tags
- Other customized keywords





## Installation

### Manual Install

- cp ./ftdetect/* ~/.vim/ftdetect/
- cp ./syntax/* ~/.vim/syntax/
- cp ./.vimrc ~/.vimrc

Note: `.vimrc` is a hidden file in the repository root.




## Configuration

Once installed, the syntax highlighting will be enabled by default for files ending with `.log` and `_log` suffixes.

By default only uppercase keywords are recognized as level indicators in the log files.
You can add additional log level keywords using the standard VIM syntax functions, for example by adding this to your `.vimrc` file:

```viml
" Add custom level identifiers
au rc Syntax log syn keyword logLevelError MY_CUSTOM_ERROR_KEYWORD
```

Likewise you can disable highlighting for elements you don't need:

```viml
" Remove highlighting for URLs
au rc Syntax log syn clear logUrl
```



## Related Projects

* VIM Built-in /var/log/messages highlighting
* [vim-log-syntax](https://github.com/dzeban/vim-log-syntax) by dzeban
* [vim-log4j](https://github.com/tetsuo13/Vim-log4j) by tetsuo13
* [ccze](https://github.com/cornet/ccze) by cornet
