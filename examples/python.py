import requests

print(requests.get("https://commsharbor.com/api/health", timeout=30).json())
