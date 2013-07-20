Forked from https://github.com/jpettersson/vagrant-rails-project-box

Having fun installing all that software needed to start a new rails project? No? Then use this VM instead. Until I have finished the documentation read this to find out why this is a great thing: 

http://blog.base2.io/2012/05/01/vagrants-and-chefs-and-librarians-oh-my/#.UQmCJEq6BYh

# Get up and running

## 1. Install VirtualBox
https://www.virtualbox.org/

## 2. Clone repo
``
  $ git clone https://github.com/batdevis/vagrant-rails-project-box.git
``

``
  $ cd vagrant-rails-project-box/
``

## 3. Install vagrant and librarian
``
  $ bundle
``

## 4. Install chef cookbooks
``
  $ librarian-chef install
``

## 5. Build the VM
``
  $ vagrant up
``

# Usage

There's a folder called 'app' in this directory, it will be mounted into the VM at "/vagrant/app". This is where the rails app should be cloned. Since this folder is shared between the two environments you can edit code from your host OS and run rails commands (etc) from within the VM.

To login to the VM run:

``
  $ vagrant ssh
``

When you are done, exit the VM and run the following command to suspend it until later.

``
  $ vagrant suspend
``

Resume work at anytime:

``
  $ vagrant up
``

