from sqlalchemy import Column, Integer, String, Boolean, Float, ForeignKey, Text, Enum, DateTime, Time
from sqlalchemy.orm import relationship, backref
from datetime import datetime, timedelta
from flask_login import UserMixin
from app import db, app
from enum import Enum as UserEnum


class UserRole(UserEnum):
    ADMIN = 1
    EMPLOYEE = 2


class BaseMoDel(db.Model):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True)



chi_tiet_ben_xe = db.Table('chi_tiet_ben_xe',
                            Column('id_benxe', Integer, ForeignKey('BenXe.id'), primary_key=True),
                            Column('id_tuyenduong', Integer, ForeignKey('TuyenDuong.id'), primary_key=True))


class BenXe(BaseMoDel):
    __tablename__ = 'BenXe'

    ten_Ben_xe = Column(String(50), nullable=False)

    def __str__(self):
        return self.ten_Ben_xe


class TuyenDuong(BaseMoDel):
    __tablename__ = 'TuyenDuong'

    ten_tuyen_duong = Column(String(100), nullable=False)
    tg_khoihanh = Column(DateTime, nullable=False)
    tg_chay = Column(Time, nullable=False)
    giave_hv1 = Column(Float, nullable=False)
    giave_hv2 = Column(Float, nullable=False)
    ben_xe = relationship('BenXe', secondary='chi_tiet_ben_xe', lazy='subquery', backref=backref('chi_tiet_td', lazy=True))
    customer = relationship("Ve", backref='tuyen_duong')
    id_nv = Column(Integer, ForeignKey('User.id'), nullable=False)

    def __str__(self):
        return self.ten_tuyen_duong


class Ve(BaseMoDel):
    __tablename__ = 'Ve'

    id_tuyenduong = Column(ForeignKey('TuyenDuong.id'), primary_key=True)
    id_khach_hang = Column(ForeignKey('Customer.id'), primary_key=True)
    id_hangve = Column(Integer, ForeignKey('HangVe.id'), nullable=False)
    id_ghe = Column(Integer, ForeignKey('Ghe.id'), nullable=False)
    id_nv = Column(Integer, ForeignKey('User.id'))
    GiaVe = Column(Float, nullable=False)
    ngay_xuat_ve = Column(DateTime, default=datetime.now())

    def __str__(self):
        return str(self.id)


class Customer(BaseMoDel):
    __tablename__ = 'Customer'

    ho_ten = Column(String(50), nullable=False)
    so_cccd = Column(String(15), nullable=False)
    sdt = Column(String(12), nullable=False)
    tuyenduong = relationship("Ve", backref='customer')

    def __str__(self):
        return self.ho_ten


class HangVe(BaseMoDel):
    __tablename__ = 'HangVe'

    ten_hang_ve = Column(String(10), nullable=False)
    ve = relationship('Ve', backref='hang_ve', lazy=True)
    ghe = relationship('Ghe', backref='hang_ve', lazy=True)

    def __str__(self):
        return self.ten_hang_ve


# Ghe(ID-Ghe, SoGhe, ID-HangVe)
class Ghe(BaseMoDel):
    __tablename__ = 'Ghe'

    id_hangve = Column(Integer, ForeignKey('HangVe.id'), nullable=False)
    so_ghe = Column(Integer, nullable=False)
    ve = relationship('Ve', backref='ghe', lazy=True)

    def __str__(self):
        return str(self.id)


# User(User-ID, UserName, Password)
class User(BaseMoDel, UserMixin):
    __tablename__ = 'User'

    username = Column(String(100), nullable=False, unique=True)
    password = Column(String(100), nullable=False)
    active = Column(Boolean, default=True)
    user_role = Column(Enum(UserRole), default=UserRole.EMPLOYEE)
    ho_ten = Column(String(50), nullable=False)
    so_cccd = Column(String(15), nullable=False)
    sdt = Column(String(12), nullable=False)
    tuyen_duong = relationship('TuyenDuong', backref='nhan_vien', lazy=True)
    ve = relationship('Ve', backref='nhan_vien', lazy=True)

    def __str__(self):
        return str(self.id)


# if __name__ == '__main__':
#     with app.app_context():
        # db.create_all()
        # user admin
        # import hashlib
        # pw = str(hashlib.md5('123456'.encode('utf-8')).digest())
        # u = User(username='admin', password=pw, user_role=UserRole.ADMIN,
        #          ho_ten='Nguyễn Anh Quốc', so_cccd='261644679', sdt='0974283040')
        # db.session.add(u)
        # db.session.commit()

        # user employee
        # import hashlib
        #
        # pw = str(hashlib.md5('123123'.encode('utf-8')).digest())
        # u = User(username='anhquoc0304', password=pw, user_role=UserRole.EMPLOYEE,
        #          ho_ten='Nguyễn Anh Quốc', so_cccd='261657679', sdt='0978283040')
        # db.session.add(u)
        # db.session.commit()
        #
        # # hạng vé
        # for i in range(1, 3):
        #     ve = HangVe(ten_hang_ve='hang_' + str(i))
        #     db.session.add(ve)
        #
        # db.session.commit()

        #Ghe
        # for i in range(1, 21):
        #     ghe = Ghe(id_hangve=1, so_ghe=i)
        #     db.session.add(ghe)
        #
        # for i in range(1, 21):
        #     ghe = Ghe(id_hangve=2, so_ghe=i)
        #     db.session.add(ghe)
        #
        # db.session.commit()

        #Lập lịch tuyến đường

        # import random
        # t = 30
        # id_sb = set()
        # while t > 0:
        #     for i in range(1, 11):
        #         id_sb.add(int(i))
        #     list = tuple(id_sb)
        #     print(list)
        #     day = random.randint(1, 28)
        #     month = random.randint(1, 12)
        #     year = random.randint(2020, 2025)
        #     hour = random.randint(1, 23)
        #     minute = random.randint(0, 59)
        #     thoi_gian_khoi_hanh = datetime(year=year, month=month, day=day, hour=hour, minute=minute)
        #     hour = random.randint(1, 23)
        #     minute = random.randint(0, 59)
        #     thoigianchay = timedelta(hours=hour, minutes=minute)
        #     giave = float(random.randint(300, 999) * 1000)
        #     giave1 = giave
        #     giave2 = float(random.randint(100, giave) * 1000)
        #     s = random.choice(list)
        #     bx1 = BenXe.query.get(s)
        #     id_sb.remove(s)
        #     list = tuple(id_sb)
        #     #Sân Bay 2
        #     s = random.choice(list)
        #     bx2 = BenXe.query.get(s)
        #     id_sb.remove(s)
        #     list = tuple(id_sb)
        #     name = bx1.ten_Ben_xe + ' - ' + bx2.ten_Ben_xe
        #     c = TuyenDuong(ten_tuyen_duong=name, tg_khoihanh=thoi_gian_khoi_hanh,
        #                   tg_chay=thoigianchay, giave_hv1=giave1, giave_hv2=giave2, id_nv=2)
        #     db.session.add(c)
        #     db.session.commit()
        #     c.ben_xe.append(bx1)
        #     c.ben_xe.append(bx2)
        #     db.session.add(c)
        #     db.session.commit()
        #     t = t - 1;