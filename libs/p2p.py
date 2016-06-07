# -*- coding: utf-8 -*-
# __author__ = xutao
from transmission import Transmission
import transmissionrpc
import requests
from settings.const import TOKEN, AGENT_PORT


def connent_by_rpc(host, username, password, port):
    """
        rpc 方式的连接
    :param host:
    :param username:
    :param password:
    :param port:
    :return:
    """
    client = transmissionrpc.Client(address=host, port=port, user=username, password=password)
    return client


def connect_by_transmission(host, username, password, port):
    """
        普通方式的连接
    :param host:
    :param username:
    :param password:
    :param port:
    :return:
    """
    client = Transmission(host=host, username=username, port=9091, password=password)
    return client


def add_torrent(host, username, password, port, torrent_url):
    """
        添加种子
    :param url:
    :return:
    """
    client = transmissionrpc.Client(address=host, user=username, password=password, port=port)
    client.add_torrent(torrent_url)


def get_torrents(host, username, password, port):
    """
        获取某个节点所有的种子
    :param client:
    :return:
    """
    client = Transmission(host=host, username=username, port=port, password=password)
    response = client("torrent-get", fields=["id", "error", "errorString", "hashString", "isFinished",
                                  "percentDone", "rateDownload", "rateUpload", "status", "queuePosition", "name", "comment", "peers", "totalSize"])
    return response["torrents"]


def get_torrent(host, username, password, port, id):
    """
        获取特定种子的详细信息, id 为 hashString
    :param client:
    :return:
    """
    client = Transmission(host=host, username=username, port=port, password=password)
    response = client("torrent-get", ids=id, fields=["id", "error", "errorString", "hashString", "isFinished",
                                  "percentDone", "rateDownload", "rateUpload", "status", "queuePosition", "name", "comment", "peers", "totalSize"])
    return response["torrents"]


def start_torrent(host, username, password, port, ids):
    """
        开始torrent任务
    :param client:
    :return:
    """
    client = connect_by_transmission(host=host, username=username, password=password, port=port)
    client("torrent-start", ids=ids)


def stop_torrent(host, username, password, port, ids):
    """
        暂停torrent任务
    :param client:
    :return:
    """
    client = connect_by_transmission(host=host, username=username, password=password, port=port)
    client("torrent-stop", ids=ids)


def create_torrent(host, path, name, comment):
    """
        生成种子
    :return:
    """
    data = {
        "token": TOKEN,
        "path": path,
        "name": name,
        "comment": comment,
    }
    url = "%s:%s/torrents/" % (host, AGENT_PORT)
    response = requests.post(url, data=data)
    is_ok = response.ok
    if not is_ok:
        return False
    return response.json()

