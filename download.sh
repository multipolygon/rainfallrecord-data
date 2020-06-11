echo $HOST

OPT="--silent --show-error"
HEADER="Authorization: Token $API_KEY"

curl -o "locations.json" "$HOST/locations.json" $OPT --header "$HEADER"
curl -o "index.txt" "$HOST/locations.txt?_recent=show" $OPT --header "$HEADER"

while read id
do
    echo "$HOST/locations/$id"
    echo ".json"
    curl -o "locations/$id.json" "$HOST/locations/$id.json" $OPT --header "$HEADER"
    echo ".csv"
    curl -o "locations/$id.csv" "$HOST/locations/$id.csv" $OPT --header "$HEADER"
    echo ".xml"
    curl -o "locations/$id.xml" "$HOST/locations/$id.xml" $OPT --header "$HEADER"
done < index.txt

echo "Diff:"
git diff --name-only
