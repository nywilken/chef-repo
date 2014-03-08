name "base"
description "Role applied to all Ubuntu Linux boxes"
run_list "recipe[apt]",
         "recipe[build-essential]",
         "recipe[nodejs]",
         "recipe[simplicity::software]",
         "recipe[ntp]" 

default_attributes(
  'ntp' => {
    'servers' => ['64.90.182.55', '64.236.96.53', '206.246.122.250']
  }
)
