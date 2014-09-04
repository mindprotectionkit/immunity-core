===============
Data Protection
===============

.. toctree::
   :maxdepth: 2
   
Data Protection
================

You can’t stop or prevent a seizure of your computers, and your best defense against a subpoena is a lawyer, but there are still steps you can take to prevent a search of your computers without your cooperation, and minimize what information the government can get its hands on.

Encrypt your data
=================

Requiring a strong password to log onto accounts on your computer is a
good security step. But when the government is your attacker, it’s not
nearly enough. If the government `seizes`_ your computer, all it has to
do to get around your account protection is to take the hard drive out
and stick it into another computer to get around your password
protection. Similarly, if you were subject to a `sneak-and-peek
search`_, the government could sneak in with their own hardware, take
your hard drive out and copy it, and then replace it without you ever
knowing. Your best and only protection against this is to *encrypt* the
data that’s on your computer so the government can’t read it. If you’re
not familiar with encryption, how it works, and what it does, check out
our technology article about `encryption basics`_. 

You should also find
out more about how to choose and use `file and disk encryption
software`_. 

**So I used file encryption and the government seized my
computer — now what?** Well, first off, don’t give them your password
during the search — you have the right to remain silent, so use it.
Since they can’t search your encrypted files without your help, you’ve
got leverage that most search targets never have. But now you’ve done
all you can — now it’s time to call a lawyer. (Anyway, you should have
called as soon as the computer was seized, right?) 

A lawyer may be able
to get your property back if the warrant was improper, negotiate a deal
with the government’s attorneys to limit the search or get important
files back, or convince the court to strictly limit the search so that
they won’t search files that are legally privileged (like confidential
legal or medical records), protected by the First Amendment (like
private membership lists), or irrelevant to the case. 

Alternatively, a
prosecutor may ask a judge to order you to turn over your password. The
law is unclear on whether such an order would be valid, but that is a
matter to face with the assistance of counsel. No one other than a judge
can force you to reveal your password.  

.. _seizes: https://ssd.eff.org/your-computer/govt/fourth-amendment#seizure
.. _sneak-and-peek search: https://ssd.eff.org/your-computer/govt/sneak-and-peek
.. _encryption basics: https://ssd.eff.org/tech/encryption
.. _file and disk encryption software: https://ssd.eff.org/tech/disk-encryption




Protect Yourself Against Malware
================================

Although it’s been confirmed that the government has used
`remotely-installed spyware`_ in at least one criminal investigation,
and probably many more, the risk of Internet-based attack from the
government is still hard to judge. However, there is definitely a high
risk from just about every other bad guy on the net. Network-based
threats to computers include denial of service (e.g., flooding the
network or causing the computers to crash) and software and/or data
theft or destruction (“hacking”). In addition, malicious users could
hijack your computers so they can be used to attack other computers and
networks. The risk that this threat will materialize for any computer
connected to the Internet is a near-certainty. For example, a `recent
report`_ concludes that 80 percent of Windows computers in homes has
been compromised by one or more viruses, worms, or other malicious
software. 

Since this guide is about the government and not hackers, and
since there are plenty of other resources about fighting viruses and the
like, we’ll only share some basic thoughts on how to secure yourself
against Internet-based attacks. Several of these steps will help protect
you from any hacker, be it a government agent or an identity thief:

**For maximum security, create an “air gap” between sensitive data and
the Internet.** To protect confidentiality and integrity, do not connect
computers that store sensitive information to the Internet or other
public networks. Any computer connected to the Internet is exposed and
possibly vulnerable to a huge number of attacks. 

**Avoid Microsoft
products where possible.** Computers using the Microsoft Windows
platform are especially vulnerable as of this writing (although no
operating system is immune to all potential attacks). Consider using a
non-Microsoft operating system if possible. However, if you have to use
Microsoft Windows and you are connecting to the Internet, your best bet
is to minimize the number of Microsoft Internet applications you use –
for example, use `Firefox`_ as a browser or `Thunderbird`_ as a mail
client. Microsoft’s Internet Explorer and its email programs Outlook and
Outlook Express are very difficult for even professionals to secure.
Furthermore, adversaries tend to attack more popular platforms and
applications. 

**Keep your software updated.** Use the latest stable
version of your operating system. As of this writing, Windows 95, 98,
and ME are utterly obsolete. You should be using at least Windows Server
2003 for servers and Windows XP for clients, with all patches and
service packs applied. For Macintosh computers, use OS X 10.4 or
greater, with all patches applied. For Linux and Unix, get whatever
version is the most recent stable release, and follow all updates. It is
especially important not to let server software versions lag behind,
since servers are always on and always connected. 

**Maintain your
firewalls.** Firewalls are software or hardware components that protect
your computer or network from the Internet, blocking traffic based on
network-related parameters like IP addresses and port numbers. Firewalls
can protect against those who want to access your computer without
permission. Configuring network firewalls is pretty tough for the
layperson and beyond the scope of this guide, but you should learn how
to use the personal firewall software that’s included in most recent
operating systems. 

For more detailed information about malware, check
out the `Malware`_ article in the Defensive Technology section.

.. _Firefox: http://www.mozilla.com/firefox/
.. _Thunderbird: http://www.mozilla.com/thunderbird/
.. _Malware: https://ssd.eff.org/tech/malware
.. _remotely-installed spyware: http://www.wired.com/politics/law/news/2007/07/fbi_spyware
.. _recent report: http://www.staysafeonline.info/news/safety_study_v04.pdf


Summary
=======

If You Don’t Keep It, They Can’t Get It; If You Do Keep It, Encrypt It!

In a nutshell: if you don’t want the government to see it, `encrypt it`_
or `don’t keep it`_. 

`Subpoenas`_ are less threatening than search
warrants, but pose a much greater risk. Only a good lawyer can help you
avoid having to respond to a subpoena, and oftentimes even a good lawyer
will fail, and you’ll have to turn the information over or face contempt
charges. The best defense against a subpoena is to not have what they
are looking for. 

Not having what they’re looking for is also your best
defense against a `search warrant`_, which is a much higher threat but
lower risk. After that your best bet is encryption. You may not be able
to stop the government from seizing your computers, but by using
encryption you might be able to stop them from searching the data on
those computers.

.. _encrypt it: https://ssd.eff.org/your-computer/protect/encrypt
.. _don’t keep it: https://ssd.eff.org/your-computer/protect/retention
.. _Subpoenas: https://ssd.eff.org/your-computer/govt/subpoenas#subpoena
.. _search warrant: https://ssd.eff.org/your-computer/govt/warrants


The Basics of Data Protection
=============================

We’re not going to lecture you on how to physically secure your office,
because as we’ve said before, if the government has permission from a
court to bust in, they are going to bust in regardless of what you do.
We’re more concerned here about what they can do to your computers once
they are inside. Here are some steps to ensure that just because someone
has physical access to your machine it doesn’t mean they’ll be able to
get at all the data inside of it: 

**Require logins!** Operating systems
can be set to automatically log into a user account when the machine
boots. Disable this feature! Require that the user provide a username
and password before the machine will allow access to a user account.


**Require screensaver logins too!** Set the screensaver on your system
to start automatically after a short time (such as 2 or 5 minutes) and
to require that the user supply their password again before the
screensaver will unlock. All operating systems support a feature like
this, and it makes no sense not to use it. 

**Access controls are only as
strong as your authentication mechanism.** In other words, if your
password is “12345” or your dog’s name, or if you keep your password in
a drawer next to your computer, your files may be accessible to anyone
who has access to your computer and has a couple minutes to guess some
passwords or look through your desk. Follow `the next section`_\ ’s
advice to generate and manage strong passwords effectively. 

**Choose
your sysadmin wisely.** In mainstream operating systems, the systems
administrator must be “trusted” – that is, he or she is always able to
circumvent access controls. Therefore, your organization’s management
must take care when selecting and training systems administrators, to
ensure that he or she is worthy of trust. Trustworthy administrators
will adhere to a code of professional ethics such as that published by
the `Systems Administrators Guild`_. 

**Guest accounts.** To provide
availability for unauthorized users, if that is desired, create a guest
account for general use, and make sure that it cannot modify the
operating system or cause other damage to the system. Ensure that the
guest account does not have the privilege to read or modify sensitive
files.

.. _the next section: https://ssd.eff.org/your-computer/protect/passwords
.. _Systems Administrators Guild: https://www.usenix.org/lisa/system-administrators-code-ethics


Use Passwords Properly
======================

Choosing a Password
~~~~~~~~~~~~~~~~~~~

Longer and more complex passwords are more secure. If the government
seizes your computer it can quickly guess simple passwords by
automatically trying large lists of words from a dictionary. Automated
dictionary attacks use lists of regular words as well as proper names
and common variations of these (e.g. adding a number to a dictionary
word or replacing letters with similar numbers, e.g. replacing o with
0). 

So, if it’s human-readable, it’s computer-breakable. Don’t use
names, song titles, random words or any dictionary words at all, whether
alone, in combination with numbers, or with letters replaced by numbers
– the government can and will break it. For stronger password security,
use a lengthy passphrase that includes upper- and lower-case letters,
one or more numerical digits and special characters (e.g. #,$ or &), and
change it frequently. 

New computer hardware usually comes with default
passwords, such as “password” or “default” or the name of the technology
vendor. Always change the default passwords immediately!

Although we recommend memorizing your passwords, we recognize you
probably won’t. So, here are a few other options to consider: 

**Use a
password safe.** There are a number of software tools available that
will keep all of your passwords for you on your computer, in an
encrypted virtual safe, which you access with one master password. Just
remember to never write down the password to your password safe — that
piece of paper can become a single point of failure for all of your
password-secured assets. This brings another drawback, of course — if
you forget that master password, you’ve lost all of your other passwords
forever. 

**Carry your passwords on paper, in your pocket.** This is a
somewhat controversial solution promoted by security expert Bruce
Schneier — even though he wrote the digital password management program
`Password Safe`_. Schneier advocates that people keep their passwords in
their wallets. What you sacrifice in security, the argument goes, is
made up for by the convenience — with easy access to your passwords,
you’re more likely to use very strong ones that you couldn’t remember
otherwise, plus you can access your passwords even when you’re away from
your computer. An added benefit is that when your passwords are in your
wallet, you’ll find out very quickly if they’ve been lost or stolen.


However, to mitigate the risk of a loss, add a certain number of dummy
characters before and after the real passwords to make it harder to
identify them, and use simple code-words to indicate what asset they
protect, rather than saying “Chase Manhattan Bank” or “Work Computer.”


**Don’t use the same password to protect multiple assets.** Sure, it’s
OK to use the same password to log into the New York Times web site that
you use for the Washington Post, because those aren’t valuable assets.
But when it comes to the important stuff, use unique passwords. That
way, even if one asset is compromised, the others are still safe.

**Never keep a password in the same physical location as the asset it
protects, unless it’s encrypted.** This is the biggest password boo-boo,
and it’s an object lesson in security planning: if a security measure is
too inconvenient for day-to-day use, people won’t use it correctly. Your
password is worse than useless if it’s on a sticky note next to your
computer, and probably useless against secret searches if it is anywhere
in the same office. Again, this is why Bruce Schneier recommends keeping
your passwords in your pocket — you’ll have stronger passwords, and you
won’t leave them lying around. 

**Change passwords regularly.** A
password may have already been compromised and you just don’t know it.
You should change passwords every week, every month, or every year — it
all depends on the threat, the risk, and the value of the asset, traded
against usability and convenience.

.. _Password Safe: http://www.schneier.com/passsafe.html

Password Management
~~~~~~~~~~~~~~~~~~~

When it comes to passwords, the only truly secure password is the one
that’s only in your head. Written-down passwords can be seized or
subpoenaed. But there’s a tough trade-off — the better your password,
the harder it’ll be to remember. And if you forget the password and
don’t have it recorded somewhere, you could lose access to a critical
asset at just the wrong time — perhaps even forever.



Your Data Retention and Destruction Policy
==========================================


If You Don’t Have It, They Can’t Get It
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The best defense against a `search`_ or a `subpoena`_ is to minimize the
amount of information that it can reach. Every organization should have
a clear policy on how long to keep particular types of information, for
three key reasons:

-  It’s a pain and an expense to keep everything.
-  It’s a pain and an expense to have to produce everything in response
   to subpoenas.
-  It’s a real pain if any of it is used against you in court — just ask
   Bill Gates. His internal emails about crushing Netscape were not very
   helpful at Microsoft’s antitrust trial.

Think about it — how far back does your email archive go? Do you really
need to keep every email? Imagine you got a subpoena tomorrow — what
will you wish you’d destroyed? **Establish a retention policy.** Your
organization should review all of the types of documents, computer
files, communications records, and other information that it collects
and then develop a policy defining whether and when different types of
data should be destroyed. For example, you may choose to destroy case
files six months after cases are closed, or destroy Internet logs
showing who visited your website immediately, or delete emails after one
week. This is called a “document retention policy,” and it’s your best
defense against a subpoena — they can’t get it if you don’t have it. And
the only way to make sure you don’t have it is to establish a policy
that everyone follows. Set a clear written policy for the length of time
documents are kept (both electronic and paper documents). Having a
written policy and following it will help you if you are accused of
destroying documents to hide evidence.


**Do not destroy evidence.** You should never destroy anything after it
has been subpoenaed or if you have reason to believe you are under
investigation and it is about to be subpoenaed — destruction of evidence
and obstruction of justice are serious crimes that carry steep fines and
possible jail time, even if you didn’t do the original crime. Nor should
you selectively destroy documents — for example, destroying some intake
files or emails but not others — unless it’s part of your policy.
Otherwise, it may look like you were trying to hide evidence, and again
might make you vulnerable to criminal charges. Just stick to your
policy. 

**Destroying paper documents.** Remember, your trash is fair
game under the Fourth Amendment, so just tossing your old membership
rolls in the garbage is not the way to go. 

If you are concerned about
the privacy of the documents that you throw away (and you should be!),
you should destroy them before they go in the trash. At the very least
you should run documents through a “cross-cut” paper shredder that will
cut them in two directions and turn them into confetti, and then mix up
the shreds from different documents to make them harder to put back
together (documents cut in one direction by “strip-cut” shredders are
very easy to put back together). If you have evidence giving you reason
to believe that your trash is being or is about to be searched, you
should also completely burn all of the shreds. Even if you’re not
particularly worried about someone searching your trash, you should
still destroy or thoroughly erase any computer equipment or media that
you throw out. 

If you destroy any of your papers and disks before
throwing them out, you should try to destroy all of them, even the ones
you don’t need to keep private. If you don’t destroy everything, anyone
with access to your trash can will be able to quickly isolate the shreds
of your private documents and focus on reconstructing them. Both
government investigators and identity thieves often have the manpower
and time necessary to reconstruct your shredded documents — even the
burned ones, in some crime labs. 

**Your web browser’s watching you, so
you have to watch your browser.** In a recent trial, government
forensics experts were able to retrieve web pages of Google search
results that the suspect downloaded years ago — his web browser had
“cached” copies of the pages. It was a murder trial, and the suspect had
Googled for information about breaking necks and the depth of the local
lake, where he ended up dumping the body. The suspect was convicted.


Hopefully, you have much more innocent things you’d like to keep
private, but the point is that your browser is a security hole that
needs to be plugged. You need to take regular steps to clear out all the
stuff it’s been storing, such as a history of the web sites you’ve
visited and the files you’ve downloaded, cached copies of web pages, and
cookies from the web sites you visit (which we will talk more about
later). In particular, it’s a bad idea to have the browser save your
passwords for web sites, and it’s a bad idea to have it save the data
you’ve entered into web forms. If your computer is seized or stolen,
that information will be compromised. So consider turning these features
off completely. Not having these features is less convenient — but
that’s the security trade-off. Are you worried enough about your
computer’s security that you’re willing to type a few extra times each
day to enter a password or a web address? 

Visit our Defensive Technology
article on `web browsers`_ for help with browser hygiene and other
recommendations to improve security. 

**Your instant messenger software
is probably watching you too.** Many instant messaging (IM) clients are
set by default to log all of you IM conversations. You should check the
software’s preferences so you know what it’s doing, and figure out how
these logs fit into your retention policy. Will you clean them out every
month? Every week? Or will you take the simple route and just set the
preferences so that your IM client doesn’t log any messages at all? The
choice is up to you, but because people often treat IM like an in-person
conversation and often say things they normally wouldn’t in an email,
you should consider such logs very sensitive. If you do insist on
logging your IMs, all the more reason to make sure they are protected by
`encryption`_. For more information, check out our Defensive Technology
article about `instant messaging`_.

**Minimize computer logging.** If you run a network, an email server or
a web server, you should consider reducing or eliminating logging for
those computer and network services, to protect the privacy of your
colleagues and your clients. For more information, refer to EFF’s "`Best
Data Practices for Online Service Providers.`_\ " 

**When you delete
computer files, really delete them.** When you put a file in your
computer’s trash folder and empty the trash, you may think you’ve
deleted that file — but you really haven’t. Instead, the computer has
just made the file invisible to the user, and marked the part of the
disk drive that it is stored on as “empty” — meaning, it can be
overwritten with new data. But it may be weeks, months, or even years
before that data is overwritten, and the government’s computer
technicians can often retrieve data that has been overwritten by newer
files. Indeed, no data is ever really deleted, just overwritten over
time, and overwritten again. 

The best way to keep those “deleted” files
hidden, then, is to make sure they get overwritten immediately, and many
times. Your operating system probably already includes software that
will do this, and overwrite all of the “empty” space on your disk with
gibberish, dozens or hundreds of times, and thereby protect the
confidentiality of deleted data. Visit the `secure deletion`_ article to
learn more about how to do this in various operating systems. 

In
addition to using a `secure deletion tool`_, you should consider using
encrypted storage. Visit the `disk encryption article`_ for more
information. 

**Destroying hardware and electronic media.** When it comes
to CD-ROMs, you should do the same thing you do with paper — shred ’em.
There are inexpensive shredders that will chew up CD-ROMs. Never just
toss a CD-ROM out in the garbage unless you’re absolutely sure there’s
nothing sensitive on it. 

If you want to throw a piece of hardware away
or sell it on EBay, you’ll want to make sure no one can retrieve your
data from it. So, before selling or recycling a computer, be sure to
overwrite its storage media with gibberish first. `Darik’s Boot and
Nuke`_ is an excellent free tool for this purpose.

**Make data hygiene a regular habit, like flossing.** The easiest way to
keep this all straight is to do it regularly. If you think you face a
high risk of government seizure, or carry a laptop around with you and
therefore face a high risk of theft or loss, perhaps you should do it at
the end of each day. If not, you might want to do it once a week. For
example, at the end of each week you could:

-  Shred any paper documents or electronic media that are scheduled for
   destruction under your policy.
-  Delete any emails or other documents that are scheduled for deletion
   under your policy.
-  Clear your browser of all logs.
-  Run your secure-deletion software to overwrite all of the newly
   deleted stuff.

Have your organization put this weekly ritual or something like it in
its written policy. You’ll be glad you did.


.. _Best Data Practices for Online Service Providers.: http://www.eff.org/osp
.. _secure deletion: https://ssd.eff.org/tech/deletion
.. _secure deletion tool: https://ssd.eff.org/tech/deletion
.. _disk encryption article: https://ssd.eff.org/tech/disk-encryption
.. _Darik’s Boot and Nuke: http://dban.sourceforge.net/
.. _web browsers: https://ssd.eff.org/tech/browsers
.. _encryption: https://ssd.eff.org/tech/encryption
.. _instant messaging: https://ssd.eff.org/tech/im
.. _search: https://ssd.eff.org/your-computer/govt/fourth-amendment#search
.. _subpoena: https://ssd.eff.org/your-computer/govt/subpoenas#subpoena