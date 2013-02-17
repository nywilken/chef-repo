include_recipe "torquebox"

jruby_app "opsgadget" do
  enable true
  approot "/vagrant"
end
