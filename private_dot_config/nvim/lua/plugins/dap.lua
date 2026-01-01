return {
    'mfussenegger/nvim-dap',

    dependencies = {
        {
            'nvim-neotest/nvim-nio' -- Required for dap-ui
        },
        {
            'rcarriga/nvim-dap-ui',

            config = function()
                require('dapui').setup()
            end,
        },
    },

    keys = {
        { '<leader>bt', '<cmd>DapToggleBreakpoint<cr>' },
        { '<F5>',       '<cmd>DapContinue<cr>' },
        { '<F6>',       '<cmd>DapStepOut<cr>' },
        { '<F7>',       '<cmd>DapStepInto<cr>' },
        { '<F8>',       '<cmd>DapStepOver<cr>' },
    },

    config = function()
        local dap, dapui = require('dap'), require('dapui')

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end

        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end

        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- Go (delve)
        dap.adapters.go = function(callback, config)
            if config.mode == 'remote' and config.request == 'attach' then
                callback({
                    type = 'server',
                    host = config.host or '127.0.0.1',
                    port = config.port or '38697'
                })
            else
                callback({
                    type = 'server',
                    port = '${port}',
                    executable = {
                        command = 'dlv',
                        args = { 'dap', '-l', '127.0.0.1:${port}', '--log', '--log-output=dap' },
                        detached = vim.fn.has('win32') == 0,
                    }
                })
            end
        end

        dap.configurations.go = {
            {
                type = 'go',
                name = 'Debug',
                request = 'launch',
                program = '${file}'
            },
            {
                type = 'go',
                name = 'Debug Test',
                request = 'launch',
                mode = 'test',
                program = '${file}'
            },
            {
                type = 'go',
                name = 'Debug test (go.mod)',
                request = 'launch',
                mode = 'test',
                program = './${relativeFileDirname}'
            }
        }
    end,
}
