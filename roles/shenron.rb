name "shenron"
description "Master role applied to shenron"

default_attributes(
  :accounts => {
    :users => {
      :bretth => {
        :status => :user,
        :shell => "/usr/bin/git-shell"
      }
    }
  },
  :apache => {
    :mpm => "event",
    :event => {
      :min_spare_threads => 50,
      :max_spare_threads => 150
    }
  },
  :apt => {
    :sources => ["brightbox-ruby-ng"]
  },
  :hardware => {
    :modules => [
      "it87"
    ]
  },
  :openvpn => {
    :address => "10.0.16.3",
    :tunnels => {
      :shenron2ucl => {
        :port => "1194",
        :mode => "server",
        :peer => {
          :host => "ridley.openstreetmap.org"
        }
      }
    }
  }
)

override_attributes(
  :networking => {
    :interfaces => {
      :external_ipv4 => {
        :interface => "eth0",
        :role => :external,
        :family => :inet,
        :address => "212.110.172.32",
        :prefix => "26",
        :gateway => "212.110.172.1"
      },
      :external_ipv6 => {
        :interface => "eth0",
        :role => :external,
        :family => :inet6,
        :address => "2001:41c9:1:400::32",
        :prefix => "64",
        :gateway => "fe80::1"
      }
    }
  }
)

run_list(
  "role[bytemark]",
  "role[mail]",
  "role[lists]",
  "role[git]",
  "role[subversion]",
  "role[trac]",
  "role[osqa]",
  "role[irc]",
  "role[dns]",
  "role[geodns]",
  "role[chef-repository]",
  "recipe[blogs]",
  "recipe[openvpn]"
)
