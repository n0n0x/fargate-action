FROM amazon/aws-cli:2.0.33

ENV FARGATE_VERSION 0.3.2

# RUN apk add --no-cache ca-certificates python3 wget \
#     && pip3 install awscli \
RUN yum update -y \
    && yum install -y wget unzip \
    && wget https://github.com/awslabs/fargatecli/releases/download/${FARGATE_VERSION}/fargate-${FARGATE_VERSION}-linux-amd64.zip \
    && unzip fargate-${FARGATE_VERSION}-linux-amd64.zip \
    && rm fargate-${FARGATE_VERSION}-linux-amd64.zip \
    && chmod +x fargate \
    && mv fargate /usr/local/bin/fargate

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
