-- Remove all trailing whitespaces from the current buffer
function RemoveTrailingWhitespace()
    if  vim.bo.modifiable == false or
        vim.bo.modified == false or
        vim.bo.binary == true or
        vim.bo.filetype == 'xxd' or
        vim.bo.filetype == 'diff' then
        return
    end

    local state = vim.fn.winsaveview()
    vim.api.nvim_command('keepjumps keeppatterns %s/\\s\\+$//e')
    vim.fn.winrestview(state)
end

-- Detect and highlight tabs in current window/buffer
function DetectTabs()

    if (vim.fn.search('\t', 'nw') > 0) then
        print('Tabs found and highlighted')
    else
        print('No tabs found')
    end
end

