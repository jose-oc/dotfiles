alias md="mkdir -p"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias k="kubectl"
alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgd="kubectl get deployments"
alias kd="kubectl describe"
alias kl="kubectl logs"

# Safer defaults I actually recommend using explicitly
alias kctx="kubectl config current-context"
alias kns="kubectl config view --minify --output 'jsonpath={..namespace}' ; echo"

# Optional: open k9s in readonly mode by default
alias k9sr="k9s --readonly"

