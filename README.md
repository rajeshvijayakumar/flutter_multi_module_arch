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

Step 3: Add and activate melos library for managing/linking multiple packages across the entire codebase as we use monorepos.

         $ flutter pub add melos
         $ dart pub global activate melos

Step 4: Export $HOME/.pub-cache/bin path for pub to install executables for your project.

         $ export PATH="$PATH":"$HOME/.pub-cache/bin"

