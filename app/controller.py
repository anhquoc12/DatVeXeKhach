from app import app, dao, login, utils, models, db
from utils import datetime_f
from flask import render_template, url_for, request, redirect
from flask_login import login_user, logout_user
from datetime import datetime, timedelta
from flask_login import logout_user, current_user


def home():
    tuyenduongs = dao.load_tuyenduong()
    tg_dens = []
    count = tuyenduongs.__len__()
    for c in tuyenduongs:
        tm = timedelta(hours=c.tg_chay.hour, minutes=c.tg_chay.minute)
        tg_dens.append(c.tg_khoihanh + tm)
    return render_template('index.html', tuyenduongs=tuyenduongs, tg_dens=tg_dens, count=count)


def tra_cuu():
    benxes = dao.load_benxe()
    return render_template('tracuu.html', benxes=benxes)

def tra_cuu_detail():
    return render_template('tracuu_detail.html')

def check_tracuu():
    err = []
    if request.method.__eq__('GET'):
        bx1 = request.args['benxe1']
        bx2 = request.args['benxe2']
        date = request.args['date']
        if date.__eq__(""):
            err.append('Chọn thời gian di')
        else:
            dtime = datetime.strptime(date, '%Y-%m-%d')
            if bx1.__eq__(bx2):
                err.append('Lỗi trùng bến xe')
            else:
                td = dao.tracuu_td(bx_di=bx1, bx_den=bx2, time=dtime)
                tg_dens = []
                count = td.__len__()
                for c in td:
                    tm = timedelta(hours=c.tg_chay.hour, minutes=c.tg_chay.minute)
                    tg_dens.append(c.tg_khoihanh + tm)
        if err:
            return render_template('tracuu.html', err=err, benxes=dao.load_benxe())
    return render_template('tracuu_detail.html', bx1=bx1, bx2=bx2, tuyenduongs=td, tg_dens=tg_dens, count=count)


def dat_ve(tuyenduong_id):
    c = dao.get_TuyenDuong_by_id(id=tuyenduong_id)
    chairs_1 = dao.get_chair(id_tuyenduong=tuyenduong_id, id_hangve=1)
    chairs_2 = dao.get_chair(id_tuyenduong=tuyenduong_id, id_hangve=2)
    return render_template('datve.html', tuyenduong=c, chairs_1=chairs_1, chairs_2=chairs_2)

def luu_ve():
    if request.method.__eq__('POST'):
        #Lưu thông tin khách hàng
        hoten = request.form['hoten']
        phone = request.form['phone']
        cccd = request.form['cccd']
        customer = models.Customer(ho_ten=hoten, so_cccd=cccd, sdt=phone)
        db.session.add(customer)
        db.session.commit()
        id_td = int(request.form['id_tuyenduong'])
        tuyenduong = dao.get_tuyenduong_by_id(id_td)
        id_customer = dao.get_customer_lastest().id
        id_hv = int(request.form['hangve'])
        chair = ''
        price = 0
        if id_hv == 1:
            price = tuyenduong.giave_hv1
            chair = int(request.form['chair_1'])
            # return str(chair)
        else:
            price = tuyenduong.giave_hv2
            chair = int(request.form['chair_2'])
        ve = dao.add_ve_Onine(id_td=tuyenduong.id, id_kh=id_customer, id_hv=id_hv,
                              id_ghe=chair, gv=price, ngay_xuatve=tuyenduong.tg_khoihanh)
        if ve:
            return redirect('/')
        else:
            return 'Vui lòng thử lại'



def admin_login():
    username = request.form.get('username')
    password = request.form.get('password')
    user = dao.check_login(username=username, password=password)
    if user:
        login_user(user=user)
    return redirect('/admin')

@login.user_loader
def load_user(user_id):
    return dao.get_user_by_id(user_id=user_id)

def lap_lich_td():
    count_SB = 2
    msg = ''
    err = ''
    if request.method.__eq__('POST'):
        benxedi = request.form['benxedi']
        benxeden = request.form['benxeden']
        a = {benxedi, benxeden}
        tg_khoihanh = datetime.strptime(request.form['datetime'], '%Y-%m-%dT%H:%M')
        tg_chay = timedelta(hours=int(request.form['hours']), minutes=int(request.form['minutes']))
        # lưu giá vé
        giave_1 = float(request.form['price_1'])
        giave_2 = float(request.form['price_2'])
        # check sân bay trùng

        if (a.__len__() < count_SB):
            err =  'Lỗi trùng sân bay!!! Vui lòng quay trở lại để tạo lịch lại'
            return err
        # Xử lý lập lịch
        dao.add_tuyen_duong(name=benxedi + ' - ' + benxeden, time_start=tg_khoihanh,
                           time_run=tg_chay, price_1=giave_1, price_2=giave_2,
                           id_nv=current_user.id)
        return render_template('employee/success.html')




