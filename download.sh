OPT="--silent --show-error"
HEADER="Authorization: Token $API_KEY"

curl -o "locations/index.json" "$HOST/locations.json" $OPT --header "$HEADER"
curl -o "index.txt" "$HOST/locations.txt?_recent=show" $OPT --header "$HEADER"

while read id
do
    echo $id
    curl -o "locations/$id.json" "$HOST/locations/$id.json" $OPT --header "$HEADER"
    curl -o "locations/$id.csv" "$HOST/locations/$id.csv" $OPT --header "$HEADER"
done < index.txt
