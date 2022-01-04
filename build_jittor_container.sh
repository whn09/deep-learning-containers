export ACCOUNT_ID=579019700964
export REGION=us-east-1
export REPOSITORY_NAME=beta-jittor-training

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

pip install -r src/requirements.txt

# python src/main.py --buildspec jittor/buildspec.yml --framework jittor
python src/main.py --buildspec jittor/buildspec.yml --framework jittor --image_types training --device_types cpu --py_versions py3
