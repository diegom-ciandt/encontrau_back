FROM public.ecr.aws/lambda/python:3.8

# Copy function code
COPY src/hello_world.py ${LAMBDA_TASK_ROOT}

# Avoid cache purge by adding requirements first
COPY requirements.txt ${LAMBDA_TASK_ROOT}

RUN pip install --no-cache-dir -r requirements.txt

ARG EMAIL_USER
ARG EMAIL_PASSWORD
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION

ENV EMAIL_USER $EMAIL_USER
ENV EMAIL_PASSWORD $EMAIL_PASSWORD
ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
ENV AWS_DEFAULT_REGION $AWS_DEFAULT_REGION

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "hello_world_handler" ]
