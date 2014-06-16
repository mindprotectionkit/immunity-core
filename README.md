///LOGO///


Ultra-Secure Cloud OS
=====================

### Minimalistic KVM Hypervisor with strong focus on simplicity.

Immunity Core is a kernel only Linux Image with strong focus on security.
It is used as a hypervisor for cloud services designed to secure virtualized environments.

Immunity Core is a 10 MB kernel+hypervisor live-CD which does *nothing* else than running your KVM-instances.

Please deploy it on secure hardware. [Coreboot](http://www.coreboot.org/) is mandatory.


#Background

Hypervisors are the core blocks of any cloud architecture. 
Protecting their integrity and preventing over-interested third parties from entering your servers is very important.
Unfortunately there is no easy to use bare metal hypervisor with appropriate security built-in. 

The Goal of this project is to create a very small, ultra secure, lightweight, read only KVM hypervisor.
We want to protect cloud services from adversaries of any kind. Gouvernments should not be able to steal our data from clouds. Immunity Core is an important tool to fulfill this mission.



#Principles

+ Design to be small
+ Very limited number of packages
+ Read-Only Deployment
+ Deployment-Stages
+ Boot from Disk-Drive


#Documentation

1. Burn Immunity-Core .iso img
2. Start ...
tbc...



#References
http://en.wikipedia.org/wiki/TRESOR
http://privatecore.com/use-cases/prism-proof-cloud-servers/


