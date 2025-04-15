set -gx date (date)
set -x PATH /opt/homebrew/bin $PATH
set -gx LDFLAGS "-L/opt/homebrew/opt/mysql-client/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/mysql-client/include"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/mysql-client/lib/pkgconfig"

# Openssl
set -gx PATH "/opt/homebrew/opt/openssl@3/bin" $PATH

# miniOB
set -gx LDFLAGS "-L/opt/homebrew/opt/openssl@3/lib -L/opt/homebrew/opt/libomp/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/openssl@3/include -I/opt/homebrew/opt/libomp/include"
set -gx CXXFLAGS "-I/opt/homebrew/opt/libomp/include"
set -gx LDFLAGS "-L/opt/homebrew/opt/libomp/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/libomp/include"

# 动态库路径（可选）
set -gx DYLD_LIBRARY_PATH "/opt/homebrew/lib" $DYLD_LIBRARY_PATH
