-- Custom filetype detection
vim.filetype.add({
    pattern = {
        -- ArduPilot hardware definition files (processed by chibios_hwdef.py)
        [".*/hwdef/.*%.dat"] = "hwdef",
        [".*/hwdef/.*%.inc"] = "hwdef",
    },
})
