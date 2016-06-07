# -*- coding: utf-8 -*-
import json, requests, logging, platform
from django.conf import settings



UCENTER_URL = settings.UCENTER_URL
#UCENTER_URL = 'http://101.251.250.222:8080/'
HEADER = {"accept": "application/json", "content-type": "application/json"}
GIC_ACCOUNT = {"src": settings.UCENTER_SRC, "username": settings.UCENTER_USER, "passwd": settings.UCENTER_PASSWORD}
# GIC_ACCOUNT = '{"src": "gic", "username": "liuqiang", "passwd": "cds-123456"}'

logger = logging.getLogger(__name__)


class KEY:
    TOKEN = 'Access-Token'
    STATUS = 'status'
    ERR_CODE = 'errCode'
    ERR_MSG = 'errMsg'


class STATUS:
    SUCCESS = 'success'
    FAILURE = 'failure'


class URL:
    AUTHEN = UCENTER_URL + 'authen'
    LOGOUT = UCENTER_URL + 'logout'
    CURRENT_INFO = UCENTER_URL + 'currentInfo'
    UNLOCK = UCENTER_URL + 'unlock'
    EMPLOYEE = UCENTER_URL + 'employee'
    CUSTOMER = UCENTER_URL + 'customer'
    USER = UCENTER_URL + 'user'
    SMSCODE = UCENTER_URL + 'smscode'
    SMSAUTH = UCENTER_URL + 'smsauth'
    REGION = UCENTER_URL + 'region'
    DEPARTMENT = UCENTER_URL + 'department'
    TRADE = UCENTER_URL + 'trade'
    ALTER_PASSWORD = UCENTER_URL + 'alterpassword'
    USER_GETPWDCODE = UCENTER_URL + 'public/user/getPwdCode/'
    USER_VERIFYUUID = UCENTER_URL + 'public/user/verifyUUID/'
    EMPLOYEE_ISOK = UCENTER_URL + 'user/isOk/'


class ucenter(object):
    '''
    CDS用户中心接口封装类
    '''

    @staticmethod
    def authen(username=settings.UCENTER_USER, password=settings.UCENTER_PASSWORD):
        '''获取访问的Token.
        :param username(str): gic user name.
        :param password(str): gic user password.
        :return
        '''
        params = GIC_ACCOUNT
        if username and password:
            params['username'] = username
            params['passwd'] = password
            response = requests.post(URL.AUTHEN, json.dumps(params), headers=HEADER)
            try:
                return json.loads(response.content)
            except:
                return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: '-1', KEY.ERR_MSG: u'用户名和密码不能为空。'}

    @staticmethod
    def logout(token):
        '''
        退出登陆
        备注：OK
        '''
        headers = HEADER
        headers[KEY.TOKEN] = token
        params = {}
        response = requests.post(URL.LOGOUT, params, headers=headers)
        try:
            return json.loads(response.content)
        except:
            pass

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    @staticmethod
    def current_info(token):
        '''
        获取当前登陆员工/用户的信息
        备注：OK
        '''
        headers = HEADER
        headers[KEY.TOKEN] = token
        params = {}
        response = requests.get(URL.CURRENT_INFO, params=params, headers=headers)
        try:
            return json.loads(response.content)
        except:
            pass

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    @staticmethod
    def unlock(token, username):
        '''
        解锁验证失败的员工/用户账号
        备注：404 The requested resource () is not available.
        '''
        headers = HEADER
        headers[KEY.TOKEN] = token
        params = {'username': username}
        print URL.UNLOCK
        response = requests.get(URL.UNLOCK, params=params, headers=headers)
        try:
            return json.loads(response.content)
        except:
            pass

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    class employee:
        @staticmethod
        def add(token, adAccount, employeeNo, firstName, lastName, idNo, \
                idPhoto, deptId, regionId, locked, address, status, loginName, \
                email, phone, contactName=None, contactPhone=None, contactRelation=None):
            '''
            添加员工
            备注：003 未知异常，请联系管理员
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {
                'adAccount': adAccount,
                'employeeNo': employeeNo,
                'firstName': firstName,
                'lastName': lastName,
                'idNo': idNo,
                'idPhoto': idPhoto,
                'deptId': deptId,
                'regionId': regionId,
                'locked': locked,
                'address': address,
                'contactName': contactName,
                'contactPhone': contactPhone,
                'contactRelation': contactRelation,
                'status': status,
                'loginName': loginName,
                'email': email,
                'phone': phone
            }
            print "employee.add params:", json.dumps(params)
            response = requests.post(URL.EMPLOYEE, json.dumps(params), headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def update(token, id, adAccount=None, employeeNo=None, firstName=None, lastName=None, idNo=None, \
                   idPhoto=None, deptId=None, regionId=None, locked=None, address=None, status=None, loginName=None, \
                   email=None, phone=None, contactName=None, contactPhone=None, contactRelation=None):
            '''
            修改员工
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {'id': id}
            if adAccount is not None:
                params['adAccount'] = adAccount
            if employeeNo is not None:
                params['employeeNo'] = employeeNo
            if firstName is not None:
                params['firstName'] = firstName
            if lastName is not None:
                params['lastName'] = lastName
            if idNo is not None:
                params['idNo'] = idNo
            if idPhoto is not None:
                params['idPhoto'] = idPhoto
            if deptId is not None:
                params['deptId'] = deptId
            if regionId is not None:
                params['regionId'] = regionId
            if locked is not None:
                params['locked'] = locked
            if address is not None:
                params['address'] = address
            if status is not None:
                params['status'] = status
            if loginName is not None:
                params['loginName'] = loginName
            if email is not None:
                params['email'] = email
            if phone is not None:
                params['phone'] = phone
            if contactName is not None:
                params['contactName'] = contactName
            if contactPhone is not None:
                params['contactPhone'] = contactPhone
            if contactRelation is not None:
                params['contactRelation'] = contactRelation

            response = requests.put(URL.EMPLOYEE, json.dumps(params), headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def get(token, employee_id):
            '''
            查询员工
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {}
            url = "%s/%d" % (URL.EMPLOYEE, employee_id)
            print url
            response = requests.get(url, params=params, headers=headers)
            if response.ok:
                return json.loads(response.content)

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def list(token, pageNum=1, offset=2, getAll=False):
            '''
            列表员工
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {'pageNum': pageNum, 'offset': offset}
            if getAll:
                params = {}
            response = requests.get(URL.EMPLOYEE, params=params, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def delete(token, employee_id):
            '''
            删除员工
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {}
            url = "%s/%d" % (URL.EMPLOYEE, employee_id)
            print url
            response = requests.delete(url, params=params, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}
        @staticmethod
        def employee_isok(token, parm):
            '''
            验证输入的登录名、手机号、邮箱是否重复
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {'parm':parm}
            json_str = json.dumps(params)
            response = requests.post(URL.EMPLOYEE_ISOK, json_str, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    class customer:
        @staticmethod
        def add(token, customerNo, customerName, level, \
                tradeIds, regionId, signCompany, licenseImage, \
                contactName, contactPhone, contactEmail, operateContact, \
                businessContact, source, status, licenseNo, idNo, type):
            '''
            添加客户
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token

            params = {
                "customerNo": customerNo,
                "customerName": customerName,
                "level": level,
                "tradeIds": tradeIds,
                "regionId": regionId,
                "signCompany": signCompany,
                "licenseImage": licenseImage,
                "contactName": contactName,
                "contactPhone": contactPhone,
                "contactEmail": contactEmail,
                "operateContact": operateContact,
                "businessContact": businessContact,
                "source": source,
                "status": status,
                "licenseNo": licenseNo,
                "idNo": idNo,
                "type": type
            }
            json_str = json.dumps(params)
            logger.info(json_str)
            response = requests.post(URL.CUSTOMER, json_str, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def update(token, id, customerNo=None, customerName=None, level=None, \
                   tradeIds=None, regionId=None, signCompany=None, licenseImage=None, \
                   contactName=None, contactPhone=None, contactEmail=None, operateContact=None, \
                   businessContact=None, source=None, status=None, licenseNo=None, idNo=None, type=None):
            '''
            修改客户
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {"id": id}
            if customerNo is not None:
                params['customerNo'] = customerNo
            if customerName is not None:
                params['customerName'] = customerName
            if level is not None:
                params['level'] = level
            if tradeIds is not None:
                params['tradeIds'] = tradeIds
            if regionId is not None:
                params['regionId'] = regionId
            if signCompany is not None:
                params['signCompany'] = signCompany
            if licenseImage is not None:
                params['licenseImage'] = licenseImage
            if contactName is not None:
                params['contactName'] = contactName
            if contactPhone is not None:
                params['contactPhone'] = contactPhone
            if contactEmail is not None:
                params['contactEmail'] = contactEmail
            if operateContact is not None:
                params['operateContact'] = operateContact
            if businessContact is not None:
                params['businessContact'] = businessContact
            if source is not None:
                params['source'] = source
            if status is not None:
                params['status'] = status
            if licenseNo is not None:
                params['licenseNo'] = licenseNo
            if idNo is not None:
                params['idNo'] = idNo
            if type is not None:
                params['type'] = type

            response = requests.put(URL.CUSTOMER, json.dumps(params), headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def get(token, customer_id):
            '''
            查询客户
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {}
            url = "%s/%d" % (URL.CUSTOMER, customer_id)
            print url
            response = requests.get(url, params=params, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def list(token, pageNum=1, offset=100):
            '''
            列表客户
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {'pageNum': pageNum, 'offset': offset}
            response = requests.get(URL.CUSTOMER, params=params, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def delete(token, customer_id):
            '''
            删除客户
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {}
            url = "%s/%d" % (URL.CUSTOMER, customer_id)
            print url
            response = requests.delete(url, params=params, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    class user:
        @staticmethod
        def add(token, username, firstName, lastName, idNo, \
                idImage, email, secureEmail, phone, securePhone, \
                secureQuestion_1, secureAnswer_1, secureQuestion_2, \
                secureAnswer_2, secureQuestion_3, secureAnswer_3, \
                password, regionId, address, customerId, locked, status):
            '''
            添加用户
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {
                "username": username,
                "firstName": firstName,
                "lastName": lastName,
                "idNo": idNo,
                "idImage": idImage,
                "email": email,
                "secureEmail": secureEmail,
                "phone": phone,
                "securePhone": securePhone,
                "secureQuestion_1": secureQuestion_1,
                "secureAnswer_1": secureAnswer_1,
                "secureQuestion_2": secureQuestion_2,
                "secureAnswer_2": secureAnswer_2,
                "secureQuestion_3": secureQuestion_3,
                "secureAnswer_3": secureAnswer_3,
                "password": password,
                "regionId": regionId,
                "address": address,
                "customerId": customerId,
                "locked": locked,
                "status": status
            }
            json_str = json.dumps(params)
            logger.info(json_str)
            response = requests.post(URL.USER, json_str, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def update(token, id, username=None, firstName=None, lastName=None, idNo=None, \
                   idImage=None, email=None, secureEmail=None, phone=None, securePhone=None, \
                   secureQuestion_1=None, secureAnswer_1=None, secureQuestion_2=None, \
                   secureAnswer_2=None, secureQuestion_3=None, secureAnswer_3=None, \
                   password=None, regionId=None, address=None, customerId=None, locked=None, status=None):
            '''
            修改用户
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {"id": id}
            if username is not None:
                params['username'] = username
            if firstName is not None:
                params['firstName'] = firstName
            if lastName is not None:
                params['lastName'] = lastName
            if idNo is not None:
                params['idNo'] = idNo
            if idImage is not None:
                params['idImage'] = idImage
            if email is not None:
                params['email'] = email
            if secureEmail is not None:
                params['secureEmail'] = secureEmail
            if phone is not None:
                params['phone'] = phone
            if securePhone is not None:
                params['securePhone'] = securePhone
            if secureQuestion_1 is not None:
                params['secureQuestion_1'] = secureQuestion_1
            if secureAnswer_1 is not None:
                params['secureAnswer_1'] = secureAnswer_1
            if secureQuestion_2 is not None:
                params['secureQuestion_2'] = secureQuestion_2
            if secureAnswer_2 is not None:
                params['secureAnswer_2'] = secureAnswer_2
            if secureQuestion_3 is not None:
                params['secureQuestion_3'] = secureQuestion_3
            if secureAnswer_3 is not None:
                params['secureAnswer_3'] = secureAnswer_3
            if password is not None:
                params['password'] = password
            if regionId is not None:
                params['regionId'] = regionId
            if address is not None:
                params['address'] = address
            if customerId is not None:
                params['customerId'] = customerId
            if locked is not None:
                params['locked'] = locked
            if status is not None:
                params['status'] = status

            print "user.update params:", json.dumps(params)
            response = requests.put(URL.USER, json.dumps(params), headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def get(token, user_id):
            '''
            查询用户
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {}
            url = "%s/%d" % (URL.USER, user_id)
            print url
            response = requests.get(url, params=params, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def list(token, pageNum=1, offset=100):
            '''
            列表用户
            备注：OK
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {'pageNum': pageNum, 'offset': offset}
            response = requests.get(URL.USER, params=params, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

        @staticmethod
        def delete(token, user_id):
            '''
            删除用户
            备注：
            '''
            headers = HEADER
            headers[KEY.TOKEN] = token
            params = {}
            url = "%s/%d" % (URL.USER, user_id)
            print url
            response = requests.delete(url, params=params, headers=headers)
            try:
                return json.loads(response.content)
            except:
                pass

            return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    @staticmethod
    def smscode(token):
        '''
        下发短信验证码
        备注：对于GIC平台无用不实现
        '''
        pass

    @staticmethod
    def smsauth(token):
        '''
        校验短信验证码
        备注：对于GIC平台无用不实现
        '''
        pass

    @staticmethod
    def alterpassword(token, password, newPassword):
        '''
        修改账号密码
        备注：OK
        '''
        headers = HEADER
        headers[KEY.TOKEN] = token
        params = {'password': password, 'newPassword': newPassword}
        response = requests.post(URL.ALTER_PASSWORD, json.dumps(params), headers=headers)
        try:
            return json.loads(response.content)
        except:
            pass

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    @staticmethod
    def user_getpwdcode(username):
        '''
        获取重置密码验证码
        备注：OK
        '''
        headers = HEADER
        response = requests.get(URL.USER_GETPWDCODE + username, headers=headers)
        try:
            return json.loads(response.content)
        except:
            pass

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    @staticmethod
    def user_verifyuuid(uuid):
        '''
        确认重置密码
        备注：OK
        '''
        headers = HEADER
        response = requests.get(URL.USER_VERIFYUUID + uuid, headers=headers)
        try:
            return json.loads(response.content)
        except:
            pass

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    @staticmethod
    def region(token, pageNum=1, offset=100):
        '''
        列表区域
        备注：OK
        '''
        headers = HEADER
        headers[KEY.TOKEN] = token
        params = {'pageNum': pageNum, 'offset': offset}
        response = requests.get(URL.REGION, params=params, headers=headers)
        try:
            return json.loads(response.content)
        except:
            pass

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    @staticmethod
    def department(token, pageNum=1, offset=100, getAll=True):
        '''
        列表部门
        备注：json结果中departments错写成regions
        '''
        headers = HEADER
        headers[KEY.TOKEN] = token
        params = {'pageNum': pageNum, 'offset': offset}
        if getAll:
            params = {}
        response = requests.get(URL.DEPARTMENT, params=params, headers=headers)
        try:
            return json.loads(response.content)
        except:
            pass

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    @staticmethod
    def trade(token, pageNum=1, offset=100):
        '''
        列表行业
        备注：尚未实现 The requested resource () is not available.
        '''
        headers = HEADER
        headers[KEY.TOKEN] = token
        params = {'pageNum': pageNum, 'offset': offset}
        response = requests.get(URL.TRADE, params=params, headers=headers)
        try:
            return json.loads(response.content)
        except:
            pass

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: response.status_code, KEY.ERR_MSG: response.content}

    @staticmethod
    def user_login(username, password):
        """
        :param username(str): gic user name
        :param password(str): gic user password
        :return (user, customer, errmsg):

        """

        user = None
        token = None
        customer = None
        errmsg = ''
        resp = ucenter.authen(username, password)
        if resp[KEY.STATUS] == STATUS.SUCCESS and resp.has_key(KEY.TOKEN):
            token = resp[KEY.TOKEN]
            # print token
            # 1获取用户信息
            resp = ucenter.current_info(token)
            # print resp
            if resp[KEY.STATUS] == STATUS.SUCCESS and resp.has_key('user'):
                user = resp['user']
                if user and user.has_key('customerId'):
                    customer_id = user['customerId']
                    # 2获取客户信息
                    resp = ucenter.customer.get(token, customer_id)
                    if resp[KEY.STATUS] == STATUS.SUCCESS and resp.has_key('customer'):
                        customer = resp['customer']
                        ucenter.logout(token)
                        logger.debug("user_login customer:" + str(customer))
                        logger.debug("user_login user:" + str(user))
                        return (user, customer, errmsg)
                else:
                    return (user, customer, 'customerId not found.')
        errmsg = 'unknown error'
        # print resp
        if resp and resp.has_key(KEY.ERR_CODE) and resp.has_key(KEY.ERR_MSG):
            # 错误信息
            errmsg = "%s %s" % (resp[KEY.ERR_CODE], resp[KEY.ERR_MSG])
            logger.debug("user_login failure:" + str(resp))
        return (user, customer, errmsg)

    @staticmethod
    def token_login(token):
        user = None
        customer = None
        errmsg = ''
        if token:
            # 1获取用户信息
            resp = ucenter.current_info(token)
            # print resp
            if resp[KEY.STATUS] == STATUS.SUCCESS and resp.has_key('user'):
                user = resp['user']
                if user and user.has_key('customerId'):
                    customer_id = user['customerId']
                    # 2获取客户信息
                    resp = ucenter.customer.get(token, customer_id)
                    if resp[KEY.STATUS] == STATUS.SUCCESS and resp.has_key('customer'):
                        customer = resp['customer']
                        ucenter.logout(token)
                        logger.debug("user_login customer:" + str(customer))
                        logger.debug("user_login user:" + str(user))
                        return (user, customer, errmsg)
                else:
                    return (user, customer, 'customerId not found.')
        errmsg = 'unknown error'
        # print resp
        if resp and resp.has_key(KEY.ERR_CODE) and resp.has_key(KEY.ERR_MSG):
            # 错误信息
            errmsg = "%s %s" % (resp[KEY.ERR_CODE], resp[KEY.ERR_MSG])
            logger.debug("user_login failure:" + str(resp))
        return (user, customer, errmsg)

    @staticmethod
    def employee_login(username, password):
        employee = None
        errmsg = ''
        resp = ucenter.authen(username, password)
        if resp[KEY.STATUS] == STATUS.SUCCESS and resp.has_key(KEY.TOKEN):
            # TODO: 1获取员工信息
            token = resp[KEY.TOKEN]
            resp = ucenter.current_info(token)
            if resp[KEY.STATUS] == STATUS.SUCCESS and resp.has_key('employee'):
                employee = resp['employee']
                # print "employee:", employee
                return (employee, errmsg)
        # print resp
        if resp and resp.has_key(KEY.ERR_CODE) and resp.has_key(KEY.ERR_MSG):
            # 错误信息
            errmsg = "%s %s" % (resp[KEY.ERR_CODE], resp[KEY.ERR_MSG])
        else:
            errmsg = str(resp)
        return (employee, errmsg)

    @staticmethod
    def customer_delete(customer_id):
        resp = ucenter.authen()
        errmsg = ''
        if resp[KEY.STATUS] == STATUS.SUCCESS:
            token = resp[KEY.TOKEN]
            resp = ucenter.customer.delete(token, customer_id)
            if resp[KEY.STATUS] != STATUS.SUCCESS:
                errmsg = resp[KEY.ERR_MSG]
        else:
            errmsg = resp[KEY.ERR_MSG]

        return errmsg

    @staticmethod
    def user_delete(user_id):
        resp = ucenter.authen()
        errmsg = ''
        if resp[KEY.STATUS] == STATUS.SUCCESS:
            token = resp[KEY.TOKEN]
            resp = ucenter.user.delete(token, user_id)
            if resp[KEY.STATUS] != STATUS.SUCCESS:
                errmsg = resp[KEY.ERR_MSG]
        else:
            errmsg = resp[KEY.ERR_MSG]

        return errmsg

    @staticmethod
    def employee_delete(employee_id):
        resp = ucenter.authen()
        errmsg = ''
        if resp[KEY.STATUS] == STATUS.SUCCESS:
            token = resp[KEY.TOKEN]
            resp = ucenter.employee.delete(token, employee_id)
            if resp[KEY.STATUS] != STATUS.SUCCESS:
                errmsg = resp[KEY.ERR_MSG]

        else:
            errmsg = resp[KEY.ERR_MSG]

        return errmsg

    @staticmethod
    def user_unlock(username):
        resp = ucenter.authen()
        if resp[KEY.STATUS] == STATUS.SUCCESS:
            token = resp[KEY.TOKEN]
            resp = ucenter.unlock(token, username)
            #print "unlock:", resp
            return resp
        else:
            return resp

        return {KEY.STATUS: 'failure', KEY.ERR_CODE: '-1', KEY.ERR_MSG: u'解锁用户账号失败，获取token失败。'}

if __name__ == '__main__':
    resp = ucenter.authen("liuqiang","cds-china123")
    if resp[KEY.STATUS] == STATUS.SUCCESS:
        token = resp[KEY.TOKEN]
        resp = ucenter.unlock(token, 'sunshine.sun')
        print "unlock:", resp

    '''
    result = ucenter.employee_login("sunshine.sun", "123abc,.;")
    print 'employee:', result[0]


    resp = ucenter.authen("liuqiang","cds-china123")
    if resp[KEY.STATUS] == STATUS.SUCCESS:
        token = resp[KEY.TOKEN]
        print token
        resp = ucenter.user.add(token,
                                username="yangxinabc123@cds.com",
                                firstName="zheng111",
                                lastName="yi111",
                                idNo="620101198808082127",
                                idImage="ccccc",
                                email="yangxinabc123@cds.com",
                                secureEmail="yangxinabc123@cds.com",
                                phone="13552012553",
                                securePhone="13552012553",
                                secureQuestion_1="1",
                                secureAnswer_1="1",
                                secureQuestion_2="2",
                                secureAnswer_2="2",
                                secureQuestion_3="3",
                                secureAnswer_3="3",
                                password="12345678",
                                regionId=1,
                                address="address",
                                customerId=40,
                                locked=1,
                                status="NORMAL")
        print 'ucenter.user.add:', resp, "\r\n"
        if resp[KEY.STATUS] != STATUS.SUCCESS:
            print resp[KEY.ERR_MSG]

        resp = ucenter.customer.add(token,
                                    customerNo="1234561111",
                                    customerName="正义科技",
                                    level=1,
                                    tradeIds="1",
                                    regionId=1,
                                    signCompany="CDS",
                                    licenseImage="11",
                                    contactName="zhengyi",
                                    contactPhone="18611623114",
                                    contactEmail="zhengyi@cds.com",
                                    operateContact="1",
                                    businessContact="1",
                                    source="官网",
                                    status="online",
                                    licenseNo="123423486",
                                    idNo="430103190001010214",
                                    type="company")
        print 'ucenter.customer.add:', resp, "\r\n"
        if resp[KEY.STATUS] != STATUS.SUCCESS:
            print resp[KEY.ERR_MSG]
        '''

    '''
    result = ucenter.user_login("sunhanyuabc","1333aaa")
    print 'user:', result[0]
    print 'customer:', result[1]
    result = ucenter.employee_login("sunshine.sun","123abc,.;")
    print 'employee:', result[0]

    resp = ucenter.authen()
    if resp[KEY.STATUS] == STATUS.SUCCESS:
        token = resp[KEY.TOKEN]
        print "authen:", token, "\r\n"

        #resp = ucenter.employee.list(token)
        #print 'ucenter.employee.list:', resp, "\r\n"

        resp = ucenter.employee.add(token,
                                    deptId=20,
                                    status="normal",
                                    loginName="sunshine.sun",
                                    locked="0",
                                    firstName="hanyu1",
                                    lastName="sun1",
                                    regionId=1,
                                    adAccount="1234567230",
                                    email="sunshine.sun@yun-idc.com",
                                    phone="13455466789",
                                    idNo="11050319911221211",
                                    contactName=None,
                                    address="cdshourse",
                                    contactPhone=None,
                                    contactRelation=None,
                                    idPhoto="1101212212",
                                    employeeNo="CDS11123")
        print 'ucenter.employee.add:', resp, "\r\n"
        if resp[KEY.STATUS] != STATUS.SUCCESS:
            print resp[KEY.ERR_MSG]

        #resp = ucenter.current_info(token)
        #if resp[KEY.STATUS] == STATUS.SUCCESS:
        #	print "current_info:", resp, "\r\n"
        #else:
        #	print "current_info:", resp[KEY.ERR_CODE], resp[KEY.ERR_MSG], "\r\n"

        #resp = ucenter.unlock(token, 'liuqiang')
        #print "unlock:", resp

        #resp = ucenter.user.list(token)
        #print 'ucenter.user.list:', resp, "\r\n"

        resp = ucenter.employee.update(token,
                                    id=1256,
                                    deptId=20,
                                    status="normal",
                                    loginName="hanyu.sun",
                                    locked="0",
                                    firstName="hanyu",
                                    lastName="sun",
                                    regionId=1,
                                    adAccount="1234567890",
                                    email="hanyu.sun@yun-idc.com",
                                    phone="13455466789",
                                    idNo="11050319911221211",
                                    contactName=None,
                                    address="cdshourse",
                                    contactPhone=None,
                                    contactRelation=None,
                                    idPhoto="1101212212",
                                    employeeNo="CDS11111")
        print 'ucenter.employee.update:', resp, "\r\n"
        if resp[KEY.STATUS] != STATUS.SUCCESS:
            print resp[KEY.ERR_MSG]

        resp = ucenter.employee.get(token, 1256)
        print 'ucenter.employee.get:', resp, "\r\n"



        #resp = ucenter.employee.delete(token, 1256)
        #print 'ucenter.employee.delete:', resp, "\r\n"

        #resp = ucenter.customer.list(token)
        #print 'ucenter.customer.list:', resp, "\r\n"

        resp = ucenter.customer.add(token,
                                    customerNo="1234567891",
                                    customerName="客户测试",
                                    level=1,
                                    tradeIds="1",
                                    regionId=1,
                                    signCompany="CDS",
                                    licenseImage="11",
                                    contactName="henrylv",
                                    contactPhone="18910052099",
                                    contactEmail="henrylv206@qq.com",
                                    operateContact="1",
                                    businessContact="1",
                                    source="官网",
                                    status="online",
                                    licenseNo="123423485",
                                    idNo="430103190001010214",
                                    type="company")
        print 'ucenter.customer.add:', resp, "\r\n"
        if resp[KEY.STATUS] != STATUS.SUCCESS:
            print resp[KEY.ERR_MSG]

        resp = ucenter.customer.get(token, 37)
        print 'ucenter.customer.get:', resp, "\r\n"

        resp = ucenter.customer.update(token,
                                    id=37,
                                    customerNo="1234567891",
                                    customerName="客户测试1",
                                    level=2,
                                    tradeIds="2",
                                    regionId=2,
                                    signCompany="CDS2",
                                    licenseImage="22",
                                    contactName="henrylv2",
                                    contactPhone="18910052092",
                                    contactEmail="henrylv202@qq.com",
                                    operateContact="2",
                                    businessContact="2",
                                    source="活动",
                                    status="online",
                                    licenseNo="123423485",
                                    idNo="430103190001010214",
                                    type="personal")
        print 'ucenter.customer.update:', resp, "\r\n"
        if resp[KEY.STATUS] != STATUS.SUCCESS:
            print resp[KEY.ERR_MSG]

        resp = ucenter.customer.get(token, 37)
        print 'ucenter.customer.get:', resp, "\r\n"

        resp = ucenter.customer.get(token, 37)
        print 'ucenter.customer.get:', resp, "\r\n"

        resp = ucenter.customer.delete(token, 37)
        print 'ucenter.customer.delete:', resp, "\r\n"

        resp = ucenter.customer.get(token, 37)
        print 'ucenter.customer.get:', resp, "\r\n"

        resp = ucenter.user.update(token,
                                id=185,
                                username="sunhanyu2",
                                firstName="sun1",
                                lastName="hanyu1",
                                idNo="620101198808082357",
                                idImage="aaaaaaaaaaaaaaaaaaaaa",
                                email="sunhanyu@mofun.biz",
                                secureEmail="sunhanyu1@mofun.biz",
                                phone="18888888888",
                                securePhone="13333333323",
                                secureQuestion_1="13333333333",
                                secureAnswer_1="13333333333",
                                secureQuestion_2="13333333333",
                                secureAnswer_2="13333333333",
                                secureQuestion_3="13333333333",
                                secureAnswer_3="13333333333",
                                password="1333aaa",
                                regionId=1,
                                address="address",
                                customerId=2,
                                locked=1,
                                status="NORMAL")
        print 'ucenter.user.update:', resp, "\r\n"
        if resp[KEY.STATUS] != STATUS.SUCCESS:
            print resp[KEY.ERR_MSG]

        resp = ucenter.user.get(token, 185)
        print 'ucenter.user.get:', resp, "\r\n"

        resp = ucenter.user.delete(token, 185)
        print 'ucenter.user.delete:', resp, "\r\n"

        resp = ucenter.user.get(token, 185)
        print 'ucenter.user.get:', resp, "\r\n"

        resp = ucenter.user.add(token,
                                username="sunhanyuabc",
                                firstName="sun",
                                lastName="hanyu",
                                idNo="620101198808082357",
                                idImage="aaaaaaaaaaaaaaaaaaaaa",
                                email="sunhanyu123@mofun.biz",
                                secureEmail="sunhanyu1123@mofun.biz",
                                phone="18888834888",
                                securePhone="13333333323",
                                secureQuestion_1="13333333333",
                                secureAnswer_1="13333333333",
                                secureQuestion_2="13333333333",
                                secureAnswer_2="13333333333",
                                secureQuestion_3="13333333333",
                                secureAnswer_3="13333333333",
                                password="1333aaa",
                                regionId=1,
                                address="address",
                                customerId=2,
                                locked=1,
                                status="NORMAL")
        print 'ucenter.user.add:', resp, "\r\n"
        if resp[KEY.STATUS] != STATUS.SUCCESS:
            print resp[KEY.ERR_MSG]

        resp = ucenter.employee.list(token)
        print 'ucenter.employee.list:', resp, "\r\n"

        resp = ucenter.user.list(token)
        print 'ucenter.user.list:', resp, "\r\n"

        #resp = ucenter.region(token)
        #print 'ucenter.region:', resp, "\r\n"

        #resp = ucenter.department(token)
        #print 'ucenter.department:', resp, "\r\n"

        #resp = ucenter.trade(token)
        #print 'ucenter.trade:', resp, "\r\n"
        #if resp[KEY.STATUS] != STATUS.SUCCESS:
        #	print resp[KEY.ERR_MSG]

        #resp = ucenter.alterpassword(token, newPassword="cds-china123", password="cds-123456")
        #print 'ucenter.alterpassword:', resp, "\r\n"
        #if resp[KEY.STATUS] != STATUS.SUCCESS:
        #	print resp[KEY.ERR_MSG]
        resp = ucenter.logout(token)
        print "logout:", resp, "\r\n"
    else:
        print "authen:", resp, "\r\n"
        print resp[KEY.ERR_MSG]
    '''