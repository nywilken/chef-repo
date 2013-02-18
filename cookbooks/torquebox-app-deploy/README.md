Description
===========
This cookbook includes recipes to deploy a jruby rails app to a running torquebox instance. This recipe was specifically created for deploying a rails app to a torquebox instance running on a vagrant vm. 

Requirements
==========
This recipe requires the torquebox cookbook. It also requires that the user deploying the jruby app has write access to the the directory where the rail application resides. 

Usage
=====
}
    "run_list": [   "recipe[apt]",
                    "recipe[torquebox]",
                    "recipe[torquebox-app-deploy]"
                ]
}
