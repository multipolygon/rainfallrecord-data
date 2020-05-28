CURL="curl --silent --show-error"

HOST="https://cache.rainfallrecord.info"

$CURL -o "index.geo.json" "$HOST/locations.json"
$CURL -o "index.txt" "$HOST/locations.txt?_recent=show"

while read id;
do $CURL -o "locations/$id.json" "$HOST/locations/$id.json";
done < index.txt
