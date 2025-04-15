set alias_file ~/.config/fish/aliases.fish

function create_venv
    # 检查是否传递了虚拟环境名称
    if test -n "$argv[1]"
        set VENV_NAME $argv[1]
        # 在当前目录创建虚拟环境
        python -m venv $VENV_NAME

        # 获取激活脚本的绝对路径
        set VENV_PATH (realpath $VENV_NAME)
        set ACTIVATE_PATH "$VENV_PATH/bin/activate.fish"

        # 检查激活脚本是否存在
        if test -f $ACTIVATE_PATH
            # 更新配置文件 ~/.config/fish/config.fish
            set -l config_file ~/.config/fish/config.fish

            # 创建别名，用于直接激活虚拟环境
            set ALIAS_NAME "$VENV_NAME"
            echo "alias $ALIAS_NAME='source $ACTIVATE_PATH'" >>$alias_file
            echo "Alias '$ALIAS_NAME' created to start the virtual environment."
            source $config_file
            $ALIAS_NAME
            echo "enter $ALIAS_NAME and set pip config..."
            pip config set global.index-url https://mirrors.tuna.tsinghua.edu.cn/pypi/web/simple
	    python -m pip install --upgrade pip
            echo "config completed"
        else
            echo "Error: Activation script not found!"
        end
    else
        echo "Usage: create_venv venvname"
    end
end


function rm_venv
    # 检查是否传递了虚拟环境名称
    if test -n "$argv[1]"
        set VENV_NAME $argv[1]
        set VENV_PATH (realpath $VENV_NAME)
        set ACTIVATE_PATH "$VENV_PATH/bin/activate.fish"

        # 确认虚拟环境文件夹存在
        if test -d $VENV_NAME
            # 删除虚拟环境文件夹
            rm -rf $VENV_NAME
            echo "Virtual environment '$VENV_NAME' has been deleted."

            if test "$VIRTUAL_ENV" = "$VENV_PATH"
                echo "deactivate $VENV_PATH first"
                deactivate
            end

            # 更新配置文件 ~/.config/fish/config.fish
            set -l config_file ~/.config/fish/config.fish

            # 删除与虚拟环境相关的alias和source行
            if test -f $config_file
                # 删除别名行
                set ALIAS_NAME "$VENV_NAME"
                sed -i "/alias $ALIAS_NAME/d" $alias_file
                echo "Removed alias from config.fish."

                # 重新加载 Fish 配置文件，使更改立即生效
                source $config_file

            else
                echo "Config file not found."
            end
        else
            echo "Virtual environment '$VENV_NAME' does not exist."
        end
    else
        echo "Usage: delete_venv venvname"
    end
end
