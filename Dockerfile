FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel
COPY . /workspace/
WORKDIR /workspace
RUN \
  pip install -r requirements.txt
ENTRYPOINT ["python", "src/main.py"]
