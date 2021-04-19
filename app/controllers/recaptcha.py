import json
import requests
from flask import current_app


def is_valid(captcha_response):
    """ Validating recaptcha response from google server
        Returns True captcha test passed for submitted form else returns False.
    """

    payload = {'response': captcha_response, 'secret': current_app.config.get('RECAPTCHA_SITE_SECRET')}
    response = requests.post("https://www.google.com/recaptcha/api/siteverify", payload)
    response_text = json.loads(response.text)
    return response_text['success']
