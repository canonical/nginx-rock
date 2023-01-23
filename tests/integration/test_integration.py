#!/usr/bin/env python3
# Copyright 2021 Canonical Ltd.
# See LICENSE file for licensing details.

"""Integration tests for the nginx rock.

These tests assume that the nginx container is running and available at the url:port defined below.
"""

import requests  # type: ignore[import]

import unittest

NGINX_DOCKER_URL = 'http://localhost'
NGINX_DOCKER_PORT = 8080


class TestNginxRock(unittest.TestCase):
    """Integration tests for the nginx rock."""

    def test_given_nginx_container_is_running_when_http_get_then_nginx_welcome_message_is_returned(
        self
    ):
        response = requests.get(f"{NGINX_DOCKER_URL}:{NGINX_DOCKER_PORT}")

        assert response.status_code == 200
        assert "Welcome to nginx!" in response.text
