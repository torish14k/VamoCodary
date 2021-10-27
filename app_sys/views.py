import json
import re
import os
import datetime
from django.shortcuts import render,HttpResponse
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from app_sys import models as sys_db
from app_asset import models as asset_db
from app_auth.views import login_check,perms_check
from django.db.models import Q
from mtrops_v2.settings import BASE_DIR,SALT_API
from statics.scripts import salt_api
# Create your views here.

class EnvSofeware(View):
    """环境部署"""
    @method_decorator(csrf_exempt)
    @method_decorator(login_check)
    @method_decorator(perms_check)
    def dispatch(self, request, *args, **kwargs):
        return super(EnvSofeware,self).dispatch(request,*args, **kwargs)

    def get(self,request):
        title = "环境部署"

        role_id = request.session["role_id"]
        hostgroup_obj = asset_db.HostGroup.objects.all()
        tree_info = []
        n = 1
        for i in hostgroup_obj:
            hostgroup_id = i.id
            hostgroup_name = i.host_group_name
            hostinfo_obj = asset_db.Host.objects.filter(Q(group_id=hostgroup_id)&Q(role__id=role_id))
            if n == 1:
                tree_info.append({"id": hostgroup_id, "pId": 0, "name": hostgroup_name, "open": "true"})
            else:
                tree_info.append({"id": hostgroup_id, "pId": 0, "name": hostgroup_name, "open": "false"})
            n += 1
            for j in hostinfo_obj:
                host_id = j.id
                host_ip = j.host_ip
                id = hostgroup_id * 10 + host_id
                tree_info.append({"id": id, "pId": hostgroup_id, "name": host_ip})


        znodes_data = json.dumps(tree_info, ensure_ascii=False)

        sofeware_obj = sys_db.EnvSofeware.objects.all()
        return render(request,'sys_install.html',locals())

    def post(self,request):
        sofeware_name = request.POST.get('sofeware_name')
        sofeware_version = request.POST.get('sofeware_version')
        install_script = request.POST.get('install_script')
        try:
            env_obj = sys_db.EnvSofeware(sofeware_name=sofeware_name, sofeware_version=sofeware_version,install_script=install_script)
            env_obj.save()
            data = '添加成功,请刷新查看！'
        except Exception as e:
            data = '添加失败：\n%s' % e

        return HttpResponse(data)

    def put(self,request):
        """修改"""
        req_info = eval(request.body.decode())
        sofeware_id = req_info.get("sofeware_id")
        sofeware_name = req_info.get("sofeware_name")
        sofeware_version = req_info.get("sofeware_version")
        install_script = req_info.get("install_script")
        action = req_info.get("action",None)

        if action:
            """修改部署信息"""
            sofeware_obj = sys_db.EnvSofeware.objects.get(id=sofeware_id)
            sofeware_obj.sofeware_name = sofeware_name
            sofeware_obj.sofeware_version = sofeware_version
            sofeware_obj.install_script = install_script
            sofeware_obj.save()
            data = "部署信息已修改，请刷新查看！"
            return HttpResponse(data)
        else:
            """获取修改信息"""
            sofeware_info = sys_db.EnvSofeware.objects.get(id=sofeware_id)
            info_json = {'sofeware_id': sofeware_info.id, 'sofeware_name': sofeware_info.sofeware_name, 'sofeware_version': sofeware_info.sofeware_version,
                         'install_script': sofeware_info.install_script}
            data = json.dumps(info_json)

        return HttpResponse(data)

    def delete(self,request):
        req_info = eval(request.body.decode())
        sofeware_id = req_info.get("sofeware_id")
        sys_db.EnvInstall.objects.get(id=sofeware_id).delete()
        data = "软件部署已删除，请刷新查看"
        return HttpResponse(data)


@csrf_exempt
@login_check
@perms_check
def sofeware_install(request):

    host_info = request.POST.get("node_id_json")
    sofeware_id = request.POST.get("sofeware_id")
    ip_list = []
    for i in json.loads(host_info):
        if re.search("\d+.\d+.\d+.\d", i):
            ip_list.append(i)
    sofeware_obj = sys_db.EnvSofeware.objects.get(id=sofeware_id)

    install_script = sofeware_obj.install_script

    sofeware_name = sofeware_obj.sofeware_name

    script_name = "install_%s" % sofeware_name

    script_file = os.path.join(BASE_DIR, 'statics', 'scripts', script_name)

    f = open(script_file, 'w')

    f.write(install_script)

    f.close()



    salt_url = SALT_API['url']
    salt_user = SALT_API['user']
    salt_passwd = SALT_API['passwd']
    salt = salt_api.SaltAPI(salt_url, salt_user, salt_passwd)

    hosts = ",".join(ip_list)

    script_file = "salt://%s" % script_file

    result = salt.salt_run_arg(hosts, "cmd.script", script_file)

    data = "服务已部署，请检查！"

    return HttpResponse(data)




class Batch(View):
    """批量管理"""
    @method_decorator(csrf_exempt)
    @method_decorator(login_check)
    @method_decorator(perms_check)
    def dispatch(self, request, *args, **kwargs):
        return super(Batch,self).dispatch(request,*args, **kwargs)

    def get(self,request):
        title = "批量管理"
        role_id = request.session["role_id"]
        hostgroup_obj = asset_db.HostGroup.objects.all()
        tree_info = []
        n = 1
        for i in hostgroup_obj:
            hostgroup_id = i.id
            hostgroup_name = i.host_group_name
            hostinfo_obj = asset_db.Host.objects.filter(Q(group_id=hostgroup_id) & Q(role__id=role_id))

            tree_info.append({"id": hostgroup_id, "pId": 0, "name": hostgroup_name, "open": "false"})
            n += 1
            for j in hostinfo_obj:
                host_id = j.id
                host_ip = j.host_ip
                id = hostgroup_id * 10 + host_id
                tree_info.append({"id": id, "pId": hostgroup_id, "name": host_ip})

        znodes_data = json.dumps(tree_info, ensure_ascii=False)


        return render(request,'sys_batch.html',locals())


@csrf_exempt
@login_check
#@perms_check
def batch_run_cmd(request):
    """批量执行命令"""
    cmd = request.POST.get('cmd')
    ip_list = json.loads(request.POST.get("ip_list"))

    salt_url = SALT_API['url']
    salt_user = SALT_API['user']
    salt_passwd = SALT_API['passwd']
    salt = salt_api.SaltAPI(salt_url, salt_user, salt_passwd)

    hosts = ",".join(ip_list)

    data = salt.salt_run_arg(hosts, "cmd.run", cmd)

    data_txt = ''
    for ip in ip_list:
        head_txt = '=================== %s ===================\n' % ip
        result_info = "%sCommand：%s\nOutput：\n%s\n\r" % (head_txt, cmd, data[ip])
        data_txt += result_info

    return HttpResponse(data_txt)


@csrf_exempt
@login_check
#@perms_check
def batch_upload_file(request):
    """批量上传文件"""

    upload_path = request.POST.get('upload_path')

    upload_file = request.FILES.get("upfile")

    ip_list = json.loads(request.POST.get("ip_list"))

    up_file_path = os.path.join(BASE_DIR, 'statics', 'upload')

    if os.path.exists(up_file_path):
        pass
    else:
        os.makedirs(up_file_path)

    file_path = os.path.join(up_file_path, upload_file.name)

    src = "salt://" + file_path

    dest = upload_path.rstrip("/") + "/" + upload_file.name

    if os.path.exists(file_path):
        date_str = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
        os.rename(file_path, file_path + "_" + date_str)
    else:
        pass

    f = open(file_path, 'wb')

    for chunk in upload_file.chunks():
        f.write(chunk)
    f.close()

    salt_url = SALT_API['url']
    salt_user = SALT_API['user']
    salt_passwd = SALT_API['passwd']
    salt = salt_api.SaltAPI(salt_url, salt_user, salt_passwd)

    hosts = ",".join(ip_list)

    data = salt.salt_run_upfile(hosts, "cp.get_file", src, dest)


    data_txt=''
    for ip in  ip_list:
        head_txt='=================== %s ===================\n' % ip
        result_info = "%sOutput：\n%s\n\r" % (head_txt,data[ip])
        data_txt+=result_info

    return HttpResponse(data_txt)


@csrf_exempt
@login_check
#@perms_check
def batch_script(request):
    """批量执行脚本"""
    up_script = request.FILES.get("script_file")

    ip_list = json.loads(request.POST.get("ip_list"))

    script_dir = os.path.join(BASE_DIR, 'statics', 'scripts')

    if os.path.exists(script_dir):
        pass
    else:
        os.makedirs(script_dir)

    script_file = os.path.join(script_dir, up_script.name)

    if os.path.exists(script_file):
        date_str = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
        os.rename(script_file, script_file + "_" + date_str)
    else:
        pass

    f = open(script_file, 'wb')

    for chunk in up_script.chunks():
        f.write(chunk)

    f.close()

    script_src = "salt://" + script_file


    salt_url = SALT_API['url']
    salt_user = SALT_API['user']
    salt_passwd = SALT_API['passwd']
    salt = salt_api.SaltAPI(salt_url, salt_user, salt_passwd)

    hosts = ",".join(ip_list)

    data = salt.salt_run_arg(hosts, "cmd.script", script_src)

    data_txt=''
    for ip in  ip_list:
        head_txt='=================== %s ===================\n' % ip
        result_info = "%sOutput：\n%s\n\r" % (head_txt,data[ip]['stdout'])
        data_txt+=result_info

    return HttpResponse(data_txt)


class CronView(View):
    """
    计划任务管理
    """

    @csrf_exempt
    def get(self, request):

        ip_list = json.loads(request.GET.get('ip_list'))

        remote_user = request.GET.get('remote_user')

        cmd = 'crontab -u %s -l' % remote_user

        salt_url = SALT_API['url']
        salt_user = SALT_API['user']
        salt_passwd = SALT_API['passwd']
        salt = salt_api.SaltAPI(salt_url, salt_user, salt_passwd)

        hosts = ",".join(ip_list)

        data = salt.salt_run_arg(hosts, "cmd.run", cmd)

        data_info = []

        for ip in data.keys():

            data_list = data[ip].split('\n')
            cron_list = []
            if re.match('no', data_list[0]) or re.match('crontab', data_list[0]):
                cron_list = []
            else:
                for i in data_list:
                    A = i.split()
                    if A:
                        B = A[0:5]
                        C = A[5:]
                        cmd = " ".join(C)
                        B.append(cmd)
                        cron_list.append(
                            {'m': B[0], 'h': B[1], 'd': B[2], 'M': B[3], 'w': B[4], 'cmd': B[5], 'org_cmd': i})

            data_info.append({"IP": ip, "cron": cron_list})

        return render(request, "sys_cron_table.html", locals())

    def post(self, request):
        ip_list = json.loads(request.POST.get('ip_list'))

        remote_user = request.POST.get('remote_user')

        Minute = request.POST.get('Minute')

        Hour = request.POST.get('Hour')

        Day = request.POST.get('Day')

        Month = request.POST.get('Month')

        Week = request.POST.get('Week')

        cron_cmd = request.POST.get('cron_cmd')

        cron_cmd = re.sub(r"\"", "\'", cron_cmd)

        if Minute == '':
            Minute = '*'
        if Hour == '':
            Hour = '*'
        if Day == '':
            Day = '*'
        if Month == '':
            Month = '*'
        if Week == '':
            Week = '*'

        cmd = 'echo "%s %s %s %s %s %s" >> /var/spool/cron/%s' % (Minute, Hour, Day, Month, Week, cron_cmd, remote_user)

        salt_url = SALT_API['url']
        salt_user = SALT_API['user']
        salt_passwd = SALT_API['passwd']
        salt = salt_api.SaltAPI(salt_url, salt_user, salt_passwd)

        hosts = ",".join(ip_list)

        data = salt.salt_run_arg(hosts, "cmd.run", cmd)

        data_txt = ''

        for ip in ip_list:
            head_txt = '=================== %s ===================\n' % ip
            result_info = "%sOutput：\n%s\n\r" % (head_txt, data[ip])
            data_txt += result_info

        return HttpResponse(data_txt)

    def put(self, request):
        del_info = eval(request.body.decode())

        ip = del_info['ip']

        ip_list = [ip]

        remote_user = del_info['remote_user']

        org_cmd = del_info['org_cmd']

        action = del_info['action']

        b = re.sub("\\*", "\*", org_cmd)

        c = re.sub("\/", "\/", b)

        d = re.sub('\"', '\\\"', c)

        d = re.sub("&", "\&", d)

        if action == 'Del':
            cmd = '''sed -i "/%s/d"  /var/spool/cron/%s''' % (d, remote_user)
        elif action == "up":
            e = re.sub("^#", "", d)
            cmd = '''sed -i "s/%s/%s/"  /var/spool/cron/%s''' % (d, e, remote_user)
        elif action == "ban":
            cmd = '''sed -i "s/%s/#%s/"  /var/spool/cron/%s''' % (d, d, remote_user)
        elif action == "edit":

            Minute = del_info['Minute']

            Hour = del_info['Hour']

            Day = del_info['Day']

            Month = del_info['Month']

            Week = del_info['Week']

            cron_cmd = del_info['cron_cmd']

            cron_new = """%s %s %s %s %s %s""" % (Minute, Hour, Day, Month, Week, cron_cmd)

            A = re.sub("\\*", "\*", cron_new)

            B = re.sub("\/", "\/", A)

            C = re.sub('\"', '\\\"', B)

            D = re.sub("&", "\&", C)

            cmd = '''sed -i "s/%s/%s/"  /var/spool/cron/%s''' % (d, D, remote_user)

        f_sed = os.path.join(BASE_DIR, 'statics', 'scripts', 'sed.sh')
        f = open(f_sed, 'w')
        f.write(cmd)
        f.close()

        salt_url = SALT_API['url']
        salt_user = SALT_API['user']
        salt_passwd = SALT_API['passwd']
        salt = salt_api.SaltAPI(salt_url, salt_user, salt_passwd)

        hosts = ",".join(ip_list)
        script_src = "salt://" + f_sed
        data = salt.salt_run_arg(hosts, "cmd.script", script_src)

        result = data[ip]

        msg = "执行错误：%s\n\r执行结果：%s" % (result['stderr'], result['stdout'])

        return HttpResponse(msg)



class FileMG(View):
    """文件管理"""
    @method_decorator(csrf_exempt)
    @method_decorator(login_check)
    @method_decorator(perms_check)
    def dispatch(self, request, *args, **kwargs):
        return super(FileMG,self).dispatch(request,*args, **kwargs)

    def get(self,request):
        title = "文件管理"
        role_id = request.session["role_id"]
        hostgroup_obj = asset_db.HostGroup.objects.all()
        tree_info = []
        n = 1
        for i in hostgroup_obj:
            hostgroup_id = i.id
            hostgroup_name = i.host_group_name
            hostinfo_obj = asset_db.Host.objects.filter(Q(group_id=hostgroup_id) & Q(role__id=role_id))


            tree_info.append({"id": hostgroup_id, "pId": 0, "name": hostgroup_name, "open": "false"})
            n += 1
            for j in hostinfo_obj:
                host_id = j.id
                host_ip = j.host_ip
                id = hostgroup_id * 10 + host_id
                tree_info.append({"id": id, "pId": hostgroup_id, "name": host_ip})

        znodes_data = json.dumps(tree_info, ensure_ascii=False)

        return render(request,'sys_file.html',locals())


