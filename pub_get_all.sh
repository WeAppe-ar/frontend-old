tryPubGet(){
  {
    pubGet $1
  } || {
    echo "Retrying pub get for $1"
    pubGet $1
  } || {
    echo "Failed to get packages for $1"
  }
}

pubGet(){
  if command -v fvm &> /dev/null
    then
      {
        {
        fvm flutter pub get &
        } &> /dev/null
        echo "Packages for $1 ✔️"
      } &
    else
      {
        {
        flutter pub get
        } &> /dev/null
        echo "Packages for $1 ✔️"
      } &
    fi
  cd ../../
}

start=`date +%s`
echo "Getting packages..."
for package in ./packages/**/pubspec.yaml
do
  cd $(dirname $package)
  # Replace the ./packages/ and /pubspec.yaml with nothing
  packageName=${package//.\/packages\//}
  packageName=${packageName//\/pubspec.yaml/}
  tryPubGet $packageName
done &
tryPubGet "hoops"

wait

end=`date +%s`
runtime=$((end-start))
echo "Done in $runtime seconds"
wait