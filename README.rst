==============
at-formula
==============

Install and configure at and set up at tasks. Tested in CentOS 7.4.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``at``
--------
Join install, configure and service states.

``install``
-----------
Install required package to run at.

``config``
----------
Configure at tasks based on the pillar configuration.

Remember that is you need to delete a at task you have to set ``type`` as ``absent`` if not, the task will not be deleted. You can also disable a task using the ``commented`` keyword.

``service``
-----------
Manage the ``at`` service. Stopping or starting it. If needed, you can disable the at service by setting the ``enabled: False`` option in the pillar.
