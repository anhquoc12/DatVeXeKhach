import datetime
from sqlalchemy import func
from app.models import User, BenXe, TuyenDuong, chi_tiet_ben_xe, Ghe, HangVe, Customer, Ve
from app import app, db
import hashlib
from sqlalchemy.sql import extract
from datetime import datetime, timedelta
#
#
def load_benxe(name=None):
    query = BenXe.query
    if name:
        return query.filter(BenXe.ten_Ben_xe.__eq__(name)).first()
    return query.all()
#
#
#
def load_tuyenduong():
    return TuyenDuong.query.all()

def tracuu_td(bx_di, bx_den, time:datetime):
    name = bx_di + ' - ' + bx_den
    return TuyenDuong.query.filter(TuyenDuong.ten_tuyen_duong.__eq__(name),
                                  TuyenDuong.tg_khoihanh.contains(time.date())).all()

def get_TuyenDuong_by_id(id):
    return TuyenDuong.query.get(id)

def get_chair(id_hangve, id_tuyenduong):
    # Tạo 1 mảng chứa danh sách số ghế có id hạng vé là 1
    chairs = []
    ghes = Ghe.query.filter(Ghe.id_hangve == id_hangve).all()
    for ghe in ghes:
        chairs.append(ghe.so_ghe)
    # Lấy tất cả các ghế đã đặt của một chuyến bay mà ghế đó có id hạng vé là 1
    td = TuyenDuong.query.get(id_tuyenduong)
    ves = td.customer
    for ve in ves:
        if ve.id_hangve == id_hangve:
            soghe = ve.ghe.so_ghe
            if chairs.__contains__(soghe):
                chairs.remove(soghe)  # ghe1 là danh sách các ghế chưa đặt có id hạng vé là 1
    return chairs

def add_ve_Onine(id_td, id_kh, id_hv, id_ghe, gv, ngay_xuatve):
    ve = Ve(id_tuyenduong=id_td, id_khach_hang=id_kh, id_hangve=id_hv, id_ghe=id_ghe, GiaVe=gv, ngay_xuat_ve=ngay_xuatve)
    db.session.add(ve)
    db.session.commit()
    return True

def check_login(username, password):
    if username and password:
        password = str(hashlib.md5(password.strip().encode('utf-8')).digest())
        return User.query.filter(User.username.__eq__(username.strip()), User.password.__eq__(password)).first()
    return None

def get_user_by_id(user_id):
    return User.query.get(user_id)

def add_tuyen_duong(name, time_start, time_run, price_1, price_2, id_nv,):
    c = TuyenDuong(ten_tuyen_duong=name, tg_khoihanh=time_start, tg_chay=time_run,
                  giave_hv1=price_1, giave_hv2=price_2, id_nv=id_nv)
    db.session.add(c)
    db.session.commit()
    bx_di = BenXe.query.get(get_id_BenXe_From_Name(name=name.split(' - ')[0]))

    bx_den = BenXe.query.get(get_id_BenXe_From_Name(name=name.split(' - ')[1]))
    c.ben_xe.append(bx_di)
    c.ben_xe.append(bx_den)
    db.session.add(c)
    db.session.commit()

def get_id_BenXe_From_Name(name):
    s = BenXe.query.filter(BenXe.ten_Ben_xe.__eq__(name)).all()
    return s[0].id

def get_customer_lastest():
    customer = db.session.query(func.max(Customer.id)).first()
    return Customer.query.get(customer)



def TuyenDuong_Month_Stat(month, year):
    return db.session.query(TuyenDuong.ten_tuyen_duong,
                            func.sum(Ve.GiaVe)).join(Ve, Ve.id_tuyenduong.__eq__(TuyenDuong.id))\
                            .filter(extract('month', Ve.ngay_xuat_ve) == month,
                                    extract('year', Ve.ngay_xuat_ve) == year) \
                            .group_by(TuyenDuong.ten_tuyen_duong).all()

def get_tuyenduong_by_id(id):
    return TuyenDuong.query.get(id)

