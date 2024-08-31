# bastion
Repository dedicated to the setup of a bastion host along with its infrastructure

# 1. Do a simple jump 
Configure your .ssh/config file : 
```
Host *
    ForwardAgent yes

Host bastion
    Hostname <public_ip>
    User ubuntu
    IdentityFile <key_path>
    Port 22

Host private_1
    Hostname 10.0.2.4
    User ubuntu
    IdentityFile <key_path>
    Port 22
    ProxyJump bastion

```
