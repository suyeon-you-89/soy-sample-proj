env=$1
if [ -z "$env" ]; then
    select prompt in "local" "dev" "stage" "prod"; do

        env=$prompt

        break
    done
fi

echo load config
docker compose --env-file ./env/.env.${env} config
docker compose --env-file ./env/.env.${env} build
docker compose --env-file ./env/.env.${env} up -d
