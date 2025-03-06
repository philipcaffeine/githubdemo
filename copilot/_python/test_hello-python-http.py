import unittest
from unittest.mock import patch
import requests
from hello_python_http import test_http_get, test_http_post

class TestHelloPythonHttp(unittest.TestCase):

    @patch('requests.get')
    def test_http_get_success(self, mock_get):
        mock_response = unittest.mock.Mock()
        mock_response.status_code = 200
        mock_response.json.return_value = {
            'userId': 1,
            'id': 1,
            'title': 'Sample Title',
            'body': 'Sample Body'
        }
        mock_get.return_value = mock_response

        with patch('builtins.print') as mocked_print:
            test_http_get()
            mocked_print.assert_any_call("GET request successful!")
            mocked_print.assert_any_call("Response:", json.dumps(mock_response.json(), indent=2))

    @patch('requests.get')
    def test_http_get_failure(self, mock_get):
        mock_response = unittest.mock.Mock()
        mock_response.status_code = 404
        mock_get.return_value = mock_response

        with patch('builtins.print') as mocked_print:
            test_http_get()
            mocked_print.assert_any_call("GET request failed with status code: 404")

    @patch('requests.post')
    def test_http_post_success(self, mock_post):
        mock_response = unittest.mock.Mock()
        mock_response.status_code = 201
        mock_response.json.return_value = {
            'id': 101,
            'title': 'Test Post',
            'body': 'This is a test post',
            'userId': 1
        }
        mock_post.return_value = mock_response

        with patch('builtins.print') as mocked_print:
            test_http_post()
            mocked_print.assert_any_call("POST request successful!")
            mocked_print.assert_any_call("Response:", json.dumps(mock_response.json(), indent=2))

    @patch('requests.post')
    def test_http_post_failure(self, mock_post):
        mock_response = unittest.mock.Mock()
        mock_response.status_code = 400
        mock_post.return_value = mock_response

        with patch('builtins.print') as mocked_print:
            test_http_post()
            mocked_print.assert_any_call("POST request failed with status code: 400")

if __name__ == '__main__':
    unittest.main()