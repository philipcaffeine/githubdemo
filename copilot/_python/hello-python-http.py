import requests
import json

def test_http_get():
    """
    Test HTTP GET request to a sample API endpoint
    """
    # Make a GET request to a public API
    response = requests.get('https://jsonplaceholder.typicode.com/posts/1')
    
    # Check if the request was successful
    if response.status_code == 200:
        print("GET request successful!")
        print("Response:", json.dumps(response.json(), indent=2))
    else:
        print(f"GET request failed with status code: {response.status_code}")

def test_http_post():
    """
    Test HTTP POST request with JSON data
    """
    # Data to be sent in POST request
    data = {
        'title': 'Test Post',
        'body': 'This is a test post',
        'userId': 1
    }
    
    # Make a POST request
    response = requests.post(
        'https://jsonplaceholder.typicode.com/posts',
        json=data,
        headers={'Content-Type': 'application/json'}
    )
    
    # Check if the request was successful
    if response.status_code == 201:
        print("POST request successful!")
        print("Response:", json.dumps(response.json(), indent=2))
    else:
        print(f"POST request failed with status code: {response.status_code}")

def main():
    print("Testing HTTP GET request...")
    test_http_get()
    
    print("\nTesting HTTP POST request...")
    test_http_post()

if __name__ == "__main__":
    main()