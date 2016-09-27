SYSTEM_NAME="ubuntu16"
while getopts ":n:" opt; do
  case $opt in
    n)
      SYSTEM_NAME=$OPTARG
      echo "Using specifyed name, Parameter: $OPTARG" >&2
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done


if [ ! -d "$SYSTEM_NAME" ]; then
    mkdir ${SYSTEM_NAME}
fi
echo "Name being used is $SYSTEM_NAME" >&2
dpkg --get-selections > ./${SYSTEM_NAME}/Package.list
sudo cp -R /etc/apt/sources.list* ./${SYSTEM_NAME}
sudo apt-key exportall > ./${SYSTEM_NAME}/Repo.keys
