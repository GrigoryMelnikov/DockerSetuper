#
# NOTE: THIS DOCKERFILE IS CREEATED BY Gregory Melnikov
#
# Explanation: requirements.txt file output from `pip freeze`.
# Command dumps all packeges/libraries installed via pip into the file,
# then could be loaded to the Container™️.
#

# Assembling
# :ARM64
FROM brunneis/python:3.8.0

# set the working directory in the container
WORKDIR /mnt

# copy the dependencies file to the working directory
COPY Include/Basic-Jup-Inst include/

# install dependencies/environment
RUN pip config set global.disable-pip-version-check true; \
	# pip install --no-cache-dir --upgrade pip; \
  pip install --no-cache-dir -r include/requirements.txt

# ==================================================================================
# SET BOOT UP SCRIPT
# Bash script which will run on container start
# ==================================================================================

COPY Entrypoint/entrypoint.sh /usr/entrypoint.sh

RUN chmod +x /usr/entrypoint.sh

CMD ["/bin/bash"]
