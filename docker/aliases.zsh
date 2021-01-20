alias d='docker $*'
alias d-c='docker-compose $*'
alias ecr-login='aws ecr get-login-password \
    --region us-east-1 \
| docker login \
    --username AWS \
    --password-stdin 537461397591.dkr.ecr.us-east-1.amazonaws.com'
