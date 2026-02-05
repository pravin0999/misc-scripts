#!/bin/bash

# Discord CLI Message Sender
# Usage: ./discord_send.sh "Your message here"

WEBHOOK_URL="https://discord.com/api/webhooks/1469008634158776464/qwqZ61fvJUdfGQzLdi9H83A-BV4m98U10QL4VXzvGoZJKoI4RXp6crJZaIVoWIsIYeCa"
MESSAGE="$1"

if [ -z "$MESSAGE" ]; then
    echo "Usage: $0 \"message\""
    exit 1
fi

curl -H "Content-Type: application/json" \
     -X POST \
     -d "{\"content\": \"$MESSAGE\"}" \
     "$WEBHOOK_URL"
