function fish_prompt --description 'Write out the prompt'
    set -l normal (set_color normal)

    # Color the prompt differently when we're root
    set -l color_cwd $fish_color_cwd
    set -l suffix '>'
    if contains -- $USER root toor
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
    end

    # Show number of jobs, if there are any
    set -l jobs_count (jobs -p | count)
    set -f jobs_info ''

    if test "$jobs_count" -gt 0
        set -f jobs_info " {$jobs_count}"
    end

    echo -n -s (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal (set_color $fish_color_command) $jobs_info $normal " " $suffix " "
end
