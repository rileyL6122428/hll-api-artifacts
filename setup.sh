mkdir server-executables
mkdir server-executables/libs
mkdir server-tempfiles

curl -o guava-26.0-jre.jar https://raw.githubusercontent.com/rileyL6122428/hll-api-artifacts/master/guava-26.0-jre.jar
mv guava-26.0-jre.jar server-executables/libs/guava-26.0-jre.jar

curl -o hll-api-0.0.1-SNAPSHOT.jar https://raw.githubusercontent.com/rileyL6122428/hll-api-artifacts/master/hll-api-0.0.1-SNAPSHOT.jar
mv hll-api-0.0.1-SNAPSHOT.jar server-executables/hll-api-0.0.1-SNAPSHOT.jar

# curl -o ffprobe https://raw.githubusercontent.com/rileyL6122428/hll-api-artifacts/master/ffprobe
# mv ffprobe server-executables/ffprobe

sudo yum install java-1.8.0-openjdk-devel
cd server-executables
java -cp hll-api-0.0.1-SNAPSHOT.jar:/home/ec2-user/server-executables/libs/* -Dserver.port=80 -Dloader.main=com.example.hllapi.HllApiApplication org.springframework.boot.loader.PropertiesLauncher
