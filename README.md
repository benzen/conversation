conversation
============

A git based IM client

Base Idea
--------------

This project aims to produce a simple IM client which will store messages in git repository.
Doing this allow us, as user to consult the conversation after ward, keep the conversation focused on the project.
It acknowledge the fact that free form conversation is an important part of any projet.

This way we could keep code, documentation (wiki), discution (conversation) in the same repository.

Proposed features
------------------------

* common wiki format
* message authoring / timestamp


Technical solution proposition
---------------------------------------

Fat client using node-webkit 
local commit, then try to push (could send message when offline)
No need for account, access to git repo will do
publication de message par hook post commit
a file by date
date kept using GMT+0, and presented to the time of the current user
use infinite scroll to see older message
