# Arch Linux User Testimonies

## 1

Indeed "stable" can have many meanings.
Sure Debian has "stable" release, that remain "stable" until they are EOL ... at that point you have to upgrade and transition the whole system which can be a PITA to the point that sometimes it's better to reinstall from scratch.
Arch linux is not a "stable release" system, but rather is rolling: but once installed, it can be maintained forever.

So which is more stable, a flat path leading to a cliff, or a constant smooth incline.
I'd never want to use a non-rolling release distro on a server unless I knew for sure that the whole purpose of the server would sundown prior to the EOL of the distro selected ... so, you could say I'd see Debian could be ok for, you know, some little hobby project.

In case the tongue-in-check mockery of the "hobby" characterization isn't obvious, I have absolutely nothing against Debian. 
I don't have much experience with it, but have every reason to think highly of it.
But:
  1. it's not for me,
  2. I resent the patronizing implication that Debian would be for professionals and Arch for "toys" or "hobbies" and hope that presenting my argument for the opposite highlights how that is both incorrect and inappropriate.

## 2

Well, Arch itself uses Arch for servers.
In fact, this own BBS is hosted on Arch Linux.
I think you first must define what you mean by stable.
If you mean ABI stability, forget about it.
Debian is way more stable than Arch in that regard.
Of course, being rolling is one of the main reasons why Arch has no ABI, but not the sole one.
However, if you mean stable as in "it doesn't break for average desktop users", then I'd say Arch and Debian can be on equal footing, with Arch having a slight edge, doing to its rolling nature.

Also, with the advent of containers, there's little, to no reason, to not use the distro you want on a professional setting.
I develop software on Arch, use containers varying from debian to alpine, passing through Arch itself, and I can be productive.
Also, thinking about corporate usage of Arch, there are several companies using it too, as servers.
It depends much more on your workflow, than on which distro you use.

Finally, we're about to have thousands of devices deployed by Valve running Arch Linux.

## 3

It really doesn't matter whether I start some container from Arch or Debian.
I find rolling release Distros way better for container orchestration, because you usually get newer versions faster and don't have to manually install security updates all the time.

@steam deck running Arch: Steam Deck doesn't run Arch, it runs something that's based on Arch called SteamOS 3.0.

## 4

To add to Trilby's excellent points - I myself am strongly in the "constant, smooth line" camp.
For the Arch servers the setup I maintain is as follows: btrfs on root, automated hourly, daily, weekly, etc.. snapshots.
Pacman pre- and post- update hooks that make btrfs snapshots before and after upgrade.
Plus I make manual snapshots before I do anything major - like an upgrade of the database.

What this gives me is predictable upgrade sequence at all times with instant, 100% working roll back.
Lets say I started an upgrade and it went to shits - no worries.
I try and fix it if I can.
If I can't - roll back btrfs snapshot, get the system back online - go figure out the issue on my own schedule.
If answer is found, I can try upgrade and fix again, if not - sometimes i just wait a few releases and try again.
Sometimes i'd spin up another instance, btrfs send the whole disk and try the upgrade somewhere else - in a safe testing environment.

Even when the issue is tricky - lets say upgrade went fine, but then in a couple of weeks we have noticed something is off.
Still not an issue.
In one case I just copied the latest database to a 2 week old snapshot, started everything up and it was working 100% for another month while we were figuring out the issue neatly planned fix tickets in sprints.

I never have to maintain this on weekends, evenings, nights, etc.
I always have plenty of time to figure things out, test them on and off site.
I have options to roll-back, wait, or do whatever.
In a majority of cases the issue I am trying to fix is incremental, trackable and... currently discussed on Arch forums or posted about on Arch blog.
Once it is fixed - it doesn't come up again.

We are not a big company by any means, just a bunch of remote devs doing things.
But everywhere I worked before, all those RHEL and Oracle super stable systems - every other production release is a freaking forest fire.
Companies with continuous deployment fare better, but you still log in on weekends.
Rolling distro in production done right works, but in a context of large organization i don't think it has ever been tried.
In any case, it may not work due to organizational and complexity issues (100s of servers to maintain is not the same as 5), but from purely technical perspective rolling on the server is far superior IMHO.

## 5

At work, we have a system where we transport multiple video feeds from vehicles around large outdoor areas with MIMO Mesh networks (including several fixed nodes with fiber optic back hauls.
Each vehicle has an Arch box on it serving a RestFUL web interface to allow the vehicle to perform functions on demand via the network.
Each of those nodes is a rugged standalone device running on an embedded single board computer (SOM based) set up as an appliance with a standardized disk image, and no desktop environment any kind of GUI.
In addition, we have diagnostic Arch-based laptops with the usual network diagnostic tools installed, and video players (to monitor video on the network).
These have i3 and Plasma installed (i3 for me, and Plasma for the guys I weaned from Windows). 

Convincing the team to embrace Linux was easy.
When I inherited the project, it was Windows 7 based (not a domain, just non-enterprise workstations) and neigh unmanageable.
They had been bridging wired and wireless networks and it almost worked a majority of the time.
Most of the network issues vanished when we went to Linux, created rational routing rules, and implemented NAT to route between networks rather than trying to create one gigantic subnet.

And, once we have a working solution, we tend to lock it down then give it to the Information Assurance guys to do their penetration testing test.
Once they approve of our images, we don't change anything anyway making the issue of being a rolling release moot.
I should also note these are private networks that are not connected to the public internet.

## 6

Well, yes...

The whole back end of our shop runs arch linux. Server, parts, technicians machines, the service dept.
Has for about 6+ years now.
I did that when It finally became my responsibility.

The front part, the customer service area, and the office people have to have windows, I'm sure that you know that routine.
Trying to get them to use something other than windows...forget it.

And the Arch machines are trouble free.
And that is do to the shop part being technical people with brains that work, and know how to use a puter, and Arch sits there and works.
The only time I concentrate on the arch machines is during a whole shop update.
And I do that on Saturday, or when no one is there.
You could get a surprise there.
But even that is only with 1 machine usually because of hardware or a kernel something.

The windows machines(10) always have problems, and that's do to them being microsoft machines, and no technical brained people in front.
Does make a big difference.

## 7

Probably the biggest issue with Arch as a server operating system is that it's not clear where and when applications may break after an upgrade.
More often than not, you have to keep up with what's going on in the wiki and on the forums before doing any sort of upgrade; with Debian and CentOS, you can well assured that any upgrades won't break any applications, since more often than not, the upgrades done on the STABLE branch will be security/bug fixes.

However, shouldn't you be testing your updates before rolling them out anyways?
We are running a few Arch boxes in production, and testing updates every week or so on some internal machines.
When everything is assured to be working, I roll out the updates.

## 8

I am running several Archlinux Servers since 2013 in an production environment and it works like a charm.

Sure you have to make sure that updates are going well by running them often and to always check the archlinux page before you upgrade.

But thats it, in the end you will have much more troubles upgrading RedHat/CentOS from 6 to 7 (almost impossible) or SLES/SLED from 11 to 12 and so on.

You have constantly small updates that, from time to time, cause some action but i never had something big in the last 5 years.

And also you are always up to date, if there is a security leak in the kernel, in openssl, in the bash or whatever, you have the updates in a few hours rather than days to months.

My Server for example is fully upgraded and protected against spectre v1, spectre v2 and meltdown, i am pretty sure that only 1% of the people posting here have servers protected against all three.

It's fast, it's secure, it's stable(!) and you have up-to-date software which relieves you from a lot of issues.

I can highly recommend using Archlinux on Server, the only "downside" is that you have to know what you're doing.
You should have installed an LFS system at least once so you understand the very basics on how a Linux distro is built and works.

The only Server System i found more rock solid than Archlinux in a Server Environment was Gentoo.
There was one Gentoo System without updates for 700days and 1 hour later this system was up to date and running with the only down-time being a single reboot.

But other Systems like Debian/Ubuntu, RedHat, SUSE will just screw you up completely when there is a distro upgrade.
RedHat even actively discourages you to do an distro upgrade and recommend to reinstall (according to the official documentation).

So yes, RedHat is more upgrade stable than Archlinux, but only because you dont get big upgrades. And when you get them, you are screwed.

## 9

The main difference of server distros is that you get security updates only, while on arch, you get major revisions of the packages too, which may break stuff.

If you use mirrors specifically designed for servers, where you get only minor revisions, then it would be safe to use arch on servers.

## 10

Yes.

Pros:

    really minimal system out of the box, great for performance especially on low-end machines/VPS. No unneeded services - compared to CentOS 7 which started several VM-related services that weren't even applicable to me as I was running on bare-metal.

    up to date software and big repositories; I lost quite a bit of time with CentOS when something wasn't in the repos and I was forced to either compile it from source or install third-party RPMs/repos, and then end up in dependency hell because these third-party RPMs were conflicting with upgrades from official repos.

    systemd, though other distributions (even Ubuntu) are switching to it so it's less of a pro but something to be expected from any decent distro.

    network configuration tools that makes sense. No desktop-grade Networkmanager nor firewalld (looking at CentOS/RHEL).

    package manager that does just what it says on the tin. The package manager won't try to "help" you by automatically configuring or starting the service you just installed (looking at Ubuntu/Debian). It's also fast, better than yum, and maybe a tiny bit faster than apt-get.

    installation process that doesn't force you to use any defaults and offers lots of room for customization - compare that to CentOS/RHEL which forces you to use LVM and swap, something not always needed (almost never in my case actually)

    /usr/bin/python is actually the latest Python 3, not the prehistoric Python 2.7. That's always a problem for me with most other distributions, and you can't easily change that either (at least not system-wide) as it will break many apps who rely on it.

Cons:

    some upgrades require manual intervention and can break. I recommend having a replica of your production environment in VMs and testing the upgrades there before rolling them out on the real servers.

    no default working configurations. Bad for people who just want to run apt-get and install their default insecure LAMP stack to deploy their crappy vulnerable PHP app and pollute the internet. Of course, that's actually an advantage for serious people as it forces you to review the config files before starting the service.

    no SELinux support. There is GRSecurity and its RBAC, but you'll need some time to get used to it and fine-tune it.

I would disagree on the fact that you get less support. Sure, that's true. Is that a disadvantage ? No in my opinion. There's very little in Arch that could break and will require support from someone familiar with Arch. Usually if you need support you'll need it for a particular software, in which case you'd ask its developers and the fact that you're running Arch becomes irrelevant.

For me, using Arch is way easier and less time-consuming than using CentOS and its Networkmanager, firewalld and other unneeded services (they can be disabled, but that's already wasted time). Plus, I know every single service that runs on the system because I would've installed it, no sneaky software that nags me about a bug and wants to phone home even though I just installed the system.

## 11

as long as your server admin is capable, sure, arch works just fine as a server

## 12

I have run Arch as a development and testing server and I'm getting involved with the Arch Server project, so yeah, I'd say Arch is good for servers.
The clean, no added crap philosophy is ideal.
As long as you check if any major updates are reported to break things, you should be fine.

## 13

An idea would be to install on an LVM root filesystem. Then make a snapshot before each update - if something breaks, just boot from the snapshot.
You would need a known good kernel (which isn't automatically overwritten by Arch updates), but otherwise this seems pretty failsafe to me.

Of course, this only touches the stability aspect of servers, security/etc are something else.

## 14

OK, I've been using Arch by 5 years (or a bit more), as my main desktop.
I work as Systems and Networks Administrator, and my servers were, for the 4 last years, running Arch, from firewalls to jabber servers, with DHCP, DNS, WWW (Nginx+Apache), FTP, dictd, LDAP, .... in between.
All running Arch. And no real problems so far.

As long as you pay attention to update issues (ie: recent warning about PHP 5.3 update), effectively warned in www.archlinux.org frontpage, you shouldn't have any problems.

I have even a non-production server in which I mount and test any service before moving it to production.
In this server, I run "pacman -Syu" almost every day (yeah, I know, I'm a lot like a suicider, ;-D), and no real and stressing problems.

So, my opinion is: pay special attention to update issues, test everything in a non-production environment (this is valid for every OS you will use in a server, not only for Arch), and don't be stressed, you shouldn't.

Enjoy Arch, and this community, which IMHO is one of the best (if not the best).

See you

## 15

If you're hosting other peoples' sites, sites they rely on being up, sites they're possibly paying you to host.... I wouldn't do it. 

Arch is great, I use it for my own web site, it very rarely breaks, and I've had almost no downtime, but...

Arch is a rolling release, bleeding edge distro.  The only way to guarantee uptime would be to have a duplicate dev box, update/test there then push packages over.

Weigh your options, just sayin'.

## 16

Suggestions:

1) Don't run [testing]  tongue
2) Keep an eye on forums/mailing lists for update problems
3) Look at the list of updates before installing them

I update my work server about once every week or two.
If you update your desktop regularly, then you will know how long various packages have been around and hold off if you see potential problem causers.

## 17

I ran Arch for almost two years here with constant updates.
Never had any stability issues.
Maybe some changed configuration files, but other distributions are just overwriting your hand-written configuration.

Just keep an eye out to the updates.
There may be some you want to do in single steps.
You may not want to overwrite your glibc and try to continue updating (Zenwalk, anyone?) or things like that.
Be careful, but you can't do much wrong.

This machine here is our internal services machine, DNS, local FTP, local HTTP and thin client host.
Works like a charm.
Just try it.

## 18

I run arch on more than one server.
Depending on what the server does, Arch is the most logical fit.
The problem with debian type distros, is also their benefit - their updates are slow, and mostly directed strictly as security updates.
This is a hinderance to some projects, as many times things move faster than the speed of security now.
Python, being an easy issue that springs to mind.

In addition, Arch gives me less annoyance over -devel things.
The maze of dependencies for slow moving additions to a stable tree for python modules and (specifically) high performance http servers that I would need to build instead of install via package, just gets tiring after a while, and makes for ridiculously complex installation scripts for large clusters.
The days of LAMP like stacks are gone, especially after this whole apache hack in the past two years.

Just because Arch receives bleeding edge updates does not mean that it has to be seen that way.
Maintaining it under strict (PCI/SOX/Sas70) compliances is no easier or harder than Debian (or Redhat for that matter).
The same solution stands true, updates are slower.
That's it.
It just means that, instead of trying apt-get update && apt-get --dry-run upgrade every day and compiling a list (if something is even pushed) of what can or can't be updated (well, the days of that are gone too, I just use RSS now), the policy is still the same.
I manage a list, I check it against the potential for necessary urgency on security matters, and if I don't see a need it doesn't happen.
To be honest, the infighting and general malaise between Canonical and the Debian communities kind of made me distrust their process a bit, and Redhat's susceptibility to financial suggestion made their overall credibility drop in my eyes too.
Linux is linux, it all comes from the same place, and any security updates Redhat gets are available to us all the same.
I used to be able to fit an entire debian HTTP server in some pretty tight space even in modern days when I did it on a true minimal install... but that required work.
WIth arch, I start there, and I don't have to go any further than where I started.

As an aside, the main thing that drove me to use Arch for the first time on servers (My usage of it had already been for some time on my own desktop/laptops) was cgroups.
Redhat only introduced them in RHEL6, and RHEL is expensive as hell.
Fedora is just too bloated, and (at the time) the debian kernel wasn't going to see them for some time either.
For a while (6.06->9.04) we used Ubuntu, and honestly I don't remember if we even looked to see if they were there.
Arch was the easy frontrunner, because the secondary need was Python.
Devs at the company used primarily python for their effort on internal applications, and they were getting heavily into needs that were going to be an epic undertaking to get accepted into any one of the 4.
Arch just fit both needs.

## 19

/dev/zero, thanks for your input, what its really making me consider this is the fact as a general rule, if you want a rock-solid system, you can't have the lastest programs and updates, however in my case, I see Arch defying this rule every day.
I have installed arch on many machines by now (say about 5+ and I have used them all for extended periods of time) and I have experienced some hiccups regarding updates, but those tend to be big updates big userspace applications (say from Gnome 2 to Gnome3), on the server side applications (apache, mysql, ssh server, etc), I have never experienced any problems, thats was leads me to think this kind of setup could provide customers cutting-edge features while in a stable environment.

## 20

I can only recommend using arch for a server.
I run a fileserver at home and a database (web-) server + 2 workstations at work.
In my Arch life (4+ years) I had exactly 3 hiccups:

- years ago one xserver update was broken, which would not affect a headless server, of course
- postgres update 8 -> 9 required hands on to keep data, info was on startpage, so no problem at all
- early this year udev started assembling raid in addition to mdadm doing it.
  That was confusing and kind of a bug (only affected my fileserver, where / was on a raid as well) I ended up installing from scratch, but was able to keep my old /var and /home; so I did not loose any data. I guess there would have been a more sophisticated way to fix, but this worked quickest for me.

IMHO being able to jump quicker to php 5.4 (OO functionality) or to MySQL 5.5 (events) than on i.E. RedHat, weighs out watching your pacman output and arch news section from time to time.
My server at work is critical and never let me down.
In addition you never have to worry about a dist-upgrade or something like that ;-)

Of course, I don't update all machines at the same time ;-)

## 21

That's the key here: have two machines syncing manually all the time and test updates on one system before updating the other systems.

## 22

I would say Arch is completely usable for your server infrastructure provided you do a few things:

* Secure it. You need to know what to do here. Arch out-of-the-box is not sufficient, especially for a server.
* Test new packages before you deploy them.

It also comes down to the packages you use, and guarantee you'll have few problems with stability if you're mindful of the changes between releases.
You could even wait a week or two before updating to the latest package, just to see if there are any reports about a package.
You'll still your updates much quicker than you will on Debian or RHEL/CentOS.
You don't need to depend on "stable" server distros that update their packages once every year and a half.
Arch is still great for servers, but you do need to know what you're doing and you do need to be careful.

I've set up quite a few boxes for friends that use them in a server environment and they've seldom encountered any problems with stability, save an update a while back that affected the use of RAID.

TL;DR: Arch is great for server usage, just use your head.

## 23

I came back to Arch and I'm never leaving (Arch appreciation post)
FLUFF

I've first tried Arch about 8 years ago while I was still in school.
Managed to install it and everything but something broke and I ended up installing Debian since I've heard its suppose to be the most stable Linux distro.
I later switched to Fedora.

Between then and now I've graduated, got a job in software, and learned A LOT about Linux in the process.
I pretty much only used Debian and Fedora during that time.

Over the last few months I've grown a bit tired of everything just working and not being able to customise as much as I would like for fear of doing something that the Red Hat gods don't want you to do.
Around the same time Linux 6 came out and broke a lot of things related to my setup (wayland on NVIDIA graphics, on a laptop, with a DisplayLink dock hooked up to 3 monitors).
I've tried Gentoo, Debian stable/testing/unstable, Ubuntu, Manjaro, Solus, Alpine, Slackware, Pop, Mint, and probably a few more.

All of them had something I liked (package manager in Gentoo is hands down the best I've ever used) but also a lot that I didn't like (way more than I could ever write about).
Eventually, after avoiding it for so long after it left a bad taste in my mouth almost a decade ago, I've decided to give Arch another go.

Holy shit was it the easiest installation process I have ever gone through.
I have never not had to jump through hoops to get an encrypted disk with anything other than 256bit AES encryption before, but on Arch you just do it, modify grub, and its done.
You want a LTS kernel? Just ask.
You want that obscure package you always had to build from source?
Its on the AUR - just yay it.

On other distros after installing KDE and all my drivers I would usually end up with 1600-2000 packages on my system with some of the things still not working.
On Arch I'm currently on 600 with EVERYTHING working.
Probably will go up by 100-200 over the next week while I get everything back to the way I like it, but that is still 50% less packages overall and much less packages which I have no idea about existing.

I'm just amazed at how everything works while also giving me a lean system with bleeding edge packages - all without any headaches.

Me 8 years ago was missing out big time.

## 24

Have you ever gotten pwned while running Arch?
FLUFF

I've been running Arch since about 2007 and have never had a beach to my knowledge.
I was curious what other's experiences have been with security on Arch.

REPLY 1

No. Have it running both on servers and workstations.

Let's face it: all software has bugs and security holes.
But with Arch, I am at least less likely to be hacked because the software is newer, so there are fewer security holes unpatched.

The argument with downtime is also not valid. What is mission-critical is redundant anyway.

So why not benefit from new features and speed improvements instead?
For server applications, we invest heavily in testing, cicd, monitoring, blue-green deployments, and rolling back.

Considering all these strategies employed simultaneously, I see no reason not to use arch.

There is only one valid reason: you have no idea what you're doing, but you need that shiny contract to blame some other company if things go wrong.


## 25

[Source](https://plug-world.com/posts/arch-linux-just-works/)

### Introduction

Arch is often not recommended to new Linux users.
This is caused by the fact that you have to run a lot of commands to install and configure your system.
The terminal is scary.
The terminal is made for hackers.
That pushes new users away from it.

Despite all of that, I would recommend Arch Linux to beginners.

Arch has just recently made a guided installer.
The installer makes this process extremely easy and less tedious.

First and foremost, connect your device to the internet.

Then you may need to initalize your pacman keys.

```bash
pacman-key --init
```

Afterward, you can run through the guided installer.

```bash
python -m archinstall guided
```

Recently I tried to install Fedora on my laptop.
I heard a lot of good things about it.
Packages are up to date and stable.
But it sucked.
The package manager was sooo slow.
Updates took forever.
I had constant issues with the wifi on my laptop.
It led to me manually having to request ip addresses from my router using sudo dhclient -v.
One problem would lead to the next.
Constant issues and configuration.
Then I gave up. I wasted a whole week. I spent many hours trying to get things to “just work.”

### My Mistakes

I didn’t use the normal Fedora workstation install.
Instead, I used Fedora Everything.

I tried the Fedora workstation install initially.
But I hated it.
I didn’t like Gnome.
The system ran slow, and wasn’t as snappy as I was hoping.
It had over 2000 packages installed by default.
In comparison my Arch install on my desktop has 1805 packages.
I have many packages I don’t use, tons of apps installed, and steam games.
And yet it is less bloated than a vanilla Fedora install.

This led to me using Fedora Everything.
It’s just the essentials.
It boots to the terminal just like Arch.
Nothing additional installed.
I created a script to automatically install everything I needed.
It had my window manager (BSPWM), terminal (st), polybar, dot files and all of that fun stuff.

According to my virtual machine the script worked great.
It should be great to install quickly on multiple machines.
Nope, it wasn’t.
It sucked.
Constant issues with Fedora working with my laptop hardware.
It was an endless rabbithole of maintainance and fixing things.
I had an Nvidia Optimus based laptop.
That was the biggest problem for my custom Fedora install.
It led to many workarounds and dumb hacks.
This sucked, because I wanted to run this install on many laptops.
These workarounds wouldn’t work on other devices with different hardware.
This would lead to me constantly maintaining all of the devices using Fedora Everything.
I then stopped using Fedora.

### The Switch to Arch

Initially I didn’t want to use Arch on the laptop.
Mostly because most people on the internet says “it’s unstable”.
If I’m doing a laptop install, it needs to “just work”.
I’m not gonna have the time to mess around trying to get things working.

But I thought about it more.
I reconsidered.
I have ran my Arch install for almost a year on my desktop.
Guess what? No problems!
I probably had one or two things that broke.
But at the end of the day it was my fault that they broke in the first place.

### The Archening begins

Installing Arch was very straightforward.
I downloaded the latest Arch ISO.
And I had it livebooted in no time.
Running the Arch guided installer was very straightforward and I had all the customization I needed.
It allowed you to install most desktop environments and some window managers.
As well as installing your own packages if you so choose.
It even gave me the option to install my Nvidia drivers.

Instead of going my typical window manager route, I went with KDE Plasma.
I’m so glad I did.
Everything seems to work right out of the box.
Which is exactly what I needed.
When it booted into Plasma there was very few apps installed.
Last time I installed Plasma I had a ton of KDE apps I didn’t use.
It bloated up the system, and trying to delete them was a pain in the butt.
I’m really glad to see that it’s very minimal and I still have a lot of room to customize my install.
It also seems to use up way less resources than Gnome.
Plasma was super snappy and I’m really impressed how well it ran.
Can we talk about the number of packages.
I know packages aren’t everything, but holy cow!
When I was done with installing all of my apps and Plasma I had 700 packages!
By comparison, my Fedora Everything install had that many before I even started installing stuff.

My fresh Plasma install had almost no problems.
As always you get display issues on Nvidia Optimus laptops.
But it was an extremely simple fix.
You can fix it with changing your display manager configuration or your xorg conf.
You are also gonna have to switch from Wayland to Xorg in order for this to work.
You gotta love Nvidia, making things harder for everyone.
But after that fix, everything has been great!
I’ve been running it for over a week now. No problems!

### Arch is for Beginners

In my opinion I believe Arch is one of the best distros for beginners.
Now let me clear this up.
By beginners I mean anyone with some good computer experience that’s new to Linux.
The average Joe is always gonna have a harder time on Linux.
Especially if they are running into problems just using Windows.

You could say the terminal pushes away the beginners, your gonna have to touch the terminal in the installation.
But if you’re gonna use Linux you’re eventually gonna have to use the terminal.
The guided Arch installer opens the door to more people.
If you haven’t used Arch yet, I recommend you try it in a Virtual Machine and see how you like it.
Just go through the guided installer and see what you like.

Fedora could have been just fine.
My main issue came from not using the official workstation release.
Fedora workstation really wasn’t my thing.
Finding packages is quite a bit of work with Fedora.
It’s a smaller distro so many guides simply wouldn’t tell you what the Fedora equivalent packages are.
This leads to it taking more time hunting down packages.

With Arch, even if the application I want isn’t in the repo, I can just go to the AUR (Arch User Repository).
Almost any app that runs on linux will probably be in there.
You will rarely need to install dependencies or compile things yourself.
Which is even easier for beginners.

## 26

"Arch is the easiest distro for power users" is something i've been saying for ages.

Especially if you come from a dev background the aur + the wiki make it so much simpler compared to any of the usual "noob" distros.

Made even simpler if you go with a distro like endeavouros which is like a intro to arch basically with some of the same defaults everyone puts on a desktop arch system anyways.

## 27


