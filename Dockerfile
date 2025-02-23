# Start with BioSim base image.
ARG BASE_IMAGE=latest
FROM ghcr.io/jimboid/biosim-jupyterhub-base:$BASE_IMAGE

LABEL maintainer="James Gebbie-Rayet <james.gebbie@stfc.ac.uk>"
LABEL org.opencontainers.image.source=https://github.com/jimboid/biosim-pdb2pqr-workshop
LABEL org.opencontainers.image.description="A container environment for the ccpbiosim workshop on PDB2PQR."
LABEL org.opencontainers.image.licenses=MIT

# Switch to jovyan user.
USER $NB_USER
WORKDIR $HOME

# Install workshop deps
RUN conda install nglview ipywidgets -c conda-forge -y
RUN pip install mdtraj pdb2pqr

# Clone workshop contents
RUN git clone https://github.com/CCPBioSim/reduce-propka-workshop.git && \
    mv reduce-propka-workshop/* . && \
    rm -r AUTHORS LICENSE README.md reduce-propka-workshop Reduce_and_Propka.ipynb

# Copy lab workspace
COPY --chown=1000:100 default-37a8.jupyterlab-workspace /home/jovyan/.jupyter/lab/workspaces/default-37a8.jupyterlab-workspace

# UNCOMMENT THIS LINE FOR REMOTE DEPLOYMENT
COPY jupyter_notebook_config.py /etc/jupyter/

# Always finish with non-root user as a precaution.
USER $NB_USER
