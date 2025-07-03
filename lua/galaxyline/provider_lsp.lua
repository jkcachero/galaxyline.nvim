local get_lsp_client = function (msg)
  msg = msg or 'No Active Lsp'
  local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
  local clients = vim.lsp.get_clients()
  if #clients == 0 then
    return msg
  end

  for _,client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes,buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

return {
  get_lsp_client = get_lsp_client
}
