====
Risk
====

Security Means Making Trade-Offs to Manage Risks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Security isn’t having the strongest lock or the best anti-virus software
— security is about making trade-offs to manage risk, something we do in
many contexts throughout the day. When you consider crossing the street
in the middle of the block rather than at a cross-walk, you are making a
security trade-off: you consider the threat of getting run over versus
the trouble of walking to the corner, and assess the risk of that threat
happening by looking for oncoming cars. Your bodily safety is the asset
you’re trying to protect. How high is the risk of getting run over and
are you in such a rush that you’re willing to tolerate it, even though
the threat is to your most valuable asset? That’s a security decision.
Not so hard, is it? It’s just the language that takes getting used to.
Security professionals use four distinct but interrelated concepts when
considering security decisions: *`assets`_*, *`threats`_*,\ *`risks`_*
and *`adversaries`_*.

.. _assets: /info/risk/assets"
.. _threats: /info/risk/threats
.. _risks: /info/risk/likelihood
.. _adversaries: /info/risk/adversaries


A Few Parting Lessons
=====================

Now that we’ve covered the critical concepts, here are a few more basic
lessons in security-think that you should consider before reading the
rest of this guide: 

**Knowledge is Power.** Good security decisions
can’t be made without good information. Your security tradeoffs are only
as good as the information you have about the value of your assets, the
severity of the threats from different adversaries to those assets, and
the risk of those attacks actually happening. We’re going to try to give
you the knowledge you need to identify the threats to your computer and
communications security that are posed by the government, and judge the
risk against possible security measures. 

**The Weakest Link.** Think
about assets as components of the system in which they are used. The
security of the asset depends on the strength of all the components in
the system. The old adage that “a chain is only as strong as its weakest
link” applies to security, too: The system as a whole is only as strong
as the weakest component. For example, the best door lock is of no use
if you have cheap window latches. Encrypting your email so it won’t get
intercepted in transit won’t protect the confidentiality of that email
if you store an unencrypted copy on your laptop and your laptop is
stolen. 

**Simpler is Safer and Easier.** It is generally most
cost-effective and most important to protect the weakest component of
the system in which an asset is used. Since the weak components are much
easier to identify and understand in simple systems, you should strive
to reduce the number and complexity of components in your information
systems. A small number of components will also serve to reduce the
number of interactions between components, which is another source of
complexity, cost, and risk. 

**More Expensive Doesn’t Mean More Secure.**
Don’t assume that the most expensive security solution is the best,
especially if it takes away resources needed elsewhere. Low-cost
measures like shredding trash before leaving it on the curb can give you
lots of bang for your security buck. 

**There is No Perfect Security —
It’s Always a Trade-Off.** Set security policies that are reasonable for
your organization, for the risks you face, and for the implementation
steps your group can and will take. A perfect security policy on paper
won’t work if it’s too difficult to follow day-to-day. 

**What’s Secure
Today May Not Be Secure Tomorrow.** It is also crucially important to
continually re-evaluate the security of your assets. Just because they
were secure last year or last week doesn’t mean they’re still secure!


Adversaries
===========

Who Poses a Threat?
~~~~~~~~~~~~~~~~~~~

A critical part of assessing risk and deciding on security solutions is
knowing who or what your *adversary* is. An adversary, in
security-speak, is any person or entity that poses a threat against an
asset. Different adversaries pose different threats to different assets
with different risks; different adversaries will demand different
solutions. 

For example, if you want to protect your house from a random
burglar, your lock just needs to be better than your neighbors’, or your
porch better lit, so that the burglar will choose the other house. If
your adversary is the government, though, money spent on a better lock
than your neighbors’ would be wasted — if the government is
investigating you and wants to search your house, it won’t matter how
well your security compares to your neighbors. You would instead be
better off spending your time and money on other security measures, like
encrypting your valuable information so that if it’s seized, the
government can’t read it. 

Here are some examples of the kinds of
adversaries that may pose a threat to your digital privacy and security:

-  U.S. government agents that follow laws which limit their activities
-  U.S. government agents that are willing and able to operate without
   legal restrictions
-  Foreign governments
-  Civil litigants who have filed or intend to file a lawsuit against
   you
-  Companies that store or otherwise have access to your data
-  Individual employees who work for those companies
-  Hackers or organized criminals who randomly break into your computer,
   or the computers of companies that store your data
-  Hackers or organized criminals that specifically target your computer
   or the computers of the companies that store your data
-  Stalkers, private investigators or other private parties who want to
   eavesdrop on your communications or obtain access to your machines

This guide focuses on defending against threats from the first adversary
— government agents that follow the law — but the information herein
should also provide some help in defending against the others.



Assets
======

What You Are Protecting
~~~~~~~~~~~~~~~~~~~~~~~

An asset is something you value and want to protect. Anything of value
can be an asset, but in the context of this discussion most of the
assets in question are information. Examples are you or your
organization’s emails, instant messages, data files and web site, as
well as the computers holding all of that information


Evaluation
==========

Which Threats from Which Adversaries Pose the Highest Risk to Your Assets?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Putting these concepts together, you need to evaluate which threats to
your assets from which adversaries pose the most risk, and then decide
how to manage the risk. Intelligently trading off risks and costs is the
essence of security. How much is it worth to you to manage the risk? For
example, you may recognize that government adversaries pose a threat to
your webmail account, because of their ability to secretly subpoena its
contents. If you consider that threat from that adversary to be a high
risk, you may choose not to store your email messages with the webmail
company, and instead store it on your own computer. If you consider it a
low risk, you may decide to leave your email with the webmail company —
trading security for the convenience of being able to access your email
from any internet-connected computer. Or, if you think it’s an
intermediate risk, you may leave your email with the webmail company but
tolerate the inconvenience of using encryption to protect the
confidentiality of your most sensitive emails. In the end, it’s up to
you to decide which trade-offs you are willing to make to help secure
your assets.




Likelihood
==========

The Likelihood of a Threat Actually Occuring
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

*Risk* is the likelihood that a particular threat against a particular
asset will actually come to pass, and how damaged the asset would be.
There is a crucial distinction between threats and risks: threats are
the bad things that can happen to assets, but risk is the likelihood
that specific threats will occur. For instance, there is a threat that
your building will collapse, but the risk that it will really happen is
far greater in San Francisco (where earthquakes are common) than in
Minneapolis (where they are not). People often over-estimate and thus
over-react to the risk of unlikely threats because they are rare enough
that the worst incidents are well publicized or interesting in their
unusualness. Similarly, they under-estimate and under-react to more
common risks. The most clichéd example is driving versus flying. Another
example: when we talk to individuals about government privacy
intrusions, they are often concerned about wiretapping or searches, but
most people are much more at risk from less dramatic measures, like
subpoenas demanding records from you or your email provider. That is why
we so strongly recommend good data practices — if it’s private, don’t
give it to others to hold and don’t store it, but if you do store it,
protect it — while also covering more unusual circumstances, like what
to do when the police show up at your door or seize your laptop.

Evaluating risk is necessarily a subjective process; not everyone has
the same priorities or views threats in the same way. Many people find
certain threats unacceptable no matter what the risk, because the mere
presence of the threat at any likelihood is not worth the cost. In other
cases, people disregard high risks because they don’t view the threat as
a problem. In a military context, for example, it might be preferable
for an asset to be destroyed than for it to fall into enemy hands.
Conversely, in many civilian contexts, it’s more important for an asset
such as email service to be available than confidential. In his book
*`Beyond Fear`_*, security expert Bruce Schneier identifies five
critical questions about risk that you should ask when assessing
proposed security solutions:

-  What assets are you trying to protect?
-  What are the risks to those assets?
-  How well does the security solution mitigate those risks?
-  What other risks does the security solution cause?
-  What costs and trade-offs does the security solution impose?

Security is the art of balancing the value of the asset you are trying
to protect against the costs of providing protection against particular
risks. Practical security requires you to realistically judge the actual
risk of a threat in order to decide which security precautions may be
worth using to protect an asset, and which precautions are absolutely
necessary. In this sense, protecting your security is a game of
tradeoffs. Consider the lock on your front door. What kind of lock — or
locks — should you invest in, or should you lock the door at all? The
assets are invaluable — the privacy of your home and control over the
things inside. The threat level is very high — you could be financially
wiped out, and all of your most valuable and private information
exposed, if someone broke in. The critical question then becomes: how
serious is the risk of someone breaking in? If the risk is low, you
probably won’t want to invest much money in a lock; if the risk is high,
you’ll want to get the best locks that you can.

.. _Beyond Fear: http://www.schneier.com/book-beyondfear.html


Threats
=======

What You Are Protecting Against
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A *threat* is something bad that can happen to an asset. Security
professionals divide the various ways threats can hurt your data assets
into six sub-areas that must be balanced against each other:

-  **Confidentiality** is keeping assets or knowledge about assets away
   from unauthorized parties.
-  **Integrity** is keeping assets undamaged and unaltered.
-  **Availability** is the assurance that assets are available to
   parties authorized to use them.
-  **Consistency** is when assets behave and work as expected, all the
   time.
-  **Control** is the regulation of access to assets.
-  **Audit** is the ability to verify that assets are secure.

Threats can be classified based on which types of security they
threaten. For example, someone trying to read your email (the asset)
without permission threatens its confidentiality and your control over
it. If, on the other hand, an adversary wants to destroy your email or
prevent you from getting it, the adversary is threatening the email’s
integrity and availability. Using `encryption`_, as described later in
this guide, you can protect against several of these threats. Encryption
not only protects the confidentiality of your email by scrambling it
into a form that only you or your intended recipient can descramble, but
also allows you to audit the emails — that is, check and see that the
person claiming to be the sender is actually that person, or confirm
that the email wasn’t changed between the sender and you to ensure that
you’ve maintained the email’s integrity and your control over it.

.. _encryption: https://ssd.eff.org/tech/encryption