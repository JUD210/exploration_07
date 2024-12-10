from tensorflow.keras.models import load_model
import os

script_dir = os.path.dirname(os.path.abspath(__file__))
model_path = os.path.join(script_dir, 'cifar10_model.h5')

# h5 파일 로드
model = load_model(model_path)

# SavedModel 형식으로 저장
# 이전에는 model.save('cifar10_model_saved') 로 가능했지만
# 이제는 model.export()를 사용해서 SavedModel으로 내보내야 함.
model.export('cifar10_model_saved')
