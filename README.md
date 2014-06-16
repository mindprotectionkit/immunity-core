///LOGO///


Ultra-Secure Cloud OS
=====================

### Minimalistic KVM Hypervisor with strong focus on simplicity.

Immunity Core is a kernel-only Linux distribution designed for virtualization security.
It serves as a ultra-secure hypervisor at the core of free private cloud deployments.
Protecting the virtualization layer is critical for any *really* secure cloud (private of public).
Today's hypervisors are not very secure, agencies can (easily) enter the layer below most cloud servers. :(

Immunity Core is here to change this. A 10 MB kernel+hypervisor live-CD which does *nothing* else than running your KVM-instances.
Please deploy it on secure hardware. Using [Coreboot](http://www.coreboot.org/) and a secure network card is highly recommended.


#Background

(tbd)

Hypervisors are the core blocks of any cloud architecture. 
Protecting their integrity and preventing over-interested third parties from entering your servers is very important.
Unfortunately there is no easy to use bare metal hypervisor with appropriate security built-in. 

The Goal of this project is to create a very small, ultra secure, lightweight, read only KVM hypervisor.
We want to protect cloud services from adversaries of any kind. Gouvernments should not be able to steal our data from clouds. Immunity Core is an important tool to fulfill this mission.


#Security

Immunity Core integrates the following seurity-features.

+ No keyboard/mouse at runtime.
+ 

#Project Principles

+ Simplicity
+ Security
+ As-small-as-possible
+ Deploy read only


#Documentation

1. Burn Immunity-Core .iso img
2. Start ...
tbc...



#References
1. [Tresor](http://en.wikipedia.org/wiki/TRESOR)
2. [Privatecore](http://privatecore.com/use-cases/prism-proof-cloud-servers/)
3. [Network](http://www.links.org/?p=330)
4. [Backdoors](http://krebsonsecurity.com/2013/01/backdoors-found-in-barracuda-networks-gear/)

