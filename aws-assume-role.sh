RED='\033[0;31m'
YELLOW='\033[33m'
RESET='\033[0m'

assumeRole () {

   # 1. save previous keys
   export PREV_AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
   export PREV_AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
   export PREV_AWS_SESSION_TOKEN=${AWS_SESSION_TOKEN}

   unset AWS_ACCESS_KEY_ID
   unset AWS_SECRET_ACCESS_KEY
   unset AWS_SESSION_TOKEN

   # 2. assume role arn with external id

   echo -e "${YELLOW}...assuming role ${1} with external id ${2}... ${RESET}"
   role_session_name=_${CI_PIPELINE_IID:-local}
   temp_role=$(aws sts assume-role \
                     --role-arn "$1" \
                     --role-session-name "$role_session_name" \
                     --external-id "$2" \
                     --duration-seconds 3600 )

   if [[ $? != 0 ]]; then
      echo -e "${RED}Failed to assume role $1 ${RESET}"
      echo -e "  > hint: does your account has a trust policy setup and can it assume a role (sts assume role)?"
      return
   fi

   export AWS_ACCESS_KEY_ID=$(echo $temp_role | jq .Credentials.AccessKeyId | xargs)
   export AWS_SECRET_ACCESS_KEY=$(echo $temp_role | jq .Credentials.SecretAccessKey | xargs)
   export AWS_SESSION_TOKEN=$(echo $temp_role | jq .Credentials.SessionToken | xargs)

   aws sts get-caller-identity
}

unassumeRole () {
   echo -e "${YELLOW}...unassuming role ... ${RESET}"

   # 1. Release assumerole keys
   unset AWS_ACCESS_KEY_ID
   unset AWS_SECRET_ACCESS_KEY
   unset AWS_SESSION_TOKEN

   # 2. Set back the previous keys
   export AWS_ACCESS_KEY_ID=${PREV_AWS_ACCESS_KEY_ID}
   export AWS_SECRET_ACCESS_KEY=${PREV_AWS_SECRET_ACCESS_KEY}
   export AWS_SESSION_TOKEN=${PREV_AWS_SESSION_TOKEN}
}
