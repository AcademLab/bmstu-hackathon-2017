FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install git -y
RUN apt-get install gradle -y
RUN apt-get install default-jdk -y
RUN git clone https://github.com/AcademLab/bmstu-hackathon-2017.git
CMD gradle -p ./bmstu-hackathon-2017/secondstep/places-api bootRun
