# -*- coding: utf-8 -*-
# __author__ = xutao

# just for connect docker
import requests
from settings.const import TOKEN, AGENT_PORT


def create_p2p_container(host, name, image, password, port):
    """
        新建 p2p 节点
    :return:
    """
    data = {
        "token": TOKEN,
        "container_name": name,
        "image": image,
        "password": password,
        "port": port,
    }
    url = "http://%s:%s/containers/" % (host, AGENT_PORT)
    container_id = requests.post(url=url, data=data)
    container_id = container_id.json()["data"]

    return container_id


def stop_p2p_container(host, container_id):
    """
        停止指定的节点
    :param container_id:
    :return:
    """
    data = {
        "token": TOKEN,
        "container_id": container_id,
        "action": "stop",
    }
    url = "%s:%s/containers/" % (host, AGENT_PORT)
    requests.put(url, data=data)