# flutter_multi_module_arch

A new Flutter project.

## How to create a module..?

Step 1 : create directory "core" and change your working directory to "core"
         
         $ mkdir core
         $ cd core

Step 2: create "data" module inside "core" directory
        (command -> flutter create --template=package enter_module_name_here)
         
         $ flutter create --template=package data
                            (or)
         $ flutter create --template=package core/data
         