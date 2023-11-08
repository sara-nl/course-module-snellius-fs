# Hands-on Snellius file systems

Open a terminal to access to Snellius via `ssh`.
```
$ ssh scur1448@snellius.surf.nl
Last login: Wed Nov 8 18:33:29 2023
[scur1448@int5 ~]$
```

On the login node, we will identify the different file systems:
1. `/home`
2. `/scratch-shared`
3. `/project`
4. `/archive`

## Home
The home file system, often denoted as `/home`, is the storage space dedicated to individual user accounts on Snellius. It serves as a personal workspace where users can store their important files, configuration files, scripts, and other data. **Each user on Snellius has their own dedicated home directory** within the `/home` file system, which is found at `/home/<username>`. The home directory is usually private and can only be accessed by the user who owns it. Other users typically don't have access to your home directory. Although you can change its access permissions, you should be very restrictive in using this capability.

Right after logging into Snellius via ssh, the prompt will be located at your home. You can check this via the path to the working directory command, `pwd`, as follows:
```
[scur1448@int5 ~]$ pwd
/home/scur1448
```

The home file system often has disk space quotas associated with it. Users are allocated a specific amount of storage space, and it's essential to be mindful of your usage to avoid exceeding your quota. The number of individual files, or inodes, is also limited. You can check your quota and current usage with the `myquota` command.
```
[scur1448@int5 ~]$ myquota
scur1448@home4|GiB:quota=200.00,limit=210.00,usage=0.0000%|Inodes:quota=1000000,limit=1200000,usage=0.0008%
```

The home directory is typically designed for **long-term storage of essential files** and data. It's not the ideal location for temporary or large files that you're actively working on. Files stored in the home directory are often **backed up regularly to prevent data loss** in case of hardware failures or accidental file deletion. SURF supplies a versioned **incremental backup service** for your home directory that is run overnight. Files that have been backed up are retained in the backup repository for **three weeks** after they have been deleted from the file system. We can restore files and/or directories when you accidentally remove them or overwrite them with the wrong contents.

While the home file system is suitable for long-term storage, it's not optimized for high-performance I/O or large data processing tasks. For such operations, other file systems like `/scratch` or `/project` may be more suitable.
