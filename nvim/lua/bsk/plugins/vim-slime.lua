-- send buffer to tmux
-- Put your cursor over the text you want to send and type:
-- ctrl-c ctrl-c

return {
	"jpalardy/vim-slime",
    config = function()
        vim.g.slime_target = "tmux"
        vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
    end
}
