declare -a values=("NAME" "WORK_MAIL" "JIRA_URL")

NAME="Michael Hirsch"
WORK_MAIL=
JIRA_URL= # also set the jira url in "manual_settings/work_bookmarks.html" and "manual_settings/work_vimium-options.json"




### check for unset variables ###
value_not_set=false

for val in "${values[@]}"; do
    if [ -z "${!val}" ]; then
        echo "$val is not set."
        value_not_set=true
    fi
done

if [ "$value_not_set" = true ]; then
    exit 1
fi