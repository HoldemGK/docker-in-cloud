# docker-ai-platform

# Dockerfile
Create container, push to registry, save to var $IMAGE_URI

# training-job.sh
gcloud ai-platform jobs submit training $JOB_NAME \
  --region=$REGION \
  --master-image-uri $IMAGE_URI \
  --model-dir=gs://$BUCKET_NAME/$MODEL_DIR \
  --epochs=10
