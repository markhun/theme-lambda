function fish_prompt
    # Cache exit status
    set -g exit_code $status

    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end
    if not set -q __fish_prompt_char
        switch (id -u)
            case 0
                set -g __fish_prompt_char '#'
            case '*'
                set -g __fish_prompt_char 'λ'
        end
    end

    set -l normal (set_color normal)
    set -l white (set_color FFFFFF)
    set -l turquoise (set_color 5fdfff)
    set -l orange (set_color df5f00)
    set -l hotpink (set_color df005f)
    set -l magenta (set_color magenta)
    set -l red (set_color red)
    set -l yellow (set_color yellow)
    set -l blue (set_color blue)
    set -l limegreen (set_color 87ff00)
    set -l green (set_color green)
    set -l purple (set_color af5fff)

    # Configure __fish_git_prompt
    set -g __fish_git_prompt_char_stateseparator " | "

    set -g __fish_git_prompt_color_branch magenta
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_showupstream "informative"
    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_prefix " "

    set -g __fish_git_prompt_char_stagedstate "● "
    set -g __fish_git_prompt_char_dirtystate "✚ "
    set -g __fish_git_prompt_char_untrackedfiles "… "
    set -g __fish_git_prompt_char_conflictedstate "✖ "
    set -g __fish_git_prompt_char_cleanstate "✔ "

    set -g __fish_git_prompt_color_stagedstate yellow
    set -g __fish_git_prompt_color_dirtystate blue
    set -g __fish_git_prompt_color_untrackedfiles normal
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_cleanstate green --bold

    # Line 1
    echo -n $green'╭─'$green'['$normal$__fish_prompt_hostname$green']'$white' in '$green(pwd)$normal
    __fish_git_prompt " [ %s ]"
    echo

    # Line 2
    echo -n $green'╰'
    # support for virtual env name
    if set -q VIRTUAL_ENV
        echo -n "($turquoise"(basename "$VIRTUAL_ENV")"$white)"
    end
    echo -n $green'─'$red$__fish_prompt_char $normal
end


