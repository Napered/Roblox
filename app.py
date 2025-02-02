from flask import Flask, request, jsonify
import some_ai_model_module  # AI 모델 임포트

app = Flask(__name__)

@app.route('/analyze', methods=['POST'])
def analyze_message():
    data = request.get_json()
    message = data.get('text')
    
    # AI 모델을 통해 메시지 분석
    result = some_ai_model_module.analyze(message)
    
    # 부적절한 메시지 감지 여부 반환
    if result['is_bad']:
        return jsonify({'is_bad': True}), 200
    else:
        return jsonify({'is_bad': False}), 200

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5000)
