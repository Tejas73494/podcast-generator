FROM ubuntu:latest

# Install Python, pip, git, and venv support
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

# Create a virtual environment and install PyYAML in it
RUN python3.10 -m venv /venv \
    && /venv/bin/pip install --upgrade pip \
    && /venv/bin/pip install PyYAML

# Copy your script and entrypoint
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Make sure entrypoint.sh is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint (make sure your script uses /venv/bin/python if needed)
ENTRYPOINT ["/entrypoint.sh"]
