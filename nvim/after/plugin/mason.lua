local present, mason = pcall(require, 'mason')

if not present then
    return
end

mason.setup()

