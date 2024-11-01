FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget curl && \
    apt-get clean

# Download Honeygain
RUN wget -O honeygain.deb https://github.com/honeygain/honeygain/releases/latest/download/honeygain_1.0.0_amd64.deb && \
    apt-get install -y ./honeygain.deb && \
    rm honeygain.deb

# Create a script to run Honeygain
RUN echo '#!/bin/bash\nhoneygain -u kripeshmainali024@gmail.com -p pokemongo123' > /start_honeygain.sh && \
    chmod +x /start_honeygain.sh

# Set the command to run Honeygain
CMD ["/start_honeygain.sh"]
