name "taginfo"
description "Role applied to all taginfo servers"

default_attributes(
  :accounts => {
    :users => {
      :jochen => {
        :status => :administrator
      },
      :taginfo => {
        :status => :role,
        :members => [:jochen, :tomh]
      }
    }
  },
  :apache => {
    :mpm => "event",
    :event => {
      :server_limit => 40,
      :max_request_workers => 1000,
      :min_spare_threads => 50,
      :max_spare_threads => 150,
      :threads_per_child => 50,
      :max_connections_per_child => 10000
    }
  },
  :taginfo => {
    :sites => [
      {
        :name => "taginfo.openstreetmap.org",
        :description => "This is the main taginfo site. It contains OSM data for the whole planet and is updated daily.",
        :about => "<p>This site is run by the <a href='http://www.osmfoundation.org/'>OSMF</a> and maintained by <a href='//www.openstreetmap.org/user/Jochen%20Topf'>Jochen Topf</a> and the <a href='//wiki.openstreetmap.org/wiki/System_Administrators'>Sysadmin team</a>.</p><p>Several <a class='extlink' href='//wiki.openstreetmap.org/wiki/Taginfo/Sites'>other taginfo sites</a> are operated by different people for different areas of the world.</p>",
        :icon => "world",
        :contact => "Jochen Topf <jochen@remote.org>"
      }
    ]
  }
)

run_list(
  "recipe[taginfo]"
)
