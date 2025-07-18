import os
from langchain_community.llms import Ollama

def get_code_files(directory):
    code_files = []
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(('.sh', '.py', '.js')):  # Add your code extensions here
                code_files.append(os.path.join(root, file))
    return code_files

def analyze_with_ollama(code):
    llm = Ollama(model="phi")  # Use the small model for speed
    result = llm.invoke(f"Analyze this code for bugs, performance issues, and improvements:\n\n{code}")
    return result

if __name__ == "__main__":
    repo_dir = '.'  # Jenkins checks out code here
    files = get_code_files(repo_dir)
    for file_path in files:
        with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
            code = f.read()
        print(f"\n--- Analyzing {file_path} ---")
        result = analyze_with_ollama(code)
        print(result)
