return {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                parameterNames = true,
            },
            staticcheck = true,
        },
    },
}
