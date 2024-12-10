FROM tensorflow/serving:latest

# 모델 폴더 복사
COPY cifar10_model_saved /models/my_model

# 환경 변수 설정: 모델명
ENV MODEL_NAME=my_model

# 8501 포트 공개 (REST API)
EXPOSE 8501

ENTRYPOINT ["/usr/bin/tensorflow_model_server", \
    "--rest_api_port=8501", \
    "--model_name=my_model", \
    "--model_base_path=/models/my_model"]

# >>> Docker 이미지 빌드
# docker build -t exploration_07 .

# >>> 컨테이너 실행
# docker run --platform=linux/amd64 -p 8501:8501 exploration_07

# >>> 모델 상태 확인
# curl http://localhost:8501/v1/models/my_model

# >>> tender_wozniak 라는 이름의 컨테이너에 sh 연결 시도
# docker exec -it tender_wozniak sh