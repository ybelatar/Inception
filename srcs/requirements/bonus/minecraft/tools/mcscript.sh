#!/bin/bash

export PROJECT="paper"

export LATEST_VERSION=$(curl -s https://api.papermc.io/v2/projects/${PROJECT} | \
    jq -r '.versions[-1]')

export LATEST_BUILD=$(curl -s https://api.papermc.io/v2/projects/${PROJECT}/versions/${LATEST_VERSION}/builds | \
    jq -r '.builds | map(select(.channel == "default") | .build) | .[-1]')

export JAR_NAME=${PROJECT}-${LATEST_VERSION}-${LATEST_BUILD}.jar

export PAPERMC_URL="https://api.papermc.io/v2/projects/${PROJECT}/versions/${LATEST_VERSION}/builds/${LATEST_BUILD}/downloads/${JAR_NAME}"

# Download the latest PaperMC version
curl -o server.jar $PAPERMC_URL
echo "Downloads completed"


java -Xmx4G -Xms4G -jar server.jar --nogui