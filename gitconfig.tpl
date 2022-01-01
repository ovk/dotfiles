[apply]
    # Warn on whitespace errors when applying a patch
    whitespace = warn

[core]
    editor = nvim
    whitespace = trailing-space,-space-before-tab

    # Convert CRLF to LF on commit
    autocrlf = input

[diff]
    algorithm = histogram
    renames = copies

[push]
    default = simple

[pull]
    rebase = true

[log]
    decorate = short
    abbrevCommit = true

[pretty]
    dense = '%C(bold green)%h%Creset: %C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)[%an]%Creset'

[user]
    name = ovk
    email = mail@okosh.xyz
    signingKey = 6A61296702850A3C

[commit]
    gpgsign = true
[rebase]
	autoStash = true
