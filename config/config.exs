# gen.phx - Tue Oct 29 13:45:29 PDT 2019

import Config

for config <- "../apps/*/config/config.exs" |> Path.expand(__DIR__) |> Path.wildcard() do
  import_config config
end
