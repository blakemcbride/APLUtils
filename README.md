
Documentation on the Utils APL workspace

by Blake McBride

https://github.com/blakemcbride/APLUtils


I programmed business applications (as opposed to scientific or
mathematical applications) in APL from 1980 to 1985.  During that time,
I developed a variety of utilities to make the construction of
business applications easy.  This repository represents my port of
those utilities to GNU APL.

The workspace contains three classes of functions as follows:

1.  Application runtime utilities
2.  Generic utilities
3.  Development utilities

In general, all of the utility functions start in an uppercase letter.
It is assumed that application functions would all start with a
lowercase letter in order to avoid conflicts.

Typically an application would start with a function named 'start',
and ⎕LX←'Auto'.  When an application is loaded, Auto gets run in order
to initialize certain things, and then the application specific entry
point 'start' is called.  Following this procedure is necessary in
order for the Application runtime utilities to function.  This is
because they assume certain initialization had taken place before they
are called.

Calling Auto without a start function causes the application to stop
with a SI.  At this point the Application runtime functions may be
used since Auto already initialized everything.  The Generic utilities
and Development utilities do not have this requirement and may be used
at any point.

Most of the Application runtime utilities are used for I/O such as
input and output interaction with the user.  The Generic utilities are
used to handle generic functionality such as formatting a date, date
conversion, stripping or parsing a string, etc.  These all work
stand-alone (without any pre-existing context).  Lastly, the
Development utilities are used by a developer to do things like print
a function or workspace, search or search and replace code in a
workspeace, etc.

Although I have no intention of exhaustively documenting everything, I
do hope to document enough to provide a good start at using these
utilities.  As a subject of another document, I hope to provide a
rationale for the use of APL in business applications - even today!

The following documents are provided:

DevUtils.txt	Development utilities documentation
AppUtils.txt	Application runtime utilities

