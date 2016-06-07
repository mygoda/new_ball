# -*- coding: utf-8 -*-
# __author__ = xutao

from __future__ import division, unicode_literals, print_function

import requests
from settings.const import OVFTOOL_AGENT_PORT, TOKEN
from applications.p2p.models import SiteVcenterShip
import random


def convert_to_ova(host, site_id, vm_name, task_id):
    """
        转换为模板
    :return:
    """
    vcenter = SiteVcenterShip.objects.get(site_id=site_id)
    url = "http://%s:%s/ovas/" % (host, OVFTOOL_AGENT_PORT)
    data = {
        "token": TOKEN,
        "host": vcenter.host,
        "username": vcenter.username,
        "password": vcenter.password,
        "datacenter": vcenter.datecenter,
        "vm_name": vm_name,
        "task_id": task_id,
    }
    rep = requests.post(url, data=data)
    if rep.ok:
        return rep.json()
    return False


def deploy_ova(host, site_id, vm_name, task_id):
    """
        部署模板
    :param host:
    :param site_id:
    :param vm_name:
    :param task_id:
    :return:
    """
    vcenter = SiteVcenterShip.objects.get(site_id=site_id)
    clusters = vcenter.cluster
    cluster_list = clusters.split(",")
    cluster = cluster_list[random.randrange(len(cluster_list))]
    url = "http://%s:%s/vms/" % (host, OVFTOOL_AGENT_PORT)
    data = {
        "token": TOKEN,
        "host": vcenter.host,
        "username": vcenter.username,
        "password": vcenter.password,
        "datacenter": vcenter.datecenter,
        "vm_name": vm_name,
        "task_id": task_id,
        "cluster_name": cluster,
        "datastore": vcenter.datastore
    }
    rep = requests.post(url, data=data)
    if rep.ok:
        return rep.json()
    return False
