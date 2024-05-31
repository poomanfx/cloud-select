#!/bin/bash

## - User select on cloud profiles.
#    Currently supports for GCP, AWS
function cloud_select {
_CLOUD_CONFIG_NAME=$(
  (
    ls ${CLOUDSDK_CONFIG:-~/.config/gcloud}/configurations/ | grep -v 'config_default' | sed 's/config_/GCP /g';  # GCP
    grep '^\[profile' ${AWS_CONFIG_FILE:-~/.aws/config} | sed 's/^\[profile /AWS /; s/\]//';                      # AWS
  )|fzf
)

case "${_CLOUD_CONFIG_NAME%% *}" in
  "AWS")
    echo "Activate AWS profile [${_CLOUD_CONFIG_NAME#* }]"
    export AWS_PROFILE=${_CLOUD_CONFIG_NAME#* }
    ;;
  "GCP")
    echo "Activated GCP profile [${_CLOUD_CONFIG_NAME#* }]"
    export CLOUDSDK_ACTIVE_CONFIG_NAME=${_CLOUD_CONFIG_NAME#* }
    ;;
  *)
    echo "!! Unsupported cloud profile [${_CLOUD_CONFIG_NAME%% *}]"
    exit 1
    ;;
esac
}
