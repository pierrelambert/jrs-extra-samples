title
=================
description

I (FCE) adjusted the changes to match the sample-package requirements :
- removed the extra comments (here is a change), as I use a patch system, the changes are easily auditables. Furthermore, it makes the patch more light and portable throught the different JRS versions
- removed commented out changes to the original files. If it is commented, it is not needed. Comments exist to comment, not to disable code. And it makes the patch more portable.
- removed possible conflicting resources across JRS versions from the repository export : /public/audit /public/diagnostic, /public/monitoring, /themes/default


Gianluca Natali

##Requirements

##Instructions
