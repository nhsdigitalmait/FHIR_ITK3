#Report the version numbers
if [[ -e /home/service/TKW/config/FHIR_ITK3/version_string.txt ]]; then
	cat /home/service/TKW/config/FHIR_ITK3/version_string.txt
fi
java -jar /home/service/TKW/TKW-x.jar -version | grep -v "starting on"

if [ "$1" == '--version' ]; then
	exit 0
fi

echo "Running as UID $UID"
echo "Making sure output structure is available"
cd /home/service/data
tar -xvf /home/service/TKW/config/FHIR_ITK3/tkwoutputstructure.tar
cd /home/service
# decide whether its TLSMA or not

#ClearText
java -version
java -XX:+UseContainerSupport -XX:MaxRAMPercentage=80.0 -jar /home/service/TKW/TKW-x.jar -meshinterceptor /home/service/TKW/config/FHIR_ITK3/tkw-x.properties
