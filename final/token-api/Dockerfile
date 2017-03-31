FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install gradle -y
RUN apt-get install default-jdk -y
CMD git clone https://github.com/AcademLab/bmstu-hackathon-2017.git && gradle -p ./bmstu-hackathon-2017/final/token-api bootRun
