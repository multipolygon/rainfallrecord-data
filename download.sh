HOST="https://api.rainfallrecord.info"

OPT="--silent --show-error"
HEADER="Authorization: Token $API_KEY"

curl -o "index.geo.json" "$HOST/locations.json" $OPT --header "$HEADER"
curl -o "index.txt" "$HOST/locations.txt?_recent=show" $OPT --header "$HEADER"

while read id
do
    echo $id
    curl -o "locations/$id.json" "$HOST/json/$id.json" $OPT --header "$HEADER"
    curl -o "locations/$id.csv" "$HOST/csv/$id.csv" $OPT --header "$HEADER"
done < index.txt
