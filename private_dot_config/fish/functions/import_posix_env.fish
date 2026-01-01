function import_posix_env --description 'Import environment variables from ~/.profile and /etc/profile'
    argparse 'v/verbose' -- $argv

    set newenv (env | sort | bash -l -c 'comm -13 - <(env | sort)')

    for e in $newenv
        set name (echo "$e" | cut -d '=' -f 1 | string trim)

        if test "$name" != "_"; and test "$name" != "SHLVL"
            if test "$name" = "PATH"
                set newpath (echo "$e" | cut -d '=' -f 2 | string split ':' | sort -u)

                for p in $newpath
                    if test -n "$_flag_v"
                        echo "fish_add_path $p"
                    end

                    fish_add_path "$p"
                end
            else
                if test -n "$_flag_v"
                    echo "export $e"
                end

                export $e
            end
        end
    end
end

