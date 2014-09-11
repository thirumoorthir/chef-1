name "viserion"
description "Master role applied to viserion"

default_attributes(
  :networking => {
    :interfaces => {
      :external_ipv4 => {
        :interface => "eth0",
        :role => :external,
        :family => :inet,
        :address => "193.198.233.211",
        :prefix => "27",
        :gateway => "193.198.233.209"
      },
      :external_ipv6 => {
        :interface => "eth0",
        :role => :external,
        :family => :inet6,
        :address => "2001:b68:4cff:3::2",
        :prefix => "128",
        :gateway => "fe80::217:fff:fead:14c0"
      }
    }
  },
  :squid => {
    :cache_mem => "12500 MB",
    :cache_dir => "coss /store/squid/coss-01 128000 block-size=8192 max-size=262144 membufs=80"
  },
  :tilecache => {
    :tile_parent => "pula.render.openstreetmap.org",
    :tile_siblings => [
    ]
  }
)

run_list(
  "role[carnet]",
  "role[tilecache]"
)