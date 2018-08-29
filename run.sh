COMMAND=$@

echo "REP_BASE_PROD: ${REP_BASE_PROD:?}"
echo "CURRENT_IC: ${CURRENT_IC:?}"

mkdir -pv /tmp/osa-home-$$
mkdir -pv /tmp/osa-home-$$-pfiles

docker run \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /tmp/osa-home-$$-pfiles:/pfiles \
    -v /tmp/osa-home-$$:/home/integral \
    -v $REP_BASE_PROD:/data/rep_base_prod \
    -v $CURRENT_IC:/data/current_ic \
    --rm -it --user $(id -u) \
        integralsw/osa:11.0 bash -c "export HOME=/home/integral; source init.sh; $COMMAND"
