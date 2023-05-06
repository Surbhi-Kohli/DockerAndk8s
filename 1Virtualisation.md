Virtualization:
Technique of splitting/adding physical resources into as many logical resources as we want.

You may have a mobile phone with internal memory:32 gb and u have a memory card of 16gb.In case u want to download a movie of 40 gb, you wont be 
able to download it as such, unless u choose to use ur memory card as an internal memory.(Virtualisation with adding resources).
In case if u now remove ur sd card, ur whole memory gets corrupted.

## Hypervisor:
Hypervisor is a piece of software or firmware that creates and runs a virtual machine.Hypervisor is sometimes also called as Virtual Machine Manager.


Types of hypervisor:

     * Type 1 hypervisor(bare metal/native hypervisor) -used in                Enterprise
     * Type 2 hypervisor(hosted hypervisor)- used in            learning,testing purpose

__Type1 Hypervisor:__
This hypervisor runs directly on system hardware(that's why also know as firmware).The guest OS of the VM runs above the hypervisor.

VMware ESXi is a Type1 hypervisor that runs on host server hardware without an underlying OS.
Type1 hypervisor acts as their own OS.

__Firmware__: Something that runs directly on the top of OS layer.
__Software__: Something that runs above the firmware.

A hypervisor provides virtualization layer that abstracts the CPU,storage,memory and networking resources of the physical host into multiple virtual machines.

<img width="275" alt="Screenshot 2023-05-06 at 1 59 45 PM" src="https://user-images.githubusercontent.com/32058209/236612926-397880fa-b9d9-46e9-9924-126f02c51a01.png">


__Type 2 Hypervisor__(Hosted type):
Hypervisor that runs within conventional OS environment that the host OS provides.

Example of Type2 Hypervisors are VMware workstation,Oracle Virtual Box and Microsoft Virtual PC.
This hypervisor doess not have direct access to the host Hardware and resources.

<img width="258" alt="Screenshot 2023-05-06 at 2 09 41 PM" src="https://user-images.githubusercontent.com/32058209/236613733-4a92ddc8-8ec7-444a-b591-bc4e0efe429b.png">

<img width="610" alt="Screenshot 2023-05-06 at 2 14 31 PM" src="https://user-images.githubusercontent.com/32058209/236613744-5fe027db-ccf2-4f21-88c4-c9650ddc517c.png">


