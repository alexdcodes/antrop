#!/bin/bash

# Define variables
LOCAL_USER=$(whoami)
REMOTE_LOGINS=$(who | awk '$5 ~ /\(/ {print $1, $5}')
HOSTNAME=$(hostname)
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
SUBJECT="⚠️ ALERT: Remote Login Detected on $HOSTNAME"
EMAIL_BODY="/tmp/remote_login_alert.txt"
EMAIL_TO="$LOCAL_USER@localhost"  # Assumes local mail delivery

# Check for remote logins
if [ -n "$REMOTE_LOGINS" ]; then
    echo "[$TIMESTAMP] Remote login detected:" > "$EMAIL_BODY"
    echo "$REMOTE_LOGINS" >> "$EMAIL_BODY"
    echo -e "\nThis is an automated alert from your system." >> "$EMAIL_BODY"

    # Send mail using mailx
    mail -s "$SUBJECT" "$EMAIL_TO" < "$EMAIL_BODY"

    # Optional: also show in terminal
    echo "🔔 Alert sent to $EMAIL_TO"
else
    echo "✅ No remote logins detected at $TIMESTAMP."
fi
