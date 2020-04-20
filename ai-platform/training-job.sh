gcloud ai-platform jobs submit training $JOB_NAME \
  --region=$REGION \
  --master-image-uri $IMAGE_URI \
  --model-dir=gs://$BUCKET_NAME/$MODEL_DIR \
  --epochs=10
