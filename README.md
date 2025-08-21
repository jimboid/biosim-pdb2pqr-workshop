CCPBioSim PDB2PQR Workshop
==========================

[![build](https://github.com/jimboid/biosim-pdb2pqr-workshop/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/jimboid/biosim-pdb2pqr-workshop/actions/workflows/build.yaml)

This container is derived from the CCPBioSim JupyterHub image. This container
adds the necessary software packages and notebook content to form a deployable
course container. The source content for this course can be found at
https://github.com/CCPBioSim/reduce-propka-workshop

How to Use
----------

In our containers we are using the JupyterHub default port 8888, so you should
forward this port when deploying locally::

    docker run -p 8888:8888 ghcr.io/jimboid/biosim-pdb2pqr-workshop:latest

