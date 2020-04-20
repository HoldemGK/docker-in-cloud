FROM python:2.7.15-jessie
WORKDIR /root

#Install pytorch and torch
RUN pip install torch==1.0.0 torchvision==0.2.1

#Install hyperparameter tuning
RUN pip install cloudml-hypertune

#Install gcloud SDK
RUN wget -nv \
    https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
    mkdir /root/tools && \
    tar xvzf google-cloud-sdk.tar.gz -C /root/tools && \
    rm google-cloud-sdk.tar.gz && \
    /root/tools/google-cloud-sdk/install.sh --usage-reporting=false \
       --path-update=false --bash-completion=false \
       --disable-installation-options && \
    rm -rf /root/.config/* && \
    ln -s /root/.config /config && \
    rm -rf /root/tools/google-cloud-sdk/.install/.backup

ENV PATH $PATH:/root/tools/google-cloud-sdk/bin
#Make sure gsutil will use the default service account
RUN echo '[GoogleCompute]\nservice_account = default' > /etc/boto.cfg

#Copies the trainer code
RUN mkdir /root/trainer
COPY trainer/mnist.py /root/trainer/mnist.py

#Sets up the entry point to invoke the trainer
ENTRYPOINT ["python", "trainer/mnist.py"]
