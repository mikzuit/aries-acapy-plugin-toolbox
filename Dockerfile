#FROM bcgovimages/von-image:py36-1.14-0
FROM <ACCOUNTID>.dkr.ecr.<REGION>.amazonaws.com/von-image:py36-1.14-0
USER root

ADD . .

RUN pip3 install --no-cache-dir -e .

ADD https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 ./jq
RUN chmod +x ./jq
COPY startup.sh startup.sh
RUN chmod +x ./startup.sh

EXPOSE 3005
EXPOSE 8150
ENTRYPOINT ["./startup.sh"]
